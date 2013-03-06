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
 
package eu.sociosproject.sociosapi.junit.tools;

/**
 * 
 * @author pielakm
 *
 */
public class ErrorMessage {
	/**
	 * 
	 */
	private String faultProp;

	/**
	 * 
	 */
	private String faultValueP1;

	/**
	 * 
	 */
	private String faultValueP2;

	public String getFaultProp() {
		return faultProp;
	}

	public void setFaultProp(String faultProp) {
		this.faultProp = faultProp;
	}

	public String getFaultValueP1() {
		return faultValueP1;
	}

	public void setFaultValueP1(String faultValueP1) {
		this.faultValueP1 = faultValueP1;
	}

	public String getFaultValueP2() {
		return faultValueP2;
	}

	public void setFaultValueP2(String faultValueP2) {
		this.faultValueP2 = faultValueP2;
	}
	
	
}
