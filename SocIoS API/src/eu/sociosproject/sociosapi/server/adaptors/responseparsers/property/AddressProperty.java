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
import eu.sociosproject.sociosvoc.Address;

/**
 * 
 * @author pielakm
 * 
 */
public class AddressProperty extends Property<Address> {

	private ValueInfo country;
	private ValueInfo extendedAddress;
	private ValueInfo latitude;
	private ValueInfo locality;
	private ValueInfo longitude;
	private ValueInfo poBox;
	private ValueInfo postalCode;
	private ValueInfo primary;
	private ValueInfo region;
	private ValueInfo streetAddress;
	private ValueInfo type;
	private ValueInfo formatted;

	public ValueInfo getCountry() {
		return country;
	}

	public void setCountry(ValueInfo country) {
		this.country = country;
	}

	public ValueInfo getExtendedAddress() {
		return extendedAddress;
	}

	public void setExtendedAddress(ValueInfo extendedAddress) {
		this.extendedAddress = extendedAddress;
	}

	public ValueInfo getLatitude() {
		return latitude;
	}

	public void setLatitude(ValueInfo latitude) {
		this.latitude = latitude;
	}

	public ValueInfo getLocality() {
		return locality;
	}

	public void setLocality(ValueInfo locality) {
		this.locality = locality;
	}

	public ValueInfo getLongitude() {
		return longitude;
	}

	public void setLongitude(ValueInfo longitude) {
		this.longitude = longitude;
	}

	public ValueInfo getPoBox() {
		return poBox;
	}

	public void setPoBox(ValueInfo poBox) {
		this.poBox = poBox;
	}

	public ValueInfo getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(ValueInfo postalCode) {
		this.postalCode = postalCode;
	}

	public ValueInfo getPrimary() {
		return primary;
	}

	public void setPrimary(ValueInfo primary) {
		this.primary = primary;
	}

	public ValueInfo getRegion() {
		return region;
	}

	public void setRegion(ValueInfo region) {
		this.region = region;
	}

	public ValueInfo getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(ValueInfo streetAddress) {
		this.streetAddress = streetAddress;
	}

	public ValueInfo getType() {
		return type;
	}

	public void setType(ValueInfo type) {
		this.type = type;
	}

	public ValueInfo getFormatted() {
		return formatted;
	}

	public void setFormatted(ValueInfo formatted) {
		this.formatted = formatted;
	}
}
