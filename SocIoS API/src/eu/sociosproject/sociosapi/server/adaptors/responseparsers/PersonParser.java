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

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.AddressProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.OrganizationProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Organization;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.Source;

/**
 * 
 * @author pielakm
 * 
 */
public class PersonParser extends AbstractParser<Person> {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	BigInteger val = new BigInteger("-1");

	@Override
	public Person parseToObj(JSONObject jObject, Property<Person> property)
			throws SociosException {

		Person person = new Person();
		PersonProperty prop = (PersonProperty) property;
		
		if (!isEmptyOrNull(prop.getAboutMe())) {
			String aboutMe = (String) getValue(prop.getAboutMe(), jObject);
			person.setAboutMe(aboutMe);
		}
//		if (!isEmptyOrNull(prop.getAge())) {
//			Integer age = (Integer) getValue(prop.getAge(), jObject);
//			person.setAge(age);
//		}
		if (!isEmptyOrNull(prop.getActivities())) {
			List<String> activityList = getObjListFromValueInfoList(
					prop.getActivities(), jObject);
			person.getActivities().addAll(activityList);
		}
		if (!isEmptyOrNull(prop.getAddresses())) {
			AbstractParser<Address> addressParser = new AddressParser();

			for (int i = 0; i < prop.getAddresses().size(); i++) {
				List<Address> addressList = addressParser.parseToListObj(
						jObject, prop.getAddresses().get(i));
				person.getAddresses().addAll(addressList);
			}
		}

		if (!isEmptyOrNull(prop.getConnected())) {
			Boolean isConnected = (Boolean) getValue(prop.getConnected(),
					jObject);
			person.setConnected(isConnected);
		}
		if (!isEmptyOrNull(prop.getDisplayName())) {
			String value = (String) getValue(prop.getDisplayName(), jObject);
			person.setDisplayName(value);
		}

		if (!isEmptyOrNull(prop.getEmails())) {
			List<String> emailsList = getObjListFromValueInfoList(
					prop.getEmails(), jObject);
			person.getEmails().addAll(emailsList);
		}

		if (!isEmptyOrNull(prop.getGender())) {
			String value = (String) getValue(prop.getGender(), jObject);
			person.setGender(value);
		}

		if (!isEmptyOrNull(prop.getId())) {
			ObjectId objId = new ObjectId();
			String id = (String) getValue(prop.getId(), jObject);
			objId.setId(id);
			Source src = new Source();
			String sns = prop.getSocialNetwork();
			if(sns.equals("INSTAGRAM")){
				src.setKnownSns(KnownSns.INSTAGRAM);
			}
			if(sns.equals("GOOGLEP")){
				src.setKnownSns(KnownSns.GOOGLEP);
			}
			objId.setSource(src);
			person.setId(objId);
		}
//		if (!isEmptyOrNull(prop.getIms())) {
//			List<String> imsList = getObjListFromValueInfoList(prop.getIms(),
//					jObject);
//			person.getIms().addAll(imsList);
//
//		}
		if (!isEmptyOrNull(prop.getInDegree())) {
			int value =  (Integer)(getValue(prop.getInDegree(),
					jObject));
			BigInteger bigValue = new BigInteger(Integer.toString(value));
			person.setInDegree(bigValue);
			}
		else if(isEmptyOrNull(prop.getInDegree())){
			person.setInDegree(val);
		}

		if (!isEmptyOrNull(prop.getName())) {
			NameParser nameParser = new NameParser();
			Name name = nameParser.parseToObj(jObject, prop.getName());
			person.setName(name);
		}
		if (!isEmptyOrNull(prop.getNickname())) {
			String value = (String) getValue(prop.getNickname(), jObject);
			person.setNickname(value);
		}
		if (!isEmptyOrNull(prop.getNumFriends())) {
			BigInteger value = (BigInteger) getValue(prop.getNumFriends(),
					jObject);
			person.setNumFriends(value);
		}
		else if(isEmptyOrNull(prop.getNumFriends())){
			person.setNumFriends(val);
		}
//		if (!isEmptyOrNull(prop.getOrganizations())) {
//			AbstractParser<Organization> organizationParser = new OrganizationParser();
//			for (int i = 0; i < prop.getOrganizations().size(); i++) {
//				List<Organization> organizationList = organizationParser
//						.parseToListObj(jObject, prop.getOrganizations().get(i));
//				person.getOrganizations().addAll(organizationList);
//			}
//		}
		if (!isEmptyOrNull(prop.getOutDegree())) {
			int value =  (Integer)(getValue(prop.getOutDegree(),
					jObject));
			BigInteger bigValue = new BigInteger(Integer.toString(value));
			person.setOutDegree(bigValue);
			}
		else if(isEmptyOrNull(prop.getOutDegree())){
			person.setOutDegree(val);		
		}

		if (!isEmptyOrNull(prop.getPhotos())) {
			List<String> getPhotos = getObjListFromValueInfoList(
					prop.getPhotos(), jObject);
			person.getPhotos().addAll(getPhotos);

		}
		
		if (!isEmptyOrNull(prop.getPreferredUsername())) {
			String value = (String) getValue(prop.getPreferredUsername(),
					jObject);
			person.setPreferredUsername(value);
		}

		if (!isEmptyOrNull(prop.getProfileUrl())) {
			String value = (String) getValue(prop.getProfileUrl(), jObject);
			person.setProfileUrl(value);
		}
		String sns = prop.getSocialNetwork();
		if(sns.equals("INSTAGRAM")){
			StringBuilder builder = new StringBuilder();
			builder.append("http://web.stagram.com/n/");
			builder.append(person.getDisplayName());
			person.setProfileUrl(builder.toString());	
		}
		if (!isEmptyOrNull(prop.getProfileVideo())) {
			String value = (String) getValue(prop.getProfileVideo(), jObject);
			person.setProfileVideo(value);
		}
//		if (!isEmptyOrNull(prop.getPublished())) {
//			// TODO GREGORIAN CALENDAR
//		}
		if (!isEmptyOrNull(prop.getRelationships())) {
			List<String> relationshipsList = getObjListFromValueInfoList(
					prop.getRelationships(), jObject);
			person.getRelationships().addAll(relationshipsList);

		}
		if (!isEmptyOrNull(prop.getRelationshipStatus())) {
			String value = (String) getValue(prop.getRelationshipStatus(),
					jObject);
			person.setRelationshipStatus(value);
		}

		if (!isEmptyOrNull(prop.getTags())) {
			List<String> tagsList = getObjListFromValueInfoList(prop.getTags(),
					jObject);
			person.getTags().addAll(tagsList);
		}
		if (!isEmptyOrNull(prop.getThumbnailUrl())) {
			String value = (String) getValue(prop.getThumbnailUrl(), jObject);
			person.setThumbnailUrl(value);
		}

		if (!isEmptyOrNull(prop.getUpdated())) {
			// TODO Gregorian Calendar

		}
		if (!isEmptyOrNull(prop.getUrls())) {
			List<String> urlsList = getObjListFromValueInfoList(prop.getUrls(),
					jObject);
			person.getUrls().addAll(urlsList);

		}

		return person;
	}

	public JSONObject getJSONObject(JSONObject jObj, Property prop)
			throws JSONException {
		JSONObject resultObj = jObj;
		String objStr = prop.getObjJSONname();
		String[] array = objStr.split("|");
		for (int i = 0; i < array.length; i++) {
			String element = array[i];
			try {
				resultObj = resultObj.getJSONObject(element);
			} catch (JSONException e) {
				logger.error(e.toString());
				throw new JSONException(e.toString());
			}
		}
		return resultObj;
	}

	public List<String> getObjListFromValueInfoList(List<ValueInfo> list,
			JSONObject jObject) throws SociosException {
		List<String> resultList = new ArrayList<String>();
		for (ValueInfo valueInfo : list) {
			getValueFromJSONList(valueInfo, jObject, resultList);
		}
		return resultList;

	}

}
