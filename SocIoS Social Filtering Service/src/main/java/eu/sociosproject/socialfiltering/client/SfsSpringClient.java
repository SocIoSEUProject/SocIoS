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

import org.springframework.context.support.ClassPathXmlApplicationContext;

import eu.sociosproject.sociosvoc.Group;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonList;
import eu.sociosproject.sociosvoc.Source;

public final class SfsSpringClient {

    public static PersonList getSampleFlickrPersonList() {
        PersonList personList = new PersonList();

        Person p = new Person();
        ObjectId id = new ObjectId();
        // id.setId("74059645@N05");
        id.setId("75665939@N02");
        Source src = new Source();
        // OpenSocialSns oss = new OpenSocialSns();
        // oss.setBaseUri("flickr");

        src.setKnownSns(KnownSns.FLICKR);
        id.setSource(src);
        // personIdList.getPersonId().add(id);
        p.setId(id);
        p.setPreferredUsername("Arthior");
        personList.getPerson().add(p);

        p = new Person();
        id = new ObjectId();
        // id.setId("74059645@N05");
        id.setId("74059645@N05");
        src = new Source();
        src.setKnownSns(KnownSns.FLICKR);
        // oss = new OpenSocialSns();
        // oss.setBaseUri("flickr");
        // src.setOpenSocialSnsId(oss);
        id.setSource(src);
        // personIdList.getPersonId().add(id);
        p.setId(id);
        p.setPreferredUsername("Xxxx");
        personList.getPerson().add(p);

        return personList;
    }

    public static PersonList getSampleTwitterPersonList() {
        PersonList personList = new PersonList();
        Person p = new Person();
        ObjectId id = new ObjectId();
        id.setId("10078002");
        Source src = new Source();
        src.setKnownSns(KnownSns.TWITTER);
        // OpenSocialSns oss = new OpenSocialSns();
        // oss.setBaseUri("twitter");
        // src.setOpenSocialSnsId(oss);
        id.setSource(src);
        // personIdList.getPersonId().add(id);
        p.setId(id);
        p.setPreferredUsername("Arkub");
        personList.getPerson().add(p);

        return personList;
    }

    public static ObjectId getSessionId() {
        // ObjectId oid = createObjectId("jsmith", "twitter");
        // if (fSessionId == null) {
        // fSessionId = IdUtil.newObjectId();
        // return fSessionId;
        // } else {
        // return fSessionId;
        // }

        ObjectId oid = new ObjectId();
        oid.setId("1");
        Source source = new Source();
        // OpenSocialSns oss = new OpenSocialSns();
        // oss.setBaseUri("twitter");
        // source.setOpenSocialSnsId(oss);

        source.setKnownSns(KnownSns.TWITTER);
        oid.setSource(source);
        return oid;
    }

    public static void main(String args[]) throws Exception {
        // Initialize the spring context and fetch our test client
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
            new String[] { "classpath:sfs-application-context.xml" });
        SfsCli client = (SfsCli) context.getBean("cli");

        String groupName = "socios-20120705-1";

        client.init();
        ObjectId sessionId = getSessionId();

        client.testListGroups(sessionId);
        Group createdGroup = client.testCreateGroup(
            sessionId,
            groupName,
            "Socios 20120705-1",
            getSampleFlickrPersonList());
        // System.out.println("Group: " + createdGroup);
        PersonList members = client.getListGroupMembers(sessionId, groupName);
        for (Person member : members.getPerson()) {

            System.out.println(member);
        }

        ObjectId groupId = new ObjectId();
        // groupId.setId("id-b5224705-7fd6-4555-9e5c-5bcb8067ac61");

        // groupId.setId("id-78973871-ecb6-4415-b7ab-d8d04d717539");

        groupId.setId(createdGroup.getId().getId());
        // groupId.setId(" id-46bce535-0ccf-407c-abb9-0277db3f1068");
        // System.out.println("Group [" + groupId.getId() + "] members:");

        // members = client.getListGroupMembers(sessionId, groupId);
        // for (Person member : members.getPerson()) {
        //
        // System.out.println(member);
        // }

        //
        // client.testRemoveMembers(groupName, SfsCli.getSamplePersonList());
        //
        // members = client.getListGroupMembers(groupName);
        // System.out.println("Member size: " + members.getPerson().size());
        // for (Person member : members.getPerson()) {
        //
        // System.out.println(member);
        // }

        // client.getRecentActivities(sessionId, sessionId.getId(),
        // getSampleFlickrPersonList());
        //

        client.testFilteringService(sessionId, groupId);

        // client.testFilteringService(sessionId, groupId);

        // client.testCoreServiceFindActivities("1", getSamplePersonList());

        // client.testDeleteGroups();

        System.exit(0);
    }

    private SfsSpringClient() {
    }
}
