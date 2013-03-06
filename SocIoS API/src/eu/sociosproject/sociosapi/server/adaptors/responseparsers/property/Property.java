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

/**
 * 
 * @author pielakm
 *
 * @param <T>
 */
public class Property<T> {
	/**
	 * 
	 */
	private String objJSONname;
	
	/**
	 * 
	 */
	private Boolean isNecessary = false;
	
	public String getObjJSONname() {
		return objJSONname;
	}

	public void setObjJSONname(String objJSONname) {
		this.objJSONname = objJSONname;
	}

	public Boolean getIsNecessary() {
		return isNecessary;
	}

	public void setIsNecessary(Boolean isNecessary) {
		this.isNecessary = isNecessary;
	}
}
