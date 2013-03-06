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
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.NameProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;

/**
 * 
 * @author pielakm
 * 
 */
public class InstagramFindMethods {

	public static PersonProperty findPersons() {

		PersonProperty property = new PersonProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);
		
		NameProperty nameProp = new NameProperty();

		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setValue("username");
		property.setDisplayName(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("first_name");
//		nameProp.setGivenName(valueInfo);
//
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("last_name");
//		nameProp.setFamilyName(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("profile_picture");
		property.getPhotos().add(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		property.setId(valueInfo);
		property.setSocialNetwork("INSTAGRAM");
		
		valueInfo = new ValueInfo();
		property.setName(nameProp);
		
		
		

		return property;
	}

	public static MediaItemProperty findMediaItems() {
		MediaItemProperty property = new MediaItemProperty();
		property.setObjJSONname("list");
		property.setIsNecessary(true);

		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setListLevel("tags", null);
		property.setTags(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("created_time");
		property.setCreated(valueInfo);
		//System.out.println("property.getCreated = " + property.getCreated().getValue());

		valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		property.setId(valueInfo);
		//System.out.println("property.getId = " + property.getId().getValue());

		valueInfo = new ValueInfo();
		valueInfo.setValue("link");
		property.setUrl(valueInfo);
		//System.out.println("property.getUrl = " + property.getUrl().getValue());
		
		valueInfo = new ValueInfo();
		valueInfo.setValue("user");
		valueInfo.addLevel("id");
		property.setUserId(valueInfo);
		//System.out.println("property.getUserId = " + property.getUserId().getValue());

		property.setTypeProperty("image", "video", "audio", "text");
		valueInfo = new ValueInfo();
		valueInfo.setValue("type");
		property.setType(valueInfo);
		//System.out.println("property.getType = " + property.getType().getValue());
		
		valueInfo = new ValueInfo();
		valueInfo.setValue("likes");
		valueInfo.addLevel("count");
		property.setNumPositiveVotes(valueInfo);
		//System.out.println("property.getNumPositiveVotes = " + property.getNumPositiveVotes().getValue());
	
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
		//System.out.println("property.getThumbnailUrl = " + property.getThumbnailUrl().getValue());

		return property;
	}
}
