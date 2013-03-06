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
 
package eu.sociosproject.sociosapi.server.adaptors.googlep.requestconstructor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * AbstractRequestMaker is designed to create request to google plus api
 * webservice Inheriting class have a specific methods for their objects like
 * person, activity, ...
 * 
 * @author pielakm 
 */
public abstract class AbstractRequestMaker {

	/**
	 * logger for log to file information about program action
	 */
	private final Logger logger = LoggerFactory
			.getLogger(AbstractRequestMaker.class);
	private final static String BASE_URL = "https://www.googleapis.com/plus/v1";
	private final static String API_KEY = "AIzaSyCiLUZpYPGjMH--b_HHudOnZE-5uDvdqUo";

	/**
	 * 
	 * @return basic request for get person
	 */
	protected String getPeopleRequest() {
		StringBuilder builder = new StringBuilder();
		builder.append(BASE_URL);
		builder.append("/people");

		String debug = String.format("getPeopleRequest - 1, output = %s",
				builder.toString());
		logger.debug(debug);
		return builder.toString();
	}

	/**
	 * 
	 * @return basic request for get activity
	 */
	protected String getActivityRequest() {
		StringBuilder builder = new StringBuilder();
		builder.append(BASE_URL);
		builder.append("/activities");

		String debug = String.format("getActivityRequest - 1, output = %s",
				builder.toString());
		logger.debug(debug);
		return builder.toString();
	}

	/**
	 * 
	 * @param isFirstParam
	 *            is first param in request(? or &)
	 * @return api key with param for request
	 */
	protected String getKeyParam(boolean isFirstParam) {
		StringBuilder builder = new StringBuilder();
		if (isFirstParam)
			builder.append("?key=");
		else
			builder.append("&key=");
		builder.append(API_KEY);

		String debug = String.format("getKeyParam - 1, output = %s",
				builder.toString());
		logger.debug(debug);
		return builder.toString();
	}
}
