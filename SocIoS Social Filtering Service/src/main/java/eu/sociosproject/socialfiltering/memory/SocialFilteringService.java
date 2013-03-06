/*
 *   Copyright 2013 Cognium Systems SAS
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
package eu.sociosproject.socialfiltering.memory;

import java.util.List;

import javax.annotation.Resource;
import javax.xml.ws.WebServiceContext;

import eu.sociosproject.IGroupService;
import eu.sociosproject.ISocialFilteringService;
import eu.sociosproject.sociosvoc.ActivityReturnObject;
import eu.sociosproject.sociosvoc.ArrayOfObjectIds;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonList;

public class SocialFilteringService implements ISocialFilteringService {

    private IGroupService fGroupService;

    // private SociosApi fSociosApi;

    private String fSociosApiUserKey;

    /**
     * The WebServiceContext can be used to retrieve special attributes like the
     * user principal. Normally it is not needed
     */
    @Resource
    WebServiceContext wsContext;

    public SocialFilteringService() {
        super();
    }

    protected String getApiUserKey(ObjectId session) {
        return fSociosApiUserKey;
    }

    @Override
    public ActivityReturnObject getRecentActivities(
        ObjectId clientId,
        ObjectId groupId) {
        PersonList groupMembers = fGroupService.getGroupMembers(
            clientId,
            groupId);

        ArrayOfObjectIds userIds = new ArrayOfObjectIds();
        List<ObjectId> userIdList = userIds.getObjectId();
        for (Person member : groupMembers.getPerson()) {
            ObjectId memberId = member.getId();
            userIdList.add(memberId);
        }
        PersonFilter personFilter = new PersonFilter();
        personFilter.setId(userIds);

        // ActivitiesFindRequest request = new ActivitiesFindRequest();
        // request.setFilterPerson(personFilter);

        String apiUserKey = getApiUserKey(clientId);
        // ActivityList activities = fSociosApi
        // .findActivities(apiUserKey, request);
        // return activities;
        return null;
    }

}
