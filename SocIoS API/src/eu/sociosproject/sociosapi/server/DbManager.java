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

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;

import socios.jpa.services.AccessInfo;
import socios.jpa.services.TokenService;
import socios.jpa.services.TokenServiceService;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;
import eu.sociosproject.sociosapi.server.local.DbManagerLocal;
import eu.sociosproject.sociosvoc.KnownSns;


@Stateless
public class DbManager implements DbManagerLocal {

	private TokenService tokenDbPort;	
	
	@PostConstruct
	private void initialize() {
		TokenServiceService ss = new TokenServiceService();
		this.tokenDbPort = ss.getTokenServicePort();
		
		
	}
	
	
	@Override
	public List<SnsAccessTokens<?>> getAccessTokens(String sociosApiUserKey,
			List<Integer> snsIds) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public AccessInfo getAccessInfoByUserIdAndSnsId(String userId, KnownSns sn) {
		
		AccessInfo response = new AccessInfo();
		int snId = resolveSnId(sn);
		response = tokenDbPort.getAccessInfoByUserIdAndSnsIs(Integer.parseInt(userId), snId);
		
		return response;
	}
	
	@Override
	public AccessInfo getAccessInfoByUserIdAndSnsId(String userId, int snId) {
		
		AccessInfo response = new AccessInfo();		
		response = tokenDbPort.getAccessInfoByUserIdAndSnsIs(Integer.parseInt(userId), snId);
		
		return response;
	}	
	
	@Override
	public AccessInfo getAccessInfoBySnsIdAndSnsUserId(int snId, String snsUserId){
		AccessInfo response = new AccessInfo();
		response = tokenDbPort.getAccessInfoBySnsIdAndSnsUserId(snId, snsUserId);
		
		return response;
	}
	
	@Override
	public int resolveSnId(KnownSns sn) {
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
	
	@Override
	public KnownSns resolveKnownSnById(int id) {

		if (id == 1)
			return KnownSns.FLICKR;
		else if (id == 2)
			return KnownSns.FACEBOOK;
		else if (id == 3)
			return KnownSns.TWITTER;
		else if (id == 4)
			return KnownSns.YOUTUBE;
		else if (id == 5)
			return KnownSns.MYSPACE;
		else if (id == 6)
			return KnownSns.DAILYMOTION;
		else if (id == 7)
			return KnownSns.GOOGLEP;
		else if (id == 8)
			return KnownSns.INSTAGRAM;
		else 
			return null;
	}	

}
