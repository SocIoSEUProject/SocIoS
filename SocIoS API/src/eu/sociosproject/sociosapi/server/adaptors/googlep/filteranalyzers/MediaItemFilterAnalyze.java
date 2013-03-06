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
import eu.sociosproject.sociosvoc.MediaItemFilter;

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemFilterAnalyze extends AbstractFilterAnalyze {
	/**
	 * logger for log to file information about program action
	 */
	private Logger logger = LoggerFactory
			.getLogger(MediaItemFilterAnalyze.class);

	/**
	 * 
	 * @param activityFilter
	 * @return
	 */
	public String getQueryFromFilter(MediaItemFilter mediaItemFilter) {
		StringBuilder queryBuilder = new StringBuilder();
		if (mediaItemFilter.getTitle() != null)
			queryBuilder = appendToQueryIfFilled(mediaItemFilter.getTitle(),
					queryBuilder);
//		if (mediaItemFilter.getTags() != null)
//			queryBuilder = appendToQueryIfFilled(mediaItemFilter.getTags(),
//					queryBuilder);
//		if (mediaItemFilter.getDescription() != null)
//			queryBuilder = appendToQueryIfFilled(
//					mediaItemFilter.getDescription(), queryBuilder);

		// FIXME implement more keywords to search

		logger.debug("\ngetQueryFromFilter - 1, output = "
				+ queryBuilder.toString());
		//return queryBuilder.toString();
		return queryBuilder.toString().replaceAll(" ", "%20").trim();
	}
}
