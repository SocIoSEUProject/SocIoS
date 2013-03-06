package eu.sociosproject.sociosapi.server.adaptors.myspace;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.myspace.corefunctionalities.MySpaceApi;
import eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor.FindMethods;
import eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor.GetMethods;
import eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor.RequestUtility;
import eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor.RequestUtility.IFilter;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
//import eu.sociosproject.sociosvoc.OpenSocialSns;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosvoc.Source;

/**
 * @author kotelnikov
 */
// The implementation of this class was "inspired" by others implementations
// (like FlickrAdaptor class).
public class MySpaceAdaptor implements SnsAdaptor {

	public abstract class Callback implements IJsonCallback {

		private boolean fNotifyAccessErrors;

		public Callback() {
			this(false);
		}

		public Callback(boolean notifyAccessErrors) {
			super();
			fNotifyAccessErrors = notifyAccessErrors;
		}

		protected void handleResourceAccessError(SociosCallException e) {
			if (fNotifyAccessErrors) {
				LOG.log(Level.WARNING, "ERROR: " + e.getResponseCode()
						+ ". URL: '" + e.getUrl() + "'", e);
			}
		}

		protected abstract void handleResult(JSONObject result)
				throws Exception;

		@Override
		public void onError(Throwable t) {
			if (t instanceof SociosCallException) {
				SociosCallException e = (SociosCallException) t;
				handleResourceAccessError(e);
			} else {
				LOG.log(Level.WARNING, "An error occurred", t);
			}
		}

		@Override
		public final void onSuccess(JSONObject result) {
			try {
				handleResult(result);
			} catch (Throwable t) {
				onError(t);
			}
		}

	}

	public interface IJsonCallback {

		void onError(Throwable t);

		void onSuccess(JSONObject result);
	}

	public static class SociosCallException extends SociosException {
		private static final long serialVersionUID = 6974643401780102794L;

		private int fResponseCode;

		private String fUrl;

		public SociosCallException(String url, int code) {
			fUrl = url;
			fResponseCode = code;
		}

		public int getResponseCode() {
			return fResponseCode;
		}

		public String getUrl() {
			return fUrl;
		}

	}

	private final static Logger LOG = Logger.getLogger(MySpaceAdaptor.class
			.getName());

	private static final Source MYSPACE_SOURCE = new Source();

	static {
		MYSPACE_SOURCE.setKnownSns(KnownSns.MYSPACE);
		// OpenSocialSns openSocialSns = new OpenSocialSns();
		// openSocialSns.setBaseUri("http://www.myspace.com/");
		// MYSPACE_SOURCE.setOpenSocialSnsId(openSocialSns);

	}

	private Executor fExecutor = Executors.newCachedThreadPool();

	private OAuthService fService;

	private MySpaceAccessTokens fServiceConfig;

	/*
	 * @Override public void sendMessage(ObjectId personId, Message message) {
	 * System.out.println("===>Message send:" + message.getBody()); }
	 */
	public MySpaceAdaptor(MySpaceAccessTokens config) {
		fServiceConfig = config;
		fService = new ServiceBuilder().provider(MySpaceApi.class)
				.apiKey(fServiceConfig.getApiKey())
				.apiSecret(fServiceConfig.getApiSecret()).build();
	}

	private void addRequestUrls(List<String> requestUrls, List<String> urlsToAdd) {
		if (urlsToAdd != null) {
			requestUrls.addAll(urlsToAdd);
		}
	}

	private void addRequestUrls(List<String> requestUrls, String... urls) {
		for (String url : urls) {
			if (url != null) {
				requestUrls.add(url);
			}
		}
	}

	private String call(String uri) throws SociosException {
		OAuthRequest request = new OAuthRequest(Verb.GET, uri);
		Token accessToken = fServiceConfig.getAccessToken();
		fService.signRequest(accessToken, request);
		Response response = request.send();
		int code = response.getCode();
		if (code != 200) {
			throw new SociosCallException(uri, code);
		}
		String result = response.getBody();
		return result;
	}

