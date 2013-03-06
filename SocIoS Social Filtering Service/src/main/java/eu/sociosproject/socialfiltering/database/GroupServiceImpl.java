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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.xml.ws.WebServiceContext;

import eu.sociosproject.IGroupService;
import eu.sociosproject.socialfiltering.database.JdbcConnector.ISqlAction;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosvoc.Group;
import eu.sociosproject.sociosvoc.GroupList;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonList;
import eu.sociosproject.sociosvoc.Source;

public class GroupServiceImpl implements IGroupService {

    /**
     * This class contains information about groups of people for a specific
     * client of this service.
     */
    protected class UserGroups {

        private final ObjectId fUserId;

        protected UserGroups(ObjectId userId) {
            this.fUserId = userId;
        }

        private void addGroupMembers(ObjectId groupId, final PersonList people) {
            final String key = getKey(groupId);

            final PersonList groupMembers = getGroupMembers(groupId);

            // TODO: check that there is no doublon
            fConnector.run("Adding group members", new ISqlAction<Void>() {
                @Override
                public Void run(Connection connection) throws SQLException {

                    PreparedStatement statement = connection
                        .prepareStatement(SQL_INSERT_GROUP_MEMBERS);

                    try {

                        List<Person> persons = people.getPerson();
                        for (Person person : persons) {

                            int result = storeUser(person, connection);
                            if (result >= 0) {
                                // check that the person is not already part
                                // the target group
                                boolean isAlreadyMember = false;
                                for (Person member : groupMembers.getPerson()) {
                                    if (member != null
                                        && person
                                            .getId()
                                            .getId()
                                            .equals(member.getId().getId())) {
                                        isAlreadyMember = true;
                                        break;
                                    }

                                }

                                if (!isAlreadyMember) {
                                    statement.setString(1, key);
                                    statement.setString(
                                        2,
                                        getKey(person.getId()));
                                    statement.addBatch();
                                }
                            } else {
                                handleError(
                                    "Error while storing person " + person,
                                    new eu.sociosproject.sociosapi.SociosException());
                            }
                        }
                        statement.executeBatch();
                        statement.clearBatch();
                    } finally {
                        statement.close();

                    }
                    return null;
                }

            });

        }

        public Group addMembers(ObjectId groupId, PersonList people) {

            Group group = getGroupById(groupId);

            if (group == null) {
                throw new IllegalArgumentException("No group id found with id "
                    + groupId);
            }
            addGroupMembers(groupId, people);
            return group;
        }

        public boolean checkUserExists(ObjectId userId, Connection connection)
            throws SQLException {
            PreparedStatement userStatement = connection
                .prepareStatement(SQL_CHECK_USER_PRESENCE);

            try {
                userStatement.setString(1, getKey(userId));

                ResultSet rs = userStatement.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count > 0) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            } finally {

                userStatement.close();
            }

        }

        public Group createGroup(Group group, PersonList people) {
            final Group newGroup = new Group();
            newGroup.setTitle(group.getTitle());
            newGroup.setDescription(group.getDescription());
            ObjectId groupId = IdUtil.newObjectId();
            newGroup.setId(groupId);

            fConnector.run("Creating group...", new ISqlAction<Void>() {
                @Override
                public Void run(Connection connection) throws SQLException {
                    PreparedStatement statement = connection
                        .prepareStatement(SQL_INSERT_GROUP);

                    try {

                        // id, id_user, name, description
                        // TODO: check user not already stored
                        // storeUser(fUserId, connection);

                        statement.setString(1, getKey(newGroup.getId()));
                        statement.setString(2, getKey(fUserId));
                        statement.setString(3, newGroup.getTitle());
                        statement.setString(4, newGroup.getDescription());
                        statement.addBatch();

                        statement.executeBatch();
                        statement.clearBatch();

                    } finally {
                        statement.close();

                    }
                    return null;
                }
            });

            addGroupMembers(groupId, people);
            return newGroup;
        }

