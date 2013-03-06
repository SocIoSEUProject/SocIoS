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
 
package eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser;

import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.ActivityProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;

/**
 * 
 * @author pielakm
 * 
 */
public class GooglepFindMethods {

	public static ActivityProperty findActivities() {
		ActivityProperty prop = GooglepGetMethods.getActivities();
		prop.setIsNecessary(true);
		prop.setObjJSONname("list");
		return prop;
	}

	public static PersonProperty findPersons() {
		return GooglepGetMethods.getPersons();
	}

	public static MediaItemProperty findMediaItems() {
		MediaItemProperty mediaItemProp = new MediaItemProperty();
		mediaItemProp.setObjJSONname("list");
		mediaItemProp.setIsNecessary(true);
		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		mediaItemProp.setId(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("content");
		mediaItemProp.setDescription(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("url");
		mediaItemProp.setUrl(valueInfo);
								
		mediaItemProp.setTypeProperty("photo", "video", "audio", "article");
		valueInfo = new ValueInfo();
		valueInfo.setValue("objectType");
		mediaItemProp.setType(valueInfo);
		
		return mediaItemProp;

	}
}
