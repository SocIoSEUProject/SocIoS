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

/**
 *
 * @author G.A.P. II
 */


import java.math.BigInteger;
import java.security.MessageDigest;

public class RequestUtilities implements Constants {

    public static StringBuilder basicRequestUrl(String method) {
        StringBuilder url = new StringBuilder();
        url.append("http://api.flickr.com/services/rest/?");
        url.append("method=");
        url.append(method);
        url.append("&api_key=");
        url.append(API_KEY);
        url.append("&format=");
        url.append("json");
        url.append("&nojsoncallback=");
        url.append("1");

        return url;
    }

    public static StringBuilder extendedRequestUrl(String method) {
        StringBuilder url = new StringBuilder(); 
        url.append("http://api.flickr.com/services/rest/?");
        url.append("method=");
        url.append(method);
        url.append("&api_key=");
        url.append(API_KEY);
        url.append("&format=");
        url.append("json");
        url.append("&nojsoncallback=");
        url.append("1");
        url.append("&extras=");
        url.append("description,date_upload,date_taken,owner_name,");
        url.append("icon_server,original_format,last_update,geo,tags,");
        url.append("machine_tags,o_dims,views,media,path_alias,url_sq,");
        url.append("url_t,url_s,url_m,url_z,url_l,url_o");

        return url;
    }
    
    public static String MD5(String text) {
        String md5Text = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			md5Text = new BigInteger(1, digest.digest((text).getBytes())).toString(16);
		} catch (Exception e) {
			System.out.println("Error in call to MD5");
		}
		
        if (md5Text.length() == 31) {
            md5Text = "0" + md5Text;
        }
		return md5Text;
	}  
}
