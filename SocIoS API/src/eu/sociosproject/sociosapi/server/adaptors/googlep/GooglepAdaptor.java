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
 
package eu.sociosproject.sociosapi.server.adaptors.googlep;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gdata.client.Query;
import com.google.gdata.data.Link;
import com.google.gdata.data.batch.BatchId;
import com.google.gdata.data.extensions.Email;
import com.google.gdata.data.extensions.Im;
import com.google.gdata.data.extensions.Name;
import com.google.gdata.util.ServiceException;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.googlep.filteranalyzers.ActivityFilterAnalyze;
import eu.sociosproject.sociosapi.server.adaptors.googlep.filteranalyzers.MediaItemFilterAnalyze;
import eu.sociosproject.sociosapi.server.adaptors.googlep.filteranalyzers.PersonFilterAnalyze;
import eu.sociosproject.sociosapi.server.adaptors.googlep.requestconstructor.ActivityRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.googlep.requestconstructor.PersonRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser.GooglepFindMethods;
import eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser.GooglepFindParser;
import eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser.GooglepGetMethods;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ActivityParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.MediaItemParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.PersonParser;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;

/**
 * Google Plus Apdator class is designed to provide operations on google plus
 * api
 * 
 * @author pielakm
 * 
 */
public class GooglepAdaptor implements SnsAdaptor {
	/**
	 * logger
	 */
	private final Logger logger = LoggerFactory.getLogger(getClass());

