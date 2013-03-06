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
 
package eu.sociosproject.sociosapi.coreutilities.networkutilities;

import eu.sociosproject.sociosapi.SociosException;
//import eu.sociosproject.sociosvoc.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.AccessTokenAuthenticationException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.IllegalRequestException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONmerge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author ang
 */
public class HttpRequests implements ApplicationParameters {

	private final static ExecutorService executor = Executors
			.newFixedThreadPool(MAX_NO_OF_ASYNCHRONOUS_REQUESTS);

	private final static Logger logger = LoggerFactory
			.getLogger(HttpRequests.class);

	// Shutdown the threads during shutdown of your app.
	// executor.shutdown();

	/*
	 * public static String getAsynchronousHttpResonse(String args,
	 * ArrayList<String> requestURLs) throws SociosException { int counter = 0;
	 * String[] urlsArray = new String[requestURLs.size()]; for (String url :
	 * requestURLs) { urlsArray[counter++] = url;
	 * System.out.println("getAsynchronousHttpResonse url " + url); }
	 * 
	 * return getAsynchronousHttpResonse(args, urlsArray); }
	 */

	public static String getAsynchronousHttpResonse(String args,
			List<String> requestURLs, Boolean isJSONArrayOrder)
			throws SociosException {

		if (requestURLs == null) {
			String message = "InputStream stream is null";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// int noOfRequests = requestURLs.length;
		int noOfRequests = requestURLs.size();
		int noOfIterations = noOfRequests / MAX_NO_OF_ASYNCHRONOUS_REQUESTS + 1;

		JSONmerge merger = new JSONmerge();
		for (int i = 0; i < noOfIterations; i++) {
			Future<AsynchronousResponse>[] responses = new Future[MAX_NO_OF_ASYNCHRONOUS_REQUESTS];

			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
				int currentIndex = j + i * MAX_NO_OF_ASYNCHRONOUS_REQUESTS;
				if (currentIndex == noOfRequests) {
					break;
				}

				// Fire a request
				URL url = null;
				try {
					// url = new URL(requestURLs[currentIndex]);
					url = new URL(requestURLs.get(currentIndex));
				} catch (MalformedURLException ex) {
					responses[j] = null;
					ex.printStackTrace();
					continue;
				}
				// System.out.println("in the httprequest url: " + url );
				AsynchronousRequest aRequest = new AsynchronousRequest(url);
				responses[j] = executor.submit(aRequest);
			}

			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
				if (responses[j] == null) {
					continue;
				}

				// Get response
				InputStream body = null;
				try {
					body = responses[j].get().getBody();
				} catch (Exception ex) {
					System.out
							.println("in getAsynchronousHttpResonse, exception occured : "
									+ ex.getMessage());
				}
				if (body == null) {
					continue;
				}

				// responseString
				// einai i apantisi pou pairnw apo to social netowork kai thelw
				// na kanw parse
				String responseString = getStringFromInputStream(body);
				//System.out.println("responseString ALAL = " + responseString);
				String debug = String.format("input stream ALAL = %s",
						responseString);
				logger.debug(debug);
				if (responseString == null) {
					System.out.println(" if responseString == null");
					continue;
				}

				try {
					if (isJSONArrayOrder) {
						merger.orderAnswerJSONArray(args, responseString);
					} else {
						merger.orderAnswerJSONObject(args, responseString);
					}
				} catch (JSONException ex) {
					 ex.printStackTrace();
					logger.error("getAsynchronousHttpResonse -1 JSONException: "
							+ ex.getMessage());
				}
			}
		}

		try {
			return merger.getfinalJSON().toString();
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("getAsynchronousHttpResonse -2 JSONException: "
					+ ex.getMessage());
			return null;
		}
	}

