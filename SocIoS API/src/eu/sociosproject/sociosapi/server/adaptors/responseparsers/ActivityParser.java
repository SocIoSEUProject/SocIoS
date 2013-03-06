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
 
package eu.sociosproject.sociosapi.server.adaptors.responseparsers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.ActivityProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Organization;
import eu.sociosproject.sociosvoc.Source;

/**
 * 
 * @author pielakm
 * 
 */
public class ActivityParser extends AbstractParser<Activity> {

	/***
	 * 
	 */
	private final Logger logger = LoggerFactory.getLogger(ActivityParser.class);

	@Override
	public Activity parseToObj(JSONObject jObject, Property<Activity> property)
			throws SociosException {
		logger.debug("parseToObj - 1");

		Activity activity = new Activity();
		ActivityProperty prop = (ActivityProperty) property;

		if (!isEmptyOrNull(prop.getAppId())) {
			ObjectId objId = new ObjectId();
			String id = (String) getValue(prop.getAppId(), jObject);
			objId.setId(id);
			activity.setAppId(objId);
		}
		if (!isEmptyOrNull(prop.getBody())) {
			String value = (String) getValue(prop.getBody(), jObject);
			activity.setBody(value);
		}
		if (!isEmptyOrNull(prop.getBodyId())) {
			ObjectId objId = new ObjectId();
			String bodyId = (String) getValue(prop.getBodyId(), jObject);
			objId.setId(bodyId);
			activity.setBodyId(objId);
		}

		if (!isEmptyOrNull(prop.getId())) {
			ObjectId objId = new ObjectId();
			String id = (String) getValue(prop.getId(), jObject);
			objId.setId(id);
			Source src = new Source();
			src.setKnownSns(KnownSns.GOOGLEP);
			objId.setSource(src);
			activity.setId(objId);
		}
		if (!isEmptyOrNull(prop.getMediaItems())) {
			MediaItemParser mediaItemParser = new MediaItemParser();
			List<MediaItem> mediaItemList = mediaItemParser.parseToListObj(
					jObject, prop.getMediaItems());
			activity.getMediaItems().addAll(mediaItemList);
		}
//		if (!isEmptyOrNull(prop.getPostedTime())) {
//			// 2012-10-05T20:05:48.000Z
//			DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
//			String value = (String) getValue(prop.getPostedTime(), jObject);
//			try {
//				Date published = df.parse(value);
//				long longDate = published.getTime();
//				activity.setPostedTime(longDate);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//		}
		if (!isEmptyOrNull(prop.getPriority())) {
			Double value = (Double) getValue(prop.getPriority(), jObject);
			activity.setPriority(value);
		}
		if (!isEmptyOrNull(prop.getStreamFaviconUrl())) {
			String value = (String) getValue(prop.getStreamFaviconUrl(),
					jObject);
			activity.setStreamFaviconUrl(value);
		}
		if (!isEmptyOrNull(prop.getStreamSourceUrl())) {
			String value = (String) getValue(prop.getStreamSourceUrl(), jObject);
			activity.setStreamSourceUrl(value);
		}
		if (!isEmptyOrNull(prop.getStreamUrl())) {
			String value = (String) getValue(prop.getStreamUrl(), jObject);
			activity.setStreamUrl(value);
		}
		if (!isEmptyOrNull(prop.getStreamTitle())) {
			String value = (String) getValue(prop.getStreamTitle(), jObject);
			activity.setStreamTitle(value);
		}
		if (!isEmptyOrNull(prop.getTitle())) {
			String value = (String) getValue(prop.getTitle(), jObject);
			activity.setTitle(value);
		}
		if (!isEmptyOrNull(prop.getTitleId())) {
			ObjectId objId = new ObjectId();
			String id = (String) getValue(prop.getTitleId(), jObject);
			objId.setId(id);
			activity.setTitleId(objId);
		}
		if (!isEmptyOrNull(prop.getUrl())) {
			String value = (String) getValue(prop.getUrl(), jObject);
			activity.setUrl(value);
		}
		if (!isEmptyOrNull(prop.getUserId())) {
			ObjectId objId = new ObjectId();
			String id = (String) getValue(prop.getUserId(), jObject);
			objId.setId(id);
			activity.setUserId(objId);
		}

		logger.debug("parseToObj - 2");

		return activity;
	}
}
