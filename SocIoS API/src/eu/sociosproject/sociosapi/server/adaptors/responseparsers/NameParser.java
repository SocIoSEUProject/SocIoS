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
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.NameProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Name;

/**
 * 
 * @author pielakm
 * 
 */
public class NameParser extends AbstractParser<Name> {

	@Override
	public Name parseToObj(JSONObject jObject, Property<Name> property)
			throws SociosException {
		Name name = new Name();
		NameProperty prop = (NameProperty) property;

		if (!isEmptyOrNull(prop.getAdditionalName())) {
			String value = (String) getValue(prop.getAdditionalName(), jObject);
			name.setAdditionalName(value);
		}
		if (!isEmptyOrNull(prop.getFamilyName())) {
			String value = (String) getValue(prop.getFamilyName(), jObject);
			name.setFamilyName(value);
		}
		if (!isEmptyOrNull(prop.getFormatted())) {
			String value = (String) getValue(prop.getFormatted(), jObject);
			name.setFormatted(value);
		}
		if (!isEmptyOrNull(prop.getGivenName())) {
			String value = (String) getValue(prop.getGivenName(), jObject);
			name.setGivenName(value);
		}
		if (!isEmptyOrNull(prop.getHonorificPrefix())) {
			String value = (String) getValue(prop.getHonorificPrefix(), jObject);
			name.setHonorificPrefix(value);
		}
		if (!isEmptyOrNull(prop.getHonorificSuffix())) {
			String value = (String) getValue(prop.getHonorificSuffix(), jObject);
			name.setHonorificSuffix(value);
		}

		return name;
	}

}
