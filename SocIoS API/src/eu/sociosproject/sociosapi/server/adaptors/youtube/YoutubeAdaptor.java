package eu.sociosproject.sociosapi.server.adaptors.youtube;

import java.io.IOException;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.gdata.client.Query;
import com.google.gdata.client.youtube.YouTubeQuery;
import com.google.gdata.client.youtube.YouTubeService;
import com.google.gdata.data.Category;
import com.google.gdata.data.DateTime;
import com.google.gdata.data.geo.impl.GeoRssWhere;
import com.google.gdata.data.media.mediarss.MediaCopyright;
import com.google.gdata.data.Link;
import com.google.gdata.data.youtube.FriendEntry;
import com.google.gdata.data.youtube.FriendFeed;
import com.google.gdata.data.youtube.UserEventEntry;
import com.google.gdata.data.youtube.UserEventFeed;
import com.google.gdata.data.youtube.UserProfileEntry;
import com.google.gdata.data.youtube.VideoEntry;
import com.google.gdata.data.youtube.VideoFeed;
import com.google.gdata.data.youtube.YouTubeMediaGroup;
import com.google.gdata.data.youtube.YouTubeNamespace;
import com.google.gdata.util.ServiceException;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;

import eu.sociosproject.sociosapi.server.adaptors.youtube.apiproxy.DateUtils;
import eu.sociosproject.sociosapi.server.adaptors.youtube.apiproxy.YouTubeRequestUrlFactory;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KeyWordFilter;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.LicenseType;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Organization;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosvoc.Source;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;

public class YoutubeAdaptor implements SnsAdaptor {

	private YoutubeAcessTokens exampleAccessToken;
	String developerKey = "AI39si7sI8f4n1TJuttrgQzj_qdRRldoJMuqXQOiz_tDCLLs5R4Daj-m6HlW2509qQXc6okRMbk2WI6xNLuxLxYsFoqwytF4og";
	String clientId = "Socios_test";
	YouTubeService service = new YouTubeService(clientId, developerKey);

	// String accessToken = exampleAccessToken.getExampleApiKey1();
	//
	public YoutubeAdaptor(YoutubeAcessTokens youtubeAcessToken) {
		this.exampleAccessToken = youtubeAcessToken;
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) {
		return Lists.newArrayList(createFakePerson("findPersons"));
	}

