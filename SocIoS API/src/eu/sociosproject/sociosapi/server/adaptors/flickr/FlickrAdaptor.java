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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.jws.WebMethod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import socios.jpa.services.AccessInfo;
import socios.jpa.services.TokenService;
import socios.jpa.services.TokenServiceService;
//import sun.net.www.content.text.plain;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.IllegalRequestException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.Constants;

import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
//import eu.sociosproject.sociosvoc.Address;
//import eu.sociosproject.sociosvoc.KnownSns;
//import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosvoc.Source;
//import eu.sociosproject.sociosvoc.Source

import eu.sociosproject.sociosvoc.InitiatorType;
import eu.sociosproject.sociosapi.server.adaptors.flickr.exceptions.FlickrExceptions;

public class FlickrAdaptor implements SnsAdaptor {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private FlickrAcessTokens flickrToken;

	public FlickrAdaptor(FlickrAcessTokens flickrToken) {
		this.flickrToken = flickrToken;
	}

	FlickrExceptions flickrExceptions = new FlickrExceptions();

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds)
			throws SociosException {
		logger.warn("The flickr api doesn't support this operations!!!");
		throw new SnUnavailableException(
				"Flickr API doesn't support this operation!");
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
		String requestUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindConnectedMethods
				.connectedPersonsRequest(personId.getId().toString());

		// System.out.println("requestUrl = " + requestUrl);
		debug = String.format("\nconnectedPersons - 2, requestUrl = %s",
				requestUrl);
		logger.debug(debug);

		// call service
		String response = HttpRequests.getSynchronousHttpResonse(requestUrl);
		// System.out.println("response: " + response);
		debug = String.format(
				"\nconnectedPersons - 3, response from service = %s", response);
		logger.debug(debug);

		flickrExceptions.connectedPersonsException(response);

		// parse response
		List<Person> connectedPersonsList = Arrays
				.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindConnectedMethods
						.parseConnectedPersonsResponse(response));

		debug = String.format("\nconnectedPersons - 4, size of response =  %s",
				connectedPersonsList.size());
		logger.debug(debug);

		return connectedPersonsList;

	}

	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException {

		String debug = String.format(
				"\nmyConnectedPersons - 1, input size = %s", personId.getId()
						.length());
		logger.debug(debug);

		if (personId.getId().length() == 0) {
			String message = "No input in myConnectedPersons";
			throw new InvalidInputException(message);
		}

		String urlStr = "http://api.flickr.com/services/rest/?method=flickr.contacts.getList";
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setAllowUserInteraction(false);

			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");

			String auth_token = flickrToken.getToken();
			System.out.println("auth token = " + auth_token);

			String sig = Constants.API_SECRET + "api_key" + Constants.API_KEY
					+ "auth_token" + auth_token + "formatjson"
					+ "methodflickr.contacts.getList" + "nojsoncallback1";

			String api_sig = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities
					.MD5(sig);
			System.out.println("api_sig = " + api_sig);

			String[] paramName = { "api_key", "auth_token", "api_sig",
					"format", "nojsoncallback" };
			String[] paramVal = { Constants.API_KEY, auth_token, api_sig,
					"json", "1" };

			OutputStream out = conn.getOutputStream();
			Writer writer = new OutputStreamWriter(out, "UTF-8");

			for (int i = 0; i < paramName.length; i++) {
				writer.write(paramName[i]);
				writer.write("=");
				writer.write(URLEncoder.encode(paramVal[i], "UTF-8"));
				writer.write("&");
			}
			writer.close();

			out.close();

			if (conn.getResponseCode() != 200) {
				throw new IOException(conn.getResponseMessage());
			}

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getStringFromInputStream(conn.getInputStream());
			System.out.println("response = " + response);

			debug = String.format(
					"\nmyConnectedPersons - 2, response from service = %s",
					response);
			logger.debug(debug);

			conn.disconnect();

			List<Person> myConnectedPersonsList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindConnectedMethods
							.parseMyConnectedPersonsResponse(response));

			debug = String.format(
					"\nmyConnectedPersons - 3, size of response =  %s",
					myConnectedPersonsList.size());
			logger.debug(debug);

			return myConnectedPersonsList;

		} catch (Exception e) {
			flickrExceptions.myConnectedPersonsException();
			e.printStackTrace();
			e.getMessage();
			return null;
		}
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException /* , IOException */{

		logger.debug("\nfindActivities - 1");

		ArrayList<Activity> res = new ArrayList<Activity>();

		if (personIdList != null) {

			List<ObjectId> list = personIdList.getPersonId();

			for (ObjectId obj_id : list) {

				String user_id = obj_id.getId();

				// prepare request
				String requestUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
						.mediaItemsRequest(user_id);
				System.out.println("requestUrl = " + requestUrl);

				String debug = String.format(
						"\nfindActivities - 2, requestUrl = %s", requestUrl);
				logger.debug(debug);

				// call service
				String responseMedia = HttpRequests
						.getSynchronousHttpResonse(requestUrl);
				// System.out.println("responseMedia = " + responseMedia);

				debug = String.format(
						"\nfindActivities - 3, response from service = %s",
						responseMedia);
				logger.debug(debug);

				flickrExceptions.findActivitiesException(responseMedia);

				List<MediaItem> aggregateResponseMedia = null;

				try {
					aggregateResponseMedia = Arrays
							.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
									.parseFindMediaItemsFromMediaItemResponse(responseMedia));

					if (aggregateResponseMedia != null
							&& !aggregateResponseMedia.isEmpty()) {

						Activity newActivity = new Activity();
						newActivity.setUserId(obj_id);
						newActivity.getMediaItems().addAll(
								aggregateResponseMedia);
						System.out
								.println("in flickr adaptor, findActivities() return "
										+ newActivity.getMediaItems().size()
										+ " mediaItems");
						res.add(newActivity);
					}
				} catch (Exception ex) {
					// ex.printStackTrace();
					System.out
							.println("Flickr findActivities(), exception for userId "
									+ obj_id.getId() + " : " + ex.getMessage());
				}

			}// end for
		}// end if

		String debug = String.format(
				"\nfindActivities - 4, size of response res =  %s", res.size());
		logger.debug(debug);

		return res;
	}

	// @Override
	// public List<Activity> findActivities(ActivityFilter activityFilter,
	// PersonFilter personFilter, MediaItemIdList mediaItemIdList,
	// PersonIdList personIdList) throws SociosException /* , IOException */{
	//
	// logger.debug("\nfindActivities - 1");
	//
	// ArrayList<Activity> res = new ArrayList<Activity>();
	//
	// if (personIdList != null) {
	//
	// List<ObjectId> list = personIdList.getPersonId();
	//
	// for (ObjectId obj_id : list) {
	//
	// String user_id = obj_id.getId();
	//
	// // prepare request
	// String requestUrl =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
	// .recentMediaItemsRequest(user_id);
	// // System.out.println("requestUrl = " + requestUrl);
	//
	// String debug = String.format(
	// "\nfindActivities - 2, requestUrl = %s", requestUrl);
	// logger.debug(debug);
	//
	// // call service
	// String responseMedia = HttpRequests
	// .getSynchronousHttpResonse(requestUrl);
	// // System.out.println("responseMedia = " + responseMedia);
	//
	// debug = String.format(
	// "\nfindActivities - 3, response from service = %s",
	// responseMedia);
	// logger.debug(debug);
	//
	// flickrExceptions.findActivitiesException(responseMedia);
	//
	// List<MediaItem> aggregateResponseMedia = null;
	//
	// try {
	// aggregateResponseMedia = Arrays
	// .asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
	// .parseFindMediaItemsFromMediaItemResponse(responseMedia));
	//
	// if (aggregateResponseMedia != null
	// && !aggregateResponseMedia.isEmpty()) {
	//
	// Activity newActivity = new Activity();
	// newActivity.setUserId(obj_id);
	// newActivity.getMediaItems().addAll(
	// aggregateResponseMedia);
	// System.out.println("in flickr adaptor, findActivities() return " +
	// newActivity.getMediaItems().size() + " mediaItems");
	// res.add(newActivity);
	// }
	// } catch (Exception ex) {
	// //ex.printStackTrace();
	// System.out
	// .println("Flickr findActivities(), exception for userId "
	// + obj_id.getId() + " : " + ex.getMessage());
	// }
	//
	// }// end for
	// }// end if
	//
	// String debug = String.format(
	// "\nfindActivities - 4, size of response res =  %s", res.size());
	// logger.debug(debug);
	//
	// return res;
	// }

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException {

		// long time = System.currentTimeMillis();
		// Date d = new Date(time);
		// System.out.println(" SOCIOS_EVAL CORE FLICKR starting measure at = "
		// + d);

		logger.debug("findMediaItems - 1");

		if (filterMediaItem != null) {

			// prepare request
			String requestUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
					.mediaItemsRequest(filterMediaItem);

			// System.out.println("requestUrl = " + requestUrl);
			String debug = String.format(
					"findMediaItems filterMediaItem - 2, requestUrl = %s",
					requestUrl);
			logger.debug(debug);

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getSynchronousHttpResonse(requestUrl);

			debug = String
					.format("findMediaItems filterMediaItem - 3, response from service = %s",
							response);
			logger.debug(debug);
			// System.out.println("response = " + response);

			flickrExceptions.findMediaItemsException(response);

			// parse response
			List<MediaItem> findMediaItemList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
							.parseFindMediaItemsFromMediaItemResponse(response));
			debug = String
					.format("findMediaItems filterMediaItem - 4, size of response =  %s",
							findMediaItemList.size());
			logger.debug(debug);

			// System.out.println("Flickr findMediaItemList size = "
			// + findMediaItemList.size());

			// for (MediaItem mediaItem : findMediaItemList) {
			//
			// String mediaItemId = mediaItem.getId().getId();
			// //System.out.println("mediaItemId = " + mediaItemId);
			//
			// // prepare request
			// String url =
			// eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods.mediaItemsRequest(mediaItemId);
			// //System.out.println("url = " + url);
			//
			// // call service
			// String aggregatedResponse = HttpRequests
			// .getSynchronousHttpResonse(url);
			//
			// //System.out.println("aggregatedResponse = " +
			// aggregatedResponse);
			//
			//
			// try {
			// JSONObject jObject = new JSONObject(aggregatedResponse);
			// JSONObject photo = jObject.optJSONObject("photo");
			// if (photo.has("license")) {
			// //System.out.println("photo has license");
			// String license = photo.optString("license");
			// License flickrLicense = new License();
			// flickrLicense.setId(license);
			//
			// if (license.equals("0")) {
			// flickrLicense.setName("All Rights Reserved");
			// flickrLicense
			// .setUrl("http://info.yahoo.com/legal/us/yahoo/copyright/en-us/");
			// }
			//
			// else if (license.equals("4")) {
			// flickrLicense.setName("Attribution License");
			// flickrLicense
			// .setUrl("http://creativecommons.org/licenses/by/2.0/");
			// }
			//
			// mediaItem.setLicense(flickrLicense);
			//
			// }
			//
			// } catch (JSONException e) {
			// System.out
			// .println("problem sti findmediaitems sto license");
			// e.printStackTrace();
			// }
			//
			// }//end for

			// time = System.currentTimeMillis() - time;
			// System.out.println(" SOCIOS_EVAL CORE FLICKR calling findMediaItems() and getting "
			// + findMediaItemList.size() + " results in " + time + " msec");

			return findMediaItemList;

		} else if (filterPerson != null) {

			// prepare request
			String requestUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
					.mediaItemsRequest(filterPerson);

			String debug = String.format(
					"findMediaItems filterPerson - 2, requestUrl = %s",
					requestUrl);
			logger.debug(debug);

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getSynchronousHttpResonse(requestUrl);

			debug = String
					.format("findMediaItems filterPerson - 3, response from service = %s",
							response);
			logger.debug(debug);

			// parse response
			List<MediaItem> findMediaItemList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
							.parseFindMediaItemsFromMediaItemResponse(response));
			debug = String.format(
					"findMediaItems filterPerson - 4, size of response =  %s",
					findMediaItemList.size());
			logger.debug(debug);

			return findMediaItemList;

		} else if (personIdList != null) {

			// prepare request
			ArrayList<String> requestUrls = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
					.mediaItemsRequest(personIdList);
			// for (int i = 0; i < requestUrls.size(); i++) {
			// System.out.println("requestUrl = " + requestUrls.get(i));
			// }

			String debug = String.format(
					"findMediaItems  personIdList - 2, requestUrls = %s",
					requestUrls);
			logger.debug(debug);

			// call service
			String response = HttpRequests.getFlickrAsynchronousHttpResponse(
					"photos", requestUrls, false);
			// String response =
			// HttpRequests.getAsynchronousHttpResonse("photos",
			// requestUrls, false);
			// System.out.println("response = " + response);

			debug = String
					.format("findMediaItems personIdList - 3, response from service = %s",
							response);
			logger.debug(debug);

			// parse response

			List<MediaItem> findMediaItemList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
							.parseFindMediaItemsResponse(response));

			debug = String
					.format("findMediaItems personIdList - 4, size of response mediaItemList =  %s",
							findMediaItemList.size());
			logger.debug(debug);

			return findMediaItemList;

		} else {
			String message = "No input in findMediaItems";
			throw new InvalidInputException(message);
		}

	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException {

		logger.debug("findPersons - 1");

		if (personFilter != null) {

			// prepare request
			String requestUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
					.personsRequest(personFilter);
			// System.out.println("requestUrl = " + requestUrl);
			String debug = String
					.format("findPersons PersonFilter - 2, requestUrl = %s",
							requestUrl);
			logger.debug(debug);

			// call service
			String response = HttpRequests
					.getSynchronousHttpResonse(requestUrl);
			// System.out.println("response = " + response);
			debug = String.format(
					"findPersons PersonFilter - 3, response from service = %s",
					response);
			logger.debug(debug);

			flickrExceptions.findPersonsPersonFilterException(response);

			// parse response
			ObjectId[] personIds = eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
					.parseFindPersonsResponse(response);

			if (personIds == null || personIds.length == 0)
				throw new InvalidInputException(
						"in findPersons: personId is null");

			PersonIdList list = new PersonIdList();
			for (ObjectId id : personIds) {
				list.getPersonId().add(id);
			}
			List<Person> findPersonList = getPersons(list);

			debug = String
					.format("findPersons personFilter - 4, size of response personIds =  %s",
							findPersonList.size());
			logger.debug(debug);

			return findPersonList;

		} else if (mediaItemIdList != null) {

			// prepare request & call service
			String response = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.ResponseRetriever
					.retrieveMediaItemsResponse(mediaItemIdList);
			// System.out.println("response = " + response);
			String debug = String.format(
					"findPersons mediaItemIdList - 3, response = %s", response);
			logger.debug(debug);

			// parse response
			List<Person> findPersonList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
							.parseFindPersonsFromMediaItemsResponse(response));
			debug = String.format(
					"findPersons mediaItemIdList - 4, size of response =  %s",
					findPersonList.size());
			logger.debug(debug);

			return findPersonList;
		}
		String message = "No input in findPersons";
		// System.out.println(message);
		throw new InvalidInputException(message);
	}

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds)
			throws SociosException {

		logger.warn("Flickr api doesn't support this operation!!!");
		throw new SnUnavailableException(
				"Flickr API doesn't support this operation!");

	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException {

		String debug = String.format(
				"\ngetMediaItems - 1, input size of list = %s", mediaItemIdList
						.getMediaItemId().size());
		logger.debug(debug);

		// prepare request and call service
		String response = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.ResponseRetriever
				.retrieveMediaItemsResponse(mediaItemIdList);
		debug = String.format(
				"\ngetMediaItems - 2, response from service = %s", response);
		logger.debug(debug);

		// parse response
		List<MediaItem> items = Arrays
				.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
						.parseMediaItemsResponse(response));

		for (MediaItem item : items) {

			item.setRating(-1.0);
			BigInteger big = new BigInteger("-1");
			item.setNumRatings(big);
			item.setNumNegativeVotes(big);
			item.setNumPositiveVotes(big);
			item.setNumVotes(big);
			item.setNumResharings(big);

			String mediaItemId = item.getId().getId();
			String url = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods
					.nummFavoritesRequest(mediaItemId);
			debug = String.format(
					"\ngetMediaItems, nummFavoritesRequestUrl = %s", url);
			logger.debug(debug);
			String aggregatedResponse = HttpRequests
					.getSynchronousHttpResonse(url);

			String numFavourites = eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
					.parseNumFavorites(aggregatedResponse);
			debug = String.format("\ngetMediaItems, parseNumFavorites = %s",
					numFavourites);
			logger.debug(debug);

			BigInteger q = BigInteger.valueOf(Long.parseLong(numFavourites));
			item.setNumFavorites(q);
		}

		debug = String.format("\ngetMediaItems - 3, size of response  =  %s",
				items.size());
		logger.debug(debug);

		return items;
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException {

		String debug = String.format(
				"\nGetPersons - 1, input size of list = %s", personIdList
						.getPersonId().size());
		logger.debug(debug);

		if (personIdList == null || personIdList.getPersonId().size() == 0) {
			String message = "No input in getPersons";
			throw new InvalidInputException(message);
		}

		// prepare request
		// creates an array which contains a number of API calls
		final ArrayList<String> requestUrls = new ArrayList<String>();
		for (int i = 0; i < personIdList.getPersonId().size(); i++) {

			String url = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods
					.personRequest(personIdList.getPersonId().get(i).getId()
							.toString());
			if (url != null) {
				requestUrls.add(url);
			}
		}
		debug = String.format("\nGetPersons - 2, initial requestUrls = %s",
				requestUrls);
		logger.debug(debug);

		// call service
		// creates asynchronous http requests for each different PersonId
		String response = HttpRequests.getFlickrAsynchronousHttpResponse(
				"person", requestUrls, false);
		debug = String.format(
				"\nGetPersons - 3, initial response from service = %s",
				response);
		logger.debug(debug);

		// parse response
		List<Person> persons = Arrays
				.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
						.parsePersonsResponse(response));

		for (Person person : persons) {
			BigInteger big = new BigInteger("-1");
			person.setOutDegree(big);
			person.setInDegree(big);

			String personId = person.getId().getId();
			debug = String.format("\nGetPersons -1, personId = %s", response);
			logger.debug(debug);

			// prepare request
			String url = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindConnectedMethods
					.connectedPersonsRequest(personId);
			debug = String.format(
					"\nGetPersons - 4, connectedPersonsRequest = %s", url);
			logger.debug(debug);

			// call service
			String aggregatedResponse = HttpRequests
					.getSynchronousHttpResonse(url);
			debug = String
					.format("\nGetPersons - 5, connectedPersonsRequest aggregatedResponse = %s",
							aggregatedResponse);
			logger.debug(debug);

			try {
				String numFriends = eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindConnectedMethods
						.parseNumFriends(aggregatedResponse);
				debug = String.format("\nGetPersons - 6, numFriends = %s",
						numFriends);
				logger.debug(debug);

				BigInteger q = new BigInteger(numFriends);
				person.setNumFriends(q);

			} catch (Exception e) {
				System.out.println("Error parsing number of friends");
			}

		}
		debug = String.format("\nGetPersons - 7, size of response =  %s",
				persons.size());
		logger.debug(debug);

		return persons;

	}

	@WebMethod
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {

		logger.debug("registerListener - 1");

		String urlStr = "http://api.flickr.com/services/rest/?method=flickr.push.subscribe";
		try {
			if (eventListener.getInitiatorType().equals(InitiatorType.TOPIC)) {
				System.out
						.println("[@FlickRAdaptor] FlickR does not support topic based subscription");
				System.out
						.println("[@FlickRAdaptor] eventListener initiatorType"
								+ eventListener.getInitiatorType());
				for (String topic : eventListener.getTopics().getTopics())
					System.out.println("[@FlickRAdaptor] eventListener topics "
							+ topic);
				return "FlickR|";
			}
		} catch (NullPointerException nex) {
			System.out.println("[@FlickRAdaptor] NullPointerException");
			System.out
					.println("[@FlickRAdaptor]eventListener.getInitiatorType()=="
							+ eventListener.getInitiatorType());
			return "FlickR|";
		}
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setAllowUserInteraction(false);

			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");

			for (ObjectId targetId : eventListener.getTargets()) {
				TokenServiceService service = new TokenServiceService();
				TokenService port = service.getTokenServicePort();

				AccessInfo info = port.getAccessInfoBySnsIdAndSnsUserId(1,
						targetId.getId());
				String auth_token = info.getAccessToken();
				// String callback =
				// "http://localhost:8080/CallbackFunction?topic=my_photos" +
				// "&user_id=" + info.getAccessInfoPK().getUserId();
				// System.out.println("callback: " + callback);

				// String auth_token = flickrToken.getToken();
				System.out.println("auth_token: " + auth_token);

				// String auth_token = "72157629634549158-70421bb19059d875";
				// String auth_token = "72157629596493437-a288355a39a9d85d";

				String callback = "http://147.102.19.122:8080/CoreServices/CallbackFunction?user_id="
						+ targetId.getId() + "&topic=my_photos";

				String debug = String.format(
						"\nregisterListener - 2, callback = %s", callback);
				logger.debug(debug);

				String sig = Constants.API_SECRET + "api_key"
						+ Constants.API_KEY + "auth_token" + auth_token
						+ "callback" + callback + "methodflickr.push.subscribe"
						+ "topicmy_photos" + "verifyasync"
						+ "verify_tokenmyToken12";

				debug = String.format("\nregisterListener - 3, sig = %s", sig);
				logger.debug(debug);

				String api_sig = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities
						.MD5(sig);

				String[] paramName = { "api_key", "topic", "callback",
						"verify", "verify_token", "auth_token", "api_sig" };

				String[] paramVal = { Constants.API_KEY, "my_photos", callback,
						"async", "myToken12", auth_token, api_sig };

				OutputStream out = conn.getOutputStream();
				Writer writer = new OutputStreamWriter(out, "UTF-8");
				for (int i = 0; i < paramName.length; i++) {
					writer.write(paramName[i]);
					writer.write("=");
					writer.write(URLEncoder.encode(paramVal[i], "UTF-8"));
					writer.write("&");
				}
				writer.close();
				out.close();
				debug = String.format("\nregisterListener - 4, writer = %s",
						writer);
				logger.debug(debug);
				debug = String.format("\nregisterListener - 5, out = %s", out);
				logger.debug(debug);

				if (conn.getResponseCode() != 200) {
					throw new IOException(conn.getResponseMessage());
				}

				BufferedReader rd = new BufferedReader(new InputStreamReader(
						conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();

				debug = String.format("\nregisterListener - 6, rd = %s", rd);
				logger.debug(debug);

				conn.disconnect();

				debug = String.format("\nregisterListener - 7, sb = %s", sb);
				logger.debug(debug);

			}

		} catch (Exception e) {
			System.out.println("in registerListener catch");
			e.printStackTrace();
			return null;
		}
		return "ok";

	}

	// @Override
	@WebMethod
	public boolean unregisterListener(ObjectId id) throws SociosException {

		logger.debug("unregisterListener - 1");

		String urlStr = "http://api.flickr.com/services/rest/?method=flickr.push.unsubscribe";

		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setAllowUserInteraction(false);

			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");

			String auth_token = flickrToken.getToken();
			String debug = String.format("unregisterListener auth_token = %s",
					auth_token);
			logger.debug(debug);

			// String auth_token = "72157629160134880-aa4731b7ff40f4f5";

			String callback = "http://localhost:8080/CallbackFunction?user_id="
					+ id.getId() + "&topic=my_photos";
			debug = String.format("unregisterListener userid = %s", id.getId());
			logger.debug(debug);

			debug = String.format("unregisterListener callback = %s", callback);
			logger.debug(debug);

			String sig = Constants.API_SECRET + "api_key" + Constants.API_KEY
					+ "auth_token" + auth_token + "callback" + callback
					+ "methodflickr.push.subscribe" + "topicmy_photos"
					+ "verifyasync" + "verify_tokenmyToken12";

			debug = String.format("unregisterListener sig = %s", sig);
			logger.debug(debug);

			String api_sig = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities
					.MD5(sig);

			String[] paramName = { "api_key", "topic", "callback", "verify",
					"verify_token", "auth_token", "api_sig" };

			String[] paramVal = { Constants.API_KEY, "my_photos", callback,
					"async", "myToken12", auth_token, api_sig };

			OutputStream out = conn.getOutputStream();
			Writer writer = new OutputStreamWriter(out, "UTF-8");
			for (int i = 0; i < paramName.length; i++) {
				writer.write(paramName[i]);
				writer.write("=");
				writer.write(URLEncoder.encode(paramVal[i], "UTF-8"));
				writer.write("&");
			}
			writer.close();
			out.close();

			debug = String.format("unregisterListener writer = %s", writer);
			logger.debug(debug);
			debug = String.format("unregisterListener out = %s", out);
			logger.debug(debug);

			if (conn.getResponseCode() != 200) {
				throw new IOException(conn.getResponseMessage());
			}

			BufferedReader rd = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			debug = String.format("unregisterListener rd = %s", rd);
			logger.debug(debug);
			conn.disconnect();

			debug = String.format("unregisterListener sb = %s", sb);
			logger.debug(debug);

			if (sb.toString().contains("ok")) {
				return true;
			} else
				return false;

		} catch (Exception e) {
			System.out.println("in unregisterListener catch");
			e.printStackTrace();
			return false;

		}

	}

	@Override
	public boolean disable() {
		String debug = String.format("Will not disable Flickr adaptor...");
		logger.debug(debug);
		return false;
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {

		if (mediaItemId == null) {
			String message = "No input in getMediaItemsDisplay";
			throw new InvalidInputException(message);
		}

		// prepare request and call service
		// first call to get embeddedHtml
		String requestGetUrl = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods
				.urlRequest(mediaItemId.getId());
		System.out.println("requestGetUrl = " + requestGetUrl);

		String responseGetUrl = HttpRequests
				.getSynchronousHttpResonse(requestGetUrl);
		System.out.println("responseGetUrl = " + responseGetUrl);

		flickrExceptions.getMediaItemsDisplayUrlException(responseGetUrl);

		MediaItemDisplay embeddedHtml = eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
				.parseMediaItemDisplayResponse(responseGetUrl);

		System.out.println("flickr EmbeddedHtml = "
				+ embeddedHtml.getEmbeddedHtml());

		// second request to get id, source, title
		String requestGetMediaItemInfo = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods
				.mediaItemsRequest(mediaItemId.getId());
		System.out.println("requestGetMediaItemInfo = "
				+ requestGetMediaItemInfo);

		String responseGetMediaItemInfo = HttpRequests
				.getSynchronousHttpResonse(requestGetMediaItemInfo);
		System.out.println("responseGetMediaItemInfo = "
				+ responseGetMediaItemInfo);

		flickrExceptions
				.getMediaItemsDisplayException(responseGetMediaItemInfo);

		MediaItemDisplay mediaItemIdandTitle = eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
				.parseMediaItemDisplay(responseGetMediaItemInfo);

		MediaItemDisplay mediaItemDisplayTotalObj = new MediaItemDisplay();
		mediaItemDisplayTotalObj
				.setEmbeddedHtml(embeddedHtml.getEmbeddedHtml());
		mediaItemDisplayTotalObj.setMediaItemId(mediaItemIdandTitle
				.getMediaItemId());
		mediaItemDisplayTotalObj.setTitle(mediaItemIdandTitle.getTitle());

		return mediaItemDisplayTotalObj;
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {

		System.out.println("personId = " + personId.getId());
		if (personId.getId().length() == 0) {
			String message = "No input in findMyMediaItems";
			throw new InvalidInputException(message);
		}

		String urlStr = "http://api.flickr.com/services/rest/?method=flickr.people.getPhotos";
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setAllowUserInteraction(false);

			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");

			String auth_token = flickrToken.getToken();
			System.out.println("auth_token = " + auth_token);

			String extra = "description, license, date_upload, date_taken, owner_name, icon_server, original_format, last_update, geo, tags, machine_tags, o_dims, views, media, path_alias, url_sq, url_t, url_s, url_q, url_m, url_n, url_z, url_c, url_l, url_o";
			String extras = extra.trim().replaceAll(", ", ",");

			String sig = Constants.API_SECRET + "api_key" + Constants.API_KEY
					+ "auth_token" + auth_token + "extras" + extras
					+ "formatjson" + "methodflickr.people.getPhotos"
					+ "nojsoncallback1" + "user_id" + personId.getId();

			String api_sig = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities
					.MD5(sig);
			System.out.println("apisig = " + api_sig);

			String[] paramName = { "api_key", "user_id", "extras",
					"auth_token", "format", "nojsoncallback", "api_sig" };

			String[] paramVal = { Constants.API_KEY, personId.getId(), extras,
					auth_token, "json", "1", api_sig };

			// String[] paramName = { "api_key", "api_sig", "auth_token",
			// "extras",
			// "format", "user_id" };
			//
			// String[] paramVal = { Constants.API_KEY, api_sig, auth_token,
			// extras,
			// "json", personId.getId() };

			for (int i = 0; i < paramVal.length; i++) {
				System.out.println("paramval = " + paramVal[i]);
			}

			OutputStream out = conn.getOutputStream();
			Writer writer = new OutputStreamWriter(out, "UTF-8");

			for (int i = 0; i < paramName.length; i++) {
				writer.write(paramName[i]);
				writer.write("=");
				writer.write(URLEncoder.encode(paramVal[i], "UTF-8"));
				writer.write("&");
			}
			writer.close();

			out.close();

			if (conn.getResponseCode() != 200) {
				throw new IOException(conn.getResponseMessage());
			}

			// call service
			String response = eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests
					.getStringFromInputStream(conn.getInputStream());
			System.out.println("response = " + response);

			conn.disconnect();

			List<MediaItem> findMediaItemList = Arrays
					.asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
							.parseFindMediaItemsFromMediaItemResponse(response));

			return findMediaItemList;
			// return null;

		} catch (Exception e) {
			// e.printStackTrace();
			e.getMessage();
			return null;
		}

	}

	// @Override
	// public List<MediaItem> findMyMediaItems(ObjectId personId)
	// throws SociosException {
	//
	// if (personId == null) {
	// String message = "No input in findMyMediaItems";
	// throw new InvalidInputException(message);
	// }
	//
	// String requestUrl =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.FindMethods
	// .mediaItemsRequest(personId);
	//
	// // call service
	// String response = HttpRequests.getSynchronousHttpResonse(requestUrl);
	// System.out.println("response = " + response);
	//
	// String debug = String.format(
	// "findMyMediaItems personId, response from service = %s",
	// response);
	// logger.debug(debug);
	//
	// flickrExceptions.findMediaItemsException(response);
	//
	// // parse response
	// List<MediaItem> findMediaItemList = Arrays
	// .asList(eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.FindMethods
	// .parseFindMediaItemsFromMediaItemResponse(response));
	//
	// debug = String
	// .format("findMyMediaItems personId -2, size of response findMediaItemList =  %s",
	// findMediaItemList.size());
	// logger.debug(debug);
	//
	// return findMediaItemList;
	// }

	// @Override
	// public MediaItemDisplayList getMediaItemsDisplay(
	// MediaItemIdList mediaItemIdList) throws SociosException {
	//
	// if (mediaItemIdList == null
	// || mediaItemIdList.getMediaItemId().size() == 0) {
	// String message = "No input in getMediaItemsEmbeddedHtml";
	// throw new InvalidInputException(message);
	// }
	//
	// // prepare request and call service
	// String mediaItemUrls =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.ResponseRetriever
	// .retrieveUrlResponse(mediaItemIdList);
	// System.out.println("mediaItemUrls = " + mediaItemUrls);
	//
	// MediaItemDisplayList embeddedHtmlList =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
	// .parseMediaItemDisplayResponse(mediaItemUrls);
	//
	// System.out.println("embeddedHtmlList.getMediaItemDisplay().size() = "
	// + embeddedHtmlList.getMediaItemDisplay().size());
	//
	// String mediaItemInfo =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.ResponseRetriever
	// .retrieveMediaItemsResponse(mediaItemIdList);
	//
	// System.out.println("mediaItemInfo = " + mediaItemInfo);
	//
	// MediaItemDisplayList mediaItemTitlesList =
	// eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser.GetMethods
	// .parseGetEmbeddedHtml(mediaItemInfo);
	//
	// for (int i = 0; i < embeddedHtmlList.getMediaItemDisplay().size(); i++) {
	// String embedded = embeddedHtmlList.getMediaItemDisplay().get(i)
	// .getEmbeddedHtml();
	// mediaItemTitlesList.getMediaItemDisplay().get(i)
	// .setEmbeddedHtml(embedded);
	// }
	//
	// System.out.println("final mediaItemDescriptionList size = "
	// + mediaItemTitlesList.getMediaItemDisplay().size());
	//
	// return mediaItemTitlesList;
	// }

}
