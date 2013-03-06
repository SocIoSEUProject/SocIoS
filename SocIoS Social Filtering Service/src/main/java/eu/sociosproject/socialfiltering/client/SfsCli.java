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
package eu.sociosproject.socialfiltering.client;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.datatype.XMLGregorianCalendar;

import junit.framework.Assert;

import com.sun.org.apache.xerces.internal.jaxp.datatype.XMLGregorianCalendarImpl;

import eu.sociosproject.IGroupService;
import eu.sociosproject.ISocialFilteringService;
import eu.sociosproject.socialfiltering.database.JdbcConnector;
import eu.sociosproject.socialfiltering.database.JdbcConnector.ISqlAction;
import eu.sociosproject.sociosapi.SociosApi;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityList;
import eu.sociosproject.sociosvoc.ActivityReturn;
import eu.sociosproject.sociosvoc.ActivityReturnObject;
import eu.sociosproject.sociosvoc.ArrayOfObjectIds;
import eu.sociosproject.sociosvoc.Group;
import eu.sociosproject.sociosvoc.GroupList;
import eu.sociosproject.sociosvoc.KeyWordFilter;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.PersonList;
import eu.sociosproject.sociosvoc.Source;

public final class SfsCli {

    private static Logger log = Logger.getLogger(SfsCli.class.getName());

    private static String SQL_DELETE_GROUP_MEMBERS = ""
        + "delete from sfs_group_members";

    private static String SQL_DELETE_GROUPS = "" + "delete from sfs_groups";

    private static String SQL_DELETE_USER_GROUPS = ""
        + "delete from sfs_user_groups";

    private static String TABLE_GROUPS = "sfs_groups";

    private JdbcConnector fConnector;

    SociosApi fCoreService;

    ISocialFilteringService fFilteringService;

    // The CustomerService proxy will be injected either by spring or by a
    // direct call to the setter
    IGroupService fGroupService;

    private ObjectId fSessionId;

    // public ObjectId createObjectId(String id, String sourceBaseUri) {
    // ObjectId oid = new ObjectId();
    // oid.setId(id);
    // oid.setSource(createSource(sourceBaseUri));
    // return oid;
    //
    // }

    // protected Source createSource(String baseUri) {
    // Source source = new Source();
    // // KnownSns knownSns = KnownSns.
    // OpenSocialSns oss = new OpenSocialSns();
    // oss.setBaseUri(baseUri);
    // source.setOpenSocialSnsId(oss);
    //
    // return source;
    // }

