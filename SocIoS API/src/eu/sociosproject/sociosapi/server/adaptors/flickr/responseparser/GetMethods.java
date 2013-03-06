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

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.Source;

/**
 * 
 * @author G.A.P. II
 */
public class GetMethods {

	private final static Logger logger = LoggerFactory
			.getLogger(GetMethods.class);

	private static MediaItem getMediaItemFromJSON(JSONObject flickrItem) {
		MediaItem mediaItem = new MediaItem();
		String[] names = JSONObject.getNames(flickrItem);

		for (int j = 0; j < names.length; j++) {
			if (names[j].equals("license")) {

				String value = flickrItem.optString(names[j]); // set license id
																// information
				License licenseValue = new License();
				licenseValue.setId(value);

				if (value.equals("0")) {
					licenseValue.setName("All Rights Reserved");
					licenseValue
							.setUrl("http://info.yahoo.com/legal/us/yahoo/copyright/en-us/");
				}

				else if (value.equals("4")) {
					licenseValue.setName("Attribution License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by/2.0/");
				} else if (value.equals("6")) {
					licenseValue.setName("Attribution-NoDerivs License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nd/2.0/");
				} else if (value.equals("3")) {
					licenseValue
							.setName("Attribution-NonCommercial-NoDerivs License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc-nd/2.0/");
				} else if (value.equals("2")) {
					licenseValue.setName("Attribution-NonCommercial License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc/2.0/");
				} else if (value.equals("1")) {
					licenseValue
							.setName("Attribution-NonCommercial-ShareAlike License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-nc-sa/2.0/");
				} else if (value.equals("5")) {
					licenseValue.setName("Attribution-ShareAlike License");
					licenseValue
							.setUrl("http://creativecommons.org/licenses/by-sa/2.0/");
				} else if (value.equals("7")) {
					licenseValue.setName("No known copyright restrictions");
					licenseValue.setUrl("http://flickr.com/commons/usage/");
				}

				mediaItem.setLicense(licenseValue);
			}

			if (names[j].equals("dateuploaded")) {
				Long longValue = flickrItem.optLong(names[j]);
				if (longValue == 0) {
					Date uploadDate = DateUtilities.convert(flickrItem
							.optString(names[j]));
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploadDate);
					mediaItem.setStartTime(xmlTakenTime);
				} else {
					Date uploadDate = DateUtilities.timeStamptoDate(longValue);
					XMLGregorianCalendar xmlTakenTime = DateUtilities
							.asXMLGregorianCalendar(uploadDate);
					mediaItem.setStartTime(xmlTakenTime);
				}
			}

			String value = flickrItem.optString(names[j]).trim();
			boolean validValue = value != null && 0 < value.length();
			if (names[j].equals("id")) {
				if (validValue) {
					Source source = new Source();
					source.setKnownSns(KnownSns.FLICKR);
					ObjectId id = new ObjectId();
					id.setId(value);
					id.setSource(source);
					mediaItem.setId(id);
				}
				continue;
			} else if (names[j].equals("media")) {
				if (validValue) {
					if (value.equals("photo")) {
						mediaItem.setType(MediaItemType.IMAGE);
					} else if (value.equals("video")) {
						mediaItem.setType(MediaItemType.VIDEO);
					}
				}
				continue;
			} else if (names[j].equals("views")) {
				mediaItem.setNumViews(BigInteger.valueOf(flickrItem
						.optInt(names[j])));
				continue;
			} else if (names[j].equals("comments")) {
				try {
					JSONObject commentsObject = flickrItem
							.getJSONObject("comments");
					int numComments = commentsObject.optInt("_content");
					mediaItem.setNumComments(BigInteger.valueOf(numComments));
				} catch (JSONException e) {
					e.printStackTrace();
				}
				// mediaItem.setNumComments(BigInteger.valueOf(flickrItem.optInt(names[j])));
				continue;
			} else if (names[j].equals("tags")) {
//				System.out
//						.println("@getMediaItemFromJSON : found elemets tags + "
//								+ value);
				try {

					JSONObject fullTag = new JSONObject(value);
					// JSONObject tagObject = flickrItem.getJSONObject("tag");

					JSONArray tagsObject = fullTag.getJSONArray("tag");
					System.out.println("@@@@@@@ tagObject found "
							+ tagsObject.length());
					StringBuilder tags = new StringBuilder();

					for (int pq = 0; pq < tagsObject.length(); pq++) {
						JSONObject o = tagsObject.getJSONObject(pq);
						String tag = o.getString("_content");
						System.out.println("tag : " + tag);
						tags.append(tag);

						if (pq != tagsObject.length() - 1)
							tags.append(",");

					}
					mediaItem.setTags(tags.toString());

				} catch (JSONException ex) {
					System.out.println("@@@@@@@" + ex.getMessage());
				}

				continue;
			}

			JSONObject content = null;
			try {
				content = flickrItem.getJSONObject(names[j]);
			} catch (JSONException ex) {
				System.out.println("@getMediaItemFromJSON: " + ex.getMessage());
				continue;
			}

			if (names[j].equals("title")) {
				if (content.has("_content")) {
					String contentValue = content.optString("_content").trim();
					if (0 < contentValue.length()) {
						mediaItem.setTitle(contentValue);
					}
				}
			} else if (names[j].equals("location")) {
				try {
					Address address = new Address();
					if (content.has("region")) {
						JSONObject region = content.getJSONObject("region");
						if (region.has("_content")) {
							String currentRegion = region.optString("_content")
									.trim();
							if (0 < currentRegion.length()) {
								address.setRegion(currentRegion);
							}
						}
					}

					if (content.has("country")) {
						JSONObject country = content.getJSONObject("country");
						if (country.has("_content")) {
							String currentCounter = country.optString(
									"_content").trim();
							if (0 < currentCounter.length()) {
								address.setCountry(currentCounter);
							}
						}
					}

					if (content.has("locality")) {
						JSONObject locality = content.getJSONObject("locality");
						if (locality.has("_content")) {
							String currentLocality = locality.optString(
									"_content").trim();
							if (0 < currentLocality.length()) {
								address.setLocality(currentLocality);
							}
						}
					}

					if (content.has("latitude")) {
						Double optDouble = content.optDouble("latitude");
						if (optDouble != null && !optDouble.isNaN()) {
							address.setLatitude(optDouble);
						}
					}

					if (content.has("longitude")) {
						Double optDouble = content.optDouble("longitude");
						if (optDouble != null && !optDouble.isNaN()) {
							address.setLongitude(optDouble);
						}
					}
					mediaItem.setLocation(address);
				} catch (JSONException ex) {
					ex.printStackTrace();
				}
			} else if (names[j].equals("dates")) {
				if (content.has("taken")) {
					String dateString = content.optString("taken").trim();
					if (0 < dateString.length()) {
						Date dateTaken = DateUtilities.convert(dateString);
						if (dateTaken != null) {
							XMLGregorianCalendar xmlTakenTime = DateUtilities
									.asXMLGregorianCalendar(dateTaken);
							mediaItem.setCreated(xmlTakenTime);
						}
					} else {
						Long dateInteger = content.optLong("taken");
						if (0 < dateInteger) {
							Date dateTaken = DateUtilities
									.timeStamptoDate(dateInteger);
							XMLGregorianCalendar xmlTakenTime = DateUtilities
									.asXMLGregorianCalendar(dateTaken);
							mediaItem.setCreated(xmlTakenTime);
						}
					}
				}
			} else if (names[j].equals("description")) {
				if (content.has("_content")) {
					String contentValue = content.optString("_content").trim();
					if (0 < contentValue.length()) {
						mediaItem.setDescription(contentValue);
					}
				}
			} else if (names[j].equals("urls")) {
				try {
					JSONArray opturl = content.getJSONArray("url");
					for (int c = 0; c < opturl.length(); c++) {
						JSONObject optUrlObject = opturl.getJSONObject(c);
						if (optUrlObject.has("type")) {
							if (optUrlObject.optString("type").equals(
									"photopage")) {
								if (optUrlObject.has("_content")) {
									if (!optUrlObject.optString("_content")
											.equals("")) {
										mediaItem.setUrl(optUrlObject
												.optString("_content"));
									}
								}
							}
						}
					}
				} catch (JSONException ex) {
					ex.printStackTrace();
				}
			} else if (names[j].equals("owner")) {
				if (content.has("nsid")) {
					String nsid = content.optString("nsid").trim();
					if (nsid == null || nsid.length() == 0) {
						continue;
					}

					Source source = new Source();
					source.setKnownSns(KnownSns.FLICKR);
					ObjectId id = new ObjectId();
					id.setId(nsid);
					id.setSource(source);
					mediaItem.setUserId(id);
				}

				// if (content.has("username")) {
				// String username = content.optString("username").trim();
				// }
				//
				// if (content.has("realname")) {
				// String realname = content.optString("realname").trim();
				// }
			}
		}