	/*
	 * @Override public void sendMessage(ObjectId personId, Message message) {
	 * System.out.println("===>Message send:" + message.getBody()); }
	 */

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds) {
		if (activityIds == null) {
			return null;
		}
		List<ObjectId> ids = activityIds.getActivityId();

		if (ids == null) {
			return null;
		}

		String[] users = new String[ids.size()];
		int i = 0;
		for (ObjectId id : ids) {
			users[i] = id.getId();
			i++;
		}
		String activitiesUrl = YouTubeRequestUrlFactory.getActivitiesUrl(users);
		UserEventFeed activityFeed = null;
		try {
			activityFeed = service.getFeed(new URL(activitiesUrl),
					UserEventFeed.class);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return getActivitiesFromFeed(activityFeed);

		// return Lists.newArrayList(createFakeActivity("getActivities"));
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList) {

		if (personIdList == null) {
			return null;
		}
		List<ObjectId> ids = personIdList.getPersonId();
		if (ids == null) {
			return null;
		}

		List<Person> persons = new ArrayList<Person>();
		for (ObjectId objId : ids) {
			Person person = null;
			try {
				person = getPerson(objId.getId());
			} catch (ServiceException ex) {
				System.out.println(ex.toString());
			} catch (IOException ex) {
				System.out.println(ex.toString());
			}
			persons.add(person);
		}

		return persons;

		// return Lists.newArrayList(createFakePerson("getPersons"));
	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {
		List<MediaItem> videos = new ArrayList<MediaItem>();

		YouTubeQuery query = null;
		boolean isCC = false;
		try {
			
				query = new YouTubeQuery(new URL(
						YouTubeRequestUrlFactory.getVideosBaseUrl()));
				query.setOrderBy(YouTubeQuery.OrderBy.PUBLISHED);
				query.setSafeSearch(YouTubeQuery.SafeSearch.STRICT);
				query.setMaxResults(50);
				URI uri = query.getQueryUri();
				System.out.println("[Youtube]:findMediaItems: query uri:"
						+ uri.toString());

				if (filterMediaItem.getLicense() != null) {

					filterMediaItem.getLicense();
					if (filterMediaItem.getLicense().equals(LicenseType.CC)) {
						Query.CustomParameter license = new Query.CustomParameter(
								"license", "cc");
						query.addCustomParameter(license);
						System.out
								.println("[Youtube]:findMediaItems: query uri:"
										+ uri.toString());
					}
					isCC = true;

				}

				List<String> keywords = new ArrayList<String>();
				KeyWordFilter tags = filterMediaItem.getTags();
				if (tags != null) {
					for (String keyword : tags.getKeyword()) {
						if (!keywords.contains(keyword))
							keywords.add((keyword));
					}
				}

				KeyWordFilter title = filterMediaItem.getTitle();
				if (title != null) {
					for (String keyword : title.getKeyword()) {
						if (!keywords.contains(keyword))
							keywords.add((keyword));
					}
				}
				KeyWordFilter description = filterMediaItem.getDescription();
				if (description != null) {
					for (String keyword : description.getKeyword()) {
						if (!keywords.contains(keyword))
							keywords.add((keyword));
					}
				}

				if (tags != null || title != null || description != null) {
					for (String keyword : keywords) {
						Query.CategoryFilter categoryFilter = new Query.CategoryFilter();
						categoryFilter.addCategory(new Category(
								YouTubeNamespace.KEYWORD_SCHEME, keyword));
						query.addCategoryFilter(categoryFilter);
					}
				}
			
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new SnUnavailableException(
					"YouTube oAuth API is currently unavailable");
		}

		// Query.CategoryFilter categoryFilter3 = new Query.CategoryFilter();
		// categoryFilter3.addCategory(new
		// Category(YouTubeNamespace.CATEGORY_SCHEME, "News"));
		// query.addCategoryFilter(categoryFilter3);

		VideoFeed videoFeed = null;
		try {
			videoFeed = service.query(query, VideoFeed.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (videoFeed == null || videoFeed.getEntries() == null) {
			return Lists.newArrayList(createFakeMediaItem("findMediaItems"));
		}
		for (VideoEntry videoEntry : videoFeed.getEntries()) {
			videos.add(getMediaItemFromVideoEntry(videoEntry, isCC));
		}
		System.out.println("[Youtube]:findMediaItems: items.length = "
				+ videos.size());
		return videos;

		// return Lists.newArrayList(createFakeMediaItem("findMediaItems"));
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds) {

		// if(activityIds==null)
		// return null;

		String activitiesUrl = YouTubeRequestUrlFactory
				.getFriendsActivitiesUrl();
		UserEventFeed activityFeed = null;
		try {
			activityFeed = service.getFeed(new URL(activitiesUrl),
					UserEventFeed.class);
		} catch (MalformedURLException e) {
			System.out.println(e.toString() + "MalformedURL Exception");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println(e.toString() + "IOService Exception");
			e.printStackTrace();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			System.out.println(e.toString() + "Service Exception");
			e.printStackTrace();
		}
		return getActivitiesFromFeed(activityFeed);
		// return
		// Lists.newArrayList(createFakeActivity("findConnectedActivities"));
	}

	@Override
	public List<Person> connectedPersons(ObjectId personId) {

		String token = exampleAccessToken.getToken();
		service.setHeader("Authorization", "Bearer " + token);
		if (personId == null)
			return null;
		FriendFeed friendFeed = null;

		String friendsUrl = YouTubeRequestUrlFactory
				.getUserContactsUrl(personId.getId());
		friendsUrl = "https://gdata.youtube.com/feeds/api/users/default/contacts?v=2";
		try {
			friendFeed = service.getFeed(new URL(friendsUrl), FriendFeed.class);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ServiceException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (friendFeed != null) {
			List<FriendEntry> friends = friendFeed.getEntries();

			if (friends != null) {
				List<Person> connectedPersons = new ArrayList<Person>();
				for (FriendEntry friend : friends) {
					try {
						connectedPersons.add(getPerson(friend.getUsername()));
					} catch (Exception e) {
					}
				}
				return connectedPersons;
			}
		}

		return null;

		// return Lists.newArrayList(createFakePerson("getPersons"));
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) {
		
		
try{
	YouTubeQuery query = null;
	
	ArrayList<Activity> res = new ArrayList<Activity>();
	if (personIdList != null) {

		List<ObjectId> list = personIdList.getPersonId();
		
	for (ObjectId obj_id : list) {

		String user_id = obj_id.getId();
		System.out.println("YOUTUBE: findActivities user_id: " + user_id);
	String uploadsUrl = YouTubeRequestUrlFactory
			.findActivitiesUrl(user_id);
		query = new YouTubeQuery(new URL(uploadsUrl));
		
		//Long time = new Date().getTime();
		//Date date = new Date(time + (24 * 60 * 60 * 1000));
		//DateTime publishedMax = new DateTime(date);
		query.setMaxResults(5);//.setPublishedMax(publishedMax);//(new DateTime(DateTime.now().getValue()  + (1000 * 60 * 60 * 48)));
		
		query.setOrderBy(YouTubeQuery.OrderBy.PUBLISHED);
		System.out.println("YOUTUBE: publishedMax:" +  query.getPublishedMax());
		//uploadsUrl
		System.out.println("YOUTUBE: uploadUrl = "+ uploadsUrl);
		
		VideoFeed videoFeed = null;
		List<MediaItem> videos = new ArrayList<MediaItem>();
		videoFeed = service.query(query, VideoFeed.class);
		System.out.println("YOUTUBE: videoFeed retireved");
		if (videoFeed == null || videoFeed.getEntries() == null) {
			//return Lists.newArrayList(createFakeMediaItem("findMediaItems"));
		}
		for (VideoEntry videoEntry : videoFeed.getEntries()) {
			videos.add(getMediaItemFromVideoEntry(videoEntry, false));
		}
		
		System.out.println("YOUTUBE: VideoFeed size:" + videoFeed.getEntries().size());
		
		Activity newActivity = new Activity();
		newActivity.setUserId(obj_id);
		newActivity.getMediaItems().addAll(videos);
		System.out.println("in youtube adaptor, findActivities() return " + newActivity.getMediaItems().size() + " mediaItems");
		res.add(newActivity);
		
	
	}}
	return res;
} catch (MalformedURLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
	
}
catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ServiceException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		
		
	

		
		
		
		
		return Lists.newArrayList(/* createFakeActivity("findActivities") */);
	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList) {
		System.out.println("Calling getMediaItems..");
		if (mediaItemIdList == null) {
			return null;
		}
		List<ObjectId> ids = mediaItemIdList.getMediaItemId();
		if (ids == null) {
			return null;
		}
		System.out.println("MediaItemIdList not null..");
		List<MediaItem> mediaItems = new ArrayList<MediaItem>();
		for (ObjectId objId : ids) {
			MediaItem mediaItem = null;
			try {
				mediaItem = getMediaItem(objId.getId());
			} catch (IOException ex) {
				System.out.println(ex.toString());
			} catch (ServiceException ex) {
				System.out.println(ex.toString());
			}
			mediaItems.add(mediaItem);
		}
		return mediaItems;

		// return Lists.newArrayList(createFakeMediaItem("getMediaItems"));
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

	private Person createFakePerson(String method) {
		Person person = new Person();
		person.setAboutMe("[Youtube]One fake person, retrieved with keys:"
				+ exampleAccessToken.getToken() + " from method " + method);
		Source source = new Source();
		source.setKnownSns(KnownSns.YOUTUBE);

		ObjectId id = createObjectId("fakeUser");
		id.setSource(source);

		person.setId(id);
		return person;
	}

	private Activity createFakeActivity(String method) {
		Activity activity = new Activity();
		activity.setBody("[Youtube]One fake activity, retrieved with keys:"
				+ exampleAccessToken.getToken() + " and " + " from method "
				+ method);
		return activity;
	}

	private MediaItem createFakeMediaItem(String method) {
		MediaItem mediaItem = new MediaItem();
		mediaItem
				.setDescription("[Youtube]One fake media item, retrieved with keys:"
						+ exampleAccessToken.getToken()

						+ " from method " + method);
		return mediaItem;
	}

	@Override
	public List<Person> myConnectedPersons(ObjectId personId) {

		System.out.println("myConnectedPersons called");
		String token = exampleAccessToken.getToken();
		System.out.println("Token used: " + token);
		service.setHeader("Authorization", "Bearer " + token);
		if (personId == null)
			return null;
		FriendFeed friendFeed = null;

		String friendsUrl = YouTubeRequestUrlFactory
				.getUserContactsUrl(personId.getId());
		friendsUrl = "https://gdata.youtube.com/feeds/api/users/default/contacts?v=2";
		try {
			friendFeed = service.getFeed(new URL(friendsUrl), FriendFeed.class);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ServiceException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (friendFeed != null) {
			List<FriendEntry> friends = friendFeed.getEntries();
			System.out.println("Feed not null");
			if (friends != null) {
				System.out.println("Friends not null");
				List<Person> connectedPersons = new ArrayList<Person>();
				for (FriendEntry friend : friends) {
					try {
						connectedPersons.add(getPerson(friend.getUsername()));
					} catch (Exception e) {
						System.out.println(friend.getUsername() + "Exception: "
								+ e.getMessage());
					}
				}
				return connectedPersons;
			}
		}

		return null;

		// return Lists.newArrayList(createFakePerson("getPersons"));

	}

	private MediaItem getMediaItemFromVideoEntry(VideoEntry videoEntry,
			boolean isCC) {
		// System.out.println("Calling getMediaItemFromVideoEntry..");
		MediaItem mediaItem = new MediaItem();
		YouTubeMediaGroup mediaGroup = videoEntry.getMediaGroup();
		mediaItem.setDescription(mediaGroup.getDescription()
				.getPlainTextContent());
		mediaItem.setDuration(BigInteger.valueOf(mediaGroup.getDuration()));
		MediaCopyright copyright = mediaGroup.getCopyright();
		if (copyright != null) {
			System.out.println("copyright" + copyright.getUrl() + " "
					+ copyright.getUrl());
		}
		if (isCC) {
			License licenseValue = new License();
			// licenseValue.setId("0");

			licenseValue.setName("Creative Commons");
			licenseValue.setUrl("http://creativecommons.org/licenses/by/3.0/");
			mediaItem.setLicense(licenseValue);
		}
		//
		String idString = videoEntry.getId();
		// e.g. tag:youtube.com,2008:video:IXupsQy7LiE
		// we only want the last part (video:IXupsQy7LiE)
		String[] idElements = idString.split("[:]");
		mediaItem.setId(createObjectId(idElements[idElements.length - 1]));
		// mediaItem.setId(createObjectId(videoEntry.getId()));
		//

		mediaItem.setLanguage(videoEntry.getLocation());
		List<com.google.gdata.data.Person> authors = videoEntry.getAuthors();
		if (authors != null && authors.size() > 0) {
			// for(com.google.gdata.data.Person person: authors) {
			// logger.debug("Author " + person.getName() + ", " +
			// person.getUri());
			// }
			ObjectId userId = new ObjectId();
			userId.setId(authors.get(0).getName());

			Source source = new Source();
			// source.setOtherId("YouTube");
			source.setKnownSns(KnownSns.YOUTUBE);
			userId.setSource(source);
			mediaItem.setUserId(userId);
		}
		GeoRssWhere location = videoEntry.getGeoCoordinates();
		Address address = new Address();
		address.setLocality(videoEntry.getLocation());
		if (location != null) {
			address.setLongitude(location.getLongitude());
			address.setLatitude(location.getLatitude());
		}
		mediaItem.setLocation(address);
		// mediaItem.setMimeType(mediaGroup.getPlayer().getExtensionLocalName());
		// mediaItem.setNumComments(videoEntry.getComments().ge);
		if (videoEntry.getStatistics() != null) {
			mediaItem.setNumViews(BigInteger.valueOf(videoEntry.getStatistics()
					.getViewCount()));
			mediaItem.setNumFavorites(BigInteger.valueOf(videoEntry
					.getStatistics().getFavoriteCount()));
		}
		long rating = -1;
		if (videoEntry.getRating() != null) {
			rating = (long) (videoEntry.getRating().getAverage() / 5);
		}
		if (videoEntry.getYtRating() != null) {
			int likes = videoEntry.getYtRating().getNumLikes();
			int dislikes = videoEntry.getYtRating().getNumDislikes();
			int totalRatings = likes + dislikes;
			mediaItem.setNumPositiveVotes(BigInteger.valueOf(likes));
			mediaItem.setNumNegativeVotes(BigInteger.valueOf(dislikes));
			mediaItem.setNumRatings(BigInteger.valueOf(totalRatings));
			mediaItem.setNumResharings(BigInteger.valueOf(-1));

		}

		if (videoEntry.getComments() != null) {
			mediaItem.setNumComments(BigInteger.valueOf(videoEntry
					.getComments().getFeedLink().getCountHint()));
		}

		// Next line changed to comply with rating change from integer to double
		// - Modify if needed:
		mediaItem.setRating((double) rating);

		mediaItem.setCreated(DateUtils.getXMLGregorianCalendar(new Date(
				videoEntry.getMediaGroup().getUploaded().getValue())));

		mediaItem.setStartTime(DateUtils.getXMLGregorianCalendar(new Date(
				videoEntry.getPublished().getValue())));

		if (mediaGroup.getKeywords() != null
				&& mediaGroup.getKeywords().getKeywords() != null) {
			mediaItem.setTags(Joiner.on(", ").join(
					mediaGroup.getKeywords().getKeywords()));
		}

		if (mediaGroup.getThumbnails().size() > 0) {
			mediaItem.setThumbnailUrl(mediaGroup.getThumbnails().get(0)
					.getUrl());
		}

		mediaItem.setTitle(videoEntry.getTitle().getPlainText());

		// mediaItem.setDescription("Youtube Test Description");
		// mediaItem.setDescription(videoEntry.getDescription().getPlainText());
		mediaItem.setUrl(mediaGroup.getPlayer().getUrl());

		return mediaItem;
	}

	private List<Activity> getActivitiesFromFeed(UserEventFeed activityFeed) {
		List<Activity> activities = new ArrayList<Activity>();

		if (activityFeed == null || activityFeed.getEntries() == null) {
			return activities;
		}

		for (UserEventEntry entry : activityFeed.getEntries()) {
			String author = entry.getAuthors().get(0).getName();
			String eventType = entry.getUserEventType().getTerm();
			String videoId = entry.getVideoId();
			DateTime published = entry.getPublished();

			String user = null;
			if (entry.getUserEventType() == UserEventEntry.Type.USER_SUBSCRIPTION_ADDED
					|| entry.getUserEventType() == UserEventEntry.Type.FRIEND_ADDED) {
				user = entry.getUsername();
			}
			Activity activity = new Activity();
			activity.setTitle(eventType);
			MediaItem mediaItem = new MediaItem();
			mediaItem.setId(createObjectId(videoId));
			try {
				mediaItem = getMediaItem(videoId);
			} catch (Exception e) {
				System.out.println("Exception " + e.toString());
			}
			activity.getMediaItems().add(mediaItem);
			if (user != null) {
				activity.setUserId(createObjectId(user));
			}
			activity.setId(createObjectId(author));
			if (published != null) {
				activity.setPostedTime(published.getValue());
			}

			activities.add(activity);
		}
		return activities;
	}

	private ObjectId createObjectId(String id) {
		ObjectId objId = new ObjectId();
		objId.setId(id);
		Source source = new Source();
		// source.setOtherId("YouTube");
		source.setKnownSns(KnownSns.YOUTUBE);
		objId.setSource(source);
		return objId;
	}

	public MediaItem getMediaItem(String videoId) throws IOException,
			ServiceException {
		System.out.println("Calling getMediaItem with videoId = " + videoId);
		String videoEntryUrl = YouTubeRequestUrlFactory.getVideoUrl(videoId);
		VideoEntry videoEntry = service.getEntry(new URL(videoEntryUrl),
				VideoEntry.class);
		return getMediaItemFromVideoEntry(videoEntry, false);
	}

	public Person getPerson(String username) throws ServiceException,
			IOException {
		try {

			Person person = new Person();

			String token = exampleAccessToken.getToken();
			System.out.println("getPerson called.. with username =" + username);
			service.setHeader("Authorization", "Bearer " + token);

			String profileUrl = YouTubeRequestUrlFactory
					.getUserProfileUrl(username);
			UserProfileEntry profileEntry = service.getEntry(
					new URL(profileUrl), UserProfileEntry.class);

			if (profileEntry != null) {
				System.out.println("Profile entry retrieved: "
						+ profileEntry.getId());
				person.setDisplayName(username);
				person.setProfileUrl("http://www.youtube.com/user/" + username);
				System.out.println("Thumbnail: " + profileEntry.getThumbnail());
				System.out.println("ThumbnailUrl: "
						+ profileEntry.getThumbnail().getUrl());
				person.setThumbnailUrl(profileEntry.getThumbnail().getUrl());
				person.setAboutMe(profileEntry.getAboutMe());
				person.setAge(profileEntry.getAge());
				if (profileEntry.getGender() != null) {
					person.setGender(profileEntry.getGender().getId());
				}

				Name name = new Name();
				name.setFamilyName(profileEntry.getLastName());
				name.setGivenName(profileEntry.getFirstName());
				person.setName(name);
				person.getJobInterests().add(profileEntry.getHobbies());
				person.getBooks().add(profileEntry.getBooks());
				person.getMovies().add(profileEntry.getMovies());
				person.getMovies().add(profileEntry.getMusic());

				Source source = new Source();
				source.setKnownSns(KnownSns.YOUTUBE);

				ObjectId id = createObjectId(profileEntry.getUsername());
				id.setSource(source);

				person.setId(id);

				Organization company = new Organization();
				company.setName(profileEntry.getCompany());
				Organization occupation = new Organization();
				occupation.setName(profileEntry.getOccupation());
				person.getOrganizations().add(occupation);
				if (profileEntry.getRelationship() != null) {
					person.getRelationships().add(
							profileEntry.getRelationship().toString());
				}

				// Link friendsFeedLink = profileEntry.getContactsFeedLink();
				// int numFriends = 0;
				// while (friendsFeedLink != null) {
				// String href = friendsFeedLink.getHref();
				// FriendFeed friendFeed = service.getFeed(new URL(href),
				// FriendFeed.class);
				// for (FriendEntry fe : friendFeed.getEntries()) {
				// numFriends++;
				// }
				// }

				// person.setNumFriends(BigInteger.valueOf(numFriends));
				person.setInDegree(BigInteger.valueOf(-1));
				person.setOutDegree(BigInteger.valueOf(-1));
				return person;
			} else {
				return null;

			}
		} catch (Exception ex) {
			System.out.println("Error in GetPerson with username: " + username);
			System.out.println(ex.getMessage());
			// Person person = new Person();
			// Source source = new Source();
			// source.setKnownSns(KnownSns.YOUTUBE);

			// ObjectId id = createObjectId();
			// id.setSource(source);
			// person.setDisplayName(username);
			// person.setId(id);
			// return person;
			return null;
		}
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
		List<MediaItem> videos = new ArrayList<MediaItem>();
		YouTubeQuery query = null;
		try {

			String token = exampleAccessToken.getToken();
			service.setHeader("Authorization", "Bearer " + token);
			query = new YouTubeQuery(
					new URL(
							"https://gdata.youtube.com/feeds/api/users/default/uploads"));
			System.out.println("[Youtube]:findMyMediaItems: query uri:"
					+ query.getFeedUrl().toString());
			System.out.println("[Youtube]:findMyMediaItems: token:" + token);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new SnUnavailableException(
					"YouTube oAuth API is currently unavailable");
		}
		VideoFeed videoFeed = null;
		try {
			videoFeed = service.query(query, VideoFeed.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (videoFeed == null || videoFeed.getEntries() == null) {
			//return Lists.newArrayList(createFakeMediaItem("findMediaItems"));
			return Lists.newArrayList();
		}
		for (VideoEntry videoEntry : videoFeed.getEntries()) {
			videos.add(getMediaItemFromVideoEntry(videoEntry, false));
		}
		System.out.println("[Youtube]:findMyMediaItems: items.length = "
				+ videos.size());

		return null;
	}
}
