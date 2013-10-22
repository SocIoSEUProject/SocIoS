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
 
package eu.sociosproject.sociosapi.server;

import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokensRetriever;
import eu.sociosproject.sociosapi.server.adaptors.CompositeAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.SnsAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.DailymotionAcessTokens;
import eu.sociosproject.sociosapi.server.adaptors.flickr.FlickrAcessTokens;
import eu.sociosproject.sociosapi.server.adaptors.googlep.GooglepAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.instagram.InstagramAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.myspace.MySpaceAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.youtube.YoutubeAcessTokens;
import eu.sociosproject.sociosapi.server.local.CompositeAdaptorFactoryLocal;
import eu.sociosproject.sociosapi.server.local.CompositeLocal;
import eu.sociosproject.sociosapi.server.local.SnsAccessTokensRetrieverLocal;
import eu.sociosproject.sociosvoc.KnownSns;

@Stateless
public class CompositeAdaptorFactory implements CompositeAdaptorFactoryLocal {

	@EJB
	private SnsAccessTokensRetrieverLocal accessTokensRetriever;
		
	
	//@Override
	public /*SnsAdaptor*/ CompositeLocal create(String sociosApiUserKey, List<KnownSns> sns ) {
		
		System.out.println("[CompositeAdaptorFactory.create]");
		
		List<SnsAccessTokens<?>> tokens = Lists.newArrayList();
		
		if(sociosApiUserKey == null || sociosApiUserKey.trim().equals("")) {
		
			Iterator<KnownSns> it = sns.iterator();
			while(it.hasNext()) {
				KnownSns sn = it.next();
				tokens.add(resolveSn(sn));
			}					
		}else {	
			Iterator<KnownSns> it = sns.iterator();
			List<Integer> snsIds = Lists.newArrayList();
			while(it.hasNext()) {
				KnownSns sn = it.next();
				snsIds.add(resolveSnId(sn));
			}	
			if(accessTokensRetriever == null)
				System.out.println("accessTokensRetriever null");
			else 
				System.out.println("accessTokensRetriever not null");
			List<SnsAccessTokens<?>> storedTokens = accessTokensRetriever.getAccessTokens(sociosApiUserKey,snsIds);		
			tokens.addAll(storedTokens);
		}
		
		System.out.println("@create : tokens.size = " + tokens.size());
		List<SnsAdaptor> snsAdaptors = Lists.newArrayList();
		for (SnsAccessTokens<?> token : tokens) {
			//System.out.println("Examining token " + token.getClass());
			SnsAdaptor adaptor =  token.create();
			
			if(adaptor == null)  {
				System.out.println("adaptor is null");
			}else{
				System.out.println("@create Adding adaptor : " + adaptor.getClass());
				snsAdaptors.add(adaptor);
			}
		}
		return new CompositeAdaptor(snsAdaptors);
	}
	
	private SnsAccessTokens<?> resolveSn(KnownSns sn) {
		if(sn.equals(KnownSns.FLICKR)) {
			return new FlickrAcessTokens("random");
		}else if(sn.equals(KnownSns.DAILYMOTION)) {
			return new DailymotionAcessTokens("random");
		}else if(sn.equals(KnownSns.MYSPACE)) {
			return new MySpaceAccessTokens("random", "random");
		}else if(sn.equals(KnownSns.YOUTUBE)) {
			return new YoutubeAcessTokens("random");
		}else if(sn.equals(KnownSns.GOOGLEP)) {
			return new GooglepAccessTokens("random");
		}else if(sn.equals(KnownSns.INSTAGRAM)) {
			return new InstagramAccessTokens("random");
		}else{
			return null;
		}
	}
	
	private int resolveSnId(KnownSns sn) {
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
		}else if(sn.equals(KnownSns.GOOGLEP)) {
			return 7;
		}else if(sn.equals(KnownSns.INSTAGRAM)) {
			return 8;
		}else
			return 0;
			
	}	

}
