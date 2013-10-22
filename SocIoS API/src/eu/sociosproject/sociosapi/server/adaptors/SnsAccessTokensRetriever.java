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
 
package eu.sociosproject.sociosapi.server.adaptors;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;

import socios.jpa.services.AccessInfo;
import socios.jpa.services.AccessInfoPK;
import socios.jpa.services.TokenService;
import socios.jpa.services.TokenServiceService;

import com.google.common.collect.Lists;

import eu.sociosproject.sociosapi.server.adaptors.dailymotion.DailymotionAcessTokens;
import eu.sociosproject.sociosapi.server.adaptors.flickr.FlickrAcessTokens;
import eu.sociosproject.sociosapi.server.adaptors.googlep.GooglepAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.instagram.InstagramAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.myspace.MySpaceAccessTokens;
import eu.sociosproject.sociosapi.server.adaptors.youtube.YoutubeAcessTokens;
import eu.sociosproject.sociosapi.server.local.DbManagerLocal;
import eu.sociosproject.sociosapi.server.local.SnsAccessTokensRetrieverLocal;


@Stateless
public class SnsAccessTokensRetriever implements SnsAccessTokensRetrieverLocal{
	@EJB
	DbManagerLocal dbManager;
	
	public List<SnsAccessTokens<?>> getAccessTokens(String sociosApiUserKey, List<Integer> snsIds ) {
		List<SnsAccessTokens<?>> tokens = Lists.newArrayList();
		List<AccessInfo> tokensFromDb = Lists.newArrayList();
		
		
		for(int id : snsIds) {
			System.out.println("[getAccessTokens] id = " + id + " userId =  " + Integer.parseInt(sociosApiUserKey));			
			//AccessInfo info = port.getAccessInfoByUserIdAndSnsIs(Integer.parseInt(sociosApiUserKey), id);
			AccessInfo info = dbManager.getAccessInfoByUserIdAndSnsId(sociosApiUserKey, id);

			if(info != null)
				tokensFromDb.add(info);
			else {
				AccessInfo temp = new AccessInfo();
				AccessInfoPK pk = new AccessInfoPK();
				pk.setSnsId(id);
				pk.setUserId(Integer.parseInt(sociosApiUserKey));
				
				if(id == 3)					
					temp.setAccessToken("random@random@random@random");
				else 
					temp.setAccessToken("random");
				
				temp.setAccessInfoPK(pk);
				
				tokensFromDb.add(temp);
			}
		}		
		    
		for(AccessInfo t : tokensFromDb) {
			if(t.getAccessInfoPK().getSnsId() == 1) {
				
				FlickrAcessTokens flickRtoken = new FlickrAcessTokens(t.getAccessToken());
				System.out.println("Adding flickr token : " + t.getAccessToken());
				tokens.add(flickRtoken);
			
			}else if(t.getAccessInfoPK().getSnsId() == 4){
				YoutubeAcessTokens youtubeToken = new YoutubeAcessTokens(t.getAccessToken());
				System.out.println("Adding Youtube token");
				tokens.add(youtubeToken);
			}else if(t.getAccessInfoPK().getSnsId() == 6){
				DailymotionAcessTokens dailymotionToken = new DailymotionAcessTokens(t.getAccessToken());
				System.out.println("Adding Dailymotion token");
				tokens.add(dailymotionToken);
			}else if(t.getAccessInfoPK().getSnsId() == 5){
		        String accessToken = "pw465GbWLTu+Fowq8G2EO5zLapH29q8qIzu8w8nsoGMA5JfA60dss7Og1P7Xy7veiRWqTIgAC0j0CyCydJ+9juZme7sLLqeBjIqcMNvdIwk=";
		        String accessSecret = "09865b3e1184465996ef943629eb767046a5204cd79440acaeb7ecf302cdda11";
				MySpaceAccessTokens myspaceToken = new MySpaceAccessTokens(accessToken, accessSecret); 
				System.out.println("Adding MySpace token");
				tokens.add(myspaceToken);
			}else if(t.getAccessInfoPK().getSnsId() == 7){
				GooglepAccessTokens googlepToken = new GooglepAccessTokens(t.getAccessToken());
				System.out.println("Adding GoogleP token");
				tokens.add(googlepToken);
			}else if(t.getAccessInfoPK().getSnsId() == 8){
				InstagramAccessTokens instagramToken = new InstagramAccessTokens(t.getAccessToken());
				System.out.println("Adding Instagram token");
				tokens.add(instagramToken);
			}
			
		}
					
		return tokens;
	}
	



}
