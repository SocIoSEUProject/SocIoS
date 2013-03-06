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
 
package eu.sociosproject.sociosapi.server.adaptors.responseparsers;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.AddressProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Address;

/**
 * 
 * @author pielakm
 * 
 */
public class AddressParser extends AbstractParser<Address> {

	@Override
	public Address parseToObj(JSONObject jObject, Property<Address> property)
			throws SociosException {
		AddressProperty prop = (AddressProperty) property;
		Address address = new Address();

		if (!isEmptyOrNull(prop.getCountry())) {
			String value = (String) getValue(prop.getCountry(), jObject);
			address.setCountry(value);
		}
		if (!isEmptyOrNull(prop.getExtendedAddress())) {
			String value = (String) getValue(prop.getExtendedAddress(), jObject);
			address.setExtendedAddress(value);
		}
		if (!isEmptyOrNull(prop.getFormatted())) {
			String value = (String) getValue(prop.getFormatted(), jObject);
			address.setFormatted(value);
		}
		if (!isEmptyOrNull(prop.getLatitude())) {
			Double value = (Double) getValue(prop.getLatitude(), jObject);
			address.setLatitude(value);
		}
		if (!isEmptyOrNull(prop.getLocality())) {
			String value = (String) getValue(prop.getLocality(), jObject);
			address.setLocality(value);
		}
		if (!isEmptyOrNull(prop.getLongitude())) {
			Double value = (Double) getValue(prop.getLongitude(), jObject);
			address.setLongitude(value);
		}
		if (!isEmptyOrNull(prop.getPoBox())) {
			String value = (String) getValue(prop.getPoBox(), jObject);
			address.setPoBox(value);
		}
		if (!isEmptyOrNull(prop.getPostalCode())) {
			String value = (String) getValue(prop.getPostalCode(), jObject);
			address.setPostalCode(value);
		}
		if (!isEmptyOrNull(prop.getPrimary())) {
			Boolean value = (Boolean) getValue(prop.getPrimary(), jObject);
			address.setPrimary(value);
		}
		if (!isEmptyOrNull(prop.getRegion())) {
			String value = (String) getValue(prop.getRegion(), jObject);
			address.setRegion(value);
		}
		if (!isEmptyOrNull(prop.getStreetAddress())) {
			String value = (String) getValue(prop.getStreetAddress(), jObject);
			address.setStreetAddress(value);
		}
		if (!isEmptyOrNull(prop.getType())) {
			String value = (String) getValue(prop.getType(), jObject);
			address.setType(value);
		}

		return address;
	}

}
