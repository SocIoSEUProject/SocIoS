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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.xml.datatype.XMLGregorianCalendar;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.Constants;
import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.LicenseType;
import eu.sociosproject.sociosvoc.LocationFilter;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;

/**
 * 
 * @author G.A.P. II
 */

public class FindMethods implements Constants {

	public static String activitiesRequest(String authToken) {

		StringBuilder requestUrl = RequestUtilities
				.basicRequestUrl("flickr.activity.userComments"); // This method
																	// requires
																	// authentication
																	// with
																	// 'read'
																	// permission.

		String auth_token = "72157629596493437-a288355a39a9d85d";

		// String auth_token = Authentication.GetAuthToken.getAuth();
		// System.out.println("auth_token: " +
		// Authentication.GetAuthToken.getAuth());

		System.out.println("APIKEY= " + Constants.API_KEY);
		System.out.println("APISECRET= " + Constants.API_SECRET);

		String sig = Constants.API_SECRET + "api_key" + Constants.API_KEY
				+ "auth_token" + auth_token + "formatjson"
				+ "methodflickr.activity.userComments" + "nojsoncallback1";
		System.out.println("sig: " + sig);
		String api_sig = eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities
				.MD5(sig);
		System.out.println("api_sig: " + api_sig);

		requestUrl.append("&auth_token=");
		requestUrl.append(auth_token);
		requestUrl.append("&api_sig=");
		requestUrl.append(api_sig);

		return requestUrl.toString();
	}

