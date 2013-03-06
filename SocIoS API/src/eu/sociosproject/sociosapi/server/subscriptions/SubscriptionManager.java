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
 
package eu.sociosproject.sociosapi.server.subscriptions;

import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosvoc.Source;
import eu.sociosproject.sociosvoc.TopicsInSN;
import socios.jpa.services.subscriptionservice.SubscriptionReport;
import socios.jpa.services.subscriptionservice.SubscriptionService_Service;
import socios.jpa.services.subscriptionservice.SubscriptionService;


public class SubscriptionManager {
	public boolean isSubscribed(ObjectId id) {
		SubscriptionService_Service ss = new SubscriptionService_Service();
		 SubscriptionService port = ss.getSubscriptionServicePort();
		 
		System.out.println("Invoking isSubscribed....");
		boolean result = false;
		try{
			result = port.isSubscribed(id.getId(), resolveSnId(id.getSource().getKnownSns()));
		}catch (Exception ex){
			 System.out.println(ex.toString());
		 			 return false;
		 }
		 return result;
	}
	
    public int createSubscription(int serviceId, String serviceUrl, ObjectId id){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		 
		System.out.println("Invoking createSubscription....");
		return port.createUserSubscription(serviceId, serviceUrl, resolveSnId(id.getSource().getKnownSns()), id.getId());
    }
    
    public int createTopicSubscription(int serviceId, String serviceUrl, TopicsInSN topics){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		 
		System.out.println("Invoking createTopicSubscription....");
		String topicsAsString = "";
		for(String topic:topics.getTopics())
			topicsAsString=topicsAsString+"||"+topic;
		
		return port.createTopicSubscription(serviceId, serviceUrl, resolveSnId(topics.getKnownSns()), topicsAsString);
	}
    
    public boolean deleteSubscription(int subscriptionId){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		 
		System.out.println("Invoking deleteSubscribed...");
		return port.deleteUserSubscription(subscriptionId);
    }
    
    public boolean deleteTopicSubscription(int subscriptionId){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		 
		System.out.println("Invoking deleteTopicSubscribed...");
		return port.deleteTopicSubscription(subscriptionId);
    }
    
    public KnownSns getSubscribedTopic(int subscriptionId){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		
		System.out.println("Invoking getSubscriptionTopic...");
		//return port.
		return KnownSns.TWITTER;
    }
    
    public ObjectId getSubscribedUser(int subscriptionId){
    	SubscriptionService_Service ss = new SubscriptionService_Service();
		SubscriptionService port = ss.getSubscriptionServicePort();
		 		 
		System.out.println("Invoking getSubscribedUser...");
		SubscriptionReport user = port.getSubscribedUser(subscriptionId);
		
		ObjectId response = new ObjectId();
		response.setId(user.getUserId());
		Source sn = new Source();
		sn.setKnownSns(resolveKnownSns(user.getSnsId()));
		response.setSource(sn);
		return response;
    }
   
    
    private KnownSns resolveKnownSns(int index){
    	switch (index){
    	case 1: return KnownSns.FLICKR;
    	case 2: return KnownSns.FACEBOOK;
    	case 3: return KnownSns.TWITTER;
    	case 4: return KnownSns.YOUTUBE;
    	case 5: return KnownSns.MYSPACE;
    	case 6: return KnownSns.DAILYMOTION;
    	}
    	return null;
    	
    }
	private int resolveSnId(KnownSns sn) {
		if (sn==null) return 0;
		if(sn.equals(KnownSns.FLICKR)) {
			return 1;
		}else if(sn.equals(KnownSns.DAILYMOTION)) {
			return 6;
		}else if(sn.equals(KnownSns.FACEBOOK)) {
			return 2;
		}else if(sn.equals(KnownSns.MYSPACE)) {
			return 5;
		}else if(sn.equals(KnownSns.TWITTER)) {
			return 3;
		}else if(sn.equals(KnownSns.YOUTUBE)) {
			return 4;
		}else 
			return 0;
			
	}	
}
