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
 
package eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.datatype.XMLGregorianCalendar;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Source;

public class GooglepFindParser {

	public static List<MediaItem> parseFindMediaItemsGoogleP(String response) {
		// 2012-10-05T20:05:48.000Z
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		List<MediaItem> items = new ArrayList<MediaItem>();
		MediaItem item = new MediaItem();
		ObjectId id = new ObjectId();
		Source src = new Source();

		String published = null;
		XMLGregorianCalendar xmlTakenTime = null;
		try {
			JSONObject jObject = new JSONObject(response);
			JSONArray jArray = jObject.optJSONArray("items");

			for (int i = 0; i < jArray.length(); i++) {

				item = new MediaItem();
				src.setKnownSns(KnownSns.GOOGLEP);
				id.setSource(src);
				item.setId(id);
				BigInteger bigValue = new BigInteger("-1");
				item.setNumComments(bigValue);
				item.setNumFavorites(bigValue);
				item.setNumNegativeVotes(bigValue);
				item.setNumPositiveVotes(bigValue);
				item.setNumRatings(bigValue);
				item.setNumViews(bigValue);
				item.setNumResharings(bigValue);
				item.setNumVotes(bigValue);
				item.setRating(-1.0);

				License license = new License();
				license.setUrl("http://www.google.com/policies/privacy/");
				item.setLicense(license);

				JSONObject jTmpObj = jArray.optJSONObject(i);
				if (jTmpObj.has("published")) {
					published = jTmpObj.optString("published");
					// System.out.println("published = " + published);
					Date uploaded;
					try {
						uploaded = df.parse(published);
						xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(uploaded);

						item.setCreated(xmlTakenTime);
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}

				if (jTmpObj.has("title")) {
					String title = jTmpObj.optString("title");
					item.setTitle(title);
				}

				JSONObject actor = jTmpObj.optJSONObject("actor");
				String userId = actor.optString("id");
				ObjectId objUserId = new ObjectId();
				objUserId.setId(userId);
				objUserId.setSource(src);
				item.setUserId(objUserId);

				if (jTmpObj != null) {
					jTmpObj = jTmpObj.optJSONObject("object");
					JSONArray jTmpArray = jTmpObj.optJSONArray("attachments");
					if (jTmpArray != null) {
						for (int j = 0; j < jTmpArray.length(); j++) {

							JSONObject attachment = jTmpArray.optJSONObject(j);

							if (attachment.has("objectType")) {
								String objectType = attachment
										.optString("objectType");

								if (objectType.equals("photo")) {
									if (attachment.has("url")) {
										String url = attachment
												.optString("url");
										// System.out.println("url = " + url);

										if (url.startsWith("https://plus.google.com/photos/")) {

											// System.out
											// .println("url pou thelw= "
											// + url);
											item.setUrl(url);
											// item.setMimeType("IMAGE");
											item.setType(MediaItemType.IMAGE);
											JSONObject image = attachment
													.optJSONObject("image");
											String thumbnail = image
													.optString("url");
											item.setThumbnailUrl(thumbnail);

											// if (attachment.has("content")) {
											//
											// // System.out
											// // .println("content = "
											// // + attachment
											// // .optString("content"));
											// item.setTitle(attachment
											// .optString("content"));
											// }

											items.add(item);

										}// end if(url.startsWith
									}// end if(attachment.has("url"))

								}// end if if(objectType.equals("photo"))

							}// end if(attachment.has("objectType"))
						}// end for (int j = 0; j < jTmpArray.length(); j++)
					}// if(jTmpArray != null)
				}// end if (jTmpObj != null)

			}// end for (int i = 0; i < jArray.length(); i++)
		} catch (JSONException e) {
			e.printStackTrace();
		}

		return items;
	}

	public static List<Activity> parseFindActivitiesGoogleP(String response)
			throws SociosException {
		// 2012-10-05T20:05:48.000Z
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		XMLGregorianCalendar xmlTakenTime = null;
		List<Activity> items = new ArrayList<Activity>();

		Source src = new Source();
		src.setKnownSns(KnownSns.GOOGLEP);

		JSONObject jObject = null;
		try {
			jObject = new JSONObject(response);
		} catch (JSONException e1) {
			e1.printStackTrace();
		}

		JSONArray jArray = jObject.optJSONArray("list");
		if (jArray != null) {

			for (int i = 0; i < jArray.length(); i++) {
				Activity activity = new Activity();
				MediaItem media = new MediaItem();
				// System.out.println("jArray.length() = " + jArray.length());
				// System.out.println("jArray = " + i + jArray);

				JSONObject jarrayObj = jArray.optJSONObject(i);
				if (jarrayObj.has("id")) {
					String id = jarrayObj.optString("id");
					// System.out.println("id = " + id);
					ObjectId activityId = new ObjectId();
					activityId.setId(id);
					activityId.setSource(src);
					activity.setId(activityId);
				}

				if (jarrayObj.has("title")) {
					String title = jarrayObj.optString("title");
					// System.out.println("title = " + title);
					activity.setTitle(title);
				}

				if (jarrayObj.has("published")) {
					String published = jarrayObj.optString("published");
					// System.out.println("published = " + published);
					try {
						Date postedTime = df.parse(published);

						xmlTakenTime = DateUtilities
								.asXMLGregorianCalendar(postedTime);

						media.setCreated(xmlTakenTime);

						long longDate = postedTime.getTime();
						activity.setPostedTime(longDate);
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}

				if (jarrayObj.has("url")) {
					String url = jarrayObj.optString("url");
					// System.out.println("url = " + url);
					media.setUrl(url);
					activity.setUrl(url);
				}

				JSONObject actor = jarrayObj.optJSONObject("actor");
				if (actor.has("id")) {
					String userId = actor.optString("id");
					// System.out.println("userId = " + userId);
					ObjectId objUserId = new ObjectId();
					objUserId.setId(userId);
					objUserId.setSource(src);
					media.setUserId(objUserId);
					activity.setUserId(objUserId);
				}

				JSONObject object = jarrayObj.optJSONObject("object");
				JSONArray attachments = object.optJSONArray("attachments");
				if (attachments != null) {
					for (int k = 0; k < attachments.length(); k++) {
						JSONObject jobj = attachments.optJSONObject(k);
						// System.out.println("in attachements");
						if (jobj.has("objectType")) {
							String objectType = jobj.optString("objectType");

							if (objectType.equals("photo")) {
								// System.out.println("objectType photo");
								media.setType(MediaItemType.IMAGE);

								if (object.has("content")) {
									String content = object
											.optString("content");
									media.setDescription(content);
								}
								if (jobj.has("id")) {
									String id = jobj.optString("id");
									ObjectId mediaObj = new ObjectId();
									mediaObj.setId(id);
									mediaObj.setSource(src);
									media.setId(mediaObj);
								}
								// if (jobj.has("url")) {
								// String url = jobj.optString("url");
								// media.setUrl(url);
								// }
								JSONObject image = jobj.optJSONObject("image");
								if (image.has("url")) {
									String thumbnailurl = image
											.optString("url");
									media.setThumbnailUrl(thumbnailurl);
								}
							}
							// System.out.println("after objectType photo");

							if (objectType.equals("album")) {
								// System.out.println("objectType album");
								media.setType(MediaItemType.IMAGE);
								if (object.has("content")) {
									String content = object
											.optString("content");
									media.setDescription(content);
								}
								if (jobj.has("id")) {
									String id = jobj.optString("id");
									ObjectId mediaObj = new ObjectId();
									mediaObj.setId(id);
									mediaObj.setSource(src);
									media.setId(mediaObj);
								}

								JSONArray thumbnails = jobj
										.optJSONArray("thumbnails");
								JSONObject firstThumbnail = thumbnails
										.optJSONObject(0);
								JSONObject image = firstThumbnail
										.optJSONObject("image");
								if (image.has("url")) {
									String thumbnailurl = image
											.optString("url");
									media.setThumbnailUrl(thumbnailurl);
								}
							}
							// System.out.println("after objectType album");

							if (objectType.equals("article")) {
								// System.out.println("objectType article");
								if (jobj.has("content")) {
									String content = jobj.optString("content");
									// System.out.println("content = " +
									// content);
									media.setDescription(content);
								}
								if (jobj.has("displayName")) {
									String title = jobj
											.optString("displayName");
									// System.out.println("title = " + title);
									media.setTitle(title);
								}

								JSONObject fullImage = jobj
										.optJSONObject("fullImage");
								if (fullImage != null) {
									if (fullImage.has("url")) {
										String thumbanailUrl = fullImage
												.optString("url");
										// System.out.println("thumbanailUrl = "
										// + thumbanailUrl);
										media.setThumbnailUrl(thumbanailUrl);
										media.setType(MediaItemType.IMAGE);
									}
								} else {
									System.out.println("sto else tou setTYPE");
									media.setType(MediaItemType.TEXT);
								}
							}
							// System.out.println("after objectType article");

							if (objectType.equals("event")) {
								// System.out.println("objectType event");
								media.setType(MediaItemType.TEXT);
								if (jobj.has("content")) {
									String content = jobj.optString("content");
									media.setDescription(content);
								}
								if (jobj.has("displayName")) {
									String title = jobj
											.optString("displayName");
									media.setTitle(title);
								}
							}
							// System.out.println("after objectType event");

							if (objectType.equals("video")) {
								// System.out.println("objectType video");
								media.setType(MediaItemType.VIDEO);

								if (jobj.has("content")) {
									String content = jobj.optString("content");
									media.setDescription(content);
								}
								if (jobj.has("displayName")) {
									String title = jobj
											.optString("displayName");
									media.setTitle(title);
								}

								JSONObject image = jobj.optJSONObject("image");
								if (image.has("url")) {
									String thumbnailurl = image
											.optString("url");
									// System.out.println("thumbnailurl = "
									// + thumbnailurl);
									media.setThumbnailUrl(thumbnailurl);
								}
							}// end if video
								// System.out.println("after objectType video");
						}// end if(objectType)
					}// end for
				}

				activity.getMediaItems().add(media);
				items.add(activity);
			}// end for jsonArray
		}

		return items;
	}

}
// public static List<Activity> parseFindActivitiesGoogleP(String response)
// {
// // 2012-10-05T20:05:48.000Z
// DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
// List<Activity> items = new ArrayList<Activity>();
// Activity activity = new Activity();
// ObjectId activityId = new ObjectId();
// Source src = new Source();
//
// JSONObject jObject = null;
// try {
// jObject = new JSONObject(response);
// } catch (JSONException e1) {
// // TODO Auto-generated catch block
// e1.printStackTrace();
// }
// JSONArray jArray = jObject.optJSONArray("items");
//
// for (int i = 0; i < jArray.length(); i++) {
//
// activity = new Activity();
// src.setKnownSns(KnownSns.GOOGLEP);
// activityId.setSource(src);
// String id = null;
// try {
// id = jArray.getString(i);
// } catch (JSONException e1) {
// // TODO Auto-generated catch block
// e1.printStackTrace();
// }
// activityId.setId(id);
// activity.setId(activityId);
//
// JSONObject jTmpObj = jArray.optJSONObject(i);
// if (jTmpObj.has("published")) {
// String published = jTmpObj.optString("published");
// // System.out.println("published = " + published);
// try {
// Date postedTime = df.parse(published);
// long longDate = postedTime.getTime();
// activity.setPostedTime(longDate);
// } catch (ParseException e) {
// e.printStackTrace();
// }
// }
//
// if (jTmpObj.has("title")) {
// String title = jTmpObj.optString("title");
// activity.setTitle(title);
// }
//
// JSONObject actor = jTmpObj.optJSONObject("actor");
// String userId = actor.optString("id");
// ObjectId objUserId = new ObjectId();
// objUserId.setId(userId);
// objUserId.setSource(src);
// activity.setUserId(objUserId);
//
// items.add(activity);
// }
//
// return items;
// }

