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
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.corefunctionalities.DailyMotionUtilities;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.requestconstructor.GetMethods;
import eu.sociosproject.sociosvoc.AddressLocationFilter;
import eu.sociosproject.sociosvoc.LocationFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author G.A.P. II
 */

public class FindMethods {

     /*
     * Creates the dailymotion API call for the mediaItemFilter object
     * and gets the string response from dailymotion in JSON format
     */
    public static String mediaItemsRequest(MediaItemFilter mediaItemFilter) {
        if (mediaItemFilter == null) {
        	System.out.println("mediaItemFilter is null");
            return null;
        }
        //System.out.println("before StringBuilder requestUrl");

        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(50);
       // System.out.println("mediaItemsRequest requestUrl: " + requestUrl);
        StringBuilder additionalParameters = new StringBuilder();
        
            
        if (mediaItemFilter.getDescription() != null) {
            for (String keyword : mediaItemFilter.getDescription().getKeyword()) {
                additionalParameters.append(keyword).append(" ");
            }
        }
        if (mediaItemFilter.getTitle() != null) {
            for (String keyword : mediaItemFilter.getTitle().getKeyword()) {
                additionalParameters.append(keyword).append(" ");
            }
        }
        String totalSearch = additionalParameters.toString().trim().replaceAll(" ", "%20");
        if (0 < totalSearch.length()) {
            requestUrl.append("&search=");
            requestUrl.append(totalSearch);
        }
        
//        if(mediaItemFilter.getId() == null) 
//        	System.out.println("ids @@@ is null");
//        else
//        	System.out.println("ids @@@ is NOT null");
        
        if (mediaItemFilter.getId() != null) {
        	StringBuilder idParameters = new StringBuilder();
            //additionalParameters = new StringBuilder();
            for (ObjectId id : mediaItemFilter.getId().getObjectId()) {
            	idParameters.append(id.getId().toString()).append(",");
            }
            requestUrl.append("&ids=");
            requestUrl.append(idParameters.toString());

            //requestUrl.append(idParameters.toString());
        }

        additionalParameters = new StringBuilder();
        if (mediaItemFilter.getTags() != null) {
            for (String keyword : mediaItemFilter.getTags().getKeyword()) {
                additionalParameters.append(keyword).append(" ");
            }
        }
//        if (mediaItemFilter.getTaggedPeople() != null) {
//            for (String keyword : mediaItemFilter.getTags().getKeyword()) {
//                additionalParameters.append(keyword).append(" ");
//            }
//        }
        String totalTags = additionalParameters.toString().trim().replaceAll(" ", "%20");
        if (0 < totalTags.length()) {
            requestUrl.append("&tag=");
            requestUrl.append(totalTags);
        }

        if ((mediaItemFilter.getLanguage() != null)) {
            StringBuilder languageParameters = new StringBuilder();
            for (String keyword : mediaItemFilter.getLanguage().getKeyword()) {
            	languageParameters.append(keyword).append(" ");
            }

            String totalLanguage = languageParameters.toString().trim().replaceAll(" ", "%20");
            if (0 < totalLanguage.length()) {
                requestUrl.append("&language=");
                requestUrl.append(totalLanguage);
            }
        }

        StringBuilder userIds = new StringBuilder();
        if (mediaItemFilter.getUserId().getObjectId() != null) {
            for (ObjectId userid : mediaItemFilter.getUserId().getObjectId()) {
                userIds.append(userid.getId().toString()).append(" ");
                System.out.println("userid.getId().toString() "
                        + userid.getId().toString());
            }
            String totalUserIds = userIds.toString().trim()
                    .replaceAll(" ", "%20");
            if (0 < totalUserIds.length()) {
                requestUrl.append("&owner=").append(totalUserIds);
            }
        }
        
        //testing localization
        //requestUrl.append("&localization=fr");
       
        requestUrl.append(DailyMotionUtilities.fields);

        return requestUrl.toString();
    }

    /*
     * Creates the dailymotion API call for the PersonIdList object
     * and gets the string response from dailymotion in JSON format
     */
    public static String mediaItemsUserRequest(String personId) throws SociosException{
        if (personId == null) {
            return null;
        }
        
        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(50);
    	requestUrl.append("&owner=");
    	requestUrl.append(personId);
    	 requestUrl.append(DailyMotionUtilities.fields);
    	return requestUrl.toString(); 
 
    }

    /*
     * Creates the dailymotion API call for the FilterPerson object
     * and gets the string response from dailymotion in JSON format
     */
    public static String mediaItemsRequest(PersonFilter personFilter) {
        if (personFilter == null) {
            return null;
        }

        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(100);

        StringBuilder tags = new StringBuilder();
        if (personFilter.getDisplayName() != null) {
            for (String keyword : personFilter.getDisplayName().getKeyword()) {
                tags.append(keyword).append(" ");
            }

            String tagsField = tags.toString().trim();
            if (0 < tagsField.length()) {
                requestUrl.append("&tag=");
                requestUrl.append(tagsField.replaceAll(" ", "%20"));
            }
        }

        StringBuilder search = new StringBuilder();
        search.append(tags);

        if (personFilter.getCurrentLocation() != null) {
            AddressLocationFilter addressFilter = personFilter.getCurrentLocation().getAddressFilter();
            if (addressFilter != null) {
                if (addressFilter.getCountry() != null) {
                    search.append(addressFilter.getCountry()).append(" ");
                }
                if (addressFilter.getPostalCode() != null) {
                    search.append(addressFilter.getPostalCode()).append(" ");
                }
                if (addressFilter.getRegion() != null) {
                    search.append(addressFilter.getRegion()).append(" ");
                }
            }
        }

        if (personFilter.getAddresses() != null) {
            for (LocationFilter locationFinder : personFilter.getAddresses()) {
                AddressLocationFilter addressFilter = locationFinder.getAddressFilter();
                if (addressFilter != null) {
                    if (addressFilter.getCountry() != null) {
                        search.append(addressFilter.getCountry()).append(" ");
                    }
                    if (addressFilter.getPostalCode() != null) {
                        search.append(addressFilter.getPostalCode()).append(" ");
                    }
                    if (addressFilter.getRegion() != null) {
                        search.append(addressFilter.getRegion()).append(" ");
                    }
                }
            }
        }

        String searchField = search.toString().trim();
        if (0 < searchField.length()) {
            requestUrl.append("&search=").append(searchField.replaceAll(" ", "%20"));
        }
        requestUrl.append(DailyMotionUtilities.fields);

        return requestUrl.toString();
    }

