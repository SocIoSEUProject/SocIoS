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

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.xml.ws.WebServiceContext;

import eu.sociosproject.IGroupService;
import eu.sociosproject.sociosvoc.Group;
import eu.sociosproject.sociosvoc.GroupList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonList;
import eu.sociosproject.sociosvoc.Source;

public class GroupServiceImpl implements IGroupService {

    /**
     * This class contains information about groups of people for a specific
     * client of this service.
     */
    protected static class UserGroups {

        private final Map<String, PersonList> fGroupMembers = new HashMap<String, PersonList>();

        private final Map<String, Group> fGroups = new HashMap<String, Group>();

        private void addGroupMembers(ObjectId groupId, PersonList people) {
            String key = getKey(groupId);
            PersonList list = fGroupMembers.get(key);
            if (list == null) {
                list = new PersonList();
                fGroupMembers.put(key, list);
            }
            copyMembers(people, list);
        }

        public Group addMembers(ObjectId groupId, PersonList people) {
            String key = getKey(groupId);
            Group group = fGroups.get(key);
            if (group == null) {
                throw new IllegalArgumentException("No group id found with id "
                    + groupId);
            }
            addGroupMembers(groupId, people);
            return group;
        }

        private PersonList copyMembers(PersonList from, PersonList to) {
            Set<String> set = getMemberIds(to);
            List<Person> source = from.getPerson();
            List<Person> target = to.getPerson();
            for (Person person : source) {
                String key = getKey(person.getId());
                if (!set.contains(key)) {
                    target.add(person);
                }
            }
            return to;
        }

        public Group createGroup(Group group, PersonList people) {
            Group newGroup = new Group();
            newGroup.setTitle(group.getTitle());
            newGroup.setDescription(group.getDescription());
            ObjectId groupId = IdUtil.newObjectId();
            newGroup.setId(groupId);
            addGroupMembers(groupId, people);
            String key = getKey(groupId);
            fGroups.put(key, newGroup);
            return newGroup;
        }

        public boolean deleteGroup(ObjectId groupId) {
            String key = getKey(groupId);
            Group result = fGroups.remove(key);
            if (result != null) {
                fGroupMembers.remove(key);
            }
            return result != null;
        }

        public PersonList getGroupMembers(ObjectId groupId) {
            String key = getKey(groupId);
            PersonList members = fGroupMembers.get(key);
            PersonList result = new PersonList();
            return copyMembers(members, result);
        }

        public GroupList getGroups() {
            GroupList list = new GroupList();
            for (Group group : fGroups.values()) {
                list.getGroup().add(group);
            }
            return list;
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

        public Group removeMembers(ObjectId groupId, PersonList persons) {
            String key = getKey(groupId);
            PersonList members = fGroupMembers.get(key);
            if (members == null) {
                throw new IllegalArgumentException("No group with id "
                    + groupId);
            }
            Set<String> toRemove = getMemberIds(persons);
            PersonList newMembers = new PersonList();
            for (Person person : members.getPerson()) {
                String personKey = getKey(person.getId());
                if (!toRemove.contains(personKey)) {
                    newMembers.getPerson().add(person);
                }
            }
            fGroupMembers.put(key, newMembers);
            return fGroups.get(key);
        }

    }

    private static String getKey(ObjectId groupId) {
        Source source = groupId.getSource();
        String id = groupId.getId();
        if (source != null) {
            // return source.getOpenSocialSnsId().getBaseUri() + ":" + id;
            return source.getKnownSns().name() + ":" + id;
        }
        return id;

    }

    private final Map<String, UserGroups> fClientGroups = new HashMap<String, UserGroups>();

    /**
     * The WebServiceContext can be used to retrieve special attributes like the
     * user principal. Normally it is not needed
     */
    @Resource
    WebServiceContext wsContext;

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
        UserGroups groups = getUserGroupsBySession(session, true);
        group = groups.createGroup(group, people);
        return group;
    }

    @Override
    public boolean deleteGroup(ObjectId session, ObjectId id) {
        UserGroups groups = getUserGroupsBySession(session, false);
        if (groups == null) {
            return false;
        }
        return groups.deleteGroup(id);
    }

    @Override
    public PersonList getGroupMembers(ObjectId session, ObjectId groupId) {
        UserGroups groups = getUserGroupsBySession(session, false);
        if (groups == null) {
            return new PersonList();
        }
        PersonList members = groups.getGroupMembers(groupId);
        return members;
    }

    @Override
    public GroupList getGroups(ObjectId session) {
        UserGroups groups = getUserGroupsBySession(session, false);
        if (groups == null) {
            return new GroupList();
        }
        return groups.getGroups();
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
            groups = new UserGroups();
            fClientGroups.put(key, groups);
        }
        return groups;

    }

    @Override
    public Group removeMembers(
        ObjectId session,
        ObjectId groupId,
        PersonList persons) {
        UserGroups groups = getUserGroupsBySession(session, false);
        if (groups == null) {
            return null;
        }
        return groups.removeMembers(groupId, persons);

    }

}
