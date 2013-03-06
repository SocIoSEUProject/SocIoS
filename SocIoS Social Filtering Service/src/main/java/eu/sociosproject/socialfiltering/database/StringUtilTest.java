/*
 *   Copyright 2013 Cognium Systems SAS
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
package eu.sociosproject.socialfiltering.database;

import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;
import eu.sociosproject.socialfiltering.database.StringUtil.IVariableProvider;

public class StringUtilTest extends TestCase {

    public StringUtilTest(String name) {
        super(name);
    }

    /**
     *
     */
    public void testProperyResolving() {
        // Dictionary of properties
        final Map<String, String> properties = new HashMap<String, String>();
        properties.put("firstName", "John");
        properties.put("lastName", "Smith");
        properties.put("displayName", "${firstName} ${lastName}");
        properties.put("age", "37");
        // This property provider is used to resolve variables in the string
        IVariableProvider propertyProvider = new StringUtil.IVariableProvider() {
            @Override
            public String getValue(String name) {
                return properties.get(name);
            }
        };

        String result = StringUtil.resolveProperty(
            "Hello ${firstName}! Your age is ${age}.",
            propertyProvider);
        assertEquals("Hello John! Your age is 37.", result);

        // Recursive property resolving: the property "displayName" references
        // the "fistName" and "lastName".
        result = StringUtil.resolveProperty(
            "Hello ${displayName}! Your age is ${age}.",
            propertyProvider);
        assertEquals("Hello John Smith! Your age is 37.", result);
    }

    /**
     *
     */
    public void testProperyResolvingByKey() {
        // Dictionary of properties
        final Map<String, String> properties = new HashMap<String, String>();
        properties.put("root.dir", "./mydir");
        properties.put("log", "${root.dir}/log");
        properties.put("log.sys", "${log}/sys");
        properties.put("log.mymodule", "${log.sys}/mymodule");

        // This property provider is used to resolve variables in the string
        IVariableProvider propertyProvider = new StringUtil.IVariableProvider() {
            @Override
            public String getValue(String name) {
                return properties.get(name);
            }
        };

        // The template itself is searched in the property map
        String result = StringUtil.resolvePropertyByKey(
            "log.sys",
            propertyProvider);
        assertEquals("./mydir/log/sys", result);
        result = StringUtil.resolvePropertyByKey(
            "log.mymodule",
            propertyProvider);
        assertEquals("./mydir/log/sys/mymodule", result);
    }

}