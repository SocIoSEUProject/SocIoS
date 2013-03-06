/**
 * 
 */
package eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor;

import java.util.ArrayList;
import java.util.List;

import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonIdList;

/**
 * @author kotelnikov
 */
public class GetMethods extends RequestUtility {

    public static String friendsRequest(String str) {
        String url = String.format(
            "http://api.myspace.com/1.0/people/%s/@friends",
            str);
        return url;
    }

    private static String mediaItemRequest(
        ObjectId personId,
        ObjectId mediaItemId) {
        String requestUrl = String.format(
            "http://api.myspace.com/1.0/mediaItems/%s/@self/@videos/%s",
            toStringId(personId),
            toStringId(mediaItemId));
        return requestUrl;
    }

    public static List<String> mediaItemsRequest(List<ObjectId> personIds) {
        List<String> result = new ArrayList<String>();
        for (ObjectId personId : personIds) {
            String url = mediaItemsRequest(personId);
            if (url != null) {
                result.add(url);
            }
        }
        return result;
    }

    public static String mediaItemsRequest(ObjectId personId) {
        String personIdStr = toStringId(personId);
        String url = null;
        if (personIdStr != null) {
            StringBuilder buf = new StringBuilder(String.format(
                "http://api.myspace.com/1.0/mediaItems/%s/@self",
                personIdStr));
            url = buf.toString();
        }
        return url;
    }

    public static List<String> mediaItemsRequest(
        ObjectId personId,
        List<ObjectId> mediaItemIds) {
        List<String> result = new ArrayList<String>();
        for (ObjectId mediaItemId : mediaItemIds) {
            String url = mediaItemRequest(personId, mediaItemId);
            result.add(url);
        }
        return result;
    }

    public static List<String> mediaItemsRequest(PersonIdList personIdList) {
        List<ObjectId> personIds = personIdList.getPersonId();
        return mediaItemsRequest(personIds);
    }

    public static String peopleProfileRequest(String personId) {
        String requestUrl = String.format(
            "http://api.myspace.com/1.0/people/%s/@self",
            personId);
        return requestUrl;
    }
}
