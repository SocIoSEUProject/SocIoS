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
 
package eu.sociosproject.sociosapi.server.adaptors;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONArray;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;

/**
 * Abstract Class Parser is designed to provide basic methods for implemented
 * parsers
 * 
 * @author pielakm
 * 
 */
public abstract class AbstractParser<T> {

	/**
	 * 
	 */
	private final Logger logger = LoggerFactory.getLogger(AbstractParser.class);

	/**
	 * 
	 * @param input
	 * @param jObject
	 * @return
	 */
	public abstract T parseToObj(JSONObject jObject, Property<T> property)
			throws SociosException;

	/**
	 * 
	 * @param input
	 * @return
	 * @throws SociosException
	 */
	public T parseToObj(String input, Property<T> property)
			throws SociosException {
		String debug = String.format("\nparse - 1, input = %s", input);
		logger.debug(debug);

		JSONObject jObject = null;
		try {
			jObject = new JSONObject(input);
			if (!isEmptyOrNull(property.getObjJSONname()))
				jObject = jObject.getJSONObject(property.getObjJSONname());
		} catch (JSONException e) {
			logger.error("parseToObj - " + e.toString());
			throw new SociosException(e.toString());
		}
		return parseToObj(jObject, property);
	}
	
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public List<T> parseToListObj(String input, Property<T> property)
			throws SociosException {
		String debug = String.format("\nparseToListObj - 1, input = %s", input);
		logger.debug(debug);
		JSONObject jObject = null;
		try {
			//System.out.println("parseToListObj input = " + input);
			jObject = new JSONObject(input);
		} catch (JSONException e) {
			logger.error("parseToListObj - 2" + e.toString());
			e.printStackTrace();
			System.out.println("getMessage" + e.getMessage());
			throw new SociosException(e.toString());
		}
		return parseToListObj(jObject, property);
	}
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public List<T> parseToListObj(JSONObject jObject, Property<T> property)
			throws SociosException {
		String debug = String.format("\nparseToListObj - 1, input = %s", jObject.toString());
		logger.debug(debug);

		List<T> listObj = new ArrayList<T>();
		try {			
			JSONArray jArray = getJSONArray(jObject, property);
			if(jArray == null)
				return listObj;
			
			for (int i = 0; i < jArray.length(); i++) {
				T t = parseToObj(jArray.getJSONObject(i), property);
				listObj.add(t);
			}
		} catch (JSONException e) {
			logger.error("parseToListObj - 1" + e.toString());
			throw new SociosException(e.toString());
		}
		return listObj;
	}
	

	/**
	 * 
	 * @param obj
	 * @return
	 */
	protected Boolean isEmptyOrNull(Object obj) {
		if (obj == null) {
			return true;
		}
		if (obj instanceof String) {
			String objStr = (String) obj;
			if (objStr.equals(""))
				return true;
		}
		return false;

	}
	
	public JSONArray getJSONArray(JSONObject jObj, Property<T> prop)
			throws JSONException {
		JSONArray resultArray = null;
		String objStr = prop.getObjJSONname();
		try {
			if (!objStr.contains(";")) {
				resultArray = jObj.getJSONArray(objStr);
				return resultArray;
			}

			String[] array = objStr.split(";");
			JSONObject tmpJObj = jObj;
			for (int i = 0; i < array.length; i++) {
				String element = array[i];

				if (i + 1 < array.length) {
					tmpJObj = tmpJObj.getJSONObject(element);

				} else {
					resultArray = tmpJObj.getJSONArray(element);
				}

			}
		} catch (JSONException e) {
			if (prop.getIsNecessary()) {
				logger.error("getJSONArray - " + e.toString());
				e.printStackTrace();
				throw new JSONException(e.toString());
			}
		}
		return resultArray;
	}

	/**
	 * 
	 * @param valueInfo
	 * @param jObject
	 * @return
	 * @throws SociosException 
	 */
	protected Object getValue(ValueInfo valueInfo, JSONObject jObject) throws SociosException {
		Object value = null;
		if (isListResult(valueInfo)) {
			List<String> list = new ArrayList<String>();
			getValueFromJSONList(valueInfo, jObject, list);
			value = listToString(list);
		} else {
			value = getValueFromJSON(valueInfo, jObject);
		}
		return value;
	}

	/**
	 * 
	 * @param valueInfo
	 * @param jObject
	 * @return
	 * @throws SociosException
	 */
	private Object getValueFromJSON(ValueInfo valueInfo, JSONObject jObject)
			throws SociosException {
		if (valueInfo.isNested()) {
			JSONObject jNObj = jObject.optJSONObject(valueInfo.getValue());
			if(jNObj == null)
				return null;
			
			return getValueFromJSON(valueInfo.getValueInfo(), jNObj);
		} else {
			return jObject.opt(valueInfo.getValue());
		}
	}

	/**
	 * 
	 * @param valueInfo
	 * @param jObject
	 * @param results
	 * @throws SociosException
	 */
	protected void getValueFromJSONList(ValueInfo valueInfo, JSONObject jObject,
			List<String> results) throws SociosException {
		try {
			if (valueInfo.isList()) {
				JSONArray jArray = jObject.optJSONArray(valueInfo
						.getListValue());
				if(jArray == null)
					return;
				for (int i = 0; i < jArray.length(); i++) {
					if (valueInfo.isNested()) {
						getValueFromJSONList(valueInfo.getValueInfo(),
								jArray.optJSONObject(i), results);
					} else if (!isEmptyOrNull(valueInfo.getValue())) {
						results.add(jArray.optJSONObject(i).optString(
								valueInfo.getValue()));
					} else {
						results.add(jArray.optString(i));
					}
				}
			} else if (valueInfo.isNested()) {
				JSONObject jNObj = jObject.optJSONObject(valueInfo.getValue());
				if(jNObj == null)
					return;
				getValueFromJSONList(valueInfo.getValueInfo(), jNObj, results);

			} else if (valueInfo.getValue() != null) {
				results.add(jObject.getString(valueInfo.getValue()));
			}
		} catch (JSONException e) {
			logger.error(e.toString());
			throw new SociosException(e.toString());
		}
	}

	/**
	 * 
	 * @param valueInfo
	 * @return
	 */
	private Boolean isListResult(ValueInfo valueInfo) {
		if (valueInfo != null) {
			if (valueInfo.isList()) {
				return true;
			} else {
				return isListResult(valueInfo.getValueInfo());
			}
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @param list
	 * @return
	 */
	private String listToString(List<String> list) {
		String result = "";
		for (int i = 0; i < list.size(); i++){
			result += list.get(i);
			if(i + 1 < list.size())
				result += ";";
			
		}
		return result;
	}
}
