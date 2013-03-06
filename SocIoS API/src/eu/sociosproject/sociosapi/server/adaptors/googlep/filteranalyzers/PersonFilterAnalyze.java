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

import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SociosException;
import eu.sociosproject.sociosapi.server.adaptors.AbstractFilterAnalyze;
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
	 * @throws InvalidInputException
	 */
	public String getQueryFromFilter(PersonFilter personFilter)
			throws InvalidInputException {
		StringBuilder queryBuilder = new StringBuilder();
		if (personFilter.getDisplayName() != null)
			queryBuilder = appendToQueryIfFilled(personFilter.getDisplayName(),
					queryBuilder);
		// if (personFilter.getEmails() != null)
		// queryBuilder = appendToQueryIfFilled(personFilter.getEmails(),
		// queryBuilder);
		if (personFilter.getGender() != null)
			queryBuilder = appendToQueryIfFilled(personFilter.getGender(),
					queryBuilder);
//		else {
//			throw new InvalidInputException(
//					"Parameterless search, please give displayname or gender to find the person");
//		}

		logger.debug("getQueryFromFilter - 1, output = "
				+ queryBuilder.toString());
		return queryBuilder.toString();
	}

}