    public void emptyTables() throws SociosException {
        try {
            if (fConnector.checkTable(TABLE_GROUPS)) {

                fConnector.run(new ISqlAction<Void>() {
                    @Override
                    public Void run(Connection connection) throws SQLException {
                        Statement stmt = null;
                        try {
                            stmt = connection.createStatement();
                            stmt.executeUpdate(SQL_DELETE_GROUPS);
                            stmt.executeUpdate(SQL_DELETE_USER_GROUPS);
                            stmt.executeUpdate(SQL_DELETE_GROUP_MEMBERS);

                        } catch (Exception e) {
                            e.printStackTrace();
                            fConnector
                                .handleError(
                                    "Can not open connection and initialize tables.",
                                    e);
                        }
                        stmt.close();
                        return null;

                    }
                });

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public SociosApi getCoreService() {
        return fCoreService;
    }

    public ISocialFilteringService getFilteringService() {
        return fFilteringService;
    }

    public Group getGroupByName(ObjectId sessionId, String groupName) {
        GroupList glist = fGroupService.getGroups(sessionId);
        // Assert.assertEquals(1, glist.getGroup().size());
        System.out.println("Getting groups...");
        System.out.println(glist.getGroup().size());
        for (Group agroup : glist.getGroup()) {
            if (agroup.getTitle().equalsIgnoreCase(groupName)) {
                return agroup;
            }

        }
        return null;
    }

    public IGroupService getGroupService() {
        return fGroupService;
    }

    public PersonList getListGroupMembers(ObjectId sessionId, ObjectId groupId) {

        PersonList members = fGroupService.getGroupMembers(sessionId, groupId);

        for (Person member : members.getPerson()) {
            System.out.println(member.getId().getId()
                + " "
                + member.getPreferredUsername());
        }

        return members;

    }

    public PersonList getListGroupMembers(ObjectId sessionId, String groupName) {
        Group group = getGroupByName(sessionId, groupName);

        System.out.println("Group: " + group);

        if (group != null) {
            PersonList members = fGroupService.getGroupMembers(
                sessionId,
                group.getId());

            for (Person member : members.getPerson()) {
                System.out.println(member.getId().getId()
                    + " "
                    + member.getPreferredUsername());
            }

            return members;
        }

        return null;
    }

    public ActivityReturnObject getRecentActivities(
        ObjectId userId,
        String sociosKey,
        PersonList personList) throws SociosException {
        System.out.println("Testing filter... CoreService: " + fCoreService);

        log.log(Level.INFO, "getRecentActivities... CoreService "
            + fCoreService);

        PersonIdList personIdList = personListToPersonIdList(personList);

        // ObjectId id = new ObjectId();
        // id.setId("74059645@N05");
        // Source src = new Source();
        // src.setKnownSns(KnownSns.FLICKR);
        // id.setSource(src);
        // personIdList.getPersonId().add(id);

        log.log(
            Level.INFO,
            "Invoking findActivities... UserId: "
                + userId.getId()
                + " SociosKey: "
                + sociosKey);

        StringBuffer pids = new StringBuffer();
        for (Person member : personList.getPerson()) {
            ObjectId memberId = member.getId();
            // pids.append(memberId.getId() + " "
            // + memberId.getSource().getOpenSocialSnsId().getBaseUri()
            // + " " + memberId.getSource().getKnownSns().toString() + ",");

            pids.append(memberId.getId()
                + " "
                + memberId.getSource().getKnownSns().name()
                + " "
                + memberId.getSource().getKnownSns().toString()
                + ",");

        }
        log.log(Level.INFO, "PersonList: " + pids);
        ActivityFilter activityFilter = null;
        MediaItemIdList mediaItemList = null;
        PersonFilter personFilter = null;

        List<Activity> result;
        result = fCoreService.findActivities(
            sociosKey,
            activityFilter,
            personFilter,
            mediaItemList,
            personIdList);

        if (result == null) {
            log.log(Level.INFO, "response is null");
        } else {
            ActivityList activityList = new ActivityList();
            log
                .log(
                    Level.INFO,
                    "response is not null, size = " + result.size());

            ActivityReturnObject aro = new ActivityReturnObject();
            ActivityReturn ar = new ActivityReturn();
            aro.setActivityReturn(ar);
            for (int q = 0; q < result.size(); q++) {

                Activity activity = result.get(q);
                String body = activity.getBody();
                System.out.println("body: " + body);
                activityList.getActivity().add(activity);
                ar.getActivities().add(activity);
            }

            return aro;

        }

        return null;

    }

    public void init() {

    }

    private PersonIdList personListToPersonIdList(PersonList personList) {
        PersonIdList personIdList = new PersonIdList();
        for (Person member : personList.getPerson()) {
            ObjectId memberId = member.getId();

            String id = memberId.getId();
            int idx = id.indexOf(":");
            if (idx > 0 && id.length() > idx) {
                id = id.substring(idx + 1);
            }
            memberId.setId(id);

            personIdList.getPersonId().add(memberId);
        }

        return personIdList;
    }

    public void setCoreService(SociosApi coreService) {
        fCoreService = coreService;
    }

    public void setFilteringService(ISocialFilteringService filteringService) {
        fFilteringService = filteringService;
    }

    public void setGroupService(IGroupService service) {
        this.fGroupService = service;
    }

    public List<Activity> testCoreServiceFindActivities(
        String sociosKey,
        PersonList personList) throws SociosException {

        log.log(Level.INFO, "Testing coreService:FindActivities...");
        ActivityFilter activityFilter = null;
        MediaItemIdList mediaItemList = null;
        PersonFilter personFilter = null;

        PersonIdList pidList = personListToPersonIdList(personList);
        StringBuffer pids = new StringBuffer();
        for (ObjectId memberId : pidList.getPersonId()) {
            pids.append(memberId.getId() + " "
            // + memberId.getSource().getOpenSocialSnsId().getBaseUri()
                + memberId.getSource().getKnownSns().name()
                + " "
                + memberId.getSource().getKnownSns().toString()
                + ",");
        }
        log.log(Level.INFO, "PersonList: " + pids);

        List<Activity> result = fCoreService.findActivities(
            sociosKey,
            activityFilter,
            personFilter,
            mediaItemList,
            pidList);

        if (result != null) {

            for (Activity act : result) {
                log.log(Level.INFO, "Activity body: " + act.getBody());
            }

        } else {
            log.log(Level.INFO, "The serviced returned null.");
        }

        return result;

    }

    public Group testCreateGroup(
        ObjectId sessionId,
        String groupName,
        String groupDescription,
        PersonList people) {

        // for (int i = 0; i < 10; i++) {
        // Person aperson = new Person();
        // aperson.setPreferredUsername("Arthur ∕ ∖ ∗ ∘ ∙ √ ∛ ∜");
        // ObjectId oid = IdUtil.newObjectId();
        // Source source = new Source();
        // OpenSocialSns oss = new OpenSocialSns();
        // oss.setBaseUri("twitter");
        // source.setOpenSocialSnsId(oss);
        // oid.setSource(source);
        // aperson.setId(oid);
        // people.getPerson().add(aperson);
        // }

        Group agroup = new Group();
        agroup.setTitle(groupName);
        agroup.setDescription(groupDescription);
        Group createdGroup = fGroupService.createGroup(
            sessionId,
            people,
            agroup);

        return createdGroup;

    }

    public void testDeleteGroups(ObjectId sessionId) {
        GroupList glist = fGroupService.getGroups(sessionId);
        for (Group agroup : glist.getGroup()) {
            fGroupService.deleteGroup(sessionId, agroup.getId());

        }

        glist = fGroupService.getGroups(sessionId);
        Assert.assertEquals(0, glist.getGroup().size());

    }

    public void testFilter(ObjectId sessionId) {

        XMLGregorianCalendar cal = new XMLGregorianCalendarImpl();
        cal.setYear(2011);
        GroupList glist = fGroupService.getGroups(sessionId);
        if (glist.getGroup().size() > 0) {
            Group group = glist.getGroup().get(0);
            fFilteringService.getRecentActivities(sessionId, group.getId());
        }
    }

    public ActivityReturnObject testFilteringService(
        ObjectId sessionId,
        ObjectId groupId) throws SociosException {
        log.log(Level.INFO, "Testing filter... fFilteringService: "
            + fFilteringService);

        if (groupId != null) {
            log.log(
                Level.INFO,
                "********* Group ObjectId ID: " + groupId.getId());

            ActivityReturnObject activities = fFilteringService
                .getRecentActivities(sessionId, groupId);

            log.log(Level.INFO, "Activities: " + activities);

            if (activities != null) {
                for (Activity activ : activities
                    .getActivityReturn()
                    .getActivities()) {
                    log.log(Level.INFO, activ.getBody());
                }
            }
            return activities;
        }

        return null;

    }

    public ActivityReturnObject testFilteringService(
        ObjectId sessionId,
        String groupName) throws SociosException {

        Group group = getGroupByName(sessionId, groupName);
        if (group != null) {
            return testFilteringService(sessionId, group.getId());
        }

        return null;
    }

    public void testFindPersons() throws SociosException {

        System.out.println("Invoking findPersons...");
        java.lang.String _findPersons_sociosApiUserKey = "";
        PersonFilter _findPersons_personFilter = new PersonFilter();

        KeyWordFilter filter = new KeyWordFilter();
        filter.getKeyword().add("SociosAdaptor");
        _findPersons_personFilter.setDisplayName(filter);

        ObjectId id = new ObjectId();
        Source src = new Source();
        src.setKnownSns(KnownSns.FLICKR);
        id.setSource(src);

        ArrayOfObjectIds list = new ArrayOfObjectIds();
        list.getObjectId().add(id);
        _findPersons_personFilter.setId(list);

        eu.sociosproject.sociosvoc.MediaItemIdList _findPersons_mediaItemIdList = null;
        java.util.List<eu.sociosproject.sociosvoc.Person> _findPersons__return;
        _findPersons__return = fCoreService.findPersons(
            _findPersons_sociosApiUserKey,
            _findPersons_personFilter,
            _findPersons_mediaItemIdList);
    }

    public void testListGroups(ObjectId sessionId) {

        log.log(
            Level.INFO,
            "Getting groups for sessionId: " + sessionId.getId() + "...");
        GroupList groups = fGroupService.getGroups(sessionId);
        if (groups == null) {
            log.log(Level.INFO, "No group found");
        }
        for (Group group : groups.getGroup()) {
            log.log(Level.INFO, "Group: " + group.getTitle());

        }
    }

    public Group testRemoveMembers(
        ObjectId sessionId,
        String groupName,
        PersonList people) {

        // PersonList people = getSamplePersonList();

        // for (int i = 0; i < 10; i++) {
        // Person aperson = new Person();
        // aperson.setPreferredUsername("Arthur ∕ ∖ ∗ ∘ ∙ √ ∛ ∜");
        // ObjectId oid = IdUtil.newObjectId();
        // Source source = new Source();
        // OpenSocialSns oss = new OpenSocialSns();
        // oss.setBaseUri("twitter");
        // source.setOpenSocialSnsId(oss);
        // oid.setSource(source);
        // aperson.setId(oid);
        // people.getPerson().add(aperson);
        // }

        Group group = getGroupByName(sessionId, groupName);
        Group updatedGroup = fGroupService.removeMembers(
            sessionId,
            group.getId(),
            people);

        return updatedGroup;

    }
}
