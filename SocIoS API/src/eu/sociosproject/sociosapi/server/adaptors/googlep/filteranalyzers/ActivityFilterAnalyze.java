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
 
package eu.sociosproject.sociosapi.server.adaptors.googlep.filteranalyzers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.server.adaptors.AbstractFilterAnalyze;
import eu.sociosproject.sociosvoc.ActivityFilter;

/**
 * 
 * @author pielakm
 * 
 */
public class ActivityFilterAnalyze extends AbstractFilterAnalyze {
	/**
	 * logger for log to file information about program action
	 */
	private Logger logger = LoggerFactory
			.getLogger(ActivityFilterAnalyze.class);

	/**
	 * 
	 * @param activityFilter
	 * @return
	 */
	public String getQueryFromFilter(ActivityFilter activityFilter) {
		StringBuilder queryBuilder = new StringBuilder();
		if (activityFilter.getTitle() != null)
			queryBuilder = appendToQueryIfFilled(activityFilter.getTitle(),
					queryBuilder);
		if (activityFilter.getUrl() != null)
			queryBuilder = appendToQueryIfFilled(activityFilter.getUrl(),
					queryBuilder);

		// FIXME implement more keywords to search

		logger.debug("\ngetQueryFromFilter - 1, output = "
				+ queryBuilder.toString());
		return queryBuilder.toString();
	}

}