        public boolean deleteGroup(final ObjectId groupId) {
            removeAllMembers(groupId);
            fConnector.run("Strong messages.", new ISqlAction<Void>() {
                @Override
                public Void run(Connection connection) throws SQLException {

                    PreparedStatement delStatement = connection
                        .prepareStatement(SQL_DELETE_GROUPS);

                    try {
                        delStatement.setString(1, getKey(groupId));

                        delStatement.addBatch();
                        delStatement.executeBatch();
                        delStatement.clearBatch();

                    } catch (Exception e) {
                        handleError("Cannot delete group " + groupId, e);
                    }

                    finally {
                        delStatement.close();

                    }
                    return null;
                }
            });

            return true;
        }

        private Group getGroupById(ObjectId groupId) {
            GroupList glist = getGroups();
            for (Group group : glist.getGroup()) {
                if (group != null
                    && groupId != null
                    && group.getId() != null
                    && getKey(group.getId()).equals(getKey(groupId))) {
                    return group;
                }
            }

            return null;
        }

        public PersonList getGroupMembers(final ObjectId groupId) {
            // String key = getKey(groupId);
            List<Person> list = fConnector.run(
                "Load group members",
                new ISqlAction<List<Person>>() {

                    @Override
                    public List<Person> run(Connection connection)
                        throws SQLException {
                        List<Person> result = new ArrayList<Person>();

                        PreparedStatement statement = connection
                            .prepareStatement(SQL_SEARCH_MEMBERS);

                        try {

                            statement.setString(1, getKey(groupId));
                            ResultSet set = statement.executeQuery();
                            try {
                                if (set.first()) {
                                    do {

                                        final Person newPerson = new Person();
                                        ObjectId oid = new ObjectId();
                                        // the id is the local id
                                        oid.setId(set.getString("id_local"));

                                        Source source = new Source();
                                        String baseUri = set.getString("label");
                                        source.setKnownSns(KnownSns
                                            .fromValue(baseUri.toUpperCase()));
                                        // source.setOpenSocialSnsId(getOpenSocialSnsIdByUri(baseUri));

                                        // OpenSocialSns oss = new
                                        // OpenSocialSns();
                                        // oss.setBaseUri(baseUri);
                                        // source.setOpenSocialSnsId(oss);

                                        // source.setKnownSns(value)
                                        oid.setSource(source);

                                        newPerson.setId(oid);
                                        newPerson.setPreferredUsername(set
                                            .getString("preferred_name"));

                                        result.add(newPerson);

                                    } while (set.next());
                                }
                            } finally {
                                set.close();
                            }
                        } finally {
                            statement.close();
                        }

                        return result;
                    }
                });

            PersonList plist = new PersonList();
            for (Person p : list) {
                plist.getPerson().add(p);
            }
            return plist;

        }

        public GroupList getGroups() {

            log.log(Level.INFO, "Loading user group... for " + getKey(fUserId));
            List<Group> list = fConnector.run(
                "Load user groups",
                new ISqlAction<List<Group>>() {

                    @Override
                    public List<Group> run(Connection connection)
                        throws SQLException {
                        List<Group> result = new ArrayList<Group>();

                        PreparedStatement statement = connection
                            .prepareStatement(SQL_SEARCH_BY_USER);

                        try {

                            statement.setString(1, getKey(fUserId));
                            ResultSet set = statement.executeQuery();

                            try {
                                if (set.first()) {
                                    do {

                                        final Group newGroup = new Group();
                                        newGroup.setTitle(set.getString("name"));
                                        newGroup.setDescription(set
                                            .getString(3));
                                        ObjectId oid = new ObjectId();
                                        oid.setId(set.getString("id"));
                                        newGroup.setId(oid);
                                        newGroup.setDescription(set
                                            .getString("description"));
                                        result.add(newGroup);

                                    } while (set.next());
                                }
                            } finally {
                                set.close();
                            }
                        } finally {
                            statement.close();
                        }
                        return result;
                    }
                });

            GroupList glist = new GroupList();
            for (Group group : list) {
                glist.getGroup().add(group);
            }
            return glist;
        }