//	public static String getInstagramAsynchronousHttpResponse(String args,
//			List<String> requestURLs, Boolean isJSONArrayOrder)
//			throws SociosException {
//
//		if (requestURLs == null) {
//			String message = "InputStream stream is null";
//			logger.error(message);
//			throw new InvalidInputException(message);
//		}
//
//		// int noOfRequests = requestURLs.length;
//		int noOfRequests = requestURLs.size();
//		int noOfIterations = noOfRequests / MAX_NO_OF_ASYNCHRONOUS_REQUESTS + 1;
//
//		JSONmerge merger = new JSONmerge();
//		for (int i = 0; i < noOfIterations; i++) {
//			Future<AsynchronousResponse>[] responses = new Future[MAX_NO_OF_ASYNCHRONOUS_REQUESTS];
//
//			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
//				int currentIndex = j + i * MAX_NO_OF_ASYNCHRONOUS_REQUESTS;
//				if (currentIndex == noOfRequests) {
//					break;
//				}
//
//				// Fire a request
//				URL url = null;
//				try {
//					// url = new URL(requestURLs[currentIndex]);
//					url = new URL(requestURLs.get(currentIndex));
//				} catch (MalformedURLException ex) {
//					responses[j] = null;
//					ex.printStackTrace();
//					continue;
//				}
//				// System.out.println("in the httprequest url: " + url );
//				AsynchronousRequest aRequest = new AsynchronousRequest(url);
//				responses[j] = executor.submit(aRequest);
//			}
//
//			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
//				if (responses[j] == null) {
//					continue;
//				}
//
//				// Get response
//				InputStream body = null;
//				try {
//					body = responses[j].get().getBody();
//					// System.out.println("body = " + body.toString());
//				} catch (Exception ex) {
//					System.out
//							.println("In getInstagramAsynchronousHttpResponse occured exception : "
//									+ ex.getMessage());
//					// ex.printStackTrace();
//					// throw new InvalidInputException("InvalidInputException: "
//					// + ex.getMessage());
//
//				}
//
//				// if (body == null) {
//				// continue;
//				// }
//
//				// responseString
//				// einai i apantisi pou pairnw apo to social netowork kai thelw
//				// na kanw parse
//				String responseString = getStringFromInputStream(body);
//				// System.out.println("responseString ALAL = " +
//				// responseString);
//				String debug = String.format("input stream ALAL = %s",
//						responseString);
//				logger.debug(debug);
//				if (responseString == null) {
//
//					System.out.println(" if responseString == null");
//					continue;
//				}
//
//				// try {
//				// JSONObject instagramJson = new JSONObject(responseString);
//				// JSONObject meta = instagramJson.optJSONObject("meta");
//				// int code = meta.optInt("code");
//				// if (code == 400) {
//				// System.out.println("mes sto code");
//				// String errorType = meta.optString("error_type");
//				// System.out
//				// .println("in getAsynchronousHttpResonse try, error type = "
//				// + errorType);
//				// debug = String
//				// .format("in getAsynchronousHttpResonse try, error type = %s",
//				// errorType);
//				// logger.debug(debug);
//				// String errorMessage = meta.optString("error_message");
//				// System.out.println("errorMessage = " + errorMessage);
//				// throw new SociosException();
//				//
//				// }
//				// } catch (JSONException e) {
//				// e.printStackTrace();
//				// logger.error("JSONException: " + e.getMessage());
//				// System.out.println(e.getMessage());
//				// }
//
//				try {
//					if (isJSONArrayOrder) {
//						merger.orderAnswerJSONArray(args, responseString);
//					} else {
//						merger.orderAnswerJSONObject(args, responseString);
//					}
//				} catch (JSONException ex) {
//					ex.printStackTrace();
//					logger.error("getAsynchronousHttpResonse -1 JSONException: "
//							+ ex.getMessage());
//
//				}
//			}
//		}
//
//		try {
//			return merger.getfinalJSON().toString();
//		} catch (JSONException ex) {
//			ex.printStackTrace();
//			logger.error("getAsynchronousHttpResonse -2 JSONException: "
//					+ ex.getMessage());
//
//		}
//		return null;
//	}

	public static String getFlickrAsynchronousHttpResponse(String args,
			List<String> requestURLs, Boolean isJSONArrayOrder)
			throws SociosException {

		if (requestURLs == null) {
			String message = "InputStream stream is null";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		// int noOfRequests = requestURLs.length;
		int noOfRequests = requestURLs.size();
		int noOfIterations = noOfRequests / MAX_NO_OF_ASYNCHRONOUS_REQUESTS + 1;

		JSONmerge merger = new JSONmerge();
		for (int i = 0; i < noOfIterations; i++) {
			Future<AsynchronousResponse>[] responses = new Future[MAX_NO_OF_ASYNCHRONOUS_REQUESTS];

			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
				int currentIndex = j + i * MAX_NO_OF_ASYNCHRONOUS_REQUESTS;
				if (currentIndex == noOfRequests) {
					break;
				}

				// Fire a request
				URL url = null;
				try {
					// url = new URL(requestURLs[currentIndex]);
					url = new URL(requestURLs.get(currentIndex));
				} catch (MalformedURLException ex) {
					responses[j] = null;
					ex.printStackTrace();
					continue;
				}
				// System.out.println("in the httprequest url: " + url );
				AsynchronousRequest aRequest = new AsynchronousRequest(url);
				responses[j] = executor.submit(aRequest);
			}

			for (int j = 0; j < MAX_NO_OF_ASYNCHRONOUS_REQUESTS; j++) {
				if (responses[j] == null) {
					continue;
				}

				// Get response
				InputStream body = null;
				try {
					body = responses[j].get().getBody();
				} catch (Exception ex) {
					System.out
							.println("in getFlickrAsynchronousHttpResponse occured an Exception : "
									+ ex.getMessage());
				}

				if (body == null) {
					continue;
				}

				// responseString
				// einai i apantisi pou pairnw apo to social netowork kai thelw
				// na kanw parse
				String responseString = getStringFromInputStream(body);
				// System.out.println("responseString ALAL = " +
				// responseString);
				String debug = String.format("input stream ALAL = %s",
						responseString);
				logger.debug(debug);
				if (responseString == null) {

					System.out.println(" if responseString == null");
					continue;
				}

				try {
					JSONObject flickrJson = new JSONObject(responseString);
					String resultStat = flickrJson.optString("stat");
					if (resultStat.equals("fail")) {
						int resultCode = flickrJson.getInt("code");
						String resultMessage = flickrJson.getString("message");
						System.out
								.println("in getAsynchronousHttpResonse try, fail: code = "
										+ resultCode
										+ " message = "
										+ resultMessage);
						debug = String.format(
								"in getAsynchronousHttpResonse try, fail = %s",
								resultMessage);
						logger.debug(debug);

						switch (resultCode) {

						case 1:
							String message1 = "InvalidInputException: Error Code: "
									+ resultCode
									+ " , message: "
									+ resultMessage;
							// throw new InvalidInputException(message1);
							System.out.println("flickr exception message : "
									+ message1);

						case 105:
							String message2 = "SnUnavailableException: Error Code: "
									+ resultCode
									+ " , message: "
									+ resultMessage;
							System.out.println("flickr exception message : "
									+ message2);
							// throw new SnUnavailableException(message2);

						default:
							String message = "Error Code: " + resultCode
									+ " , message: " + resultMessage;
							logger.error(message);
							System.out.println("flickr exception message : "
									+ message);
							// throw new SociosException(message);
						}
					}

				} catch (JSONException e) {
					// e.printStackTrace();
					logger.error("JSONException: " + e.getMessage());
					System.out.println("in httprequest occured JSONexception: "
							+ e.getMessage());
				}

				try {
					if (isJSONArrayOrder) {
						merger.orderAnswerJSONArray(args, responseString);
					} else {
						merger.orderAnswerJSONObject(args, responseString);
					}
				} catch (JSONException ex) {
					// ex.printStackTrace();
					logger.error("getAsynchronousHttpResonse -1 JSONException: "
							+ ex.getMessage());

				}
			}
		}

		try {
			return merger.getfinalJSON().toString();
		} catch (JSONException ex) {
			ex.printStackTrace();
			logger.error("getAsynchronousHttpResonse -2 JSONException: "
					+ ex.getMessage());
			return null;
		}
	}

	public static String getSynchronousHttpResonse(String mUrlString)
			throws SociosException {

		HttpURLConnection mUrlConn = null;
		String response = "";

		try {
			URL mUrl = new URL(mUrlString);
			mUrlConn = (HttpURLConnection) mUrl.openConnection();
			response = getStringFromInputStream(mUrlConn.getInputStream());
			mUrlConn.disconnect();
			mUrlConn = null;
		} catch (MalformedURLException ex) {
			ex.printStackTrace();
			String message = String.format(
					"MalformedURLException, exception = %s", ex.toString());
			logger.error(message);
			throw new SnUnavailableException(message);
		} catch (IOException ex) {
			// ex.printStackTrace();
			String message = String.format("IOException, exception = %s",
					ex.toString());
			logger.error(message);
			// throw new InvalidInputException("InvalidInputException: " +
			// message);
		} finally {
			if (mUrlConn != null)
				mUrlConn.disconnect();
		}

		return response;

	}

	public static String getStringFromInputStream(InputStream stream)
			throws SociosException {
		if (stream == null) {
			String message = "InvalidInputException: InputStream stream is null";
			logger.error(message);
			throw new InvalidInputException(message);
		}

		InputStreamReader inReader = new InputStreamReader(stream);
		BufferedReader in = new BufferedReader(inReader);
		StringBuilder output = new StringBuilder();

		try {
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				if (!inputLine.isEmpty()) {
					output.append(inputLine);
				}
			}
			in.close();
			in = null;

			inReader.close();
			inReader = null;

			// in.close();
		} catch (IOException ex) {
			String message = String.format(
					"IOException in getStringFromInputStream, exception = %s",
					ex.toString());
			logger.error(message);
			throw new SnUnavailableException(message);

		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					// System.out.println("Close  BufferedReader in");
					logger.warn("Close  BufferedReader in");
				}
			if (inReader != null)
				try {
					inReader.close();
				} catch (IOException e) {
					logger.warn(" InputStreamReader inReader");
				}
		}
		// System.out.println("output.toString()" + output.toString());
		return output.toString();
	}

}
