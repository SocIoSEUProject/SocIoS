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

import eu.sociosproject.sociosvoc.Account;

/**
 * 
 * @author pielakm
 * 
 */
public class AccountComparator extends AbstractComparator<Account> {

	@Override
	public Boolean isTheSameProps(Account t1, Account t2) {
		if (!isTheSameValues(t1.getDomain(), t2.getDomain(), "domain"))
			return false;

		if (!isTheSameValues(t1.getUserid(), t2.getUserid(), "userId"))
			return false;

		if (!isTheSameValues(t1.getUsername(), t2.getUsername(), "userName"))
			return false;

		return true;
	}

}
