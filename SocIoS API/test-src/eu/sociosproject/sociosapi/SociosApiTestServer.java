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
 

package eu.sociosproject.sociosapi;

import javax.xml.ws.Endpoint;

import com.google.common.collect.ImmutableList;

import eu.sociosproject.sociosapi.server.CompositeAdaptorFactory;
import eu.sociosproject.sociosapi.server.SociosApiImpl;
import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokensRetriever;
import eu.sociosproject.sociosapi.server.adaptors.example.ExampleAccessTokensDao;
import eu.sociosproject.sociosapi.server.adaptors.flickr.FlickrAccessTokensDao;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.DailymotionAccessTokensDao;
//import eu.sociosproject.sociosapi.server.adaptors.twitter.TwitterAccessTokensDao;
import eu.sociosproject.sociosapi.server.adaptors.youtube.YoutubeAccessTokensDao;

/**
 * Socios API Test server.
 * 
 * @author Nikos Ioannou 
 */
public class SociosApiTestServer{

    protected SociosApiTestServer() throws java.lang.Exception {
        
    	//Object implementor = new SociosApiImpl(createComopsiteAdaptorFactory());
    	Object implementor = new SociosApiImpl();
        String address = "http://localhost:8181/sociosApi/";
        Endpoint.publish(address, implementor);
    }
    
    /*
    private CompositeAdaptorFactory createComopsiteAdaptorFactory() {
    	return new CompositeAdaptorFactory(createSnsAccessTokensRetriever());
    }
    
    private SnsAccessTokensRetriever createSnsAccessTokensRetriever() {
		// The rest of the DAOs must be added here
		return new SnsAccessTokensRetriever(ImmutableList.of(
				//new ExampleAccessTokensDao(),
				new DailymotionAccessTokensDao() ,
				new TwitterAccessTokensDao()
				//new FlickrAccessTokensDao() ,
				//new YoutubeAccessTokensDao()
		));
	}
	*/

	public static void main(String args[]) throws java.lang.Exception { 
        new SociosApiTestServer();
        System.out.println("Server ready..."); 
        
        Thread.sleep(5 * 60 * 60 * 1000); 
        System.out.println("Server exiting");
        System.exit(0);
    }
}