	public static String mediaItemsRequest(MediaItemFilter mediaItemFilter) {

		License license = new License();

		StringBuilder requestUrl = RequestUtilities
				.extendedRequestUrl("flickr.photos.search");
		requestUrl.append("&per_page=");
		requestUrl.append("50");
		requestUrl.append("&sort=");
		requestUrl.append("date-posted-desc");

		StringBuilder text = new StringBuilder();
		if (mediaItemFilter.getDescription() != null) {
			for (String keyword : mediaItemFilter.getDescription().getKeyword()) {
				text.append(keyword).append(" ");
			}
		}

		if (mediaItemFilter.getId() != null) {
			for (ObjectId id : mediaItemFilter.getId().getObjectId()) {
				text.append(id.getId().toString()).append(" ");
			}
		}

		if (mediaItemFilter.getTitle() != null) {
			for (String keyword : mediaItemFilter.getTitle().getKeyword()) {
				text.append(keyword).append(" ");
			}
		}

		String totalText = text.toString().trim();
		if (0 < totalText.length()) {
			requestUrl.append("&text=").append(totalText);
		}

		// added 2/11 for testing!!
		StringBuilder userIds = new StringBuilder();
		if (mediaItemFilter.getUserId().getObjectId() != null) {
			for (ObjectId userid : mediaItemFilter.getUserId().getObjectId()) {
				userIds.append(userid.getId().toString()).append(" ");
				System.out.println("userid.getId().toString() "
						+ userid.getId().toString());
			}

			String totalUserIds = userIds.toString().trim()
					.replaceAll(" ", "%20");
			if (0 < totalUserIds.length()) {
				requestUrl.append("&user_id=").append(totalUserIds);
			}
		}

		StringBuilder tags = new StringBuilder();
		if (mediaItemFilter.getTags() != null) {
			for (String tag : mediaItemFilter.getTags().getKeyword()) {
				tags.append(tag).append(" ");
			}
		}

		// if (mediaItemFilter.getTaggedPeople() != null) {
		// for (String tagKeyword : mediaItemFilter.getTaggedPeople()
		// .getKeyword()) {
		// tags.append(tagKeyword).append(" ");
		// }
		// }

		String totalTags = tags.toString().trim();
		if (0 < totalTags.length()) {
			requestUrl.append("&tags=").append(totalTags);
		}

		if (mediaItemFilter.getLocation() != null) {
			Double latitude = mediaItemFilter.getLocation().getLatitude();
			Double longitude = mediaItemFilter.getLocation().getLongitude();
			if (latitude != null && longitude != null
					&& 0 < longitude.toString().trim().length()
					&& 0 < latitude.toString().trim().length()) {
				requestUrl.append("&lat=").append(latitude);
				requestUrl.append("&lon=").append(longitude);
			}
		}

		// if (mediaItemFilter.getStartTime() != null) {
		// XMLGregorianCalendar startingUploadTime = mediaItemFilter
		// .getStartTime().getFrom();
		// if (startingUploadTime != null) {
		// Date utilDate = DateUtilities.asDate(startingUploadTime);
		// if (utilDate != null) {
		// java.sql.Date sqlDate = new java.sql.Date(
		// utilDate.getTime());
		// if (sqlDate != null) {
		// requestUrl.append("&min_upload_date=").append(
		// sqlDate.toString());
		// }
		// }
		// }
		//
		// XMLGregorianCalendar endingUploadTime = mediaItemFilter
		// .getStartTime().getTo();
		// if (endingUploadTime != null) {
		// Date utilDate = DateUtilities.asDate(endingUploadTime);
		// if (utilDate != null) {
		// java.sql.Date sqlDate = new java.sql.Date(
		// utilDate.getTime());
		// if (sqlDate != null) {
		// requestUrl.append("&max_upload_date=").append(
		// sqlDate.toString());
		// }
		// }
		// }
		// }

		if (mediaItemFilter.getCreated() != null) {
			XMLGregorianCalendar startingCreatedTime = mediaItemFilter
					.getCreated().getFrom();
			if (startingCreatedTime != null) {
				Date utilDate = DateUtilities.asDate(startingCreatedTime);
				if (utilDate != null) {
					java.sql.Date sqlDate = new java.sql.Date(
							utilDate.getTime());
					if (sqlDate != null) {
						requestUrl.append("&min_taken_date=").append(
								sqlDate.toString());
					}
				}
			}

			XMLGregorianCalendar endingCreatedTime = mediaItemFilter
					.getCreated().getTo();
			if (endingCreatedTime != null) {
				Date utilDate = DateUtilities.asDate(endingCreatedTime);
				if (utilDate != null) {
					java.sql.Date sqlDate = new java.sql.Date(
							utilDate.getTime());
					if (sqlDate != null) {
						requestUrl.append("&max_taken_date=").append(
								sqlDate.toString());
					}
				}
			}
		}

		// if (mediaItemFilter.getMediaTypes() != null) {
		// for (MediaItemType mediaType : mediaItemFilter.getMediaTypes()) {
		// if (mediaType == null) {
		// continue;
		// }
		//
		// if (mediaType.equals(MediaItemType.VIDEO)) {
		// requestUrl.append("&media=videos");
		// } else if (mediaType.equals(MediaItemType.IMAGE)) {
		// requestUrl.append("&media=photos");
		// }
		// }
		// }

		if (mediaItemFilter.getLicense() != null) {
			if (mediaItemFilter.getLicense().equals(LicenseType.CC)) {

				System.out.println("mesa sto license");
				System.out.println("getLicenseType "
						+ mediaItemFilter.getLicense());

				license.setId("4");
				System.out.println("license.getId()" + license.getId());

				System.out.println("1o requestUrl" + requestUrl);

				requestUrl.append("&license=");
				requestUrl.append(license.getId());
				System.out.println("2o requestUrl" + requestUrl);
			} else if (mediaItemFilter.getLicense().equals(LicenseType.ALL)) {
				System.out.println("getLicenseType "
						+ mediaItemFilter.getLicense());
				requestUrl.append("");
			}

		}

		return requestUrl.toString().replaceAll(" ", "%20").trim();
	}
	
	
	public static String mediaItemsRequest(ObjectId personId) {

		if (personId == null) {
			return null;
		}

		StringBuilder requestUrl = RequestUtilities
				.extendedRequestUrl("flickr.photos.search");
		requestUrl.append("&user_id=");
		requestUrl.append(personId.getId().trim());
		requestUrl.append("&per_page=");
		requestUrl.append("50");
		requestUrl.append("&sort=");
		requestUrl.append("date-posted-desc");

		return requestUrl.toString().replaceAll(" ", "%20").trim();
	}

