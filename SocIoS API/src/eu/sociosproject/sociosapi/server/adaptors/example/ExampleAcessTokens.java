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
 
package eu.sociosproject.sociosapi.server.adaptors.example;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;

public class ExampleAcessTokens implements SnsAccessTokens<ExampleAdaptor>{

	private final String exampleApiKey1;
	private final String exampleApiKey2;
	
	public ExampleAcessTokens(String exampleApiKey1, String exampleApiKey2) {
		this.exampleApiKey1 = exampleApiKey1;
		this.exampleApiKey2 = exampleApiKey2;
	}

	public String getExampleApiKey1() {
		return exampleApiKey1;
	}

	public String getExampleApiKey2() {
		return exampleApiKey2;
	}

	@Override
	public ExampleAdaptor create() {
		return new ExampleAdaptor(this);
	}
}
