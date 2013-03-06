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

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.server.adaptors.flickr.FlickrAcessTokens;
import eu.sociosproject.sociosapi.server.adaptors.instagram.InstagramAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.instagram.InstagramAdaptor;

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemRequestMaker extends AbstractRequestMaker {

	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getMediaItemById(String id) throws SociosException{
//		
//		if(id.equals(null)){
//			System.out.println("id is null");
//			throw new InvalidInputException("InvalidInputException: id is null");
//		}
		StringBuilder builder = new StringBuilder();
		builder.append(getMediaRequest());
		builder.append("/");
		builder.append(id);
		builder.append(getKeyParam(true));

		String message = String.format("getMediaItemById - 1, output = %s",
				builder.toString());
		logger.debug(message);
				
		return builder.toString();
	}

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public StringBuilder getMediaItemByUserId(String userId) {
		StringBuilder builder = new StringBuilder();
		builder.append(getPeopleRequest());
		builder.append("/");
		builder.append(userId);
		builder.append("/media/recent/");
		builder.append(getKeyParam(true));

		String message = String.format("getMediaItemByUserId - 1, output = %s",
				builder.toString());
		logger.debug(message);

		return builder;
	}

	/**
	 * 
	 * @param tagName
	 * @return
	 */
	public String getMediaItemByTagName(String tagName) {
		StringBuilder builder = new StringBuilder();
		builder.append(getTagsRequest());
		builder.append("/");
		builder.append(tagName.trim());
		builder.append("/media/recent");
		builder.append(getKeyParam(true));

		String message = String.format(
				"getMediaItemByTagName - 1, output = %s", builder.toString());
		logger.debug(message);

		return builder.toString();
	}

	/**
	 * 
	 * @param lat
	 * @param lng
	 * @param minTimeStamp
	 * @param maxTimeStamp
	 * @param distance
	 * @return
	 */
	public String getMediaItemBySearch(String lat, String lng,
			String minTimeStamp, String maxTimeStamp, String distance) {
		StringBuilder builder = new StringBuilder();
		builder.append(getMediaRequest());
		builder.append("/search?");
		if (!lat.isEmpty()) {
			builder.append("lat=");
			builder.append(lat);
			builder.append("&");
		}
		if (!lng.isEmpty()) {
			builder.append("lng=");
			builder.append(lng);
			builder.append("&");
		}
		if (!minTimeStamp.isEmpty()) {
			builder.append("min_timestamp=");
			builder.append(minTimeStamp);
			builder.append("&");
		}
		if (!maxTimeStamp.isEmpty()) {
			builder.append("max_timestamp=");
			builder.append(maxTimeStamp);
			builder.append("&");
		}
		if (!distance.isEmpty()) {
			builder.append("distance=");
			builder.append(distance);
		}
		if (builder.charAt(builder.length() - 1) == '&') {
			builder.deleteCharAt(builder.length() - 1);
		}

		builder.append(getKeyParam(false));

		String message = String.format("getMediaItemBySearch - 1, output = %s",
				builder.toString());
		logger.debug(message);

		return builder.toString();
	}

}
