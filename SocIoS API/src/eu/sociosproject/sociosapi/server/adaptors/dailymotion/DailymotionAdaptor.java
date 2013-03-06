/*
 *  Copyright 2013 National Technical University of Athens
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
 
package eu.sociosproject.sociosapi.server.adaptors.dailymotion;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.InitiatorType;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
//import eu.sociosproject.sociosvoc.Message;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.DailyMotionUtilities;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.FindMethods;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.GetMethods;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.MediaItemParser;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.IllegalRequestException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;

public class DailymotionAdaptor implements SnsAdaptor {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	public DailymotionAdaptor(DailymotionAcessTokens mySpaceAcessToken) {
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException {

		logger.debug("findPersons - 1");

		if (personFilter == null && mediaItemIdList == null) {
			String msg = "No input in findPersons";
			throw new InvalidInputException(msg);
		}

		// prepare request
		String requestUrl = null;
		if (personFilter != null) {
			requestUrl = FindMethods.personRequest(personFilter);

			// System.out.println("requestUrl = " + requestUrl);
			String debug = String.format(
					"findPersons personFilter input =  %s", requestUrl);
			logger.debug(debug);

		} else if (mediaItemIdList != null) {
			requestUrl = FindMethods.personRequest(mediaItemIdList);
			// System.out.println("requestUrl = " + requestUrl);

			String debug = String.format(
					"findPersons mediaItemIdList input = %s", requestUrl);
			logger.debug(debug);
		}

		// call service
		String response = HttpRequests.getSynchronousHttpResonse(requestUrl);

		// System.out.println("response = " + response);
		String debug = String.format(
				"findPersons - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response
		List<Person> findPersonsList = Arrays.asList(ResponseParsers
				.parsePersonsResponse(response));
		debug = String.format("\nfindPersons - 3, size of response =  %s",
				findPersonsList.size());
		logger.debug(debug);

		return findPersonsList;
	}

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds)
			throws SociosException {

		logger.warn("The dailymotion api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The dailymotion API doesn't support this operation!");

	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException {

		String debug = String.format(
				"\ngetPersons - 1, input size of list = %s", personIdList
						.getPersonId().size());
		logger.debug(debug);

		if (personIdList == null || personIdList.getPersonId().size() == 0)
			throw new InvalidInputException("No input in getPersons");

		// prepare request
		// creates an array which contains a number of API calls
		final ArrayList<String> requestUrls = new ArrayList<String>();
		for (int i = 0; i < personIdList.getPersonId().size(); i++) {

			// creates the url for each API call
			String requestUrl = GetMethods.getPersonRequest(personIdList
					.getPersonId().get(i).getId().toString());

			// System.out.println("requestUrl = " + requestUrl);
			debug = String.format("getPersons requestUrl = %s ", requestUrl);
			logger.debug(debug);
			if (requestUrl != null) {
				requestUrls.add(requestUrl);
			}
		}
		debug = String.format("getPersons requestUrls = %s ", requestUrls);
		logger.debug(debug);

		// call service
		// creates asynchronous http requests for each different PersonId
		// and aggregates their responses in a String object
		String aggregateResponse = HttpRequests.getAsynchronousHttpResonse("",
				requestUrls, false);
		debug = String.format("getPersons -2 aggregateResponse = %s",
				aggregateResponse);
		logger.debug(debug);

		// parse response
		List<Person> getPersonsList = Arrays.asList(ResponseParsers
				.parseGetPersonsResponse(aggregateResponse));

		debug = String.format("\ngetPersons - 3, size of response =  %s",
				getPersonsList.size());
		logger.debug(debug);

		return getPersonsList;

	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {

		logger.debug("findMediaItems - 1");

		final ArrayList<String> requestUrls = new ArrayList<String>();

		if (filterMediaItem != null) {

			// prepare request
			String requestUrl = eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.FindMethods
					.mediaItemsRequest(filterMediaItem);

			// System.out.println("Dailymotion findMediaItems requestUrl: "
			// + requestUrl);

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getSynchronousHttpResonse(requestUrl);
			// System.out.println("findMediaItems response 1: " + response);

			String debug = String.format(
					"findMediaItems - 2, response from service = %s", response);
			logger.debug(debug);

			// parse response
			List<MediaItem> findMediaItemsList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
							.parseMediaItemsResponse(response));

			debug = String.format(
					"Dailymotion findMediaItems - 3, size of response =  %s",
					findMediaItemsList.size());
			logger.debug(debug);

			// System.out.println("Dailymotion findMediaItemList size = "
			// + findMediaItemsList.size());

			return findMediaItemsList;

		} else if (filterPerson != null) {
			// System.out.println("filterPerson: " + filterPerson);

			// prepare request
			String requestUrl = eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.FindMethods
					.mediaItemsRequest(filterPerson);

			// System.out.println("requestUrl = " + requestUrl);
			String debug = String
					.format("\nDailymotion findMediaItems requestUrl =  %s",
							requestUrl);
			logger.debug(debug);

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getSynchronousHttpResonse(requestUrl);
			// System.out.println("findMediaItems response 2: " + response);
			debug = String.format(
					"findMediaItems - 2, response from service = %s", response);
			logger.debug(debug);

			// parse response
			List<MediaItem> findMediaItemsList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
							.parseMediaItemsResponse(response));

			debug = String.format("findMediaItems - 3, size of response =  %s",
					findMediaItemsList.size());
			logger.debug(debug);

			return findMediaItemsList;

		} else if (personIdList.getPersonId() != null) {
			// else if (personIdList.getPersonId().get(0).getId() != null) {

			// prepare request
			requestUrls.addAll(FindMethods.mediaItemsRequest(personIdList
					.getPersonId().toArray(new ObjectId[0])));

			// for (int i = 0; i < requestUrls.size(); i++)
			// System.out.println("requestUrl = " + requestUrls.get(i));

			String debug = String.format(
					"\npersonIdList input: requestUrls  =  %s", requestUrls);
			logger.debug(debug);

			// call service
			String response = HttpRequests.getAsynchronousHttpResonse("list",
					requestUrls, true);
			// System.out.println("response 3: " + response);

			debug = String.format(
					"findMediaItems - 2, response from service = %s", response);
			logger.debug(debug);

			// parse response
			List<MediaItem> findMediaItemsList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
							.parseMediaItemsResponse(response));

			debug = String.format("findMediaItems - 3, size of response =  %s",
					findMediaItemsList.size());
			logger.debug(debug);

			return findMediaItemsList;

		} else {
			String message = "No input in findMediaItems";
			throw new InvalidInputException(message);
		}
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds)
			throws SociosException {
		logger.warn("The dailymotion api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The dailymotion API doesn't support this operation!");

	}

	@Override
	public List<Person> connectedPersons(ObjectId personId)
			throws SociosException {

		String debug = String.format("\nconnectedPersons - 1, input size = %s",
				personId.getId().length());
		logger.debug(debug);

		if (personId.getId() == null || personId.getId().length() == 0) {
			String message = "No input in connectedPersons";
			throw new InvalidInputException(message);
		}

		// prepare request
		String requestUrl = DailyMotionUtilities.getFriendsRequest(personId
				.getId());

		// System.out.println("requestUrl = " + requestUrl);
		debug = String.format("connectedPersons requestUrl =  %s", requestUrl);
		logger.debug(debug);

		// call service
		String response = HttpRequests.getSynchronousHttpResonse(requestUrl);
		debug = String.format(
				"\nconnectedPersons - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response
		List<Person> connectedPersonsList = Arrays.asList(ResponseParsers
				.parseFriendsResponse(response));

		debug = String.format("\nconnectedPersons - 3, size of response =  %s",
				connectedPersonsList.size());
		logger.debug(debug);

		return connectedPersonsList;
	}

	@Override
	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException {
		logger.warn("The dailymotion api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The dailymotion API doesn't support this operation!");
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException {

		logger.debug("\nfindActivities - 1");

		ArrayList<Activity> res = new ArrayList<Activity>();
		List<ObjectId> ids = personIdList.getPersonId();

		if (personIdList != null) {

			// prepare request
			for (ObjectId id : ids) {

				String user_id = id.getId();
				System.out.println("dailymotion user_id = " + user_id);
				String requestUrl = eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.FindMethods
						.recentMediaItemsRequest(user_id);

				// System.out.println("requestUrl = " + requestUrl);
				String debug = String.format("findActivities requestUrl =  %s",
						requestUrl);
				logger.debug(debug);

				// call service
				String responseMedia = HttpRequests
						.getSynchronousHttpResonse(requestUrl);
				// System.out.println("responseMedia = " + responseMedia);

				debug = String.format(
						"\nfindActivities - 2, response from service = %s",
						responseMedia);
				logger.debug(debug);

				List<MediaItem> aggregateResponseMedia = null;

				try {
					aggregateResponseMedia = Arrays
							.asList(eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
									.parseMediaItemsResponse(responseMedia));

					Activity newActivity = new Activity();
					newActivity.setUserId(id);
					newActivity.getMediaItems().addAll(aggregateResponseMedia);
					res.add(newActivity);
				} catch (Exception ex) {
					System.out.println("Dailymotion findActivities(), exception occured for userId " + id.getId()
							+ " : " + ex.getMessage());
					// ex.printStackTrace();
				}
			}
		}
		String debug = String.format(
				"\nfindActivities - 3, size of response res =  %s", res.size());
		logger.debug(debug);

		return res;
	}

	// @Override
	// public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
	// throws SociosException {
	//
	// String debug = String.format(
	// "\ngetMediaItems - 1, input size of list = %s", mediaItemIdList
	// .getMediaItemId().size());
	// logger.debug(debug);
	//
	// if (mediaItemIdList.getMediaItemId() == null
	// || mediaItemIdList.getMediaItemId().size() == 0) {
	// throw new InvalidInputException("No input in getMediaItems");
	// }
	//
	// List<MediaItem> back = Lists.newArrayList();
	//
	// int size = mediaItemIdList.getMediaItemId().size();
	// System.out.println("@getMediaItems : size = " + size);
	// int iterations = size / 20;
	// int modulo = size % 20;
	// if (modulo > 0)
	// iterations++;
	//
	// for (int iteration = 0; iteration < iterations; iteration++) {
	//
	// StringBuilder concatenatedIds = new StringBuilder();
	// int firstIndex = iteration * 20;
	// int lastIndex = 0;
	// if (iteration != iterations - 1)
	// lastIndex = iteration * 20 + 20;
	// else {
	// if (modulo > 0)
	// lastIndex = iteration * 20 + modulo;
	// else
	// lastIndex = iteration * 20 + 20;
	// }
	//
	// for (int index = firstIndex; index < lastIndex; index++) {
	// ObjectId id = mediaItemIdList.getMediaItemId().get(index);
	// concatenatedIds.append(" ").append(id.getId().toString());
	// }
	// String allMediaItemsId = concatenatedIds.toString().trim();
	//
	// // request url
	// String requestUrl = GetMethods.mediaItemsRequest(allMediaItemsId);
	//
	// System.out.println("requestUrl = " + requestUrl);
	// debug = String.format("getMediaItems requestUrl =  %s", requestUrl);
	// logger.debug(debug);
	//
	// // call service
	// String response = HttpRequests
	// .getSynchronousHttpResonse(requestUrl);
	//
	// System.out.println("response = " + response);
	// debug = String
	// .format("\ngetMediaItems - 2, response from service = %s",
	// response);
	// logger.debug(debug);
	//
	// MediaItem[] r = ResponseParsers.parseMediaItemsResponse(response);
	// if (r != null) {
	// back.addAll(Lists.newArrayList(r));
	// }
	// }
	// debug = String.format("\ngetMediaItems - 3, size of response  =  %s",
	// back.size());
	// logger.debug(debug);
	//
	// return back;
	// }

	// @Override
	// public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
	// throws SociosException {
	//
	//
	// if (mediaItemIdList == null
	// || mediaItemIdList.getMediaItemId().size() == 0) {
	// throw new InvalidInputException("No input in getMediaItems");
	// }
	//
	// int size = mediaItemIdList.getMediaItemId().size();
	// System.out.println("@getMediaItems : size = " + size);
	//
	// // creates an array which contains a number of API calls
	// final ArrayList<String> requestUrls = new ArrayList<String>();
	// for (int i = 0; i < mediaItemIdList.getMediaItemId().size(); i++) {
	//
	// // creates the url for each API call
	// String requestUrl = GetMethods.getMediaItemsRequest(mediaItemIdList
	// .getMediaItemId().get(i).getId().toString());
	//
	// System.out.println("requestUrl = " + requestUrl);
	//
	// if (requestUrl != null) {
	// requestUrls.add(requestUrl);
	// }
	// }
	//
	// // call service
	// // creates asynchronous http requests for each different PersonId
	// // and aggregates their responses in a String object
	// String aggregateResponse = HttpRequests.getAsynchronousHttpResonse("",
	// requestUrls, false);
	// System.out.println("aggregateResponse = " + aggregateResponse);
	//
	// // parse response
	// List<MediaItem> getMediaItemList =
	// Arrays.asList(ResponseParsers.parseMediaItemsResponse(aggregateResponse));
	//
	// return getMediaItemList;
	// }

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException {

		String debug = String.format(
				"\ngetMediaItems - 1, input size of list = %s", mediaItemIdList
						.getMediaItemId().size());
		logger.debug(debug);

		if (mediaItemIdList.getMediaItemId() == null
				|| mediaItemIdList.getMediaItemId().size() == 0) {
			throw new InvalidInputException("No input in getMediaItems");
		}

		List<MediaItem> back = Lists.newArrayList();

		int size = mediaItemIdList.getMediaItemId().size();
		// System.out.println("@getMediaItems : size = " + size);
		int iterations = size / 20;
		int modulo = size % 20;
		if (modulo > 0)
			iterations++;

		for (int iteration = 0; iteration < iterations; iteration++) {

			// StringBuilder concatenatedIds = new StringBuilder();
			List<ObjectId> concatenatedIds = new ArrayList<ObjectId>();
			int firstIndex = iteration * 20;
			int lastIndex = 0;
			if (iteration != iterations - 1)
				lastIndex = iteration * 20 + 20;
			else {
				if (modulo > 0)
					lastIndex = iteration * 20 + modulo;
				else
					lastIndex = iteration * 20 + 20;
			}

			for (int index = firstIndex; index < lastIndex; index++) {
				ObjectId id = mediaItemIdList.getMediaItemId().get(index);
				// concatenatedIds.append(" ").append(id.getId().toString());
				concatenatedIds.add(id);
			}
			// String allMediaItemsId = concatenatedIds.toString().trim();
			// System.out.println("concatenatedIds [0] = "
			// + concatenatedIds.get(0));

			// request url
			final ArrayList<String> requestUrls = new ArrayList<String>();
			for (int i = 0; i < concatenatedIds.size(); i++) {
				// creates the url for each API call
				String requestUrl = GetMethods
						.getMediaItemsRequest(concatenatedIds.get(i).getId());
				// System.out.println("requestUrl = " + requestUrl);

				if (requestUrl != null) {
					requestUrls.add(requestUrl);
				}
			}

			// call service
			// creates asynchronous http requests for each different PersonId
			// and aggregates their responses in a String object
			String aggregateResponse = HttpRequests.getAsynchronousHttpResonse(
					"", requestUrls, false);
			// System.out.println("aggregateResponse = " + aggregateResponse);

			// // parse response
			// List<MediaItem> getMediaItemList =
			// Arrays.asList(ResponseParsers.parseMediaItemsResponse(aggregateResponse));
			//
			// return getMediaItemList;
			// }

			MediaItem[] r = ResponseParsers
					.parseMediaItemsResponse(aggregateResponse);
			if (r != null) {
				back.addAll(Lists.newArrayList(r));
			}
		}
		debug = String.format("\ngetMediaItems - 3, size of response  =  %s",
				back.size());
		logger.debug(debug);

		return back;
	}

	@Override
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {

		logger.warn("The dailymotion api doesn't support this operation!!!");

		try {
			if (eventListener.getInitiatorType().equals(InitiatorType.TOPIC)) {
				String message = "[@DailyMotionAdaptor] DailyMotion does not support topic based subscription";
				logger.debug(message);
				message = String.format(
						"[@DailyMotionAdaptor] eventListener initiatorType",
						eventListener.getInitiatorType());
				logger.debug(message);
				for (String topic : eventListener.getTopics().getTopics())
					message = String.format(
							"[@DailyMotionAdaptor] eventListener topics ",
							topic);
				logger.debug(message);
			}
		} catch (NullPointerException nex) {
			String message = "[@DailyMotionAdaptor] NullPointerException";
			logger.debug(message);
			message = String.format(
					"[@DailyMotionAdaptor]eventListener.getInitiatorType()==",
					eventListener.getInitiatorType());
			logger.debug(message);
		}
		return "DailyMotion|";
	}

	@Override
	public boolean unregisterListener(ObjectId id) {
		System.out
				.println("The dailymotion api doesn't support this operation!!!");
		logger.warn("The dailymotion api doesn't support this operation!!!");
		return true;
	}

	@Override
	public boolean disable() {
		return false;
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {

		if (personId == null) {
			String message = "No input in findMyMediaItems";
			throw new InvalidInputException(message);
		}

		String requestUrl = FindMethods.mediaItemsUserRequest(personId.getId());
		// System.out.println("requestUrl = " + requestUrl);

		String response = HttpRequests.getSynchronousHttpResonse(requestUrl);
		// System.out.println("response = " + response);

		List<MediaItem> findMediaItemsList = Arrays
				.asList(eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
						.parseMediaItemsResponse(response));

		return findMediaItemsList;
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {

		if (mediaItemId == null) {
			throw new InvalidInputException(
					"No input in getMediaItemsEmbeddedHtml");
		}

		String requestUrl = GetMethods
				.getMediaItemsRequest(mediaItemId.getId());
		// System.out.println("requestUrl = " + requestUrl);

		// call service
		String response = HttpRequests.getSynchronousHttpResonse(requestUrl);
		// System.out.println("response = " + response);

		MediaItemDisplay mediaDisplay = eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
				.parseMediaItemDisplayResponse(response);

		// System.out.println("Dailymotion EmbeddedHtml= "
		// + mediaDisplay.getEmbeddedHtml());

		return mediaDisplay;
	}

	// @Override
	// public MediaItemDisplayList getMediaItemsDisplay(
	// MediaItemIdList mediaItemIdList) throws SociosException {
	//
	// if (mediaItemIdList == null
	// || mediaItemIdList.getMediaItemId().size() == 0) {
	// throw new InvalidInputException(
	// "No input in getMediaItemsEmbeddedHtml");
	// }
	//
	// int size = mediaItemIdList.getMediaItemId().size();
	// System.out.println("@getMediaItemsEmbeddedHtml : size = " + size);
	//
	// // creates an array which contains a number of API calls
	// final ArrayList<String> requestUrls = new ArrayList<String>();
	// for (int i = 0; i < mediaItemIdList.getMediaItemId().size(); i++) {
	// String requestUrl = GetMethods.getMediaItemsRequest(mediaItemIdList
	// .getMediaItemId().get(i).getId().toString());
	//
	// System.out.println("requestUrl = " + requestUrl);
	// if (requestUrl != null) {
	// requestUrls.add(requestUrl);
	// }
	// }
	//
	// // call service
	// // creates asynchronous http requests for each different PersonId
	// // and aggregates their responses in a String object
	// String aggregateResponse = HttpRequests.getAsynchronousHttpResonse("",
	// requestUrls, false);
	// System.out.println("aggregateResponse = " + aggregateResponse);
	//
	// MediaItemDisplayList mediaDisplayList =
	// eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.ResponseParsers
	// .parseMediaItemDisplayResponse(aggregateResponse);
	//
	// System.out.println("mediaDisplayList.getMediaItemDisplay().size() = "
	// + mediaDisplayList.getMediaItemDisplay().size());
	//
	// return mediaDisplayList;
	//
	// }

}
