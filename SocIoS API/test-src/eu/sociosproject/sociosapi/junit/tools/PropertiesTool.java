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

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;

/**
 * 
 * @author pielakm
 *
 */
public class PropertiesTool {
	
	/**
	 * 
	 */
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 
	 */
	private Properties properties;
	
	/**
	 * 
	 * @param pathToFile
	 * @throws SociosException 
	 */
	public PropertiesTool(String pathToFile) throws SociosException{
		 properties = new Properties();
		try {
		    properties.load(new FileInputStream(pathToFile));
		} catch (IOException e) {
			logger.error(e.toString());
			throw new SociosException(e.toString());
		}
	}
	
	/**
	 * 
	 * @param key
	 * @return
	 */
	public String getProperty(String key){
		return properties.getProperty(key);
	}
	
}