        private Set<String> getMemberIds(PersonList people) {
            Set<String> set = new HashSet<String>();
            if (people != null) {
                List<Person> array = people.getPerson();
                if (array != null) {
                    for (Person person : array) {
                        String key = getKey(person.getId());
                        set.add(key);
                    }
                }
            }
            return set;
        }

        public void removeAllMembers(ObjectId groupId) {
            final String key = getKey(groupId);
            fConnector.run("Removing all members", new ISqlAction<Void>() {
                @Override
                public Void run(Connection connection) throws SQLException {
                    PreparedStatement statement = connection
                        .prepareStatement(SQL_REMOVE_GROUP_MEMBERS);
                    try {
                        statement.setString(1, key);
                        statement.addBatch();
                        statement.executeBatch();
                        statement.clearBatch();
                    } finally {
                        statement.close();
                    }
                    return null;
                }
            });

        }

        public Group removeMembers(
            final ObjectId groupId,
            final PersonList people) {
            // PersonList members = getGroupMembers(groupId);
            // if (members == null) {
            // throw new IllegalArgumentException("No group with id "
            // + groupId);
            // }
            // Set<String> toRemove = getMemberIds(people);
            // PersonList newMembers = new PersonList();
            // for (Person person : members.getPerson()) {
            // String personKey = getKey(person.getId());
            // if (!toRemove.contains(personKey)) {
            // newMembers.getPerson().add(person);
            // }
            // }

            fConnector.run("Removing members", new ISqlAction<Void>() {
                @Override
                public Void run(Connection connection) throws SQLException {
                    PreparedStatement statement = connection
                        .prepareStatement(SQL_REMOVE_GROUP_MEMBER);
                    try {

                        List<Person> persons = people.getPerson();
                        for (Person person : persons) {
                            statement.setString(1, getKey(groupId));
                            statement.setString(2, getKey(person.getId()));
                            statement.addBatch();
                        }
                        statement.executeBatch();
                        statement.clearBatch();
                    } finally {
                        statement.close();
                    }
                    return null;
                }
            });

            return getGroupById(groupId);
        }

