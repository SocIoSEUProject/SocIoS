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

import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.Constants;
import eu.sociosproject.sociosapi.server.adaptors.flickr.corefunctionalities.RequestUtilities;

/**
 * 
 * @author G.A.P. II
 */

public class FindConnectedMethods {

	public static String connectedPersonsRequest(String personId) {

		StringBuilder requestUrl = RequestUtilities
				.basicRequestUrl("flickr.contacts.getPublicList");
		requestUrl.append("&user_id=");
		requestUrl.append(personId);

		return requestUrl.toString();
	}

	/*
    public static String myConnectedPersonsRequest() {
    	
    	String auth_token = "72157629151686618-b4a395a185a70ebf";
        String sig = Constants.API_SECRET + "api_key" + Constants.API_KEY + "auth_token" + auth_token + "formatjson" + "methodflickr.contacts.getList" + "nojsoncallback1";
        System.out.println("sig: " + sig);
        String api_sig = GenerateMd5.MD5(sig);
        
        StringBuilder requestUrl = RequestUtilities.basicRequestUrl("flickr.contacts.getList");
        
        requestUrl.append("&auth_token=");
        requestUrl.append(auth_token);
        requestUrl.append("&api_sig=");
        requestUrl.append(api_sig);
        
        return requestUrl.toString();
    }
    */
}