/*
 *  Copyright 2013 National Technical University of Athens
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
 
package eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities;

/**
 *
 * @author G.A.P. II
 */

public class DailyMotionUtilities {

    public static String fields = "&fields=id,title,tags,channel,description,language,"
            + "country,url,tiny_url,created_time,modified_time,taken_time,"
            + "type,mode,onair,live_publish_url,private,explicit,published,"
            + "duration,owner,owner_screenname,owner_url,owner_avatar_small_url,"
            + "owner_avatar_medium_url,owner_avatar_large_url,thumbnail_url"
            + ",owner_avatar_medium_url,owner_avatar_large_url,thumbnail_url,"
            + "thumbnail_small_url,thumbnail_medium_url,thumbnail_large_url,"
            + "rating,ratings_total,views_total,views_last_hour,views_last_day,"
            + "views_last_week,views_last_month,comments_total,bookmarks_total,"
            + "embed_html,embed_url,aspect_ratio";

    public static StringBuilder getRequestUrl(int limit) {
        StringBuilder requestUrl = new StringBuilder();
        requestUrl.append("https://api.dailymotion.com/videos?");
        requestUrl.append("limit=").append(limit);

        return requestUrl;
    }
    
    public static StringBuilder getPersonRequestUrl(int limit) {
        StringBuilder requestUrl = new StringBuilder();
        requestUrl.append("https://api.dailymotion.com/user/");
        
        return requestUrl;
    }
    
    public static String getFriendsRequest(String userId) {
    	
    	StringBuilder requestUrl = new StringBuilder();
    	requestUrl.append("https://api.dailymotion.com");
    	requestUrl.append("/user/" + userId + "/following"); 
    	//requestUrl.append("/user/" + userId + "/friends");    	
    	requestUrl.append("&fields=id,username,screenname,avatar_small_url,url");
    	return  requestUrl.toString();
    }
    
    public static String getInDegreeRequest(String userId ) {
    
    	return "https://api.dailymotion.com/user/" + userId + "/fans&fields=id";
    }
        
    public static String getOutDegreeRequest(String userId) {
    	return "https://api.dailymotion.com/user/" + userId + "/following";
    }
    
    public static String getDegreeRequest(String userId) {
    	return "https://api.dailymotion.com/user/" + userId + "/friends";
    }    
}