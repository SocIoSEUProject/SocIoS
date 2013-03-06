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

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.datatype.XMLGregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.Source;

/**
 * 
 * @author G.A.P. II
 */
public class FindMethods {

	private final static Logger logger = LoggerFactory
			.getLogger(FindMethods.class);

	public static MediaItem getFlickrItems(JSONObject flickrItem)
			throws JSONException, SociosException {

		if (flickrItem == null) {
			String message = "No input in getFlickrItems";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		MediaItem mediaItem = new MediaItem();
		String[] names = JSONObject.getNames(flickrItem);
		Address address = new Address();
		if (flickrItem.has("latitude")) {
			Double optDouble = flickrItem.optDouble("latitude");
			if (optDouble.isNaN()) {
				optDouble = null;
			} else {
				address.setLatitude(optDouble);
				mediaItem.setLocation(address);
			}
		}

		if (flickrItem.has("longitude")) {
			Double optDouble = flickrItem.optDouble("longitude");
			if (optDouble.isNaN()) {
				optDouble = null;
			} else {
				address.setLongitude(optDouble);
				mediaItem.setLocation(address);
			}
		}

		for (int i = 0; i < names.length; i++) {
			String value = flickrItem.optString(names[i]).trim();
			boolean validValue = 0 < value.length();

			if (names[i].equals("owner")) {
				Source source = new Source();
				source.setKnownSns(KnownSns.FLICKR);
				ObjectId id = new ObjectId();
				id.setId(value);
				id.setSource(source);
				mediaItem.setUserId(id);
			}

			if (names[i].equals("license")) {
				
				String lValue = flickrItem.optString(names[i]); // set license
																// id
																// information
				License licenseValue = new License();
				licenseValue.setId(lValue);

				if (lValue.equals("0")) {
					licenseValue.setName("All Rights Reserved");
					licenseValue
							.setUrl("http://info.yahoo.com/legal/us/yahoo/copyright/en-us/");
				}

				else if (lValue.equals("4")) {
					licenseValue.setName("Attribution License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by/2.0/");
				} else if (lValue.equals("6")) {
					licenseValue.setName("Attribution-NoDerivs License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nd/2.0/");
				} else if (lValue.equals("3")) {
					licenseValue
							.setName("Attribution-NonCommercial-NoDerivs License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc-nd/2.0/");
				} else if (lValue.equals("2")) {
					licenseValue.setName("Attribution-NonCommercial License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc/2.0/");
				} else if (lValue.equals("1")) {
					licenseValue
							.setName("Attribution-NonCommercial-ShareAlike License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc-sa/2.0/");
				} else if (lValue.equals("5")) {
					licenseValue.setName("Attribution-ShareAlike License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-sa/2.0/");
				} else if (lValue.equals("7")) {
					licenseValue.setName("No known copyright restrictions");
					licenseValue.setUrl("http://flickr.com/commons/usage/");
				}

				mediaItem.setLicense(licenseValue);
			}

			else if (names[i].equals("dateupload")) {
				Long numericValue = flickrItem.optLong(names[i]);
				if (numericValue == 0 && validValue) {
					Date uploaded = DateUtilities.convert(value);
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploaded);
					mediaItem.setStartTime(xmlTakenTime);
				} else if (numericValue != 0) {
					Date uploaded = DateUtilities.timeStamptoDate(numericValue);
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploaded);
					mediaItem.setStartTime(xmlTakenTime);
				}
			} else if (names[i].equals("datetaken")) {
				Long numericValue = flickrItem.optLong(names[i]);
				//System.out.println("numericValue = " + numericValue);
				if (numericValue == 0 && validValue) {
					//System.out.println("value = " + value);
					Date uploaded = DateUtilities.convert(value);
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploaded);
					mediaItem.setCreated(xmlTakenTime);
					//System.out.println("mediaItem.getCreated = " + mediaItem.getCreated());
				} else if (numericValue != 0) {
					Date uploaded = DateUtilities.timeStamptoDate(numericValue);
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploaded);
					mediaItem.setCreated(xmlTakenTime);
				}
			} else if (names[i].equals("id") && validValue) {
				Source source = new Source();
				source.setKnownSns(KnownSns.FLICKR);
				ObjectId id = new ObjectId();
				id.setId(value);
				id.setSource(source);

				mediaItem.setId(id);
			} else if (names[i].equals("title") && validValue) {
				mediaItem.setTitle(value);
			} else if (names[i].equals("originalformat") && validValue) {
				mediaItem.setMimeType(value);
			} else if (names[i].equals("description") && validValue) {
				JSONObject content = flickrItem.getJSONObject(names[i]);
				if (content.has("_content")) {
					String contentValue = content.optString("_content").trim();
					if (0 < contentValue.length()) {
						mediaItem.setDescription(contentValue);
					}
				}
			} else if (names[i].equals("tags") && validValue) {
				mediaItem.setTags(value);
			} else if (names[i].equals("url_o") && validValue) {
				mediaItem.setUrl(value);
			} else if (names[i].equals("url_t") && validValue) {
				mediaItem.setThumbnailUrl(value);
			} else if (names[i].equals("views")) {
				Integer numericValue = flickrItem.optInt(names[i]);
				mediaItem.setNumViews(BigInteger.valueOf(numericValue));
			} else if (names[i].equals("media") && validValue) {
				if (value.equals("photo")) {
					mediaItem.setType(MediaItemType.IMAGE);
				} else if (value.equals("video")) {
					mediaItem.setType(MediaItemType.VIDEO);
				}
			}
		}

		if (mediaItem.getId() != null && mediaItem.getUserId() != null) {
			String photoUrl = "http://www.flickr.com/photos/"
					+ mediaItem.getUserId().getId() + "/"
					+ mediaItem.getId().getId();
			mediaItem.setUrl(photoUrl);
		}

		return mediaItem;
	}

	public static List<Activity> parseFindActivitiesResponseNew(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseFindActivitiesResponseNew";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		ArrayList<Activity> response = new ArrayList<Activity>();

		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		// try {
		// String resultStat = flickrJson.getString("stat");
		//
		// if (resultStat.equals("fail")) {
		// int resultCode = flickrJson.getInt("code");
		// String resultMessage = flickrJson.getString("message");
		//
		// switch (resultCode) {
		//
		// case 96:
		// String message_1 = "AccessTokenAuthenticationException: Error Code: "
		// + resultCode + " , message: " + resultMessage;
		// logger.error(message_1);
		// throw new AccessTokenAuthenticationException(message_1);
		//
		// case 98:
		// String message_2 = "AccessTokenAuthenticationException: Error Code: "
		// + resultCode + " , message: " + resultMessage;
		// logger.error(message_2);
		// throw new AccessTokenAuthenticationException(message_2);
		//
		// case 105:
		// String message_3 = "SnUnavailableException: Error Code: "
		// + resultCode + " , message: " + resultMessage;
		// logger.error(message_3);
		// throw new SnUnavailableException(message_3);
		//
		// default:
		// String message = "Error Code: " + resultCode + " , message: "
		// + resultMessage;
		// logger.error(message);
		// throw new SociosException(message);
		// }
		// }
		// } catch (JSONException ex) {
		// ex.printStackTrace();
		// logger.error("JSONException: " + ex.getMessage());
		// }

		JSONArray flickrList = null;
		JSONObject items = null;
		try {

			items = flickrJson.getJSONObject("items");
			flickrList = items.getJSONArray("item");

		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		for (int ln = 0; ln < flickrList.length(); ln++) {

			JSONObject flickrItem;
			try {
				flickrItem = flickrList.getJSONObject(ln);
			} catch (JSONException ex) {
				//ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}
			String[] names = JSONObject.getNames(flickrItem);
			MediaItem mediaItem = new MediaItem();
			Source source = new Source();
			source.setKnownSns(KnownSns.FLICKR);
			List<Activity> internalActivities = Lists.newArrayList();

			for (int j = 0; j < names.length; j++) {

				// if (names[j].equals("type")) {
				// String type = flickrItem.optString(names[j].trim());

				// System.out.println("type: " + type);
				// }
				if (names[j].equals("id")) {
					String id = flickrItem.optString(names[j].trim());
					ObjectId mediaObj = new ObjectId();
					mediaObj.setId(id);

					mediaObj.setSource(source);
					mediaItem.setId(mediaObj);

				} else if (names[j].equals("owner")) {
					String owner = flickrItem.optString(names[j].trim());
					ObjectId mediaOwner = new ObjectId();
					mediaOwner.setId(owner);
					mediaOwner.setSource(source);
					mediaItem.setUserId(mediaOwner);
				} else if (names[j].equals("title")) {
					JSONObject title = null;
					try {
						title = flickrItem.getJSONObject(names[j]);
					} catch (JSONException ex) {
						//ex.printStackTrace();
						logger.error("JSONException: " + ex.getMessage());
					}
					if (title == null) {
						continue;
					}
					if (title.has("_content")) {
						String _content = title.optString("_content").trim();
						mediaItem.setTitle(_content);
					}

				}// end if title
				else if (names[j].equals("media")) {
					String media = flickrItem.optString(names[j].trim());
					mediaItem.setMimeType(media);

				} else if (names[j].equals("comments")) {
					String comments = flickrItem.optString(names[j].trim());
					BigInteger big = new BigInteger(comments);
					mediaItem.setNumComments(big);

				} else if (names[j].equals("views")) {
					String views = flickrItem.optString(names[j].trim());
					BigInteger big = new BigInteger(views);
					mediaItem.setNumViews(big);

				}

				else if (names[j].equals("activity")) {

					JSONObject act = null;
					try {
						act = flickrItem.getJSONObject(names[j]);
					} catch (JSONException ex) {
					//	ex.printStackTrace();
						logger.error("JSONException: " + ex.getMessage());
					}
					if (act == null) {
						continue;
					}

					JSONArray events = null;
					try {
						events = act.getJSONArray("event");
					} catch (JSONException ex) {
						System.out.println("exception occured in parser");
						//ex.printStackTrace();
					}
					if (events == null) {
						continue;
					} else {
						String debug = String
								.format("\nparseFindActivitiesResponseNew, requestURLs = %s",
										"I have " + events.length()
												+ " comments!");
						logger.debug(debug);
					}

					for (int k = 0; k < events.length(); k++) {
						Activity activity = new Activity();
						JSONObject event = null;
						try {
							event = events.getJSONObject(k);
						} catch (JSONException ex) {
							//ex.printStackTrace();
							logger.error("JSONException: " + ex.getMessage());
						}

						if (event == null) {
							continue;
						}
						if (event.has("user")) {
							String user = event.optString("user").trim();

							if (user == null || user.length() == 0) {
								continue;
							}
							ObjectId activityObj = new ObjectId();
							activityObj.setId(user);
							activityObj.setSource(source);
							activity.setUserId(activityObj);
							String debug = String
									.format("\nparseFindActivitiesResponseNew, requestURLs = %s",
											"Detected user " + user);
							logger.debug(debug);
						}

						if (event.has("dateadded")) {
							Long dateAdded = event.optLong("dateadded");
							if (dateAdded != null) {
								activity.setPostedTime(dateAdded);
							}
						}

						if (event.has("commentid")) {
							String commentid = event.optString("commentid")
									.trim();

							if (commentid == null || commentid.length() == 0) {
								continue;
							}
							ObjectId commentObj = new ObjectId();
							commentObj.setId(commentid);
							commentObj.setSource(source);
							activity.setId(commentObj);
						}

						if (event.has("_content")) {
							String _content = event.optString("_content")
									.trim();
							if (_content == null || _content.length() == 0) {
								continue;
							}
							activity.setBody(_content);
						}
						String debug = String
								.format("\nparseFindActivitiesResponseNew, requestURLs = %s",
										"Adding activity from user "
												+ activity.getUserId().getId());
						logger.debug(debug);
						internalActivities.add(activity);
					}// end if events

					if (mediaItem.getId() != null) {
						String debug = String
								.format("\nparseFindActivitiesResponseNew, requestURLs = %s",
										"For mediaitem"
												+ mediaItem.getId().getId());
						logger.debug(debug);
					}

				}// end if activity

			}// end for names
			String debug = String.format(
					"\nparseFindActivitiesResponseNew, requestURLs = %s",
					"finished parsing of mediaitem "
							+ mediaItem.getId().getId());
			logger.debug(debug);

			if (mediaItem.getId() != null && mediaItem.getUserId() != null) {
				String photoUrl = "http://www.flickr.com/photos/"
						+ mediaItem.getUserId().getId() + "/"
						+ mediaItem.getId().getId();
				mediaItem.setUrl(photoUrl);
				debug = String.format(
						"\nparseFindActivitiesResponseNew, requestURLs = %s",
						"photourl: " + photoUrl);
				logger.debug(debug);
			}

			for (Activity internalActivity : internalActivities) {
				internalActivity.getMediaItems().add(mediaItem);
				debug = String.format(
						"\nparseFindActivitiesResponseNew, requestURLs = %s",
						"Adding mediaitem to activity "
								+ internalActivity.getUserId().getId());
				logger.debug(debug);
			}

			response.addAll(internalActivities);

		}// end for flickrlist

		return response;

	}

	public static MediaItem[] parseFindMediaItemsFromMediaItemResponse(
			String mOutput) throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseFindMediaItemsFromMediaItemResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		JSONObject flickrList = null;
		try {
			flickrList = flickrJson.getJSONObject("photos");
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		JSONArray flickrPhotoArray = null;
		try {
			flickrPhotoArray = flickrList.getJSONArray("photo");
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		final ArrayList<MediaItem> mediaItems = new ArrayList<MediaItem>();
		for (int i = 0; i < flickrPhotoArray.length(); i++) {
			JSONObject photo = null;
			try {
				photo = (JSONObject) flickrPhotoArray.get(i);
			} catch (JSONException ex) {
				//ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			MediaItem newItem = null;
			try {
				newItem = getFlickrItems(photo);
			} catch (JSONException ex) {
				//ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			if (newItem != null) {
				mediaItems.add(newItem);
			}
		}

		int counter = 0;
		final MediaItem[] mediaItemsArray = new MediaItem[mediaItems.size()];
		for (MediaItem mediaItem : mediaItems) {
			mediaItemsArray[counter++] = mediaItem;
		}

		return mediaItemsArray;
	}

	public static MediaItem[] parseFindMediaItemsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseFindMediaItemsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);

		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

	/*	 try {
		 String resultStat = flickrJson.getString("stat");
		
		 if (resultStat.equals("fail")) {
		 int resultCode = flickrJson.getInt("code");
		 String resultMessage = flickrJson.getString("message");
		
		 switch (resultCode) {
		 case 1:
		 String message_1 = "InvalidInputException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_1);
		 throw new InvalidInputException(message_1);
		
		 case 2:
		 String message_2 = "InvalidInputException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_2);
		 throw new InvalidInputException(message_2);
		
		 case 3:
		 String message_3 = "InvalidInputException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_3);
		 throw new InvalidInputException(message_3);
		
		 case 4:
		 String message_4 = "IllegalRequestException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_4);
		 throw new IllegalRequestException(message_4);
		
		 case 10:
		 String message_5 = "SnUnavailableException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_5);
		 throw new SnUnavailableException(message_5);
		
		 case 17:
		 String message_6 = "IllegalRequestException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_6);
		 throw new IllegalRequestException(message_6);
		
		 case 105:
		 String message_7 = "SnUnavailableException: Error Code: "
		 + resultCode + " , message: " + resultMessage;
		 logger.error(message_7);
		 throw new SnUnavailableException(message_7);
		
		 default:
		 String message = "Error Code: " + resultCode + " , message: "
		 + resultMessage;
		 logger.error(message);
		 throw new SociosException(message);
		 }
		 }
		 } catch (JSONException ex) {
		 ex.printStackTrace();
		 logger.error("JSONException: " + ex.getMessage());
		 }*/

		JSONArray flickrList = null;
		try {
			flickrList = flickrJson.getJSONArray("list");

		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		final ArrayList<MediaItem> mediaItems = new ArrayList<MediaItem>();
		for (int i = 0; i < flickrList.length(); i++) {
			JSONArray flickrPhotoArray = null;
			try {
				flickrPhotoArray = flickrList.getJSONObject(i).getJSONArray(
						"photo");
			} catch (JSONException ex) {
				//ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			for (int j = 0; j < flickrPhotoArray.length(); j++) {
				JSONObject photo = null;
				try {
					photo = (JSONObject) flickrPhotoArray.get(j);
				} catch (JSONException ex) {
					//ex.printStackTrace();
					logger.error("JSONException: " + ex.getMessage());
					continue;
				}

				MediaItem newItem = null;
				try {
					newItem = getFlickrItems(photo);
				} catch (JSONException ex) {
					//ex.printStackTrace();
					logger.error("JSONException: " + ex.getMessage());
					continue;
				}

				if (newItem != null) {
					mediaItems.add(newItem);
				}
			}
		}

		int counter = 0;
		final MediaItem[] mediaItemsArray = new MediaItem[mediaItems.size()];
		for (MediaItem mediaItem : mediaItems) {
			mediaItemsArray[counter++] = mediaItem;
		}

		return mediaItemsArray;
	}

	/*
	 * this method gets the String response in JSONformat and retrieves the
	 * useful information from the owner fields of the String
	 */
	public static Person[] parseFindPersonsFromMediaItemsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseFindPersonsFromMediaItemsResponse";
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}


		JSONArray flickrList = null;
		try {
			flickrList = flickrJson.getJSONArray("list");
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

		final ArrayList<Person> persons = new ArrayList<Person>();
		for (int i = 0; i < flickrList.length(); i++) {
			JSONObject flickrItem = null;
			try {
				flickrItem = flickrList.getJSONObject(i);
			} catch (JSONException ex) {
				//ex.printStackTrace();
				logger.error("JSONException: " + ex.getMessage());
				continue;
			}

			Person person = new Person();
			String[] names = JSONObject.getNames(flickrItem);
			for (int j = 0; j < names.length; j++) {
				if (names[j].equals("owner")) {
					JSONObject owner = null;
					try {
						owner = flickrItem.getJSONObject("owner");
					} catch (JSONException ex) {
						//ex.printStackTrace();
						logger.error("JSONException: " + ex.getMessage());
					}
					if (owner == null) {
						continue;
					}

					String username = owner.optString("username").trim();
					if (username != null && 0 < username.length()) {
						person.setDisplayName(username);
					}

					String nsid = owner.optString("nsid").trim();
					if (nsid != null && 0 < nsid.length()) {
						Source value = new Source();
						// value.setOtherId("Flickr");
						value.setKnownSns(KnownSns.FLICKR);
						ObjectId id = new ObjectId();
						id.setId(nsid);
						id.setSource(value);
						person.setId(id);
					}

					String location = owner.optString("location").trim();
					if (location != null && 0 < location.length()) {
						Address address = new Address();
						address.setExtendedAddress(location);
						person.setCurrentLocation(address);
					}

					String realName = owner.optString("realname").trim();
					if (realName != null && 0 < realName.length()) {
						Name name = new Name();
						name.setFormatted(realName);
						person.setName(name);
					}
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

	public static ObjectId[] parseFindPersonsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseFindPersonsResponse";
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		
		JSONObject flickrUser = null;
		try {
			flickrUser = flickrJson.getJSONObject("user");
		} catch (JSONException ex) {
			//ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

		String[] names = JSONObject.getNames(flickrUser);
		final ArrayList<ObjectId> ids = new ArrayList<ObjectId>();
		for (int j = 0; j < names.length; j++) {
			if (names[j].equals("id")) {
				String value = flickrUser.optString("id").trim();
				if (0 < value.length()) {
					ObjectId id = new ObjectId();
					id.setId(value);
					ids.add(id);
				}
			}
		}

		int counter = 0;
		final ObjectId[] idsArray = new ObjectId[ids.size()];
		for (ObjectId id : ids) {
			idsArray[counter++] = id;
		}

		return idsArray;
	}

	/*
	 * public static MediaItem[] parseRecentMediaItemsResponse(String mOutput)
	 * throws SociosException {
	 * 
	 * if (mOutput == null) { String message =
	 * "No input in parseRecentMediaItemsResponse"; logger.error(message); throw
	 * new InvalidInputException(message); }
	 * 
	 * JSONObject flickrJson = null;
	 * 
	 * try { flickrJson = new JSONObject(mOutput); } catch (JSONException ex) {
	 * ex.printStackTrace(); logger.error("JSONException: " + ex.getMessage());
	 * return null; }
	 * 
	 * String resultStat = ""; int resultCode = -1; String resultMessage = "";
	 * try {
	 * 
	 * resultStat = flickrJson.getString("stat");
	 * 
	 * if (resultStat.equals("fail")) { resultCode = flickrJson.getInt("code");
	 * resultMessage = flickrJson.getString("message"); }
	 * 
	 * } catch (JSONException ex) { ex.printStackTrace();
	 * logger.error("JSONException: " + ex.getMessage()); }
	 * 
	 * switch (resultCode) {
	 * 
	 * case 1: String message_1 = "InvalidInputException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_1);
	 * throw new InvalidInputException(message_1);
	 * 
	 * case 2: String message_2 = "InvalidInputException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_2);
	 * throw new InvalidInputException(message_2);
	 * 
	 * case 3: String message_3 = "InvalidInputException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_3);
	 * throw new InvalidInputException(message_3);
	 * 
	 * case 4: String message_4 = "IllegalRequestException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_4);
	 * throw new IllegalRequestException(message_4);
	 * 
	 * case 10: String message_5 = "SnUnavailableException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_5);
	 * throw new SnUnavailableException(message_5);
	 * 
	 * case 17: String message_6 = "IllegalRequestException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_6);
	 * throw new IllegalRequestException(message_6);
	 * 
	 * case 18: String message_7 = "InvalidInputException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_7);
	 * throw new InvalidInputException(message_7);
	 * 
	 * case 105: String message_8 = "SnUnavailableException: Error Code: " +
	 * resultCode + " , message: " + resultMessage; logger.error(message_8);
	 * throw new SnUnavailableException(message_8); }
	 * 
	 * return null; }
	 */
}
