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
 
package eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.DailyMotionUtilities;

/**
 *
 * @author G.A.P. II
 */

public class GetMethods {
	
	public static String getMediaItemsRequest(String mediaItemId) throws SociosException {
        if (mediaItemId == null || mediaItemId.trim().length() == 0) {
        	throw new InvalidInputException("InvalidInputException: No mediaItemId input");
        }

        StringBuilder requestUrl = new StringBuilder();
        requestUrl.append("https://api.dailymotion.com/video/");
        requestUrl.append(mediaItemId.replaceAll(" ", "%20"));
        requestUrl.append(DailyMotionUtilities.fields);

        return requestUrl.toString().trim();
    }
    

    public static String mediaItemsRequest(String mediaItemIds) throws SociosException {
        if (mediaItemIds == null || mediaItemIds.trim().length() == 0) {
        	throw new InvalidInputException("InvalidInputException: No mediaItemId input");
        }

        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(1);
        requestUrl.append("&ids=").append(mediaItemIds.replaceAll(" ", "%20"));
        requestUrl.append(DailyMotionUtilities.fields);

        return requestUrl.toString().trim();
    }
    
    
    public static String getPersonRequest(String userId) throws SociosException {
  	
    	if (userId == null || userId.trim().length() == 0) {
        	System.out.println("Dailymotion Getmethods class: userId is null");
        	throw new InvalidInputException("InvalidInputException: No userId input");
        }

        //creates the connection url for the dailymotion API
        StringBuilder requestUrl = DailyMotionUtilities.getPersonRequestUrl(1);
        requestUrl.append(userId.replaceAll(" ", "%20"));
        requestUrl.append("?fields=id,url,avatar_small_url,screenname,username");
        
       // https://api.dailymotion.com/user/xm13vs?fields=id,url,avatar_small_url,screenname,username
        
        return requestUrl.toString();
    }
    	
    
    
    
    public static String personRequest(String userId) throws SociosException {
    
        if (userId == null || userId.trim().length() == 0) {
        	System.out.println("Dailymotion Getmethods class: userId is null");
        	throw new InvalidInputException("InvalidInputException: No userId input");
        }

        //creates the connection url for the dailymotion API
        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(100); //xrisimopoieitai gia mediaitems
        requestUrl.append("&user=").append(userId.replaceAll(" ", "%20"));
        requestUrl.append(DailyMotionUtilities.fields);
        
        return requestUrl.toString();
    }
}