package eu.sociosproject.sociosapi.server.adaptors.youtube.apiproxy;

import com.google.common.base.Joiner;

/**
 *
 * @author kGiannakakis
 */
public class YouTubeRequestUrlFactory {
    private static String baseUrl = "http://gdata.youtube.com/feeds/api/";
    
    public static String getUserProfileUrl(String username) {
        return String.format("http://gdata.youtube.com/feeds/api/users/%s", 
                             username);
    }
    public static String getUserContactsUrl(String username) {
        return String.format("http://gdata.youtube.com/feeds/api/users/%s/contacts", 
                             username);
    }

    public static String getVideoUrl(String videoId) {
        return String.format("http://gdata.youtube.com/feeds/api/videos/%s", 
                             videoId);
    }
    
    public static String getMessagesUrl(String username) {
        return String.format("http://gdata.youtube.com/feeds/api/users/%s/inbox", 
                             username);
    }    
    
    public static String getVideosBaseUrl() {
        return "http://gdata.youtube.com/feeds/api/videos";
    }
    
    public static String getActivitiesUrl(String[] users) {
        return String.format("http://gdata.youtube.com/feeds/api/events?author=%s", 
                             Joiner.on(',').join(users));        
    }
	
	public static String findActivitiesUrl(String user) {
        return String.format("http://gdata.youtube.com/feeds/api/users/%s/uploads", 
                             user);        
    }
	

    
    public static String getFriendsActivitiesUrl() {
        return "http://gdata.youtube.com/feeds/api/users/live/friendsactivity";
    }
}
