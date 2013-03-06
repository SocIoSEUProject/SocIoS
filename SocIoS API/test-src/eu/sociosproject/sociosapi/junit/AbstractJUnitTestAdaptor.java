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
 
package eu.sociosproject.sociosapi.junit;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.junit.After;
import org.junit.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosApi;
import eu.sociosproject.sociosapi.SociosException;


/**
 * 
 * @author pielakm
 * 
 */
public abstract class AbstractJUnitTestAdaptor {
	
	/**
	 * 
	 */
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 
	 */
	private final String WEBSERVICE_ADDRESS = "http://localhost:8080/sociosApi/SociosApiImpl";
	
	/**
	 * 
	 */
	private SociosApi sociosApi;
	
	/**
	 * 
	 */
	@Before
	public void setUp() {
		//sociosApi = connectSociosService();
	}
	
	/**
	 * 
	 */
	@After
	public void clean() {
		// sociosApi.close();
	}
	
	/**
	 * 
	 * @return
	 */
	public SociosApi getSociosApi() {
		//if (sociosApi == null)
			//sociosApi = connectSociosService();
		return sociosApi;
	}
	
	/**
	 * 
	 * @return
	 *//*
	private SociosApi connectSociosService() {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.getInInterceptors().add(new LoggingInInterceptor());
		factory.getOutInterceptors().add(new LoggingOutInterceptor());
		factory.setServiceClass(SociosApi.class);
		factory.setAddress(WEBSERVICE_ADDRESS);
		SociosApi port = (SociosApi) factory.create();
		return port;
	}*/
	
	/**
	 * 
	 * @param file
	 * @return
	 * @throws SociosException
	 */
	protected String getStringFromFile(File file) throws SociosException {
		FileReader fr = null;
		BufferedReader in = null;
		StringBuilder output = new StringBuilder();
		try {
			fr = new FileReader(file);
			in = new BufferedReader(fr);

			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				if (!inputLine.isEmpty()) {
					output.append(inputLine);
				}
			}
		} catch (IOException ex) {
			logger.error(ex.toString());
			throw new SociosException(ex.toString());
		} finally {
			try {
				if (in != null)
					in.close();
				if (fr != null)
					fr.close();
			} catch (IOException ex) {
				logger.warn("An error occured during the closing stream, message = "
						+ ex.toString());
			}
		}
		return output.toString();
	}
}
