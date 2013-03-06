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
 
package eu.sociosproject.sociosapi.server.local;

import java.util.List;

import javax.ejb.Local;

import socios.jpa.services.AccessInfo;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;
import eu.sociosproject.sociosvoc.KnownSns;


@Local
public interface DbManagerLocal {
	
	public List<SnsAccessTokens<?>> getAccessTokens(String sociosApiUserKey, List<Integer> snsIds );
	public AccessInfo getAccessInfoByUserIdAndSnsId(String userId, KnownSns sn);
	public int resolveSnId(KnownSns sn);
	public AccessInfo getAccessInfoByUserIdAndSnsId(String userId, int snId);
	public KnownSns resolveKnownSnById(int id);
	
	public AccessInfo getAccessInfoBySnsIdAndSnsUserId(int snId, String snsUserId);
}
