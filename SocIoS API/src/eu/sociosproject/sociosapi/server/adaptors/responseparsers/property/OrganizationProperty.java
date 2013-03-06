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
 
package eu.sociosproject.sociosapi.server.adaptors.responseparsers.property;

import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosvoc.Organization;

/**
 * 
 * @author pielakm
 * 
 */
public class OrganizationProperty extends Property<Organization> {

	private AddressProperty address;
	private ValueInfo department;
	private ValueInfo description;
	private ValueInfo endDate;
	private ValueInfo name;
	private ValueInfo startDate;
	private ValueInfo type;
	private ValueInfo title;
	private ValueInfo field;
	private ValueInfo subField;
	private ValueInfo webpage;
	private ValueInfo salary;

	public AddressProperty getAddress() {
		return address;
	}

	public void setAddress(AddressProperty address) {
		this.address = address;
	}

	public ValueInfo getDepartment() {
		return department;
	}

	public void setDepartment(ValueInfo department) {
		this.department = department;
	}

	public ValueInfo getDescription() {
		return description;
	}

	public void setDescription(ValueInfo description) {
		this.description = description;
	}

	public ValueInfo getEndDate() {
		return endDate;
	}

	public void setEndDate(ValueInfo endDate) {
		this.endDate = endDate;
	}

	public ValueInfo getName() {
		return name;
	}

	public void setName(ValueInfo name) {
		this.name = name;
	}

	public ValueInfo getStartDate() {
		return startDate;
	}

	public void setStartDate(ValueInfo startDate) {
		this.startDate = startDate;
	}

	public ValueInfo getType() {
		return type;
	}

	public void setType(ValueInfo type) {
		this.type = type;
	}

	public ValueInfo getTitle() {
		return title;
	}

	public void setTitle(ValueInfo title) {
		this.title = title;
	}

	public ValueInfo getField() {
		return field;
	}

	public void setField(ValueInfo field) {
		this.field = field;
	}

	public ValueInfo getSubField() {
		return subField;
	}

	public void setSubField(ValueInfo subField) {
		this.subField = subField;
	}

	public ValueInfo getWebpage() {
		return webpage;
	}

	public void setWebpage(ValueInfo webpage) {
		this.webpage = webpage;
	}

	public ValueInfo getSalary() {
		return salary;
	}

	public void setSalary(ValueInfo salary) {
		this.salary = salary;
	}

}
