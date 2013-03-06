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
 
package eu.sociosproject.sociosapi.server.adaptors.instagram.requestconstructor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author pielakm
 * 
 */
public abstract class AbstractRequestMaker {

	private Logger logger = LoggerFactory.getLogger(getClass());
	private final String API_KEY = "e3432d1de10b43b1923d4d6fcc07d0b3";
	private final String BASE_URL = "https://api.instagram.com/v1";

	/**
	 * 
	 * @return
	 */
	protected String getPeopleRequest() {
		StringBuilder builder = new StringBuilder();
		builder.append(BASE_URL);
		builder.append("/users");
		return builder.toString();
	}

	/**
	 * 
	 * @return
	 */
	protected String getMediaRequest() {
		StringBuilder builder = new StringBuilder();
		builder.append(BASE_URL);
		builder.append("/media");
		return builder.toString();
	}

	protected String getTagsRequest() {
		StringBuilder builder = new StringBuilder();
		builder.append(BASE_URL);
		builder.append("/tags");
		return builder.toString();
	}

	/**
	 * 
	 * @param isFirstParam
	 * @return
	 */
	protected String getKeyParam(boolean isFirstParam) {
		StringBuilder builder = new StringBuilder();
		if (isFirstParam)
			builder.append("?client_id=");
		else
			builder.append("&client_id=");
		builder.append(API_KEY);

		String debug = String.format("getKeyParam - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}

}
