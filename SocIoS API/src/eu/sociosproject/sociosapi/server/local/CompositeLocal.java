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
 
package eu.sociosproject.sociosapi.server.local;

import java.util.List;

import javax.ejb.Local;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.ActivityReturn;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.MediaItemReturn;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.PersonReturn;
import eu.sociosproject.sociosvoc.SociosEventListener;

@Local
public interface CompositeLocal {

	public PersonReturn findPersons(PersonFilter personFilter,
			MediaItemIdList mediaItemIdList) throws SociosException;

	public PersonReturn getPersons(PersonIdList personIdList)
			throws SociosException;

	public MediaItemReturn getMediaItems(MediaItemIdList mediaItemIdList)
			throws SociosException;

	public ActivityReturn getActivities(ActivityIdList activityIds)
			throws SociosException;

	public MediaItemReturn findMediaItems(MediaItemFilter filterMediaItem,
			PersonFilter filterPerson, PersonIdList personIdList)
			throws SociosException;

	public ActivityReturn findConnectedActivities(ActivityIdList activityIds)
			throws SociosException;

	public PersonReturn connectedPersons(ObjectId personId)
			throws SociosException;

	public PersonReturn myConnectedPersons(ObjectId personId)
			throws SociosException;

	public ActivityReturn findActivities(ActivityFilter activityFilter,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList,
			PersonIdList personIdList) throws SociosException;

	public String registerListener(SociosEventListener eventListener)
			throws SociosException;

	public boolean unregisterListener(ObjectId id) throws SociosException;

	public boolean disable() throws SociosException;

	public MediaItemReturn findMyMediaItems(ObjectId personId)
			throws SociosException;

	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException;

}
