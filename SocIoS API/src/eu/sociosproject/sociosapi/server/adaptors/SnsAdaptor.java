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
 
package eu.sociosproject.sociosapi.server.adaptors;

import java.util.List;
//import eu.sociosproject.sociosapi.coreutilities.exceptions.SociosException;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
//import eu.sociosproject.sociosvoc.Message;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;

public interface SnsAdaptor {

	public List<Person> findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException;

	// public void sendMessage(ObjectId personId, Message message);

	public List<Activity> getActivities(ActivityIdList activityIds)
			throws SociosException;

	public List<Person> getPersons(PersonIdList personIdList)
			throws SociosException;

	public List<MediaItem> findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException;

	public List<Activity> findConnectedActivities(ActivityIdList activityIds)
			throws SociosException;

	public List<Person> connectedPersons(ObjectId personId)
			throws SociosException;

	public List<Person> myConnectedPersons(ObjectId personId)
			throws SociosException;

	public List<Activity> findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException;

	public List<MediaItem> getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException;

	public String registerListener(SociosEventListener eventListener)
			throws SociosException;

	public boolean unregisterListener(ObjectId id) throws SociosException;

	public boolean disable() throws SociosException;

	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException;

	public List<MediaItem> findMyMediaItems(ObjectId personId)
			throws SociosException;

}
