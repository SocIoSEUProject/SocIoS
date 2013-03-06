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
 
package eu.sociosproject.sociosapi.server.adaptors.instagram;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.instagram.filteranalyzers.PersonFilterAnalyze;
import eu.sociosproject.sociosapi.server.adaptors.instagram.filteranalyzers.MediaItemFilterAnalyze;
import eu.sociosproject.sociosapi.server.adaptors.instagram.requestconstructor.MediaItemRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.instagram.requestconstructor.PersonRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.instagram.responseparser.InstagramFindMethods;
import eu.sociosproject.sociosapi.server.adaptors.instagram.responseparser.InstagramGetMethods;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.MediaItemDisplayParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.MediaItemParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.PersonParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemDisplayProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;
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
 * 
 * @author pielakm
 * 
 */
public class InstagramAdaptor implements SnsAdaptor {
	// eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject$Null
	// cannot be cast to java.lang.String
	private Logger logger = LoggerFactory.getLogger(getClass());

	private InstagramAccessTokens instagramAccessToken;

	public InstagramAdaptor(InstagramAccessTokens instagramAccessToken) {
		this.instagramAccessToken = instagramAccessToken;
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException {
		String message = String.format("personIdList - 1, size = ",
				personIdList.getPersonId().size());
		logger.debug(message);

		// prepare request
		PersonRequestMaker requestMaker = new PersonRequestMaker();
		List<String> requestList = new ArrayList<String>();

		for (int i = 0; i < personIdList.getPersonId().size(); i++) {
			String objectId = personIdList.getPersonId().get(i).getId();
			if (objectId.trim().equals("")) {
				throw new InvalidInputException(
						"InvalidInputException: no person id input");
			}
			String request = requestMaker.getPersonById(objectId);
			// System.out.println("request = " + request);
			requestList.add(request);
		}

		// call social network instagram webservice
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, false);
		// System.out.println("response = " + response);

		// parse answer
		PersonProperty personProperty = InstagramGetMethods.getPersons();
		AbstractParser<Person> personParser = new PersonParser();
		List<Person> personList = personParser.parseToListObj(response,
				personProperty);
		message = String.format("personIdList - 2, size = ", personList.size());
		logger.debug(message);

		return personList;
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException {
		// prepare request
		PersonRequestMaker requestMaker = new PersonRequestMaker();
		List<String> requestList = new ArrayList<String>();
		if (personFilter != null) {
			PersonFilterAnalyze filterAnalyze = new PersonFilterAnalyze();
			String query = filterAnalyze.getQueryFromFilter(personFilter);
			String request = requestMaker.getPersonByQuery(query, 10);
			requestList.add(request);
		} else if (mediaItemIdList != null) {
			throw new SnUnavailableException(
					"Instagram API does not support calling findPersons with mediaIemIdList input!");
			// return null;
		}

		// call social network instagram webservice
		// String response = HttpRequests.getAsynchronousHttpResonse("data",
		// requestList, true);
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, true);
		// System.out.println("response = " + response);
		PersonProperty personProperty = InstagramFindMethods.findPersons();

		// parse answer
		AbstractParser<Person> personParser = new PersonParser();
		List<Person> personList = personParser.parseToListObj(response,
				personProperty);

		return personList;
	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList) // OK
			throws SociosException {
		String message = String.format("getMediaItems - 1, size = ",
				mediaItemIdList.getMediaItemId().size());
		logger.debug(message);

		// prepare request
		MediaItemRequestMaker requestMaker = new MediaItemRequestMaker();
		List<String> requestList = new ArrayList<String>();

		for (int i = 0; i < mediaItemIdList.getMediaItemId().size(); i++) {
			String id = mediaItemIdList.getMediaItemId().get(i).getId();
			if (id.trim().equals("")) {
				throw new InvalidInputException(
						"InvalidInputException: no media id input");
			}
			String request = requestMaker.getMediaItemById(id);
			// System.out.println("request= " + request);
			requestList.add(request);
		}

		// call social network instagram webservice
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, false);
		// String response = HttpRequests.getInstagramAsynchronousHttpResponse(
		// "data", requestList, false);
		// System.out.println("response = " + response);

		// parse answer
		AbstractParser<MediaItem> mediaItemParser = new MediaItemParser();
		MediaItemProperty prop = InstagramGetMethods.getMediaItems();
		List<MediaItem> mediaItemList = mediaItemParser.parseToListObj(
				response, prop);

		message = String.format("getMediaItems - 2, size = ",
				mediaItemList.size());
		logger.debug(message);

