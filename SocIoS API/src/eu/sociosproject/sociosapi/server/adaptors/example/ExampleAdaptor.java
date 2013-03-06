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
 
package eu.sociosproject.sociosapi.server.adaptors.example;

import java.util.List;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
//import eu.sociosproject.sociosvoc.Message;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;

public class ExampleAdaptor implements SnsAdaptor {

	private ExampleAcessTokens exampleAccessToken;

	public ExampleAdaptor(ExampleAcessTokens mySpaceAcessToken) {
		this.exampleAccessToken = mySpaceAcessToken;
	}

	@Override
	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) {
		return Lists.newArrayList(createFakePerson("findPersons"));
	}

	/*
	 * @Override public void sendMessage(ObjectId personId, Message message) {
	 * System.out.println("===>Message send:" + message.getBody()); }
	 */

	@Override
	public List<Activity> getActivities(ActivityIdList activityIds) {
		return Lists.newArrayList(createFakeActivity("getActivities"));
	}

	@Override
	public List<Person> getPersons(PersonIdList personIdList) {
		return Lists.newArrayList(createFakePerson("getPersons"));
	}

	@Override
	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList) {
		return Lists.newArrayList(createFakeMediaItem("findMediaItems"));
	}

	@Override
	public List<Activity> findConnectedActivities(ActivityIdList activityIds) {
		return Lists
				.newArrayList(createFakeActivity("findConnectedActivities"));
	}

	@Override
	public List<Person> connectedPersons(ObjectId personId) {
		return Lists.newArrayList(createFakePerson("getPersons"));
	}

	@Override
	public List<Person> myConnectedPersons(ObjectId personId) {
		return Lists.newArrayList(createFakePerson("getPersons"));
	}

	@Override
	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) {
		return Lists.newArrayList(createFakeActivity("findActivities"));
	}

	@Override
	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList) {
		return Lists.newArrayList(createFakeMediaItem("getMediaItems"));
	}

	@Override
	public String registerListener(SociosEventListener eventListener) {
		return "";
	}

	@Override
	public boolean unregisterListener(ObjectId id) {
		return true;
	}

	@Override
	public boolean disable() {
		return false;
	}

	private Person createFakePerson(String method) {
		Person person = new Person();
		person.setAboutMe("One fake person, retrieved with keys:"
				+ exampleAccessToken.getExampleApiKey1() + " and "
				+ exampleAccessToken.getExampleApiKey2() + " from method "
				+ method);
		return person;
	}

	private Activity createFakeActivity(String method) {
		Activity activity = new Activity();
		activity.setBody("One fake activity, retrieved with keys:"
				+ exampleAccessToken.getExampleApiKey1() + " and "
				+ exampleAccessToken.getExampleApiKey2() + " from method "
				+ method);
		return activity;
	}

	private MediaItem createFakeMediaItem(String method) {
		MediaItem mediaItem = new MediaItem();
		mediaItem.setDescription("One fake media item, retrieved with keys:"
				+ exampleAccessToken.getExampleApiKey1() + " and "
				+ exampleAccessToken.getExampleApiKey2() + " from method "
				+ method);
		return mediaItem;
	}

	
	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException {
		// TODO Auto-generated method stub
		return null;
	}

}
