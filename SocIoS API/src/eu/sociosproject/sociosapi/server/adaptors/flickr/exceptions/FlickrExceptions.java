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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.IllegalRequestException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;

public class FlickrExceptions {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	public void findPersonsPersonFilterException(String apiResponse)
			throws SociosException {

		System.out.println("mesa sti findPersonsPersonFilterException");
		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {

				case 1:
					String message_1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_1);
					System.out.println("in case 1 message = " + message_1);
					// throw new InvalidInputException(message_1);

				case 105:
					String message_2 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_2);
					System.out.println("in case 105 message = " + message_2);
					// throw new SnUnavailableException(message_2);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("idefault = " + message);
					// throw new SociosException(message);
				}
			}
		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}
	}

	public void connectedPersonsException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");
			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {
				case 1:
					String message1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					System.out.println("in case 1 message = " + message1);
					// throw new InvalidInputException(message1);

				case 105:
					String message2 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					System.out.println("in case 105 message = " + message2);
					// throw new SnUnavailableException(message2);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("in default message = " + message);
					// throw new SociosException(message);
				}
			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}
	}

	public void findMediaItemsException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {
				case 1:
					String message_1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_1);
					System.out.println("in case 1 message = " + message_1);
					// throw new InvalidInputException(message_1);

				case 2:
					String message_2 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_2);
					System.out.println("in case 2 message = " + message_2);
					// throw new InvalidInputException(message_2);

				case 3:
					System.out.println("in case 3");
					String message_3 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_3);
					System.out.println("in case 3 message = " + message_3);
					// throw new InvalidInputException(message_3);

				case 4:
					String message_4 = "IllegalRequestException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_4);
					System.out.println("in case 4 message = " + message_4);
					// throw new IllegalRequestException(message_4);

				case 10:
					String message_5 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_5);
					System.out.println("in case 10 message = " + message_5);
					// throw new SnUnavailableException(message_5);

				case 17:
					String message_6 = "IllegalRequestException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_6);
					System.out.println("in case 17 message = " + message_6);
					// throw new IllegalRequestException(message_6);

				case 18:
					String message_7 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_7);
					System.out.println("in case 18 message = " + message_7);
					// throw new InvalidInputException(message_7);

				case 105:
					String message_8 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_8);
					System.out.println("in case 105 message = " + message_8);
					// throw new SnUnavailableException(message_8);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("in default = " + message);
					// throw new SociosException(message);

				}

			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

	}

	public void myConnectedPersonsException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");
				switch (resultCode) {

				case 96:
					String message1 = "AccessTokenAuthenticationException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					System.out.println("in case 96 message = " + message1);
					// throw new AccessTokenAuthenticationException(message1);

				case 98:
					String message3 = "AccessTokenAuthenticationException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					System.out.println("in case 98 message = " + message3);
					// throw new AccessTokenAuthenticationException(message3);

				case 105:
					String message2 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					System.out.println("in case 105 message = " + message2);
					// throw new SnUnavailableException(message2);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("in default message = " + message);
					// throw new SociosException(message);

				}
			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException " + ex.getMessage());
		}

	}

	public void myConnectedPersonsException() throws SociosException {

		String message3 = ("AccessTokenAuthenticationException: Error Code: 98 , message: Invalid auth token");
		System.out.println("message3 = " + message3);
		// throw new AccessTokenAuthenticationException(message3);

	}

	public void findActivitiesException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("ok")) {
				JSONObject jsonObject = new JSONObject(apiResponse);
				JSONObject photos = jsonObject.optJSONObject("photos");
				String total = photos.optString("total");
				if (total.equals("0")) {
					System.out
							.println("There is no current activity for this personId");
					// throw new
					// InvalidInputException("There is no current activity for this personId");
				}
			}

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {
				case 1:
					String message_1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_1);
					//System.out.println("case 1: message = " + message_1);
					// throw new InvalidInputException(message_1);

				case 2:
					String message_2 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_2);
					//System.out.println("case 2: message = " + message_2);
					// throw new InvalidInputException(message_2);

				case 3:
					String message_3 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_3);
					//System.out.println("case 3: message = " + message_3);
					// throw new InvalidInputException(message_3);

				case 4:
					String message_4 = "IllegalRequestException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_4);
					//System.out.println("case 4: message = " + message_4);
					// throw new IllegalRequestException(message_4);

				case 10:
					String message_5 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_5);
					//System.out.println("case 10: message = " + message_5);
					// throw new SnUnavailableException(message_5);

				case 17:
					String message_6 = "IllegalRequestException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_6);
					//System.out.println("case 17: message = " + message_6);
					// throw new IllegalRequestException(message_6);

				case 18:
					String message_7 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_7);
					//System.out.println("case 18: message = " + message_7);
					// throw new InvalidInputException(message_7);

				case 105:
					String message_8 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_8);
					//System.out.println("case 105: message = " + message_8);
					// throw new SnUnavailableException(message_8);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("default = " + message);
					// throw new SociosException(message);
				}
			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

	}

	public void getMediaItemsDisplayUrlException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {
				case 1:
					String message_1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_1);
					System.out.println("case 1: message = " + message_1);
					// throw new InvalidInputException(message_1);

				case 2:
					String message_2 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_2);
					System.out.println("case 2: message = " + message_2);
					// throw new IllegalRequestException(message_2);

				case 105:
					String message_8 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_8);
					System.out.println("case 8: message = " + message_8);
					// throw new SnUnavailableException(message_8);

				default:
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("default: message = " + message);
					// throw new SociosException(message);
				}
			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

	}

	public void getMediaItemsDisplayException(String apiResponse)
			throws SociosException {

		try {
			JSONObject flickrJson = new JSONObject(apiResponse);
			String resultStat = flickrJson.getString("stat");

			if (resultStat.equals("fail")) {
				int resultCode = flickrJson.getInt("code");
				String resultMessage = flickrJson.getString("message");

				switch (resultCode) {
				case 1:
					String message_1 = "InvalidInputException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_1);
					System.out.println("case 1: message = " + message_1);
					// throw new InvalidInputException(message_1);

				case 105:
					String message_8 = "SnUnavailableException: Error Code: "
							+ resultCode + " , message: " + resultMessage;
					logger.error(message_8);
					System.out.println("case 105: message = " + message_8);
					// throw new SnUnavailableException(message_8);

				default:
					System.out.println("sto default");
					String message = "Error Code: " + resultCode
							+ " , message: " + resultMessage;
					logger.error(message);
					System.out.println("default: message = " + message);
					// throw new SociosException(message);
				}
			}

		} catch (JSONException ex) {
			// ex.printStackTrace();
			logger.error("JSONException: " + ex.getMessage());
		}

	}

}