		return mediaItemList;
	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem, // OK
																			// HALF
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {
		String message = String.format("findMediaItems - 1");
		logger.debug(message);

		// prepare request
		MediaItemRequestMaker requestMaker = new MediaItemRequestMaker();
		List<String> requestList = new ArrayList<String>();

		if (filterPerson != null) {
			throw new SnUnavailableException(
					"Instagram API does not support calling findMediaItems with filterPerson parameter, only with filterMediaItem parameter!");
			// PersonFilterAnalyze filterAnalyze = new PersonFilterAnalyze();
			// String personId =
			// filterAnalyze.getPersonIdFromFilter(filterPerson);
			// System.out.println("personId = " + personId);
			// String request = requestMaker.getMediaItemByUserId(personId);
			// System.out.println("request = " + request);
			// requestList.add(request);
		} else if (filterMediaItem != null) {
			MediaItemFilterAnalyze filterAnalyze = new MediaItemFilterAnalyze();
			String tags = filterAnalyze.getTagsFromFilter(filterMediaItem);
			String request = requestMaker.getMediaItemByTagName(tags);
			// System.out.println("request = " + request);
			requestList.add(request);
		} else {
			throw new SnUnavailableException(
					"Instagram API does not support calling findMediaItems with personIdList parameter, only with filterMediaItem parameter!");
		}

		// call social network
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, true);
		// System.out.println("response = " + response);

		message = String.format("findMediaItems , response = %s", response);
		logger.debug(message);

		// parse answer
		AbstractParser<MediaItem> mediaItemParser = new MediaItemParser();
		List<MediaItem> mediaItemList = mediaItemParser.parseToListObj(
				response, InstagramFindMethods.findMediaItems());

		return mediaItemList;
	}

	@Override
	public List<Person> connectedPersons(ObjectId personId) // OK
			throws SociosException {
		if (personId.getId() == null || personId.getId().length() == 0) {
			String message = "No input in connectedPersons";
			throw new InvalidInputException(message);
		}
		// prepare request
		PersonRequestMaker requestMaker = new PersonRequestMaker();
		List<String> requestList = new ArrayList<String>();

		// if (personId != null) {
		String userId = personId.getId();
		String request = requestMaker.getFollowPersonsByUserId(userId);
		// System.out.println("request = " + request);
		requestList.add(request);

		// } else {
		// String msg = "No input in connectedPersons";
		// throw new InvalidInputException(msg);
		// }

		// call social network instagram webservice
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, true);

		// System.out.println("response = " + response);

		// parse answer
		AbstractParser<Person> personParser = new PersonParser();
		List<Person> personList = personParser.parseToListObj(response,
				InstagramGetMethods.getConnectedPersons());

		String message = String.format(
				"connectedPersons - 2, resultList.size = ", personList.size());
		logger.debug(message);

		return personList;
	}

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds)
			throws SociosException {
		throw new SnUnavailableException(
				"Instagram API does not support this operation!");
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException {

		throw new SnUnavailableException(
				"Instagram API does not support this operation!");
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException {
		throw new SnUnavailableException(
				"Instagram API does not support this operation!");
		// return null;
	}

	@Override
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean unregisterListener(ObjectId id) throws SociosException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean disable() throws SociosException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {

		MediaItemRequestMaker requestMaker = new MediaItemRequestMaker();
		List<String> requestList = new ArrayList<String>();

		String request = requestMaker.getMediaItemById(mediaItemId.getId());
		// System.out.println("request= " + request);
		requestList.add(request);

		// call social network instagram webservice
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, false);
		// System.out.println("response = " + response);

		// parse answer
		AbstractParser<MediaItemDisplay> mediaItemDisplayParser = new MediaItemDisplayParser();
		MediaItemDisplayProperty prop = InstagramGetMethods
				.getMediaItemsDisplay();
		List<MediaItemDisplay> mediaItemDisplayObj = mediaItemDisplayParser
				.parseToListObj(response, prop);

		return mediaItemDisplayObj.get(0);
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {
		// System.out.println("mesa sto instagram adaptor");
		// 259388661 to user id tis atc
		List<String> requestList = new ArrayList<String>();

		if (personId == null) {
			String message = "No input in findMyMediaItems";
			throw new InvalidInputException(message);
		}

		MediaItemRequestMaker requestMaker = new MediaItemRequestMaker();
		StringBuilder request = requestMaker.getMediaItemByUserId(personId
				.getId());
		// System.out.println("request = " + request.toString());

		// request.append("&access_token=259388661.ba13386.f125e3019d5d499ebd456e7dea3c2f70");
		request.append("&access_token=");
		request.append(instagramAccessToken.getToken());

		// System.out.println("total request = " + request.toString());
		requestList.add(request.toString());
		// String response = HttpRequests.getSynchronousHttpResonse(request);
		String response = HttpRequests.getAsynchronousHttpResonse("data",
				requestList, true);
		// System.out.println("response = " + response);
		// parse answer
		AbstractParser<MediaItem> mediaItemParser = new MediaItemParser();
		List<MediaItem> mediaItemList = mediaItemParser.parseToListObj(
				response, InstagramFindMethods.findMediaItems());

		// System.out.println("Instagram mediaItemList.size() = "
		// + mediaItemList.size());

		return mediaItemList;
	}

}