    /*
     *  creates the API call  for the dailymotion for the mediaItemIdList object
     *  and returns the string response of the API call in JSON format
     *
     */
   // public static String personRequest(ObjectId[] mediaItemIdList) {
    public static String personRequest(MediaItemIdList mediaItemIdList) {
        if (mediaItemIdList == null) {
            return null;
        }

        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(1); //itan 100

        StringBuilder mediaItemIds = new StringBuilder();
        for (ObjectId id : mediaItemIdList.getMediaItemId()) {
            mediaItemIds.append(" ").append(id.getId().toString());
        }

        String concatenatedIds = mediaItemIds.toString().trim();
        if (0 < concatenatedIds.length()) {
            requestUrl.append("&ids=").append(concatenatedIds.replaceAll(" ", "%20"));
            requestUrl.append(DailyMotionUtilities.fields);
        }

        return requestUrl.toString();
    }

    /*
     *  creates the API call  for the dailymotion for the personFilter object
     *  and returns the string response of the API call in JSON format
     *
     */
    public static String personRequest(PersonFilter personFilter) {
        if (personFilter == null) {
        	System.out.println("DailyMotion findmethods: personFilter is null");
            return null;
        }

        StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(1);  //itan 10

        //StringBuilder tags = new StringBuilder();
        StringBuilder owner = new StringBuilder();
        if (personFilter.getDisplayName() != null) {
        	
        	for(String keyword : personFilter.getDisplayName().getKeyword()){
        		owner.append(keyword).append(" ");
        	}
        	String allOwner = owner.toString().trim();
        	if (0 < allOwner.length()) {
              requestUrl.append("&owner=").append(allOwner.replaceAll(" ", "%20"));
            } 
        	
//            for (String keyword : personFilter.getDisplayName().getKeyword()) {
//                tags.append(keyword).append(" ");
//            }
//
//            String allTags = tags.toString().trim();
//            if (0 < allTags.length()) {
//                requestUrl.append("&tag=").append(allTags.replaceAll(" ", "%20"));
//            }
        }

        StringBuilder search = new StringBuilder();
        //search.append(tags);

        LocationFilter location = personFilter.getCurrentLocation();
        if (location != null) {
            AddressLocationFilter address = location.getAddressFilter();
            if (address != null) {
                if (address.getCountry() != null) {
                    search.append(address.getCountry()).append(" ");
                }
                if (address.getPostalCode() != null) {
                    search.append(address.getPostalCode()).append(" ");
                }
                if (address.getRegion() != null) {
                    search.append(address.getRegion()).append(" ");
                }
            }
        }

        List<LocationFilter> addresses = personFilter.getAddresses();
        if (addresses != null) {
            for (LocationFilter locationFilter : addresses) {
                AddressLocationFilter address = locationFilter.getAddressFilter();
                if (address != null) {
                    if (address.getCountry() != null) {
                        search.append(address.getCountry()).append(" ");
                    }
                    if (address.getPostalCode() != null) {
                        search.append(address.getPostalCode()).append(" ");
                    }
                    if (address.getRegion() != null) {
                        search.append(address.getRegion()).append(" ");
                    }
                }
            }
        }

        String searchFields = search.toString().trim();
        if (0 < searchFields.length()) {
            requestUrl.append("&search=").append(searchFields.replaceAll(" ", "%20"));
        }

        requestUrl.append(DailyMotionUtilities.fields);
        return requestUrl.toString();
    }
    
    
    //new requestUrl
    
    public static String recentMediaItemsRequest(String personId) throws SociosException{ //take the recent (ten days) photos
        
    	if (personId == null) {
            return null;
        }
       
    	StringBuilder requestUrl = DailyMotionUtilities.getRequestUrl(15);
    	requestUrl.append("&owner=");
    	requestUrl.append(personId);
    	 requestUrl.append(DailyMotionUtilities.fields);
    	return requestUrl.toString(); 
                
    }
    
    
    /*
     * Creates the dailymotion API call for the PersonIdList object
     * and gets the string response from dailymotion in JSON format
     */
    public static ArrayList<String> mediaItemsRequest(ObjectId[] personIdList) throws SociosException{
        if (personIdList == null) {
            return null;
        }

        final ArrayList<String> requestUrls = new ArrayList<String>();
        for (ObjectId id : personIdList) {
            String newRequestUrl = GetMethods.personRequest(id.getId().toString());
            System.out.println("newRequestUrl = " + newRequestUrl);
            if (newRequestUrl != null) {
                requestUrls.add(newRequestUrl);
            }
        }

        return requestUrls;
    }
   
}