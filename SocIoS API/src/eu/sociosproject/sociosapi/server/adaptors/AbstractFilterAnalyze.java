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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosvoc.KeyWordFilter;

/**
 * 
 * @author pielakm
 * 
 */
public abstract class AbstractFilterAnalyze {

	/**
	 * logger for log to file information about program action
	 */
	private Logger logger = LoggerFactory
			.getLogger(AbstractFilterAnalyze.class);

	/**
	 * 
	 * @param kwFilter
	 * @param queryBuilder
	 * @return
	 */
	protected StringBuilder appendToQueryIfFilled(KeyWordFilter kwFilter,
			StringBuilder queryBuilder) {
		logger.debug("\nappendToQueryIfFilled - 1");

		String property = getProperty(kwFilter);
		if (!isEmptyOrNull(property)) {
			queryBuilder.append(property);
		}
		return queryBuilder;
	}

	/**
	 * 
	 * @param kwFilter
	 * @return
	 */
	private String getProperty(KeyWordFilter kwFilter) {
		StringBuilder builder = new StringBuilder();
		System.out.println("kwFilter.getKeyword().size() = " + kwFilter.getKeyword().size());
		for (int i = 0; i < kwFilter.getKeyword().size(); i++) {
			builder.append(kwFilter.getKeyword().get(i).trim()
					.replaceAll(" ", ""));
			// if(i != kwFilter.getKeyword().size() - 1)
			// builder.append(" ");
//			 System.out.println("kwFilter = " +
//			 kwFilter.getKeyword().get(i).toString());
		}

		logger.debug("\ngetProperty - 1, output = " + builder.toString());
		return builder.toString();
	}

	/**
	 * 
	 * @param str
	 * @return
	 */
	private Boolean isEmptyOrNull(String str) {
		if (str.equals("") || str == null)
			return true;
		else
			return false;
	}
}
