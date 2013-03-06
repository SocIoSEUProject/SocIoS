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
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.AddressProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.NameProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.OrganizationProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;

/**
 * 
 * @author pielakm
 * 
 */
public class GooglepGetMethods {

	public static PersonProperty getPersons() {
		PersonProperty property = new PersonProperty();
		property.setObjJSONname("list");
		ValueInfo valueInfo = new ValueInfo();

		valueInfo.setValue("id");
		property.setId(valueInfo);
		property.setSocialNetwork("GOOGLEP");

		valueInfo = new ValueInfo();
		valueInfo.setValue("displayName");
		property.setDisplayName(valueInfo);

		NameProperty nameProp = new NameProperty();
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		valueInfo.addLevel("formatted");
//		nameProp.setFormatted(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		valueInfo.addLevel("familyName");
//		nameProp.setFamilyName(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("name");
		valueInfo.addLevel("givenName");
		nameProp.setGivenName(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		valueInfo.addLevel("middleName");
//		nameProp.setAdditionalName(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		valueInfo.addLevel("honorificPrefix");
//		nameProp.setHonorificPrefix(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		valueInfo.addLevel("honorificSuffix");
//		nameProp.setHonorificSuffix(valueInfo);
//		property.setName(nameProp);

		valueInfo = new ValueInfo();
		valueInfo.setValue("nickname");
		property.setNickname(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("birthday");
		property.setBirthday(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("gender");
		property.setGender(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("aboutMe");
		property.setAboutMe(valueInfo);

		// currentLocation
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("relationshipStatus");
//		property.setRelationshipStatus(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("url");
		property.setProfileUrl(valueInfo);
		
		valueInfo = new ValueInfo();
		valueInfo.setValue("image");
		valueInfo.addLevel("url");
		//property.getPhotos().add(valueInfo);
		property.setThumbnailUrl(valueInfo);
		

		valueInfo = new ValueInfo();
		valueInfo.setListLevel("emails", "value");
		property.getEmails().add(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setListLevel("urls", "value");
		property.getUrls().add(valueInfo);

//		OrganizationProperty orgProp = new OrganizationProperty();
//		orgProp.setObjJSONname("organizations");
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("name");
//		orgProp.setName(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("department");
//		orgProp.setDepartment(valueInfo);
		
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("type");
//		orgProp.setType(valueInfo);
		
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("title");
//		orgProp.setTitle(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("startDate");
//		orgProp.setStartDate(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("endDate");
//		orgProp.setEndDate(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("location");

//		AddressProperty addressProp = new AddressProperty();
//		addressProp.setObjJSONname("organizations");
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("location");
//		addressProp.setLocality(valueInfo);
//		orgProp.setAddress(addressProp);
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("description");
//		orgProp.setDescription(valueInfo);
//		property.getOrganizations().add(orgProp);

//		addressProp = new AddressProperty();
//		addressProp.setObjJSONname("placesLived");
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("value");
//		addressProp.setLocality(valueInfo);
//		valueInfo = new ValueInfo();
//		valueInfo.setValue("primary");
//		addressProp.setPrimary(valueInfo);
//		property.getAddresses().add(addressProp);

//		valueInfo = new ValueInfo();
//		valueInfo.setListLevel("languagesSpoken", null);
//		property.getLanguagesSpoken().add(valueInfo);

//		valueInfo = new ValueInfo();
//		valueInfo.setValue("hasApp");
//		property.setHasApp(valueInfo);

		return property;
	}

	public static ActivityProperty getActivities() {
		ActivityProperty prop = new ActivityProperty();
		prop.setObjJSONname("list");
		prop.setIsNecessary(true);

		ValueInfo valueInfo = new ValueInfo();
		valueInfo.setValue("title");
		prop.setTitle(valueInfo);

		
//	    valueInfo = new ValueInfo(); 
//	    valueInfo.setValue("published");
//		prop.setPostedTime(valueInfo);
		

		valueInfo = new ValueInfo();
		valueInfo.setValue("id");
		prop.setId(valueInfo);

		valueInfo = new ValueInfo();
		valueInfo.setValue("url");
		prop.setUrl(valueInfo);
				
		valueInfo = new ValueInfo();
		valueInfo.setValue("actor");
		valueInfo.addLevel("id");
		prop.setUserId(valueInfo);

		MediaItemProperty mediaItemProp = GooglepFindMethods.findMediaItems();
		mediaItemProp.setObjJSONname("object;attachments");
		mediaItemProp.setIsNecessary(false);
		
		prop.setMediaItems(mediaItemProp);

		return prop;
	}
}
