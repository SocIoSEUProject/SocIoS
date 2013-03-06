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

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemDisplayProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Source;

public class MediaItemDisplayParser extends AbstractParser<MediaItemDisplay> {

	@Override
	public MediaItemDisplay parseToObj(JSONObject jObject,
			Property<MediaItemDisplay> property) throws SociosException {

		MediaItemDisplay mediaItemDisplay = new MediaItemDisplay();
		MediaItemDisplayProperty mProperty = (MediaItemDisplayProperty) property;

		if (!isEmptyOrNull(mProperty.getId())) {
			String id = (String) getValue(mProperty.getId(), jObject);
			ObjectId objId = new ObjectId();
			objId.setId(id);
			Source source = new Source();
			source.setKnownSns(KnownSns.INSTAGRAM);
			objId.setSource(source);
			mediaItemDisplay.setMediaItemId(objId);
		}
		
		if (!isEmptyOrNull(mProperty.getEmbeddedHtml())) {
			String url = (String) getValue(mProperty.getEmbeddedHtml(), jObject);
			String embeddedHtml = "<img src=\"" + url + "\">";
			mediaItemDisplay.setEmbeddedHtml(embeddedHtml);
		}

		if (!isEmptyOrNull(mProperty.getTitle())) {
			// System.out.println("getTags");
			String value = (String) getValue(mProperty.getTitle(), jObject);
			String tagsValue = value.replace(";", "; ");
			mediaItemDisplay.setTitle(tagsValue);
			// System.out.println("tags = " + tagsValue);
			String[] titleValue = value.split(";");
			StringBuilder builder = new StringBuilder();
			if (titleValue.length <= 5) {
				for (int i = 0; i < titleValue.length; i++) {
					builder.append(titleValue[i]);
					builder.append(" ");
				}
			} else if (titleValue.length > 5) {
				for (int i = 0; i < 5; i++) {
					builder.append(titleValue[i]);
					builder.append(" ");
				}
			}
			 System.out.println("title = " + builder.toString());
			mediaItemDisplay.setTitle(builder.toString());
		}

		return mediaItemDisplay;
	}

}
