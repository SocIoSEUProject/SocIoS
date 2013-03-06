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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;

/**
 *
 * @author G.A.P. II
 */

public class ResponseRetriever {

	private final static Logger logger = LoggerFactory.getLogger(ResponseRetriever.class);
	
    public static String retrieveMediaItemsResponse(MediaItemIdList mediaItemIdList) throws SociosException{
    	 
    	String debug = String.format(
 				"\nResponseRetriever - 1, input size of list = %s", mediaItemIdList
 						.getMediaItemId().size());
 		logger.debug(debug);
 		

        //creates an array which contains a number of API calls
        final ArrayList<String> requestURLs = new ArrayList<String>();
        for (ObjectId id : mediaItemIdList.getMediaItemId()) {
            String url = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods.mediaItemsRequest(id.getId());
            if (url != null) {
            	System.out.println("url = " + url);
                requestURLs.add(url);
               
              debug = String.format(
        				"\nResponseRetriever - 2, requestURLs = %s", requestURLs);
        		logger.debug(debug);

            }
        }

        //creates asynchronous http requests for each different MediaItemId
        return HttpRequests.getFlickrAsynchronousHttpResponse("photo", requestURLs, false);
    }
    
    public static String retrieveUrlResponse(MediaItemIdList mediaItemIdList) throws SociosException{
   	 
    	String debug = String.format(
 				"\nretrieveUrlResponse - 1, input size of list = %s", mediaItemIdList
 						.getMediaItemId().size());
 		logger.debug(debug);
 		

        //creates an array which contains a number of API calls
        final ArrayList<String> requestURLs = new ArrayList<String>();
        for (ObjectId id : mediaItemIdList.getMediaItemId()) {
            String url = eu.sociosproject.sociosapi.server.adaptors.flickr.requestconstructor.GetMethods.urlRequest(id.getId());
            if (url != null) {
            	System.out.println("url = " + url);
                requestURLs.add(url);
               
              debug = String.format(
        				"\nretrieveUrlResponse - 2, requestURLs = %s", requestURLs);
        		logger.debug(debug);

            }
        }

        //creates asynchronous http requests for each different MediaItemId
        return HttpRequests.getFlickrAsynchronousHttpResponse("sizes", requestURLs, false);
    }
}
