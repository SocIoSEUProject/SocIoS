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
import eu.sociosproject.sociosvoc.Name;

/**
 * 
 * @author pielakm
 * 
 */
public class NameProperty extends Property<Name> {

	private ValueInfo additionalName;
	private ValueInfo familyName;
	private ValueInfo givenName;
	private ValueInfo honorificPrefix;
	private ValueInfo honorificSuffix;
	private ValueInfo formatted;

	public ValueInfo getAdditionalName() {
		return additionalName;
	}

	public void setAdditionalName(ValueInfo additionalName) {
		this.additionalName = additionalName;
	}

	public ValueInfo getFamilyName() {
		return familyName;
	}

	public void setFamilyName(ValueInfo familyName) {
		this.familyName = familyName;
	}

	public ValueInfo getGivenName() {
		return givenName;
	}

	public void setGivenName(ValueInfo givenName) {
		this.givenName = givenName;
	}

	public ValueInfo getHonorificPrefix() {
		return honorificPrefix;
	}

	public void setHonorificPrefix(ValueInfo honorificPrefix) {
		this.honorificPrefix = honorificPrefix;
	}

	public ValueInfo getHonorificSuffix() {
		return honorificSuffix;
	}

	public void setHonorificSuffix(ValueInfo honorificSuffix) {
		this.honorificSuffix = honorificSuffix;
	}

	public ValueInfo getFormatted() {
		return formatted;
	}

	public void setFormatted(ValueInfo formatted) {
		this.formatted = formatted;
	}
}
