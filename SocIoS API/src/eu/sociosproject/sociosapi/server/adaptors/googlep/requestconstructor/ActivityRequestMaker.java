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
 * 
 * @author pielakm
 * 
 */
public class ActivityRequestMaker extends AbstractRequestMaker {

	/**
	 * logger for log to file information about program action
	 */
	private Logger logger = LoggerFactory.getLogger(ActivityRequestMaker.class);

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getActivityRequestById(String id) {
		StringBuilder builder = new StringBuilder();
		builder.append(getActivityRequest());
		builder.append("/");
		builder.append(id);
		builder.append(getKeyParam(true));

		String debug = String.format("getActivityRequestById - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}

	/**
	 * TODO more optional parameters to search
	 * 
	 * @param query
	 * @return
	 */
	public String getActivityRequestByQuery(String query) {
		StringBuilder builder = new StringBuilder();
		builder.append(getActivityRequest());
		builder.append("?query=");
		builder.append(query);
		builder.append("&maxResults=20");
		builder.append(getKeyParam(false));

		String debug = String.format(
				"getActivityRequestByQuery - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}
	
		
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public String getListActivityRequestByUserId(String userId) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/");
		builder.append(userId);
		builder.append("/activities/public");
		builder.append(getKeyParam(true));

		String debug = String.format(
				"getListActivityRequestByUserId - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}
}
