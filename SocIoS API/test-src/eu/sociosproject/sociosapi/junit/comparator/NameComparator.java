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
 
package eu.sociosproject.sociosapi.junit.comparator;

import eu.sociosproject.sociosvoc.Name;

/**
 * 
 * @author pielakm
 * 
 */
public class NameComparator extends AbstractComparator<Name> {

	@Override
	public Boolean isTheSameProps(Name t1, Name t2) {
		if (!isTheSameValues(t1.getAdditionalName(), t2.getAdditionalName(),
				"additionalName"))
			return false;

		if (!isTheSameValues(t1.getFamilyName(), t2.getFamilyName(),
				"familyName"))
			return false;

		if (!isTheSameValues(t1.getFormatted(), t2.getFormatted(), "formatted"))
			return false;

		if (!isTheSameValues(t1.getGivenName(), t2.getGivenName(), "givenName"))
			return false;

		if (!isTheSameValues(t1.getHonorificPrefix(), t2.getHonorificPrefix(),
				"honorificPrefix"))
			return false;

		if (!isTheSameValues(t1.getHonorificSuffix(), t2.getHonorificSuffix(),
				"honorificSuffix"))
			return false;

		return true;
	}

}
