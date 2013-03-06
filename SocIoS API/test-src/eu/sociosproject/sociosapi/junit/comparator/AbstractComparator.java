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

import java.util.Comparator;
import java.util.List;

import eu.sociosproject.sociosapi.junit.tools.ErrorMessage;

/**
 * 
 * @author pielakm
 * 
 */
public abstract class AbstractComparator<T> implements Comparator<T> {

	private ErrorMessage errorMessage = new ErrorMessage();

	/**
	 * 
	 * @param t1
	 * @param t2
	 * @return
	 */
	public abstract Boolean isTheSameProps(T t1, T t2);

	protected Boolean isTheSameValuesInList(List<String> list1,
			List<String> list2, String prop) {
		if (list1 == null && list2 == null) {
			return true;
		} else if (list1 == null && list2 != null || list1 != null
				&& list2 == null) {
			if (list1 == null)
				setErrorInfo(prop, null, "not null");
			else
				setErrorInfo(prop, "not null", null);
			return false;
		}
		if (list1.size() == list2.size()) {
			for (int i = 0; i < list1.size(); i++) {
				if (!list1.get(i).equals(list2.get(i))){
					setErrorInfo(prop, list1.get(i), list2.get(i));
					return false;
				}
			}
			return true;
		} else {
			setErrorInfo(prop, "different size, list1 = " + list1.size(),
					"different size, list2 = " + list2.size());
			return false;
		}
	}
	
	/**
	 * 
	 * @param o1
	 * @param o2
	 * @param prop
	 * @return
	 */
	protected Boolean isTheSameValues(Object o1, Object o2, String prop) {
		if (isEmptyOrNull(o1) && isEmptyOrNull(o2)) {
			return true;
		}
		if (!isEmptyOrNull(o1) && isEmptyOrNull(o2)) {
			setErrorInfo(prop, o1.toString(), null);
			return false;
		} else if (isEmptyOrNull(o1) && !isEmptyOrNull(o2)) {
			setErrorInfo(prop, null, o2.toString());
			return false;
		} else if (!o1.equals(o2)) {
			setErrorInfo(prop, o1.toString(), o2.toString());
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 
	 * @param faultProp
	 * @param faultValueP1
	 * @param faultValueP2
	 */
	private void setErrorInfo(String faultProp, String faultValueP1,
			String faultValueP2) {
		this.errorMessage.setFaultProp(faultProp);
		this.errorMessage.setFaultValueP1(faultValueP1);
		this.errorMessage.setFaultValueP2(faultValueP2);
	}

	/**
	 * 
	 * @param obj
	 * @return
	 */
	private Boolean isEmptyOrNull(Object obj) {
		if (obj == null)
			return true;
		else if (obj instanceof String && obj.equals("")) {
			return true;
		} else
			return false;
	}
	
	/**
	 * 
	 * @param list1
	 * @param list2
	 * @param prop
	 * @return
	 */
	public int compareList(List<T> list1, List<T> list2, String prop) {
		if (list1 == null && list2 == null) {
			return 0;
		} else if ((list1 == null && list2 != null)
				|| (list1 != null && list2 == null)) {
			if (list1 == null)
				setErrorInfo(prop, null, "not null");
			else
				setErrorInfo(prop, "not null", null);
			return 1;
		} else if (list1.size() == list2.size()) {
			for (int i = 0; i < list1.size(); i++) {
				if (compare(list1.get(i), list2.get(i)) != 0) {
				//	setErrorInfo(prop, Integer.toString(list1.size()),  Integer.toString(list2.size()));
					return 1;
				}
			}
			return 0;
		} else {
			setErrorInfo(prop, "different size, list1 = " + list1.size(),
					"different size, list2 = " + list2.size());
			return 1;
		}
	}
	
	/**
	 * 
	 * @param a
	 * @param b
	 * @param prop
	 * @return
	 */
	public Boolean isTheSameValuesEnum(Enum a, Enum b, String prop) {
		if (a == null && b == null) {
			return true;
		} else if (a == null && b != null) {
			setErrorInfo(prop, null, b.name());
			return false;
		} else if (a != null && b == null) {
			setErrorInfo(prop, a.name(), null);
			return false;
		} else if (a.compareTo(b) != 0) {
			setErrorInfo(prop, "diffrent value: value1 = " + a.toString(),
					"diffrent value: value2 = " + b.toString());
			return false;
		} else {
			return true;
		}
	}

	@Override
	public int compare(T t1, T t2) {
		if (isEmptyOrNull(t1) && isEmptyOrNull(t2)) {
			return 0;
		} else if (!isEmptyOrNull(t1) && isEmptyOrNull(t2)){
			setErrorInfo("obj", "not null", "null");
			return 1;
		} else if (isEmptyOrNull(t1) && !isEmptyOrNull(t2)){
			setErrorInfo("obj", "null", "not null");
			return 1;
		} else if (isTheSameProps(t1, t2)) {
			return 0;
		} else {
			return 1;
		}
	}

	public ErrorMessage getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(ErrorMessage errorMessage) {
		this.errorMessage = errorMessage;
	}

	@Override
	public String toString() {
		String message = String
				.format("Objects is not the same, diffrent property %s, expected = %s , get = %s",
						this.errorMessage.getFaultProp(),
						this.errorMessage.getFaultValueP1(),
						this.errorMessage.getFaultValueP2());
		return message;
	}
}
