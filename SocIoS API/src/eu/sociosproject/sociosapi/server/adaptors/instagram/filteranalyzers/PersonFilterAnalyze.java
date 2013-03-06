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
 
package eu.sociosproject.sociosapi.server.adaptors.instagram.filteranalyzers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.server.adaptors.AbstractFilterAnalyze;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonFilter;

/**
 * 
 * @author pielakm
 * 
 */
public class PersonFilterAnalyze extends AbstractFilterAnalyze {
	/**
	 * logger for log to file information about program action
	 */
	private Logger logger = LoggerFactory.getLogger(PersonFilterAnalyze.class);

	/**
	 * 
	 * @param personFilter
	 * @return
	 */
	public String getQueryFromFilter(PersonFilter personFilter) {
		StringBuilder queryBuilder = new StringBuilder();
		if (personFilter.getDisplayName() != null)
			queryBuilder = appendToQueryIfFilled(personFilter.getDisplayName(),
					queryBuilder);
//		if (personFilter.getEmails() != null)
//			queryBuilder = appendToQueryIfFilled(personFilter.getEmails(),
//					queryBuilder);
//		if (personFilter.getGender() != null)
//			queryBuilder = appendToQueryIfFilled(personFilter.getGender(),
//					queryBuilder);

		logger.debug("getQueryFromFilter - 1, output = "
				+ queryBuilder.toString());
		return queryBuilder.toString();
	}

	/**
	 * 
	 * @param personFilter
	 * @return
	 */
	public String getPersonIdFromFilter(PersonFilter personFilter) {
		StringBuilder queryBuilder = new StringBuilder();
		if (personFilter.getId() != null
				&& personFilter.getId().getObjectId() != null) {
			List<ObjectId> objIdList = personFilter.getId().getObjectId();
			for (int i = 0; i < objIdList.size(); i++) {
				ObjectId objId = objIdList.get(i);
				String id = objId.getId();
				queryBuilder.append(id);
			}
		} else {
			logger.debug("pusto");
		}

		logger.debug("getPersonIdFromFilter - 1, output = "
				+ queryBuilder.toString());
		return queryBuilder.toString();
	}
}