		return mediaItem;
	}

	/*
	 * GetMediaItemsResponse gets the mOutput response string in json format and
	 * retrieves the useful information from the flickr API call in order to
	 * construct the final SOAP response from the flickr Adaptor
	 */

	public static MediaItem[] parseMediaItemsResponse(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseMediaItemsResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		JSONObject flickrJson = null;
		try {
			flickrJson = new JSONObject(mOutput);

			// try {
			// String resultStat = flickrJson.getString("stat");
			// if (resultStat.equals("fail")) {
			// int resultCode = flickrJson.getInt("code");
			// String resultMessage = flickrJson.getString("message");
			//
			// switch (resultCode) {
			// case 1:
			// String message_1 = "InvalidInputException: Error Code: "
			// + resultCode + " , message: " + resultMessage;
			// throw new InvalidInputException(message_1);
			//
			// case 105:
			// String message_2 = "SnUnavailableException: Error Code: "
			// + resultCode + " , message: " + resultMessage;
			// throw new SnUnavailableException(message_2);
			// }
			// }
			// } catch (JSONException ex) {
			// ex.printStackTrace();
			// logger.error("JSONException: " + ex.getMessage());
			// }

			JSONArray flickrList = null;

			flickrList = flickrJson.getJSONArray("list");

			final ArrayList<MediaItem> mediaItems = new ArrayList<MediaItem>();
			for (int i = 0; i < flickrList.length(); i++) {
				JSONObject flickrItem = null;

				flickrItem = flickrList.getJSONObject(i);

				MediaItem mediaItem = getMediaItemFromJSON(flickrItem);
				if (mediaItem != null) {
					mediaItems.add(mediaItem);
				}
			}

			int counter = 0;
			final MediaItem[] mediaItemsArray = new MediaItem[mediaItems.size()];
			for (MediaItem mediaItem : mediaItems) {
				mediaItemsArray[counter++] = mediaItem;
			}
			return mediaItemsArray;

		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

	}

	public static MediaItemDisplay parseMediaItemDisplayResponse(
			String mOutput) throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseMediaItemDisplayResponse";
			logger.error(message);
			throw new InvalidInputException(message);
		}
		//MediaItemDisplayList mediaItemDisplayList = new MediaItemDisplayList();
		MediaItemDisplay mediaItemDisplay = new MediaItemDisplay();
		
		try {
			JSONObject jsonObj = new JSONObject(mOutput);
			JSONObject sizes = jsonObj.optJSONObject("sizes");
			JSONArray size = sizes.optJSONArray("size");
			for (int j = 0; j < size.length(); j++) {
				JSONObject sizeObj = size.getJSONObject(4);
			//	System.out.println("mesa sto for");
				if (sizeObj.has("source")) {
					String source = sizeObj.optString("source");
					//System.out.println("source = " + source);
					String embeddedHtml = "<img src=\"" + source + "\">";
					//System.out.println("embeddedHtml = " + embeddedHtml);
					mediaItemDisplay.setEmbeddedHtml(embeddedHtml);
				}
//				mediaItemDisplayList.getMediaItemDisplay()
//						.add(mediaItemDisplay);
			}

		} catch (JSONException e) {
			System.out.println("in exception");
			e.printStackTrace();
		}

		return mediaItemDisplay;
	}

	public static MediaItemDisplay parseMediaItemDisplay(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseMediaItemDisplay";
			logger.error(message);
			throw new InvalidInputException(message);
		}
		//MediaItemDisplayList mediaItemDisplayList = new MediaItemDisplayList();
		MediaItemDisplay mediaItemDisplay = new MediaItemDisplay();
		try {
			JSONObject jsonObj = new JSONObject(mOutput);
			JSONObject photo = jsonObj.optJSONObject("photo");

			if (photo.has("id")) {
				String id = photo.optString("id");
				ObjectId obj = new ObjectId();
				obj.setId(id);
				Source source = new Source();
				source.setKnownSns(KnownSns.FLICKR);
				obj.setSource(source);
				mediaItemDisplay.setMediaItemId(obj);
				System.out.println("id = " + id);
			}
			JSONObject title = photo.optJSONObject("title");
			if (title.has("_content")) {
				String content = title.getString("_content");
				mediaItemDisplay.setTitle(content);
				System.out.println("content = " + content);
			}

			//mediaItemDisplayList.getMediaItemDisplay().add(mediaItemDisplay);

		} catch (JSONException e) {
			System.out.println("in catch block");
			e.printStackTrace();
		}

		return mediaItemDisplay;
	}

	/*
	 * GetPersonsReposnse gets the mOutput response string in json format and
	 * retrieves the useful information from the flickr API call in order to
	 * construct the final SOAP response from the flickr Adaptor
	 */

	public static Person[] parsePersonsResponse(String mOutput)
			throws SociosException {

		String debug = String.format(
				"parsePersonsResponse(String mOutput) = %s", mOutput);
		logger.debug(debug);

		try {
			JSONObject flickrJson = new JSONObject(mOutput);
			debug = String.format("parsePersonsResponse flickrJson = %s",
					flickrJson.toString());
			logger.debug(debug);

			JSONArray flickrList = flickrJson.getJSONArray("list");

			final ArrayList<Person> persons = new ArrayList<Person>();
			for (int i = 0; i < flickrList.length(); i++) {
				Person person = new Person();

				JSONObject flickrUser = flickrList.getJSONObject(i);

				String[] names = JSONObject.getNames(flickrUser);
				for (int j = 0; j < names.length; j++) {
					if (names[j].equals("id")) {
						Source source = new Source();
						source.setKnownSns(KnownSns.FLICKR);
						ObjectId id = new ObjectId();
						id.setId(flickrUser.optString(names[j]));
						id.setSource(source);
						person.setId(id);
						continue;
					}

					JSONObject content = null;
					try {
						content = flickrUser.getJSONObject(names[j]);
					} catch (JSONException ex) {
//						System.out.println("@Person[] parsePersonsResponse: "
//								+ ex.getMessage());
						continue;
					}

					content = flickrUser.getJSONObject(names[j]);

					String contentValue = content.optString("_content").trim();
					if (contentValue == null || contentValue.length() == 0) {
						continue;
					}

					if (names[j].equals("username")) {
						person.setDisplayName(contentValue);
					} else if (names[j].equals("realname")) {
						Name name = new Name();
						name.setFormatted(contentValue);
						person.setName(name);
					} else if (names[j].equals("profileurl")) {
						person.setProfileUrl(contentValue);
					}

				}

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

		} catch (JSONException ex) {
		//	ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
			return null;
		}

	}

	public static String parseNumFavorites(String mOutput)
			throws SociosException {

		if (mOutput == null) {
			String message = "No input in parseNumFavorites";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		try {
			JSONObject flickrJson = null;

			flickrJson = new JSONObject(mOutput);

			JSONObject flickItem = flickrJson.getJSONObject("photo");

			String[] names = JSONObject.getNames(flickItem);

			for (int i = 0; i < names.length; i++) {
				System.out.println("names: " + names[i]);
				if (names[i].equals("total")) {
					String totalValue = flickItem.optString(names[i]);
					System.out.println("totalValue: " + totalValue);
					return totalValue;
				}
			}
		} catch (JSONException ex) {
			//ex.fillInStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

		return null;
	}
}
/*
 * public static Person[] parsePersonsResponse(String mOutput) throws
 * SociosException{
 * 
 * if (mOutput == null) { String message = "No input in parsePersonsResponse";
 * logger.error(message); throw new InvalidInputException(message); }
 * 
 * JSONObject flickrJson = null; try { flickrJson = new JSONObject(mOutput); }
 * catch (JSONException ex) { ex.printStackTrace();
 * logger.error("parsePersonsResponse: JSONException: " + ex.getMessage());
 * //return null; }
 * 
 * 
 * try { String resultStat = flickrJson.getString("stat"); if
 * (resultStat.equals("fail")) { int resultCode = flickrJson.getInt("code");
 * String resultMessage = flickrJson.getString("message");
 * 
 * switch (resultCode) {
 * 
 * case 1: String message1 = "InvalidInputException: Error Code: " + resultCode
 * + " , message: " + resultMessage; throw new InvalidInputException(message1);
 * 
 * case 105: String message2 = "SnUnavailableException: Error Code: " +
 * resultCode + " , message: " + resultMessage; throw new
 * SnUnavailableException(message2);
 * 
 * default: String message = "Error Code: " + resultCode + " , message: " +
 * resultMessage; logger.error(message); throw new SociosException(message); } }
 * 
 * } catch (JSONException ex) { ex.printStackTrace();
 * logger.error("JSONException: " + ex.getMessage()); }
 * 
 * 
 * JSONArray flickrList = null; try { flickrList =
 * flickrJson.getJSONArray("list"); } catch (JSONException ex) {
 * ex.printStackTrace(); logger.error("JSONException: " + ex.getMessage());
 * return null; }
 * 
 * final ArrayList<Person> persons = new ArrayList<Person>(); for (int i = 0; i
 * < flickrList.length(); i++) { Person person = new Person();
 * 
 * JSONObject flickrUser = null; try { flickrUser = flickrList.getJSONObject(i);
 * } catch (JSONException ex) { ex.printStackTrace();
 * logger.error("JSONException: " + ex.getMessage()); continue; }
 * 
 * String[] names = JSONObject.getNames(flickrUser); for (int j = 0; j <
 * names.length; j++) { if (names[j].equals("id")) { Source source = new
 * Source(); source.setKnownSns(KnownSns.FLICKR); ObjectId id = new ObjectId();
 * id.setId(flickrUser.optString(names[j])); id.setSource(source);
 * person.setId(id); continue; }
 * 
 * JSONObject content = null; try { content =
 * flickrUser.getJSONObject(names[j]); } catch (JSONException ex) {
 * logger.error("JSONException: " + ex.getMessage()); continue; }
 * 
 * String contentValue = content.optString("_content").trim(); if (contentValue
 * == null || contentValue.length() == 0) { continue; }
 * 
 * if (names[j].equals("username")) { person.setDisplayName(contentValue); }
 * else if (names[j].equals("realname")) { Name name = new Name();
 * name.setFormatted(contentValue); person.setName(name); } else if
 * (names[j].equals("profileurl")) { person.setProfileUrl(contentValue); }
 * 
 * }
 * 
 * String buddyIcon = "http://www.flickr.com/buddyicons/" +
 * person.getId().getId() + ".jpg"; // get avatar
 * person.setThumbnailUrl(buddyIcon);
 * 
 * persons.add(person); }
 * 
 * int counter = 0; final Person[] personsArray = new Person[persons.size()];
 * for (Person person : persons) { personsArray[counter++] = person; }
 * 
 * return personsArray; }
 */

