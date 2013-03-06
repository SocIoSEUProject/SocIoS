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
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.OrganizationProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.Organization;

/**
 * 
 * @author pielakm
 * 
 */
public class OrganizationParser extends AbstractParser<Organization> {

	@Override
	public Organization parseToObj(JSONObject jObject,
			Property<Organization> property) throws SociosException {
		Organization organization = new Organization();
		OrganizationProperty prop = (OrganizationProperty) property;
		if (!isEmptyOrNull(prop.getAddress())) {
			AbstractParser<Address> addressParser = new AddressParser();
			Address address = addressParser.parseToObj(jObject,
					prop.getAddress());
			organization.setAddress(address);

		}
		if (!isEmptyOrNull(prop.getDepartment())) {
			String value = (String) getValue(prop.getDepartment(), jObject);
			organization.setDepartment(value);
		}
		if (!isEmptyOrNull(prop.getDescription())) {
			String value = (String) getValue(prop.getDescription(), jObject);
			organization.setDescription(value);
		}
		if (!isEmptyOrNull(prop.getEndDate())) {
			// TODO DATE
		}
		if (!isEmptyOrNull(prop.getField())) {
			String value = (String) getValue(prop.getField(), jObject);
			organization.setField(value);
		}
		if (!isEmptyOrNull(prop.getField())) {
			String value = (String) getValue(prop.getField(), jObject);
			organization.setField(value);
		}
		if (!isEmptyOrNull(prop.getName())) {
			String value = (String) getValue(prop.getName(), jObject);
			organization.setName(value);
		}
		if (!isEmptyOrNull(prop.getSalary())) {
			String value = (String) getValue(prop.getSalary(), jObject);
			organization.setSalary(value);
		}
		if (!isEmptyOrNull(prop.getStartDate())) {
			// TODO DATE
		}
		if (!isEmptyOrNull(prop.getSubField())) {
			String value = (String) getValue(prop.getSubField(), jObject);
			organization.setSubField(value);
		}
		if (!isEmptyOrNull(prop.getTitle())) {
			String value = (String) getValue(prop.getTitle(), jObject);
			organization.setTitle(value);
		}
		if (!isEmptyOrNull(prop.getType())) {
			String value = (String) getValue(prop.getType(), jObject);
			organization.setType(value);
		}
		if (!isEmptyOrNull(prop.getWebpage())) {
			String value = (String) getValue(prop.getWebpage(), jObject);
			organization.setWebpage(value);
		}

		return organization;
	}

}
