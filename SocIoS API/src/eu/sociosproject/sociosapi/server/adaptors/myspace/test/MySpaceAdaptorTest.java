package eu.sociosproject.sociosapi.server.adaptors.myspace.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import junit.framework.TestCase;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.myspace.MySpaceAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.myspace.MySpaceAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor.RequestUtility;
import eu.sociosproject.sociosvoc.KeyWordFilter;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;

public class MySpaceAdaptorTest extends TestCase {

    // See https://github.com/tomayac/MySpace/tree/master/src/com/myspace/api
    // http://code.google.com/p/myspaceid-java-sdk/
    // http://wiki.developer.myspace.com/index.php?title=OAuth_REST_API_Usage_-_Authentication_Process

    private void append(StringBuilder buf, String key, String value) {
        append(buf, key, value, true);
    }

    private void append(
        StringBuilder buf,
        String key,
        String value,
        boolean appendComma) {
        if (appendComma && buf.length() > 0) {
            buf.append(",");
        }
        buf.append("\n");
        buf.append(" ");
        buf.append("\"").append(key).append("\"");
        buf.append(":");
        buf.append("\"").append(value).append("\"");
    }

    public MySpaceAdaptor getMySpaceAdapter() {
        String accessToken = "random";
        String accessSecret = "random";
        MySpaceAccessTokens token = new MySpaceAccessTokens(
            accessToken,
            accessSecret);
        MySpaceAdaptor adaptor = token.create();
        return adaptor;
    }

    private String getShift(int level) {
        String result = "";
        for (int i = 0; i < level; i++) {
            result += "  ";
        }
        return result;
    }

    protected ObjectId newObjectId(String id) {
        ObjectId objectId = new ObjectId();
        objectId.setId(id);
        return objectId;
    }

    private String serialize1(Person person) {
        StringBuilder buf = new StringBuilder();
        buf.append("{\n");
        append(buf, "id", person.getId().getId(), false);
        append(buf, "displayName", person.getDisplayName());
        append(buf, "profileUrl", person.getProfileUrl());
        append(buf, "thumbnailUrl", person.getThumbnailUrl());
        buf.append("\n}");
        return buf.toString();
    }

    public void testMediaItems() throws SociosException {
        MySpaceAdaptor adaptor = getMySpaceAdapter();

        MediaItemFilter filterMediaItem = new MediaItemFilter();
        KeyWordFilter titleFilter = new KeyWordFilter();
        filterMediaItem.setTitle(titleFilter);
        List<String> mediaTitleKeywords = titleFilter.getKeyword();
        mediaTitleKeywords.add("flowers");

        PersonFilter filterPerson = null; // new PersonFilter();
        PersonIdList personIdList = null; // new PersonIdList();

        KeyWordFilter keywordFilter = new KeyWordFilter();
        List<String> keywords = keywordFilter.getKeyword();
        keywords.add("test");
        filterMediaItem.setTags(keywordFilter);

        // ObjectId itemId = newObjectId(id);
        List<MediaItem> result = adaptor.findMediaItems(
            filterMediaItem,
            filterPerson,
            personIdList);
        assertNotNull(result);

        MediaItemIdList mediaItemIdList = new MediaItemIdList();
        List<ObjectId> list = mediaItemIdList.getMediaItemId();
        Set<String> set = new HashSet<String>();
        for (MediaItem item : result) {
            ObjectId id = item.getId();
            list.add(id);
            set.add(RequestUtility.toStringId(id));
            System.out.println(ObjectPrinter.serialize(item));
        }

        List<MediaItem> testItems = adaptor.getMediaItems(mediaItemIdList);
        System.out.println(" Numbero of found items by search: "
            + result.size());
        System.out.println(" Numbero of found items by identifiers: "
            + testItems.size());
        for (MediaItem item : testItems) {
            System.out.println(ObjectPrinter.serialize(item));
        }

        // assertEquals(result.size(), testItems.size());

    }

    public void testPeople() throws Exception {
        MySpaceAdaptor adaptor = getMySpaceAdapter();
        PersonIdList personIdList = new PersonIdList();
        personIdList.getPersonId().add(newObjectId("@me"));
        List<Person> persons = adaptor.getPersons(personIdList);
        assertNotNull(persons);
        assertTrue(persons.size() == 1);
        Person me = persons.get(0);
        String myId = me.getId().getId();
        assertNotNull(myId);

        persons = adaptor.myConnectedPersons(null);

        // Get all my friends and check that returned friend profiles
        // are the same when I retrieve them explicitly by user ids.
        Set<String> serializedPersons = new HashSet<String>();
        personIdList = new PersonIdList();
        List<ObjectId> list = personIdList.getPersonId();
        for (Person person : persons) {
            ObjectId personId = person.getId();
            list.add(personId);
            String str = ObjectPrinter.serialize(person);
            serializedPersons.add(str);
        }
        List<Person> testPersonList = adaptor.getPersons(personIdList);
        assertEquals(persons.size(), testPersonList.size());
        for (Person person : testPersonList) {
            String str = ObjectPrinter.serialize(person);
            assertTrue(serializedPersons.contains(str));
        }

        // Get all connections of each friend.
        // Check that if the user profile is open then it contains
        // myself in the list of friends.
        System.out.println("Friends: ");
        for (Person person : testPersonList) {
            System.out.println("=============================================");
            System.out.println(person.getDisplayName() + ":");
            System.out.println("---------------------------------------------");
            ObjectId personId = person.getId();
            try {
                List<Person> friends = adaptor.connectedPersons(personId);
                assertNotNull(friends);
                if (friends.isEmpty()) {
                    // It is a closed profile. So we can not get friends.
                    continue;
                }
                int pos = 0;
                for (Person friend : friends) {
                    if (pos > 0) {
                        System.out
                            .println(".............................................");
                    }
                    pos++;
                    String str = ObjectPrinter.serialize(friend);
                    System.out.println(str);
                }
            } catch (SociosException e) {
                System.out.println("ERROR! Can not load friends list!!");
            }
        }
    }
}
