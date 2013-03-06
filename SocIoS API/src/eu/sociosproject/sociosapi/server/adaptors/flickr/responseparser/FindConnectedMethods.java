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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.responseparser;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosvoc.KnownSns;
//import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.Source;

//import java.math.BigInteger;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FindConnectedMethods {
	
	private final static Logger logger = LoggerFactory
			.getLogger(FindConnectedMethods.class);

	public static Person[] parseConnectedPersonsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseConnectedPersonsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			ex.printStackTrace();
			return null;
		}

//		try {
//			String resultStat = flickrJson.getString("stat");
//			if (resultStat.equals("fail")) {
//				int resultCode = flickrJson.getInt("code");
//				String resultMessage = flickrJson.getString("message");
//
//				switch (resultCode) {
//
//				case 1:
//					String message1 = "InvalidInputException: Error Code: "
//							+ resultCode + " , message: " + resultMessage;
//					throw new InvalidInputException(message1);
//
//				case 105:
//					String message2 = "SnUnavailableException: Error Code: "
//							+ resultCode + " , message: " + resultMessage;
//					throw new SnUnavailableException(message2);
//					
//				default:
//					String message = "Error Code: " + resultCode + " , message: "
//							+ resultMessage;
//					logger.error(message);
//					throw new SociosException(message);
//				}
//			}
//
//		} catch (JSONException ex) {
//			ex.printStackTrace();
//			logger.error("JSONException: " + ex.getMessage());
//		}

		JSONArray flickrFriendArray = null;
		try {
			JSONObject flickrFriendsArgs = flickrJson.getJSONObject("contacts");
			flickrFriendArray = flickrFriendsArgs.getJSONArray("contact");
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		ArrayList<Person> persons = new ArrayList<Person>();
		for (int i = 0; i < flickrFriendArray.length(); i++) {
			Person person = new Person();

			JSONObject flickrFriend = null;
			try {
				flickrFriend = flickrFriendArray.getJSONObject(i);
			} catch (JSONException ex) {
				ex.printStackTrace();
				continue;
			}

			String[] keys = JSONObject.getNames(flickrFriend);
			for (int j = 0; j < keys.length; j++) {
				String value = flickrFriend.optString(keys[j]).trim();
				if (value == null || value.length() == 0) {
					continue;
				}

				if (keys[j].equals("nsid")) {
					ObjectId id = new ObjectId();
					id.setId(value);
					Source src = new Source();
					src.setKnownSns(KnownSns.FLICKR);
					id.setSource(src);
					person.setId(id);
				} else if (keys[j].equals("username")) {
					person.setDisplayName(value);
					// }else if (keys[j].equals("realname")) {
					// Name name = new Name();
					// name.setFormatted(value);
					// person.setName(name);
				}
			}
			String profileUrl = "http://www.flickr.com/people/"
					+ person.getId().getId();
			person.setProfileUrl(profileUrl);
			// if (mediaItem.getId() != null && mediaItem.getUserId() != null) {
			// String photoUrl = "http://www.flickr.com/photos/"
			// + mediaItem.getUserId().getId() + "/"
			// + mediaItem.getId().getId();
			// mediaItem.setUrl(photoUrl);
			// }

			String buddyIcon = "http://www.flickr.com/buddyicons/"
					+ person.getId().getId() + ".jpg"; // get avatar
			person.setThumbnailUrl(buddyIcon);

			persons.add(person);
		}

		int counter = 0;
		final Person[] personsArray = new Person[persons.size()];
		for (Person person : persons) {
			personsArray[counter++] = person;
		}

		return personsArray;
	}

	public static Person[] parseMyConnectedPersonsResponse(String mOutput)
			throws SociosException {
		
		if (mOutput == null) {
			String message = "No input in parseMyConnectedPersonsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

//		try {
//			String resultStat = flickrJson.getString("stat");
//
//			if (resultStat.equals("fail")) {
//				int resultCode = flickrJson.getInt("code");
//				String resultMessage = flickrJson.getString("message");
//				switch (resultCode) {
//
//				case 96:
//					String message1 = "AccessTokenAuthenticationException: Error Code: "
//							+ resultCode + " , message: " + resultMessage;
//					throw new AccessTokenAuthenticationException(message1);
//
//				case 105:
//					String message2 = "SnUnavailableException: Error Code: "
//							+ resultCode + " , message: " + resultMessage;
//					throw new SnUnavailableException(message2);
//
//				default:
//					String message = "Error Code: " + resultCode + " , message: "
//							+ resultMessage;
//					logger.error(message);
//					throw new SociosException(message);
//		
//				}
//			}
//
//		} catch (JSONException ex) {
//			ex.fillInStackTrace();
//		}

		JSONArray flickrFriendArray = null;
		try {
			JSONObject flickrFriendsArgs = flickrJson.getJSONObject("contacts");

			flickrFriendArray = flickrFriendsArgs.getJSONArray("contact");
		} catch (JSONException ex) {
			ex.fillInStackTrace();
			return null;
		}

		ArrayList<Person> persons = new ArrayList<Person>();
		for (int i = 0; i < flickrFriendArray.length(); i++) {
			Person person = new Person();

			JSONObject flickrFriend = null;
			try {
				flickrFriend = flickrFriendArray.getJSONObject(i);
			} catch (JSONException ex) {
				ex.printStackTrace();
				continue;
			}

			String[] keys = JSONObject.getNames(flickrFriend);
			for (int j = 0; j < keys.length; j++) {
				String value = flickrFriend.optString(keys[j]).trim();
				if (value == null || value.length() == 0) {
					continue;
				}

				if (keys[j].equals("nsid")) {
					ObjectId id = new ObjectId();
					id.setId(value);
					person.setId(id);
				} else if (keys[j].equals("username")) {
					person.setDisplayName(value);
				}
			}

			persons.add(person);

		}// end for flickrFriendArray

		int counter = 0;
		final Person[] personsArray = new Person[persons.size()];
		for (Person person : persons) {
			personsArray[counter++] = person;
		}

		return personsArray;
	}

	public static String parseNumFriends(String mOutput) throws JSONException, SociosException {
		
		if (mOutput == null) {
			String message = "No input in parseNumFriends";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

		JSONObject flickrFriendsArgs = flickrJson.getJSONObject("contacts");
		String[] names = JSONObject.getNames(flickrFriendsArgs);
		for (int i = 0; i < names.length; i++) {
			if (names[i].equals("total")) {
				String numContacts = flickrFriendsArgs.optString(names[i]);
				return numContacts;
			}
		}
		return null;
	}

}
