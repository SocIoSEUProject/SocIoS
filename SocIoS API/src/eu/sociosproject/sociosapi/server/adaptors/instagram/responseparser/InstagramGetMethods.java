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
 
package eu.sociosproject.sociosapi.server.adaptors.instagram.responseparser;

import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemDisplayProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.NameProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;
import eu.sociosproject.sociosvoc.KnownSns;

/**
 * 
 * @author pielakm
 * 
 */
public class InstagramGetMethods {

	public static PersonProperty getPersons() {
		PersonProperty property = new PersonProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);

		ValueInfo idInfo = new ValueInfo();
		idInfo.setValue("id");
		property.setId(idInfo);
		property.setSocialNetwork("INSTAGRAM");
		
		ValueInfo userNameInfo = new ValueInfo();
		userNameInfo.setValue("username");
		property.setDisplayName(userNameInfo);

		ValueInfo photosInfo = new ValueInfo();
		photosInfo.setValue("profile_picture");
		property.getPhotos().add(photosInfo);
		property.setThumbnailUrl(photosInfo);

		ValueInfo aboutMeInfo = new ValueInfo();
		aboutMeInfo.setValue("bio");
		property.setAboutMe(aboutMeInfo);

		ValueInfo urlsInfo = new ValueInfo();
		urlsInfo.setValue("website");
		property.getUrls().add(urlsInfo);

		NameProperty nameProp = new NameProperty();
		ValueInfo fullNameInfo = new ValueInfo();
		fullNameInfo.setValue("full_name");
		nameProp.setFormatted(fullNameInfo);
		property.setName(nameProp);
		
		ValueInfo followedByInfo = new ValueInfo();
		followedByInfo.setValue("counts");
		followedByInfo.addLevel("followed_by");
		//System.out.println(followedByInfo.getValue());
		property.setInDegree(followedByInfo);

		ValueInfo followsInfo = new ValueInfo();
		followsInfo.setValue("counts");
		followsInfo.addLevel("follows");
		property.setOutDegree(followsInfo);
		//System.out.println("property.getOutDegree().getValue()" + property.getOutDegree().getValue());
		
		
		return property;
	}
	
	public static PersonProperty getConnectedPersons() {
		PersonProperty property = new PersonProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);

		ValueInfo idInfo = new ValueInfo();
		idInfo.setValue("id");
		property.setId(idInfo);
		property.setSocialNetwork("INSTAGRAM");
		
		ValueInfo userNameInfo = new ValueInfo();
		userNameInfo.setValue("username");
		property.setDisplayName(userNameInfo);

		ValueInfo photosInfo = new ValueInfo();
		photosInfo.setValue("profile_picture");
		property.getPhotos().add(photosInfo);
		property.setThumbnailUrl(photosInfo);

		ValueInfo aboutMeInfo = new ValueInfo();
		aboutMeInfo.setValue("bio");
		property.setAboutMe(aboutMeInfo);

		ValueInfo urlsInfo = new ValueInfo();
		urlsInfo.setValue("website");
		property.getUrls().add(urlsInfo);

		NameProperty nameProp = new NameProperty();
		ValueInfo fullNameInfo = new ValueInfo();
		fullNameInfo.setValue("full_name");
		nameProp.setFormatted(fullNameInfo);
		property.setName(nameProp);
		
		
		return property;
	}


	public static MediaItemProperty getMediaItems() {
		MediaItemProperty property = new MediaItemProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);

		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setListLevel("tags", null);
		property.setTags(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("created_time");
		property.setCreated(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		property.setId(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("link");
		property.setUrl(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("user");
		valueInfo.addLevel("id");
		property.setUserId(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("likes");
		valueInfo.addLevel("count");
		property.setNumPositiveVotes(valueInfo);

		property.setTypeProperty("image", "video", "audio", "text");
		valueInfo = new ValueInfo();
		valueInfo.setValue("type");
		property.setType(valueInfo);
		
		valueInfo = new ValueInfo();
		valueInfo.setValue("comments");
		valueInfo.addLevel("count");
		property.setNumComments(valueInfo);
		//System.out.println("property.getNumComments = " + property.getNumComments().getValue());

		valueInfo = new ValueInfo();
		valueInfo.setValue("images");
		valueInfo.addLevel("thumbnail");
		valueInfo.addLevel("url");
		property.setThumbnailUrl(valueInfo);

		return property;
	}

	
	public static MediaItemDisplayProperty getMediaItemsDisplay() {
		MediaItemDisplayProperty property = new MediaItemDisplayProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);

		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setListLevel("tags", null);
		property.setTitle(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		property.setId(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("images");
		valueInfo.addLevel("low_resolution");
		valueInfo.addLevel("url");
		property.setEmbeddedHtml(valueInfo);

		return property;
	}
}