        private int storeUser(Person user, Connection connection)
            throws SQLException {

            boolean exists = checkUserExists(user.getId(), connection);
            if (exists) {
                return 0;
            }

            PreparedStatement userStatement = connection
                .prepareStatement(SQL_INSERT_USER);

            // TODO: obtain the mapping between snsUri and Id
            // OpenSocialSns snsId =
            // person.getId().getSource().getOpenSocialSnsId();
            // snsId.getBaseUri()

            try {
                userStatement.setString(1, getKey(user.getId()));
                Source source = user.getId().getSource();
                // if (source != null && source.getOpenSocialSnsId() != null) {
                if (source != null && source.getKnownSns() != null) {
                    // OpenSocialSns osapi = source.getOpenSocialSnsId();
                    int id = getOpenSocialSnsIdByUri(source
                        .getKnownSns()
                        .name());
                    userStatement.setInt(2, id);
                } else {
                    userStatement.setInt(2, 0);
                }

                userStatement.setString(3, user.getId().getId());
                userStatement.setString(4, user.getPreferredUsername());
                userStatement.addBatch();
                userStatement.executeBatch();
                userStatement.clearBatch();
                return 0;
            } catch (SQLException e) {
                handleError("Error storing user", e);
                return -1;
            } catch (SociosException e) {
                handleError("Error storing user", e);
                return -1;
            } finally {

                userStatement.close();
            }

        }
    }

    private static Logger log = Logger.getLogger(GroupServiceImpl.class
        .getName());

    protected static final String SQL_CHECK_USER_PRESENCE = ""
        + "select count(*) from sfs_users where id=?";

    private static String SQL_CREATE_GROUP_MEMBERS = ""
        + "create table sfs_group_members (id_group varchar(255), id_user varchar(255), primary key (id_group, id_user))";

    private static String SQL_CREATE_GROUPS = ""
        + "create table sfs_groups (id varchar(255), id_user varchar(255), name varchar(255), description text, primary key (id))";

    private static String SQL_CREATE_SOCIAL_NETWORKS = ""
        + "create table sfs_social_networks (id int, label varchar(255), primary key (id))";

    // private static String SQL_CREATE_USER_GROUPS = ""
    // +
    // "create table sfs_user_groups (id_user varchar(255), id_group varchar(255), primary key (id_user, id_group))";

    // TODO: create foreign keys on sfs_groups and sfs_group_members
    private static String SQL_CREATE_USERS = ""
        + "create table sfs_users (id varchar(255), id_sns int, id_local varchar(255), preferred_name varchar(255), primary key (id))";

    private static final String SQL_DELETE_GROUPS = ""
        + "delete from sfs_groups where id=?";

    private static final String SQL_INSERT_GROUP = ""
        + "insert into sfs_groups values (?,?,?,?)";

    private static final String SQL_INSERT_GROUP_MEMBERS = ""
        + "insert into sfs_group_members values (?,?)";

    private static final String SQL_INSERT_SOCIAL_NETWORK = ""
        + "insert into sfs_social_networks values (?,?)";

    // private static final String SQL_DELETE_USER_GROUPS = ""
    // + "delete from sfs_user_groups where id_group=?";

    // table sfs_groups (id varchar(255), id_user varchar(255), name
    // varchar(255), description text, primary key (id))";

    private static final String SQL_INSERT_USER = ""
        + "insert into sfs_users values (?,?,?,?)";

    private static final String SQL_REMOVE_GROUP_MEMBER = ""
        + "delete from sfs_group_members where id_group=? and id_user=?";

    // private static final String SQL_INSERT_USER_GROUP = ""
    // + "insert into sfs_user_groups values (?,?)";

    private static final String SQL_REMOVE_GROUP_MEMBERS = ""
        + "delete from sfs_group_members where id_group=?";

    protected static final String SQL_SEARCH = ""
        + "select name from sfs_groups";

    protected static final String SQL_SEARCH_BY_USER = ""
        + "select id, name, description from sfs_groups where id_user=?";

    protected static final String SQL_SEARCH_MEMBERS = ""
        + "select id_group, id_local, id_sns, preferred_name, label from sfs_group_members GM, sfs_users U, sfs_social_networks SN where id_group=? and GM.id_user=U.id and U.id_sns=SN.id";

    private static String TABLE_GROUPS = "sfs_groups";

    private static String getKey(ObjectId oid) {
        if (oid == null) {
            return null;
        }
        Source source = oid.getSource();
        String id = oid.getId();
        if (source != null && source.getKnownSns() != null) {
            // return source.getOpenSocialSnsId().getBaseUri() + ":" + id;
            return source.getKnownSns().name() + ":" + id;
        }
        return id;

    }

    private static void info(String msg) {
        log.log(Level.INFO, msg);
    }

    private static void warning(String msg) {
        log.log(Level.WARNING, msg);
    }

    private final Map<String, UserGroups> fClientGroups = new HashMap<String, UserGroups>();

    private JdbcConnector fConnector;

    /**
     * The WebServiceContext can be used to retrieve special attributes like the
     * user principal. Normally it is not needed
     */
    @Resource
    WebServiceContext wsContext;

    public GroupServiceImpl() {
        super();
        log.log(Level.INFO, "Initializing SFS GroupServiceImpl...");

        try {
            fConnector = ConfigUtil.getInstance().getConnector();
            if (fConnector != null) {
                open();
            }
            log
                .log(
                    Level.INFO,
                    "Initialization of SFS GroupServiceImpl completed successfully.");
        } catch (SociosException e) {
            handleError("Cannot initialize GroupService", e);
        }

    }

    @Override
    public Group addMembers(
        ObjectId session,
        PersonList people,
        ObjectId groupId) {
        UserGroups groups = getUserGroupsBySession(session, true);
        checkUserGroup(groups);
        Group group = groups.addMembers(groupId, people);
        return group;

    }

    void checkUserGroup(UserGroups groups) {
        if (groups == null) {
            throw new IllegalArgumentException("User groups are not defined");
        }
    }

    @Override
    public Group createGroup(ObjectId session, PersonList people, Group group) {
        log.log(Level.INFO, "Creating group '" + group.getTitle() + "'...");

        UserGroups groups = getUserGroupsBySession(session, true);
        group = groups.createGroup(group, people);
        return group;
    }

    @Override
    public boolean deleteGroup(ObjectId session, ObjectId id) {
        UserGroups groups = getUserGroupsBySession(session, true);
        if (groups == null) {
            return false;
        }
        return groups.deleteGroup(id);
    }

    @Override
    public PersonList getGroupMembers(ObjectId session, ObjectId groupId) {
        UserGroups groups = getUserGroupsBySession(session, true);
        if (groups == null) {
            return new PersonList();
        }
        PersonList members = groups.getGroupMembers(groupId);
        return members;
    }

    @Override
    public GroupList getGroups(ObjectId session) {
        log.log(Level.INFO, "Getting groups for " + session.getId());
        UserGroups groups = getUserGroupsBySession(session, true);
        return groups.getGroups();
    }

    private int getOpenSocialSnsIdByUri(String baseUri) throws SociosException {
        Map<Integer, String> map = ConfigUtil.getInstance().getDefaultSnsIds();
        for (Integer key : map.keySet()) {
            String snsUri = map.get(key);
            if (snsUri != null && baseUri != null && snsUri.equals(baseUri)) {
                return key;
            }
        }
        return 0;
    }

    protected UserGroups getUserGroupsBySession(
        ObjectId clientId,
        boolean create) {
        if (clientId == null) {
            throw new IllegalArgumentException();
        }
        String key = getKey(clientId);
        UserGroups groups = fClientGroups.get(key);
        if (groups == null && create) {
            groups = new UserGroups(clientId);
            fClientGroups.put(key, groups);
        }
        return groups;

    }

    private void handleError(String msg, Throwable t) {
        log.log(Level.SEVERE, msg, t);
    }

    public void open() throws SociosException {
        try {
            if (!fConnector.checkTable(TABLE_GROUPS)) {
                log.log(Level.INFO, "Creating SFS tables...");
                fConnector.run(new ISqlAction<Void>() {
                    @Override
                    public Void run(Connection connection) throws SQLException {
                        Statement stmt = connection.createStatement();
                        stmt.executeUpdate(SQL_CREATE_SOCIAL_NETWORKS);
                        stmt.executeUpdate(SQL_CREATE_USERS);
                        stmt.executeUpdate(SQL_CREATE_GROUPS);
                        stmt.executeUpdate(SQL_CREATE_GROUP_MEMBERS);

                        log.log(Level.INFO, "Loading default SNS ids...");
                        PreparedStatement insertSns = connection
                            .prepareStatement(SQL_INSERT_SOCIAL_NETWORK);

                        // load SNS identifiers from config file
                        try {
                            Map<Integer, String> defaultSnsIds = ConfigUtil
                                .getInstance()
                                .getDefaultSnsIds();
                            for (Integer id : defaultSnsIds.keySet()) {
                                String label = defaultSnsIds.get(id);
                                // SQL_INSERT_SOCIAL_NETWORK
                                insertSns.setInt(1, id);
                                insertSns.setString(2, label);
                                insertSns.execute();
                            }
                        } catch (SociosException e) {
                            // TODO Auto-generated catch block
                            handleError("Error loading default SNS ids", e);
                        }
                        insertSns.close();
                        stmt.close();
                        return null;
                    }
                });
                log.log(Level.INFO, "SFS tables created successfuly.");
            } else {
                log.log(Level.INFO, "SFS tables are already present.");
            }
        } catch (Exception e) {
            handleError("Cannot open connection and initialize tables.", e);
        }

    }

    @Override
    public Group removeMembers(
        ObjectId session,
        ObjectId groupId,
        PersonList persons) {
        UserGroups groups = getUserGroupsBySession(session, true);
        if (groups == null) {
            return null;
        }
        return groups.removeMembers(groupId, persons);

    }

}