	public static String mediaItemsRequest(PersonFilter personFilter) {
		// if (personFilter == null) {
		// return null;
		// }

		StringBuilder url = RequestUtilities
				.extendedRequestUrl("flickr.photos.search");
		url.append("&per_page=");
		url.append("50");
		if (personFilter.getId() != null) {
			StringBuilder userIds = new StringBuilder();
			for (ObjectId oid : personFilter.getId().getObjectId()) {
				userIds.append(oid.getId().toString()).append(" ");
				System.out.println("oid.getId().toString() "
						+ oid.getId().toString());
			}

			String totalUserIds = userIds.toString().trim()
					.replaceAll(" ", "%20");
			if (0 < totalUserIds.length()) {
				url.append("&user_id=").append(totalUserIds);
			}
		}

		if (personFilter.getDisplayName() != null) {
			StringBuilder keywords = new StringBuilder();
			for (String keyword : personFilter.getDisplayName().getKeyword()) {
				keywords.append(keyword).append(" ");
			}

			String totalKeywords = keywords.toString().trim()
					.replaceAll(" ", "%20");
			if (0 < totalKeywords.length()) {
				url.append("&text=").append(totalKeywords);
			}
		}

		if ((personFilter.getCurrentLocation() != null)) {
			LocationFilter location = personFilter.getCurrentLocation();
			if (location.getAreaFilter().getLatitude() != null
					&& location.getAreaFilter().getLongitude() != null) {
				String latitude = location.getAreaFilter().getLatitude()
						.toString();
				String longitude = location.getAreaFilter().getLongitude()
						.toString();
				if (0 < latitude.length() && 0 < longitude.length()) {
					url.append("&lat=").append(latitude);
					url.append("&lon=").append(longitude);
				}
			}
		}

		return url.toString();
	}

	public static ArrayList<String> mediaItemsRequest(PersonIdList personIdList)
			throws SociosException {
		// if (personIdList == null) {
		// return null;
		// }

		final ArrayList<String> requestURLs = new ArrayList<String>();
		for (ObjectId id : personIdList.getPersonId()) {
			if (id == null || id.getId().toString().trim().length() == 0) {
				throw new InvalidInputException(
						"InvalidInputException: no personId input");
			}

			StringBuilder url = RequestUtilities
					.extendedRequestUrl("flickr.photos.search");
			url.append("&user_id=");
			url.append(id.getId().toString().trim().replaceAll(" ", "%20"));
			requestURLs.add(url.toString());
		}

		return requestURLs;
	}
	
	public static String mediaItemsRequest(String personId)
			throws SociosException {
		// if (personId == null) {
		// return null;
		// }
		
		StringBuilder url = RequestUtilities
				.extendedRequestUrl("flickr.photos.search");
		url.append("&user_id=");
		url.append(personId.trim().replaceAll(" ", "%20"));
		url.append("&per_page=15");
	
		return url.toString();
	}


//	public static String recentMediaItemsRequest(String personId) {
//
//		Calendar today = Calendar.getInstance();
//		System.out.println("Current date : " + (today.get(Calendar.MONTH) + 1)
//				+ "-" + today.get(Calendar.DATE) + "-"
//				+ today.get(Calendar.YEAR));
//
//		today.add(Calendar.MONTH, -2);
//		
//		java.util.Date dateBack = new java.util.Date(today.getTimeInMillis());
//		//System.out.println("date 2 months before = " + dateBack);
//
//		long timeInMillisSinceEpoch = dateBack.getTime();
//		long dateBack_unix = timeInMillisSinceEpoch / 1000;
//		java.util.Date date = new java.util.Date(dateBack_unix * 1000);
//
//		System.out.println("date 2 months before: " + dateBack
//				+ " dateBack_unix in unixstamp: " + dateBack_unix
//				+ " dateBack_unix in date: " + date);
//
//		StringBuilder url = RequestUtilities
//				.extendedRequestUrl("flickr.photos.search");
//		url.append("&user_id=");
//		url.append(personId.trim().replaceAll(" ", "%20"));
//		url.append("&min_upload_date=");
//		url.append(dateBack_unix);
//
//		return url.toString();
//	}

	public static String personsRequest(PersonFilter personFilter) {

		StringBuilder url = null;
		if (personFilter.getDisplayName() != null) {
			url = RequestUtilities
					.basicRequestUrl("flickr.people.findByUsername");

			StringBuilder username = new StringBuilder();
			for (String name : personFilter.getDisplayName().getKeyword()) {
				username.append(name).append(" ");
			}

			String totalUserName = username.toString().trim()
					.replaceAll(" ", "%20");
			if (totalUserName.length() == 0) {
				return null;
			}

			url.append("&username=").append(totalUserName);
		}

		// else if (personFilter.getEmails() != null) {
		// url = RequestUtilities.basicRequestUrl("flickr.people.findByEmail");
		//
		// StringBuilder email = new StringBuilder();
		// for (String keyword : personFilter.getEmails().getKeyword()) {
		// email.append(keyword).append(" ");
		//
		// }

		// String totalEmail = email.toString().trim().replaceAll(" ", "%20");
		// if (totalEmail.length() == 0) {
		// return null;
		// }
		// url.append("&find_email=").append(totalEmail);
		// }

		return url.toString();
	}
}