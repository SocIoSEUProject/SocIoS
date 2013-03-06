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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor;

import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities;


/**
 *
 * @author G.A.P. II
 */

public class GetMethods {

    /*
     * Constructs the API call for hte flickr.photos.getInfo method
     * returns a string response in JSON format or null
     *
     */
    public static String mediaItemsRequest(String mediaItemId) {
        if (mediaItemId == null) {
            return null;
        }

        StringBuilder requestUrl = RequestUtilities.basicRequestUrl("flickr.photos.getInfo");
        requestUrl.append("&photo_id=");
        requestUrl.append(mediaItemId);

        return requestUrl.toString();
    }
    
    /*
     * Constructs the API call for hte flickr.photos.getSizes method
     * returns a string response in JSON format or null
     *
     */
    public static String urlRequest(String mediaItemId) {
        if (mediaItemId == null) {
            return null;
        }

        StringBuilder requestUrl = RequestUtilities.basicRequestUrl("flickr.photos.getSizes");
        requestUrl.append("&photo_id=");
        requestUrl.append(mediaItemId);

        return requestUrl.toString();
    }

    /*
     *  creates the API call for the flickr.people.getInfo method
     *
     */
    public static String personRequest(String personId) {
        if (personId == null) {
            return null;
        }

        StringBuilder requestUrl = RequestUtilities.basicRequestUrl("flickr.people.getInfo");
        requestUrl.append("&user_id=");
        requestUrl.append(personId);

        return requestUrl.toString();
    }
    
    public static String nummFavoritesRequest(String mediaItemId){
        if (mediaItemId == null) {
            return null;
        }

        StringBuilder requestUrl = RequestUtilities.basicRequestUrl("flickr.photos.getFavorites");
        requestUrl.append("&photo_id=");
        requestUrl.append(mediaItemId);
        
      //  System.out.println("requestUrl numFavorites: " + requestUrl);
        return requestUrl.toString();
    }
    
    /*
     public String getNumFavorites(String mediaItemId) throws JSONException, SociosException{
        
        String url = RequestConstructor.GetMethods.nummFavoritesRequest(mediaItemId);
       
        String aggregatedResponse = HttpRequests.getSynchronousHttpResonse(url);
      
        System.out.println("response: " + aggregatedResponse);
        return ResponseParser.GetMethods.parseNumFavorites(aggregatedResponse);
    }
    */

}