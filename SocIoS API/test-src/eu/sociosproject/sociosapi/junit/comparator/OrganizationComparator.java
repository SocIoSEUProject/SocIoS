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

import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.Organization;

/**
 * 
 * @author pielakm
 *
 */
public class OrganizationComparator extends AbstractComparator<Organization> {

	@Override
	public Boolean isTheSameProps(Organization t1, Organization t2) {
		AbstractComparator<Address> addressCompare = new AddressComparator();
		int result = addressCompare.compare(t1.getAddress(), t2.getAddress());
		if (result != 0){
			this.setErrorMessage(addressCompare.getErrorMessage());
			return false;
		}
		
		if (!isTheSameValues(t1.getDepartment(), t2.getDepartment(),
				"department"))
			return false;
		
		if (!isTheSameValues(t1.getDescription(), t2.getDescription(),
				"descritpion"))
			return false;
		
		if (!isTheSameValues(t1.getEndDate(), t2.getEndDate(), "endDate"))
			return false;
		
		if (!isTheSameValues(t1.getField(), t2.getField(), "field"))
			return false;
		
		if (!isTheSameValues(t1.getName(), t2.getName(), "name"))
			return false;
		
		if (!isTheSameValues(t1.getSalary(), t2.getSalary(), "salary"))
			return false;
		
		if (!isTheSameValues(t1.getStartDate(), t2.getStartDate(), "startDate"))
			return false;
		
		if (!isTheSameValues(t1.getSubField(), t2.getSubField(), "subField"))
			return false;
		
		if (!isTheSameValues(t1.getTitle(), t2.getTitle(), "title"))
			return false;
		
		if (!isTheSameValues(t1.getType(), t2.getType(), "type"))
			return false;
		
		if (!isTheSameValues(t1.getWebpage(), t2.getWebpage(), "webPage"))
			return false;
		
		return true;
	}

}
