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
package eu.sociosproject.socialfiltering.database;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.xml.ws.WebServiceContext;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import eu.sociosproject.IGroupService;
import eu.sociosproject.ISocialFilteringService;
import eu.sociosproject.socialfiltering.client.SfsCli;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosvoc.ActivityReturnObject;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonList;

public class SocialFilteringService implements ISocialFilteringService {

    private static Logger log = Logger.getLogger(SocialFilteringService.class
        .getName());

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

    public IGroupService getGroupService() {
        if (fGroupService == null) {
            log.log(Level.INFO, "Initializing GroupService...");
            ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
                new String[] { "classpath:sfs-application-context.xml" });
            SfsCli cli = (SfsCli) context.getBean("cli");
            fGroupService = cli.getGroupService();
            log.log(Level.INFO, "Group service: " + fGroupService);

        }
        return fGroupService;

    }

    @Override
    public ActivityReturnObject getRecentActivities(
        ObjectId clientId,
        ObjectId groupId) {
        log.log(Level.INFO, "Getting recent activities... for groupId: "
            + groupId.getId());
        PersonList groupMembers = getGroupService().getGroupMembers(
            clientId,
            groupId);

        log.log(Level.INFO, "Group members: " + groupMembers);

        for (Person aPerson : groupMembers.getPerson()) {
            log.log(Level.INFO, "Member: " + aPerson);
        }

        // PersonFilter personFilter = new PersonFilter();
        // personFilter.setId(userIds);

        // ActivitiesFindRequest request = new ActivitiesFindRequest();
        // request.setFilterPerson(personFilter);

        // String apiUserKey = getApiUserKey(clientId);
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
            new String[] { "classpath:sfs-application-context.xml" });
        SfsCli client = (SfsCli) context.getBean("cli");

        client.init();

        String sociosKey = clientId.getId();

        // for testing purpose
        // String sociosKey = "2";

        try {
            ActivityReturnObject activities = client.getRecentActivities(
                clientId,
                sociosKey,
                groupMembers);
            log.log(Level.INFO, "Activities: " + activities);

            // for (Activity aActivity : activities.getActivityReturn()) {
            // log.log(Level.INFO, "Activity: " + aActivity);
            // }
            return activities;
        } catch (SociosException e) {
            handleError("Error while retrieving activityList with id: "
                + clientId
                + ", sociosApiKey: "
                + sociosKey, e);
            return null;
        }

        // if (fSociosApi != null) {
        // ActivityList activities = fSociosApi.findActivities(apiUserKey,
        // request);
        // return activities;
        // }
    }

    private void handleError(String msg, Throwable t) {
        log.log(Level.SEVERE, msg, t);
    }

}
