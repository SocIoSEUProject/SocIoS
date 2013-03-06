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

/**
 * 
 * @author pielakm
 * 
 */
public class AddressComparator extends AbstractComparator<Address> {

	@Override
	public Boolean isTheSameProps(Address t1, Address t2) {
		if (!isTheSameValues(t1.getCountry(), t2.getCountry(), "country"))
			return false;

		if (!isTheSameValues(t1.getExtendedAddress(), t2.getExtendedAddress(),
				"extendedaddress"))
			return false;

		if (!isTheSameValues(t1.getFormatted(), t2.getFormatted(), "formatted"))
			return false;

		if (!isTheSameValues(t1.getLatitude(), t2.getLatitude(), "latitude"))
			return false;

		if (!isTheSameValues(t1.getLocality(), t2.getLocality(), "locality"))
			return false;

		if (!isTheSameValues(t1.getLongitude(), t2.getLongitude(), "longitude"))
			return false;

		if (!isTheSameValues(t1.getPoBox(), t2.getPoBox(), "poBox"))
			return false;

		if (!isTheSameValues(t1.getPostalCode(), t2.getPostalCode(),
				"postalCode"))
			return false;

		if (!isTheSameValues(t1.getRegion(), t2.getRegion(), "region"))
			return false;

		if (!isTheSameValues(t1.getStreetAddress(), t2.getStreetAddress(),
				"streetAddress"))
			return false;

		if (!isTheSameValues(t1.getType(), t2.getType(), "type"))
			return false;

		return true;
	}

}