	private void call(String url, IJsonCallback transformer) {
		try {
			String str = call(url);
			JSONObject obj = new JSONObject(str);
			transformer.onSuccess(obj);
		} catch (Throwable t) {
			transformer.onError(t);
		}
	}

	private void callAsync(List<String> requestUrls,
			final IJsonCallback callback) {
		try {
			if (requestUrls == null || requestUrls.isEmpty()) {
				throw new IllegalArgumentException(
						"URLs list is not defined or empty");
			}
			final CyclicBarrier barrier = new CyclicBarrier(
					requestUrls.size() + 1);
			for (final String url : requestUrls) {
				fExecutor.execute(new Runnable() {
					@Override
					public void run() {
						try {
							call(url, callback);
						} finally {
							try {
								barrier.await();
							} catch (Throwable t) {
								callback.onError(t);
							}
						}
					}
				});
			}
			barrier.await();
		} catch (Exception e) {
			callback.onError(e);
		}
	}

	@Override
	public List<Person> connectedPersons(ObjectId personId)
			throws SociosException {
		String url = getFriendsRequest(personId);
		return loadPeople(url);
	}

	private Activity createFakeActivity(String method) {
		Activity activity = new Activity();
		activity.setBody("One fake activity, retrieved with keys:"
				+ fServiceConfig.getAccessToken() + " from method " + method);
		return activity;
	}

	private Person createFakePerson(String method) {
		Person person = new Person();
		person.setAboutMe("One fake person, retrieved with keys:"
				+ fServiceConfig.getAccessToken() + " from method " + method);
		return person;
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) {
		// 1) Get the full list of activities
		// * personFilter == null: all activities of all friends
		// (getActivities(null))
		// * personFilter != null:
		// - findPersons(personFilter,null)
		// - for each person - get all activities

		// 2) Filter activities by activity filter

		// 3) mediaItemIdList - ????

		// 4) personIdList - load activities for each person

		return Lists.newArrayList(createFakeActivity("findActivities"));
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds) {
		System.out.println("The MySpace api doesn't support this operation!!!");
		return null;
	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {
		IFilter<MediaItem> filter = null;
		List<String> requestUrls = new ArrayList<String>();
		if (filterMediaItem != null) {
			addRequestUrls(requestUrls,
					FindMethods.mediaVideoRequest(filterMediaItem),
					FindMethods.mediaImagesRequest(filterMediaItem));
		} else if (filterPerson != null) {
			addRequestUrls(requestUrls,
					FindMethods.mediaVideoRequest(filterPerson),
					FindMethods.mediaImagesRequest(filterPerson));
			filter = FindMethods.mediaItemFilter(filterPerson);
		} else if (personIdList != null) {
			addRequestUrls(requestUrls,
					GetMethods.mediaItemsRequest(personIdList));
		}
		if (requestUrls.isEmpty()) {
			String message = "InvalidInvalidInputException: All parameters are null, give at least one if you want to get a response";
			throw new InvalidInputException(message);
		}
		return loadMediaItems(requestUrls, filter);
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) {
		// TODO: search all people corresponding to the specified filter

		// TODO: call the getMediaItems(mediaItemIdList)
		// TODO: get item authors and returns them
		return Lists.newArrayList(createFakePerson("findPersons"));
	}

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds) {
		// TODO: load all activities produced by all frinds:
		// http://api.myspace.com/1.0/activities/@me/@friends

		// TODO: filter activities by specified ids
		return Lists.newArrayList(createFakeActivity("getActivities"));
	}

