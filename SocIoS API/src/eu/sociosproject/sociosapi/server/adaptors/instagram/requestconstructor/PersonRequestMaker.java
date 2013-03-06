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
public class PersonRequestMaker extends AbstractRequestMaker {

	/**
	 * 
	 */
	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getPersonById(String id) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/");
		builder.append(id);
		builder.append(getKeyParam(true));

		String message = String
				.format("getPersonById - 1, output requesturl = %s",
						builder.toString());
		logger.debug(message);

		return builder.toString();
	}

	/**
	 * 
	 * @param query
	 * @param maxNoOfUsers
	 * @return
	 */
	public String getPersonByQuery(String query, int maxNoOfUsers) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/search");
		builder.append("?q=");
		builder.append(query);
		builder.append("&count=");
		builder.append(maxNoOfUsers);
		builder.append(getKeyParam(false));

		String message = String.format(
				"getPersonByQuery - 1, output requesturl = %s",
				builder.toString());
		logger.debug(message);

		return builder.toString();
	}

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public String getFollowPersonsByUserId(String userId) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/");
		builder.append(userId);
		builder.append("/follows");
		builder.append(getKeyParam(true));

		String message = String.format(
				"getFollowPersonsByUserId - 1, output requesturl = %s",
				builder.toString());
		logger.debug(message);

		return builder.toString();
	}

}
