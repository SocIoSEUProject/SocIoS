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
package eu.sociosproject.socialfiltering;

import java.util.Calendar;

import javax.jws.WebService;

import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityReturnObject;
import eu.sociosproject.sociosvoc.ObjectId;

/**
 * This service used to retrieve recent activities produced by a group of
 * people.
 * 
 * @author kotelnikov
 */
@WebService
public interface ISocialFilteringService {

    /**
     * Returns an activity list produced by the specified group.
     * 
     * @param clientId the identifier of the client
     * @param groupId the identifier of the group of people producing an
     *        activity stream
     * @param startTime the initial time of the activity
     * @return a list of {@link Activity} items corresponding to the specified
     *         search criteria
     */
    ActivityReturnObject getRecentActivities(
        ObjectId clientId,
        ObjectId groupId,
        Calendar startTime);

}