	private String getFriendsRequest(ObjectId personId) {
		String str = (personId != null) ? personId.getId() : "@me";
		String url = GetMethods.friendsRequest(str);
		return url;
	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException {
		System.out.println("Myspace getMediaItems is called");
		if (mediaItemIdList == null) {
			throw new InvalidInputException(
					"List of media item identifiers is not defined.");
		}
		List<ObjectId> mediaItemIds = mediaItemIdList.getMediaItemId();
		if (mediaItemIds.isEmpty()) {
			System.out.println("mesa sto if");
			return new ArrayList<MediaItem>();
		}
		List<String> urls = new ArrayList<String>();
		List<Person> friends = connectedPersons(null);
		for (Person person : friends) {
			ObjectId personId = person.getId();
			System.out.println("personId = " + personId.getId());
			String url = GetMethods.mediaItemsRequest(personId);
			System.out.println("request url = " + url);
			urls.add(url);
		}
		final Set<String> set = new HashSet<String>();
		for (ObjectId mediaItemId : mediaItemIdList.getMediaItemId()) {
			String str = RequestUtility.toStringId(mediaItemId);
			set.add(str);
		}
		List<MediaItem> result = loadMediaItems(true, urls,
				new IFilter<MediaItem>() {
					@Override
					public boolean accept(MediaItem item) {
						String str = RequestUtility.toStringId(item.getId());
						boolean accepted = set.contains(str);
						return accepted;
					}
				});
		return result;
	}

	private String getMediaItemTags(JSONObject obj) {
		StringBuilder result = new StringBuilder();
		JSONArray categories = obj.optJSONArray("categories");
		if (categories != null) {
			for (int i = 0; i < categories.length(); i++) {
				JSONObject category = categories.optJSONObject(i);
				if (category != null) {
					String name = category.optString("name", null);
					if (name != null) {
						if (result.length() > 0) {
							result.append(", ");
						}
						result.append(name);
					}
				}
			}
		}
		return result.length() > 0 ? result.toString() : null;
	}

	private MediaItemType getMediaItemType(JSONObject obj) {
		MediaItemType result = null;
		String str = obj.optString("type", null);
		if (str != null) {
			try {
				result = MediaItemType.fromValue(str.toUpperCase());
			} catch (Throwable t) {
				// Just ignore it
			}
		}
		if (result == null) {
			if (obj.optString("videoId", null) != null) {
				result = MediaItemType.VIDEO;
			} else if (obj.optString("imageId", null) != null) {
				result = MediaItemType.IMAGE;
			}
		}
		return result;
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException {
		if (personIdList == null || personIdList.getPersonId().isEmpty()) {
			throw new InvalidInputException(
					"List of person identifiers is not defeined.");
		}

		// creates an array which contains a number of API calls
		final ArrayList<String> requestUrls = new ArrayList<String>();
		for (int i = 0; i < personIdList.getPersonId().size(); i++) {
			// creates the url for each API call
			String personId = personIdList.getPersonId().get(i).getId()
					.toString();
			String requestUrl = GetMethods.peopleProfileRequest(personId);
			if (requestUrl != null) {
				requestUrls.add(requestUrl);
			}
		}

		final List<Person> result = Collections
				.synchronizedList(new ArrayList<Person>());
		callAsync(requestUrls, new Callback() {
			@Override
			protected void handleResult(JSONObject obj) throws Exception {
				JSONObject personJSON = obj.optJSONObject("person");
				Person person = toPerson(personJSON);
				result.add(person);
			}
		});

		return result;
	}

	@Override
	public String registerListener(SociosEventListener eventListener) {
		return "";
	}

	@Override
	public boolean unregisterListener(ObjectId id) {
		return true;
	}

	@Override
	public boolean disable() {
		return false;
	}

	private List<MediaItem> loadMediaItems(boolean notifyErrors,
			List<String> urls, final IFilter<MediaItem> filter)
			throws SociosException {
		final List<MediaItem> result = Collections
				.synchronizedList(new ArrayList<MediaItem>());
		callAsync(urls, new Callback(notifyErrors) {
			@Override
			protected void handleResult(JSONObject obj) throws Exception {
				List<MediaItem> list = toMediaItemList(obj);
				if (filter == null) {
					result.addAll(list);
				} else {
					for (MediaItem item : list) {
						if (filter.accept(item)) {
							result.add(item);
						}
					}
				}
			}
		});
		return result;
	}

	private List<MediaItem> loadMediaItems(List<String> urls,
			final IFilter<MediaItem> filter) throws SociosException {
		return loadMediaItems(false, urls, filter);
	}

	private List<Person> loadPeople(String url) throws SociosException {
		final List<Person> result = Collections
				.synchronizedList(new ArrayList<Person>());
		call(url, new Callback() {
			@Override
			protected void handleResult(JSONObject obj) throws Exception {
				List<Person> list = toPersonList(obj);
				result.addAll(list);
			}
		});
		return result;
	}

	@Override
	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException {
		String url = getFriendsRequest(personId);
		return loadPeople(url);
	}

	private BigInteger toBigInt(String value) {
		if (value == null) {
			return null;
		}
		value = value.replaceAll(",", "");
		try {
			return new BigInteger(value);
		} catch (NumberFormatException e) {
			return null;
		}
	}

	private MediaItem toMediaItem(JSONObject obj) {
		MediaItemType type = getMediaItemType(obj);
		if (type == null) {
			return null;
		}

		MediaItem mediaItem = new MediaItem();
		String idStr = obj.optString("id");
		ObjectId id = toObjectId(idStr);
		mediaItem.setId(id);
		mediaItem.setType(type);
		mediaItem.setTitle(obj.optString("displayName", null));
		String url = null;
		switch (type) {
		case VIDEO:
			url = obj.optString("videoUrl", null);
			break;
		case IMAGE:
			url = obj.optString("imageUrl", null);
			break;
		}
		mediaItem.setUrl(url);
		mediaItem.setThumbnailUrl(obj.optString("thumbnailUrl", null));
		mediaItem.setDescription(obj.optString("description", null));
		mediaItem.setTitle(obj.optString("title", null));
		mediaItem.setNumComments(toBigInt(obj.optString("numComments", null)));
		mediaItem.setNumViews(toBigInt(obj.optString("numViews", null)));
		mediaItem.setNumVotes(toBigInt(obj.optString("numVotes", null)));
		// Next line changed to comply with rating change from integer to double
		// - Modify if needed:
		mediaItem
				.setRating(Double.parseDouble((obj.optString("rating", null))));
		String tags = getMediaItemTags(obj);
		mediaItem.setTags(tags);
		return mediaItem;
	}

	private List<MediaItem> toMediaItemList(JSONObject obj) {
		JSONArray array = obj.optJSONArray("entry");
		List<MediaItem> result = new ArrayList<MediaItem>();
		for (int i = 0; i < array.length(); i++) {
			Object o = array.opt(i);
			if (o instanceof JSONObject) {
				JSONObject mediaItemJSON = (JSONObject) o;
				MediaItem mediaItem = toMediaItem(mediaItemJSON);
				if (mediaItem != null) {
					result.add(mediaItem);
				}
			}
		}
		return result;
	}

	private ObjectId toObjectId(String idStr) {
		ObjectId id = new ObjectId();
		id.setId(idStr);
		id.setSource(MYSPACE_SOURCE);
		return id;
	}

	private Person toPerson(JSONObject obj) {
		Person person = new Person();
		String idStr = obj.optString("id");
		ObjectId id = toObjectId(idStr);
		person.setId(id);
		person.setDisplayName(obj.optString("displayName", null));
		person.setProfileUrl(obj.optString("profileUrl", null));
		person.setThumbnailUrl(obj.optString("thumbnailUrl", null));
		JSONObject nameJSON = obj.optJSONObject("name");
		if (nameJSON != null) {
			Name name = new Name();
			name.setFamilyName(nameJSON.optString("familyName", null));
			name.setGivenName(nameJSON.optString("givenName", null));
			person.setName(name);
		}
		return person;
	}

	private List<Person> toPersonList(JSONObject obj) {
		JSONArray array = obj.optJSONArray("entry");
		List<Person> result = new ArrayList<Person>();
		for (int i = 0; i < array.length(); i++) {
			Object o = array.opt(i);
			if (o instanceof JSONObject) {
				JSONObject entryJSON = (JSONObject) o;
				JSONObject personJSON = entryJSON.optJSONObject("person");
				if (personJSON == null) {
					continue;
				}
				Person person = toPerson(personJSON);
				if (person != null) {
					result.add(person);
				}
			}
		}
		return result;
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}
}
