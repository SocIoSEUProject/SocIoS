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

/**
 * 
 * @author pielakm
 * 
 */
public class ValueInfo {

	private ValueInfo valueInfo = null;

	private String value = null;

	private String listValue = null;

	private Boolean isList = false;

	private Boolean isNested = false;

	public void setListLevel(String listValue, String value) {
		this.listValue = listValue;
		this.value = value;
		this.isList = true;
	}

	public void addListLevel(String listValue, String value) {
		ValueInfo nestedValueInfo = new ValueInfo();
		nestedValueInfo.setValue(value);
		nestedValueInfo.setListValue(listValue);
		nestedValueInfo.setIsList(true);
		ValueInfo endValueInfo = getTheEndValueInfo(this);
		endValueInfo.setIsNested(true);
		endValueInfo.setValueInfo(nestedValueInfo);
	}

	/**
	 * @param value
	 * @param isList
	 */
	public void addLevel(String value) {
		ValueInfo nestedValueInfo = new ValueInfo();
		nestedValueInfo.setValue(value);
		ValueInfo endValueInfo = getTheEndValueInfo(this);
		endValueInfo.setIsNested(true);
		endValueInfo.setValueInfo(nestedValueInfo);
	}

	private ValueInfo getTheEndValueInfo(ValueInfo valueInfo) {
		if (valueInfo.getValueInfo() != null) {
			return getTheEndValueInfo(valueInfo.getValueInfo());
		} else {
			return valueInfo;
		}
	}

	public Boolean getIsList() {
		return isList;
	}

	public void setIsList(Boolean isList) {
		this.isList = isList;
	}

	public Boolean getIsNested() {
		return isNested;
	}

	public void setIsNested(Boolean isNested) {
		this.isNested = isNested;
	}

	public void setValueInfo(ValueInfo valueInfo) {
		this.valueInfo = valueInfo;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Boolean isList() {
		return isList;
	}

	public Boolean isNested() {
		return isNested;
	}

	public ValueInfo getValueInfo() {
		return valueInfo;
	}

	public String getValue() {
		return value;
	}

	public String getListValue() {
		return listValue;
	}

	public void setListValue(String listValue) {
		this.listValue = listValue;
	}

	@Override
	public String toString() {
		String result = String.format(
				"value = %s, isList = %s, listValue = %s, isNested = %s",
				value, isList, listValue, isNested);
		if (valueInfo != null) {
			result = result + "\nvalueInfo = " + valueInfo.toString();
		}
		return result;
	}
}