	public GooglepAdaptor(GooglepAccessTokens googlepAccessTokens) {
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException {

		String debug = String.format(
				"\nGetPersons - 1, input size of list = %s", personIdList
						.getPersonId().size());
		logger.debug(debug);

		if (debug.equals(null)) {
			String message = "No input in getPersons";
			throw new InvalidInputException(message);
		}

		// prepare request
		ArrayList<String> requestList = new ArrayList<String>();
		PersonRequestMaker requestMaker = new PersonRequestMaker();

		for (int i = 0; i < personIdList.getPersonId().size(); i++) {
			ObjectId objectId = personIdList.getPersonId().get(i);
			if (objectId.getId().trim().equals("")) {
				throw new InvalidInputException(
						"InvalidInputException: no person id input");
			}
			String request = requestMaker
					.getPersonReguestById(objectId.getId());
			// System.out.println("request = " + request);
			requestList.add(request);
		}

		// call service
		String response = HttpRequests.getAsynchronousHttpResonse("",
				requestList, false);
		// System.out.println("response = " + response);

		debug = String.format("\nGetPersons - 2, response from service = %s",
				response);
		logger.debug(debug);

		// parse response to personList
		AbstractParser<Person> personParser = new PersonParser();
		List<Person> personList = null;
		try {
			personList = personParser.parseToListObj(response,
					GooglepGetMethods.getPersons());
		} catch (Exception ex) {
			System.out.println("Google plus getPersons(), exception occured : "
					+ ex.getMessage());
		}
		debug = String.format(
				"\nGetPersons - 3, size of response personList =  %s",
				personList.size());
		logger.debug(debug);

		// System.out.println("personList.size() = " + personList.size());
		return personList;

	}

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds)
			throws SociosException {
		String debug = String.format(
				"\ngetActivities - 1,  input size of list = %s", activityIds
						.getActivityId().size());
		logger.debug(debug);

		// prepare request
		ActivityRequestMaker requestMaker = new ActivityRequestMaker();
		ArrayList<String> requestList = new ArrayList<String>();

		for (int i = 0; i < activityIds.getActivityId().size(); i++) {
			ObjectId objId = activityIds.getActivityId().get(i);
			if (objId.getId().trim().equals("")) {
				throw new InvalidInputException(
						"InvalidInputException: no activity id input");
			}
			String request = requestMaker.getActivityRequestById(objId.getId());
			requestList.add(request);
		}
		// call service
		String response = HttpRequests.getAsynchronousHttpResonse("",
				requestList, false);

		debug = String.format(
				"\ngetActivities - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response to list of Activity
		AbstractParser<Activity> activityParser = new ActivityParser();
		List<Activity> activityList = activityParser.parseToListObj(response,
				GooglepGetMethods.getActivities());

		debug = String.format(
				"\ngetActivities - 3, size of response activityList =  %s",
				activityList.size());
		logger.debug(debug);

		return activityList;
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException {

		logger.debug("findPersons - 1");

		// prepare request
		ArrayList<String> requestList = new ArrayList<String>();
		PersonRequestMaker requestMaker = new PersonRequestMaker();

		if (personFilter != null) {
			PersonFilterAnalyze filter = new PersonFilterAnalyze();
			String query = filter.getQueryFromFilter(personFilter);
			String request = requestMaker.getPersonRequestByQuery(query);
			// System.out.println("request = " + request);
			requestList.add(request);
		} else {
			logger.warn("The google plus api doesn't support this operations!!!");
			throw new SnUnavailableException(
					"The google plus API doesn't support this operation!");
		}

		// call service
		String response = HttpRequests.getAsynchronousHttpResonse("items",
				requestList, true);
		// System.out.println("response = " + response);

		String debug = String.format(
				"findPersons - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response to personList
		AbstractParser<Person> personParser = new PersonParser();
		List<Person> personList = personParser.parseToListObj(response,
				GooglepFindMethods.findPersons());

		debug = String.format(
				"\nfindPersons - 3, size of response personList =  %s",
				personList.size());
		logger.debug(debug);

		return personList;
	}

	// @Override
	// public List<Activity> findActivities(ActivityFilter activityFilter,
	// PersonFilter personFilter, MediaItemIdList mediaItemIdList,
	// PersonIdList personIdList) throws SociosException {
	//
	// logger.debug("\nfindActivities - 1");
	//
	// // prepare request
	// String query = "";
	// ActivityRequestMaker requestMaker = new ActivityRequestMaker();
	// List<String> requestList = new ArrayList<String>();
	// if (activityFilter != null) {
	// ActivityFilterAnalyze filter = new ActivityFilterAnalyze();
	// query = filter.getQueryFromFilter(activityFilter);
	// String request = requestMaker.getActivityRequestByQuery(query);
	// requestList.add(request);
	// } else if (personFilter != null) {
	// if (personFilter.getId() != null
	// && personFilter.getId().getObjectId() != null) {
	// for (ObjectId objId : personFilter.getId().getObjectId()) {
	// String id = objId.getId();
	// String request = requestMaker
	// .getListActivityRequestByUserId(id);
	// requestList.add(request);
	// }
	// }
	// } else if (personIdList != null) {
	// for (int i = 0; i < personIdList.getPersonId().size(); i++) {
	// String personId = personIdList.getPersonId().get(i).getId();
	// String request = requestMaker
	// .getListActivityRequestByUserId(personId);
	// System.out.println("request = " + request);
	// requestList.add(request);
	// }
	// } else if (mediaItemIdList != null) {
	// logger.warn("The google plus api doesn't support calling findActivities with mediaItemIdList input!!!");
	// throw new SnUnavailableException(
	// "The google plus api doesn't support calling findActivities with mediaItemIdList input!!!");
	// } else {
	// throw new SnUnavailableException(
	// "Check again the code!");
	// }
	//
	// // call service
	// // String response = HttpRequests.getAsynchronousHttpResonse("items",
	// // requestList, true);
	// String response =
	// HttpRequests.getInstagramAsynchronousHttpResponse("items",
	// requestList, true);
	// System.out.println("response = " + response);
	//
	// String debug = String.format(
	// "\nfindActivities - 2, response from service = %s", response);
	// logger.debug(debug);
	//
	// // parse response to list of Activity
	// AbstractParser<Activity> activityParser = new ActivityParser();
	// List<Activity> activityList = activityParser.parseToListObj(response,
	// GooglepFindMethods.findActivities());
	//
	// debug = String.format(
	// "\nfindActivities - 3, size of response activityList =  %s",
	// activityList.size());
	// logger.debug(debug);
	//
	// return activityList;
	// }

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException {

		logger.debug("\nfindActivities - 1");

		// prepare request
		String query = "";
		ActivityRequestMaker requestMaker = new ActivityRequestMaker();
		List<String> requestList = new ArrayList<String>();
		if (activityFilter != null) {
			ActivityFilterAnalyze filter = new ActivityFilterAnalyze();
			query = filter.getQueryFromFilter(activityFilter);
			String request = requestMaker.getActivityRequestByQuery(query);
			requestList.add(request);
		} else if (personFilter != null) {
			if (personFilter.getId() != null
					&& personFilter.getId().getObjectId() != null) {
				for (ObjectId objId : personFilter.getId().getObjectId()) {
					String id = objId.getId();
					String request = requestMaker
							.getListActivityRequestByUserId(id);
					requestList.add(request);
				}
			}
		} else if (personIdList != null) {
			for (int i = 0; i < personIdList.getPersonId().size(); i++) {
				String personId = personIdList.getPersonId().get(i).getId();
				String request = requestMaker
						.getListActivityRequestByUserId(personId);
				// System.out.println("request = " + request);
				requestList.add(request);
			}
		} else if (mediaItemIdList != null) {
			logger.warn("The google plus api doesn't support calling findActivities with mediaItemIdList input!!!");
			throw new SnUnavailableException(
					"The google plus api doesn't support calling findActivities with mediaItemIdList input!!!");
		} else {
			throw new SnUnavailableException("Check again the code!");
		}

		// call service
		String response = HttpRequests.getAsynchronousHttpResonse("items",
				requestList, true);
	    // System.out.println("response = " + response);

		String debug = String.format(
				"\nfindActivities - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response to list of Activity
		List<Activity> activityList = GooglepFindParser
				.parseFindActivitiesGoogleP(response);

		debug = String.format(
				"\nfindActivities - 3, size of response activityList =  %s",
				activityList.size());
		logger.debug(debug);

		return activityList;
	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {

		logger.debug("findMediaItems - 1");

		// prepare request
		ActivityRequestMaker requestMaker = new ActivityRequestMaker();
		String request = null;
		List<MediaItem> totalMediaItemList = new ArrayList<MediaItem>();

		if (filterMediaItem != null) {
			MediaItemFilterAnalyze analyzeFilter = new MediaItemFilterAnalyze();
			String query = analyzeFilter.getQueryFromFilter(filterMediaItem);
			request = requestMaker.getActivityRequestByQuery(query);
			// System.out.println("request = " + request);

		} else {
			logger.warn("The google plus api doesn't support this operation!!!");
			throw new SnUnavailableException(
					"The google plus API doesn't support this operation!");
			// return null;
		}

		// call service
		String response = HttpRequests.getSynchronousHttpResonse(request);
		// System.out.println("response = " + response);

		String debug = String.format(
				"findMediaItems - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response
		List<MediaItem> mediaItemList = GooglepFindParser
				.parseFindMediaItemsGoogleP(response);

		totalMediaItemList.addAll(mediaItemList);

		String pageToken = getPageToken(response);

		for (int i = 0; i < 8; i++) {

			response = extendMediaItemsResponse(request, pageToken);

			List<MediaItem> nextMediaItemList = GooglepFindParser
					.parseFindMediaItemsGoogleP(response);

			totalMediaItemList.addAll(nextMediaItemList);
			pageToken = getPageToken(response);

		}

		// System.out.println("googlep totalMediaItemList.size = "
		// + totalMediaItemList.size());

		return totalMediaItemList;
	}

	public String extendMediaItemsResponse(String request, String pageToken)
			throws SociosException {

		StringBuilder aggregateRequest = new StringBuilder();
		aggregateRequest.append(request);
		aggregateRequest.append("&pageToken=");
		aggregateRequest.append(pageToken);

		// System.out.println("aggregateRequest = " +
		// aggregateRequest.toString());

		String nextResponse = HttpRequests
				.getSynchronousHttpResonse(aggregateRequest.toString());

		String debug = String.format(
				"findMediaItems - 2, response from service = %s", nextResponse);
		logger.debug(debug);

		// System.out.println("response = " + response);

		return nextResponse;
	}

	public String getPageToken(String response) {

		JSONObject googlepJson = null;
		try {
			googlepJson = new JSONObject(response);
		} catch (JSONException e) {
			e.printStackTrace();
		}

		String nextPageToken = googlepJson.optString("nextPageToken");
		// System.out.println("nextPageToken = " + nextPageToken);

		return nextPageToken;

	}

	@Override
	public boolean disable() throws SociosException {
		return false;
	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The google plus API doesn't support this operation!");
	}

	@Override
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		return null;
	}

	@Override
	public boolean unregisterListener(ObjectId id) throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		return false;
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds)
			throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		return null;
	}

	@Override
	public List<Person> connectedPersons(ObjectId personId)
			throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The google plus API doesn't support this operation!");
		// return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor#myConnectedPersons
	 * (eu.sociosproject.sociosvoc.ObjectId)
	 */
	@Override
	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException {
		System.out
				.println("The google plus api doesn't support this operation!!!");
		logger.warn("The google plus api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The google plus API doesn't support this operation!");
		// return null;

	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {
		logger.warn("The google plus api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"The google plus API doesn't support this operation!");
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

}
