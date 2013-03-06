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
 
package eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.IllegalRequestException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.Source;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.xml.datatype.XMLGregorianCalendar;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author G.A.P. II
 */
public class ResponseParsers {

	private final static Logger logger = LoggerFactory
			.getLogger(ResponseParsers.class);

	private static JSONArray getJSONList(String mOutput) throws SociosException {
		if (mOutput == null || mOutput.trim().length() == 0) {
			String message = "ResponseParsers: Input from dailymotion is null";
			logger.error(message);
			throw new SnUnavailableException(message);
		}

		JSONObject dailymotionJson = null;
		try {
			dailymotionJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		// check if Dailmotion list is null and return exception!!
		try {
			JSONArray list = dailymotionJson.getJSONArray("list");
			if (list.length() == 0) {
				System.out.println("mesa sti keni lista");
				throw new InvalidInputException("No results from Dailymotion");
			}
		} catch (JSONException e) {
			e.printStackTrace();
			System.out.println("mesa sto catch");
			logger.error("JSONException: " + e.getMessage());
		}

		// making sure that the dailymotion JSON mOutput is valid

		// if (dailymotionJson.has("error")) {
		// try {
		// System.out.println("mesa sto try tou error");
		//
		// JSONObject resultStat = dailymotionJson.getJSONObject("error");
		// int resultCode = resultStat.getInt("code");
		// String resultMessage = resultStat.getString("message");
		//
		// switch (resultCode) {
		// case 400:
		// String message_1 = "Error Code: " + resultCode
		// + " , message: " + resultMessage;
		// System.out.println("in case 400 message_1 = " + message_1);
		// throw new InvalidInputException(message_1);
		//
		// case 401:
		// String message_2 = "Error Code: " + resultCode
		// + " , message: " + resultMessage;
		// throw new AccessTokenAuthenticationException(message_2);
		//
		// case 403:
		// String message_3 = "Error Code: " + resultCode
		// + " , message: " + resultMessage;
		// throw new IllegalRequestException(message_3);
		//
		// case 404:
		// String message_4 = "Error Code: " + resultCode
		// + " , message: " + resultMessage;
		// throw new InvalidInputException(message_4);
		//
		// default:
		// String message = "Error Code: " + resultCode
		// + " , message: " + resultMessage;
		// logger.error(message);
		// throw new SociosException(message);
		// }
		// } catch (JSONException ex) {
		// ex.printStackTrace();
		// logger.error("JSONException: " + ex.getMessage());
		// }

		// }// end if

		// we wrap the content of dailymotionJson as a JSONArray object
		JSONArray dailymotionList = null;
		try {
			dailymotionList = dailymotionJson.getJSONArray("list");
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

		return dailymotionList;
	}

	/*
	 * This method gets the mOutput response string in json format and retrieves
	 * the useful information from the dailymotion API call in order to
	 * construct the final SOAP response from the dailymotion Adaptor
	 */
	public static MediaItem[] parseMediaItemsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseMediaItemsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONArray dailymotionList = getJSONList(mOutput);

		final ArrayList<MediaItem> mediaItems = new ArrayList<MediaItem>();
		String debug = String.format("\ndailymotionList length = %s",
				dailymotionList.length());
		logger.debug(debug);

		for (int i = 0; i < dailymotionList.length(); i++) {
			JSONObject dailymotionItem = null;
			try {
				dailymotionItem = dailymotionList.getJSONObject(i);
			} catch (JSONException ex) {
				ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			String[] names = JSONObject.getNames(dailymotionItem);
			MediaItem mediaItem = new MediaItem();

			for (int j = 0; j < names.length; j++) {
				Long optionLongValue = dailymotionItem.optLong(names[j]);
				String optionStringValue = dailymotionItem.optString(names[j])
						.trim();

				Double optionDoubleValue = dailymotionItem.optDouble(names[j]);

				if (optionStringValue.length() == 0) {
					continue;
				}

				if (names[j].equals("id")) {
					Source value = new Source();
					value.setKnownSns(KnownSns.DAILYMOTION);

					ObjectId id = new ObjectId();
					id.setId(optionStringValue);
					id.setSource(value);
					mediaItem.setId(id);
				} else if (names[j].equals("thumbnail_url")) {
					mediaItem.setThumbnailUrl(optionStringValue);
				} else if (names[j].equals("title")) {
					mediaItem.setTitle(optionStringValue);
				} else if (names[j].equals("description")) {
					mediaItem.setDescription(optionStringValue);
				} else if (names[j].equals("tags")) {
					try {
						JSONArray opttags = dailymotionItem
								.getJSONArray(names[j]);
						StringBuilder tags = new StringBuilder();
						for (int v = 0; v < opttags.length(); v++) {
							tags.append(opttags.get(v).toString()).append(",");
						}
						String totalTags = tags.toString();
						if (1 < totalTags.length()) {
							mediaItem.setTags(totalTags.substring(0,
									totalTags.length() - 1));
						}
					} catch (JSONException ex) {
						ex.printStackTrace();
					}
				} else if (names[j].equals("taken_time")) {
					if (optionLongValue == 0) {
						Date takenTime = DateUtilities
								.convert(optionStringValue);
						XMLGregorianCalendar xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(takenTime);

						mediaItem.setCreated(xmlTakenTime);
					} else {
						Date takenTime = DateUtilities
								.timeStamptoDate(optionLongValue);
						XMLGregorianCalendar xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(takenTime);
						mediaItem.setCreated(xmlTakenTime);
					}
				} else if (names[j].equals("url")) {
					mediaItem.setUrl(optionStringValue);
				} else if (names[j].equals("country")) {
					Address address = new Address();
					address.setCountry(optionStringValue);
					mediaItem.setLocation(address);
				} else if (names[j].equals("duration")) {
					mediaItem.setDuration(BigInteger.valueOf(optionLongValue));
				} else if (names[j].equals("rating")) {
					mediaItem.setRating(optionDoubleValue / (double) 5);
				} else if (names[j].equals("language")) {
					mediaItem.setLanguage(optionStringValue);
				} else if (names[j].equals("comments_total")) {
					mediaItem.setNumComments(BigInteger
							.valueOf(optionLongValue));
				} else if (names[j].equals("created_time")) {
					if (optionLongValue == 0) {
						Date takenTime = DateUtilities
								.convert(optionStringValue);
						XMLGregorianCalendar xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(takenTime);
						mediaItem.setStartTime(xmlTakenTime);
					} else {
						Date takenTime = DateUtilities
								.timeStamptoDate(dailymotionItem
										.optLong(names[j]));
						XMLGregorianCalendar xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(takenTime);
						mediaItem.setStartTime(xmlTakenTime);
					}
				} else if (names[j].equals("views_total")) {
					mediaItem.setNumViews(BigInteger.valueOf(optionLongValue));
				} else if (names[j].equals("ratings_total")) {
					mediaItem
							.setNumRatings(BigInteger.valueOf(optionLongValue));
				} else if (names[j].equals("bookmarks_total")) {
					mediaItem.setNumFavorites(BigInteger
							.valueOf(optionLongValue));
				} else if (names[j].equals("owner")) {
					Source source = new Source();
					source.setKnownSns(KnownSns.DAILYMOTION);
					ObjectId id = new ObjectId();
					id.setId(optionStringValue);
					id.setSource(source);
					mediaItem.setUserId(id);
				}
			}
			mediaItem.setType(MediaItemType.VIDEO);

			BigInteger big = new BigInteger("-1");
			mediaItem.setNumNegativeVotes(big);
			mediaItem.setNumPositiveVotes(big);
			mediaItem.setNumVotes(big);

			License licenseUrl = new License();
			licenseUrl.setUrl("http://www.dailymotion.com/legal/terms");
			mediaItem.setLicense(licenseUrl);
			mediaItems.add(mediaItem);
		}

		int counter = 0;
		final MediaItem[] mediaItemsArray = new MediaItem[mediaItems.size()];
		for (MediaItem mediaItem : mediaItems) {
			mediaItemsArray[counter++] = mediaItem;
		}
		return mediaItemsArray;
	}

	public static MediaItemDisplay parseMediaItemDisplayResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseMediaItemsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// MediaItemDisplayList mediaItemDisplayList = new
		// MediaItemDisplayList();
		MediaItemDisplay mediaItemDisplay = new MediaItemDisplay();

		try {
			JSONObject jsonObj = new JSONObject(mOutput);
			if (jsonObj.has("id")) {
				String id = jsonObj.optString("id");
				ObjectId mediaItemObj = new ObjectId();
				mediaItemObj.setId(id);
				Source source = new Source();
				source.setKnownSns(KnownSns.DAILYMOTION);
				mediaItemObj.setSource(source);
				mediaItemDisplay.setMediaItemId(mediaItemObj);
				System.out.println("id = " + id);
			}
			if (jsonObj.has("title")) {
				String title = jsonObj.optString("title");
				mediaItemDisplay.setTitle(title);
				System.out.println("title = " + title);
			}
			if (jsonObj.has("embed_html")) {
				String embeddedHtml = jsonObj.optString("embed_html");
				// String embeddedHtmlFinal = embeddedHtml.replace("&lt;","<");
				mediaItemDisplay.setEmbeddedHtml(embeddedHtml);
				System.out.println("embeddedHtml = " + embeddedHtml);
				// System.out.println("embeddedHtmlFinal = " +
				// embeddedHtmlFinal);
				// System.out.println("mediaItemDisplay.setEmbeddedHtml(embeddedHtmlFinal) = "
				// + mediaItemDisplay.getEmbeddedHtml());
			}
			// mediaItemDisplayList.getMediaItemDisplay().add(mediaItemDisplay);

		} catch (JSONException e) {
			e.printStackTrace();
		}

		return mediaItemDisplay;
	}

	/*
	 * FindPersonsReposnse gets the mOutput response string in json format and
	 * retrieves the useful information from the dailymotion API call in order
	 * to construct the final SOAP response from the dailymotion Adaptor
	 */
	public static Person[] parsePersonsResponse(String mOutput)
			throws SociosException {

		JSONArray dailymotionList = getJSONList(mOutput);
		if (mOutput == null) {
			String message = "No input in parsePersonsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// retrieving information from the objects of the list
		// transforming them into Person objects, that will be used in the SOAP
		// response
		final ArrayList<Person> persons = new ArrayList<Person>();

		for (int i = 0; i < dailymotionList.length(); i++) {
			JSONObject dailymotionUser = null;
			try {
				dailymotionUser = dailymotionList.getJSONObject(i);
			} catch (JSONException ex) {
				// ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			Person person = new Person();
			String[] names = JSONObject.getNames(dailymotionUser);
			for (int j = 0; j < names.length; j++) {
				String optString = dailymotionUser.optString(names[j]).trim();
				if (optString.length() == 0) {
					continue;
				}

				if (names[j].equals("owner")) {
					Source value = new Source();
					value.setKnownSns(KnownSns.DAILYMOTION);
					ObjectId id = new ObjectId();
					id.setId(optString);
					id.setSource(value);
					person.setId(id);

					String userId = optString;
					String debug = String.format(
							"\n in parsePersonsResponse , userId = = %s",
							userId);
					logger.debug(debug);

					String fansRequest = DailyMotionUtilities
							.getInDegreeRequest(userId);
					String followingRequest = DailyMotionUtilities
							.getOutDegreeRequest(userId);
					String friendsRequest = DailyMotionUtilities
							.getDegreeRequest(userId);
					debug = String.format(
							"\n in parsePersonsResponse , fansRequest = = %s",
							fansRequest);
					logger.debug(debug);
					debug = String
							.format("\n in parsePersonsResponse , followingRequest = = %s",
									followingRequest);
					logger.debug(debug);
					debug = String
							.format("\n in parsePersonsResponse , friendsRequest = = %s",
									friendsRequest);
					logger.debug(debug);
					Integer inDegree = getDegree(HttpRequests
							.getSynchronousHttpResonse(fansRequest));
					Integer outDegree = getDegree(HttpRequests
							.getSynchronousHttpResonse(followingRequest));
					Integer friends = getDegree(HttpRequests
							.getSynchronousHttpResonse(friendsRequest));

					BigInteger bg;
					BigInteger one = new BigInteger("-1");

					if (inDegree != null) {
						bg = new BigInteger(String.valueOf(inDegree));
						person.setInDegree(bg);
					} else {
						person.setInDegree(one);
					}
					if (outDegree != null) {
						bg = new BigInteger(String.valueOf(outDegree));
						person.setOutDegree(bg);
					} else {
						person.setOutDegree(one);
					}
					if (friends != null) {
						bg = new BigInteger(String.valueOf(friends));
						person.setNumFriends(bg);
					} else {
						person.setNumFriends(one);
					}

				} else if (names[j].equals("owner_screenname")) {
					person.setDisplayName(optString); // getDisplayName
														// (screenname)
					person.setId(null);
				} else if (names[j].equals("owner_url")) {
					person.setProfileUrl(optString); // getProfileUrl
				} else if (names[j].equals("owner_username")) { // get username
					person.setPreferredUsername(optString);
				} else if (names[j].equals("owner_avatar_small_url")) {
					person.setThumbnailUrl(optString);
				} else if (names[j].equals("username")) { // get username
					person.setPreferredUsername(optString);
				}
			}
			persons.add(person);
		}
		String debug = String.format("\n persons length = %s", persons.size());
		logger.debug(debug);
		int counter = 0;
		final Person[] personsArray = new Person[persons.size()];
		for (Person person : persons) {
			personsArray[counter++] = person;
		}
		return personsArray;
	}

	// new parser for getPersons
	public static Person[] parseGetPersonsResponse(String mOutput)
			throws SociosException {

		JSONArray dailymotionList = getJSONList(mOutput);
		if (mOutput == null) {
			String message = "No input in parseGetPersonsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// retrieving information from the objects of the list
		// transforming them into Person objects, that will be used in the SOAP
		// response
		final ArrayList<Person> persons = new ArrayList<Person>();

		for (int i = 0; i < dailymotionList.length(); i++) {
			JSONObject dailymotionUser = null;
			try {
				dailymotionUser = dailymotionList.getJSONObject(i);
			} catch (JSONException ex) {
				// ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			Person person = new Person();
			String[] names = JSONObject.getNames(dailymotionUser);
			for (int j = 0; j < names.length; j++) {
				String optString = dailymotionUser.optString(names[j]).trim();
				if (optString.length() == 0) {
					continue;
				}

				if (names[j].equals("id")) {
					ObjectId id = new ObjectId();
					id.setId(optString);
					Source value = new Source();
					value.setKnownSns(KnownSns.DAILYMOTION);
					id.setSource(value);
					person.setId(id);
					System.out.println("id = " + person.getId().getId());

					String userId = optString;
					String debug = String.format(
							"\n in parseGetPersonsResponse , userId = = %s",
							userId);
					logger.debug(debug);

					String fansRequest = DailyMotionUtilities
							.getInDegreeRequest(userId);
					String followingRequest = DailyMotionUtilities
							.getOutDegreeRequest(userId);
					String friendsRequest = DailyMotionUtilities
							.getDegreeRequest(userId);
					debug = String
							.format("\n in parseGetPersonsResponse , fansRequest = = %s",
									fansRequest);
					logger.debug(debug);
					debug = String
							.format("\n in parseGetPersonsResponse , followingRequest = = %s",
									followingRequest);
					logger.debug(debug);
					debug = String
							.format("\n in parseGetPersonsResponse , friendsRequest = = %s",
									friendsRequest);
					logger.debug(debug);
					Integer inDegree = getDegree(HttpRequests
							.getSynchronousHttpResonse(fansRequest));
					Integer outDegree = getDegree(HttpRequests
							.getSynchronousHttpResonse(followingRequest));
					Integer friends = getDegree(HttpRequests
							.getSynchronousHttpResonse(friendsRequest));

					BigInteger bg;
					BigInteger zero = new BigInteger("0");

					if (inDegree != null) {
						bg = new BigInteger(String.valueOf(inDegree));
						person.setInDegree(bg);
					} else {
						person.setInDegree(zero);
					}
					if (outDegree != null) {
						bg = new BigInteger(String.valueOf(outDegree));
						person.setOutDegree(bg);
					} else {
						person.setOutDegree(zero);
					}
					if (friends != null) {
						bg = new BigInteger(String.valueOf(friends));
						person.setNumFriends(bg);
					} else {
						person.setNumFriends(zero);
					}

				} else if (names[j].equals("screenname")) {
					person.setDisplayName(optString); // getDisplayName
														// (screenname)
					// person.setId(null);
				} else if (names[j].equals("url")) {
					person.setProfileUrl(optString); // getProfileUrl
				} else if (names[j].equals("username")) { // get username
					person.setPreferredUsername(optString);
				} else if (names[j].equals("avatar_small_url")) {
					person.setThumbnailUrl(optString);
				} else if (names[j].equals("username")) { // get username
					person.setPreferredUsername(optString);
				}
			}
			persons.add(person);
		}
		String debug = String.format("\n persons length = %s", persons.size());
		logger.debug(debug);
		int counter = 0;
		final Person[] personsArray = new Person[persons.size()];
		for (Person person : persons) {
			personsArray[counter++] = person;
		}
		return personsArray;
	}

	public static Person[] parseFriendsResponse(String mOutput)
			throws SociosException {

		JSONArray dailymotionList = getJSONList(mOutput);
		if (mOutput == null) {
			String message = "No input in parseFriendsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// retrieving information from the objects of the list
		// transforming them into Person objects, that will be used in the SOAP
		// response
		final ArrayList<Person> persons = new ArrayList<Person>();
		for (int i = 0; i < dailymotionList.length(); i++) {
			JSONObject dailymotionUser = null;
			try {
				dailymotionUser = dailymotionList.getJSONObject(i);
			} catch (JSONException ex) {
				ex.printStackTrace();
				continue;
			}
			Person person = new Person();
			String[] names = JSONObject.getNames(dailymotionUser);
			for (int j = 0; j < names.length; j++) {
				String optString = dailymotionUser.optString(names[j]).trim();
				if (optString.length() == 0) {
					continue;
				}
				if (names[j].equals("id")) {
					Source value = new Source();
					value.setKnownSns(KnownSns.DAILYMOTION);
					ObjectId id = new ObjectId();
					id.setId(optString);
					id.setSource(value);
					person.setId(id);

				} else if (names[j].equals("screenname")) {
					person.setDisplayName(optString);
					// person.setId(null);
					// } else if (names[j].equals("username")) {
					// person.setNickname(optString);
				} else if (names[j].equals("avatar_small_url")) {
					person.setThumbnailUrl(optString);

				} else if (names[j].equals("url")) {
					person.setProfileUrl(optString); // getProfileUrl
				} else if (names[j].equals("username")) { // get username
					person.setPreferredUsername(optString);
				}
			}
			persons.add(person);
		}
		int counter = 0;
		final Person[] personsArray = new Person[persons.size()];
		for (Person person : persons) {
			personsArray[counter++] = person;
		}
		return personsArray;
	}

	public static Integer getDegree(String input) {
		JSONObject object;
		String debug = String.format("\ngetDegree input = %s", input);
		logger.debug(debug);
		try {
			object = new JSONObject(input);
			return object.getInt("total");
		} catch (JSONException e) {
			// e.printStackTrace();
			logger.error("JSONException: " + e.getMessage());
			return null;
		}
	}

}
