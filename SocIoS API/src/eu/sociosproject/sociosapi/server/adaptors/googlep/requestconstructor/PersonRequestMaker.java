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
public class PersonRequestMaker extends AbstractRequestMaker {

	private final Logger logger = LoggerFactory
			.getLogger(PersonRequestMaker.class);

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getPersonReguestById(String id) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/");
		builder.append(id);
		builder.append(getKeyParam(true));

		String debug = String.format("getPersonRequestById - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}

	/**
	 * @param query
	 * @return
	 */
	public String getPersonRequestByQuery(String query) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("?query=");
		builder.append(query);
		builder.append(getKeyParam(false));

		String debug = String.format(
				"getPersonRequestByQuery - 1, output = %s", builder.toString());
		logger.debug(debug);

		return builder.toString();
	}

	/**
	 * 
	 * @param activityId
	 * @return
	 */
	public String getPersonListRequestByActivityId(String activityId,
			Boolean isReshares) {
		StringBuilder builder = new StringBuilder();
		builder.append(getActivityRequest());
		builder.append("/");
		builder.append(activityId);
		builder.append("/people/");
		if (isReshares)
			builder.append("resharers");
		else
			builder.append("plusoners");

		String debug = String.format(
				"getPersonListRequestByActivityId - 1, output = %s",
				builder.toString());
		logger.debug(debug);

		return builder.toString();
	}

}
