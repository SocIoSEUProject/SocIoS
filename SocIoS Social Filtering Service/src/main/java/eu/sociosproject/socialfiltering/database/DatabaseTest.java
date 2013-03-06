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
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosvoc.Group;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Source;

public class DatabaseTest extends TestCase {

    public String getKey(ObjectId groupId) {
        Source source = groupId.getSource();
        String id = groupId.getId();
        if (source != null) {
            // return source.getOpenSocialSnsId().getBaseUri() + ":" + id;
            return source.getKnownSns().name() + ":" + id;
        }
        return id;

    }

    /**
     * @throws SnsException
     */
    public void testProperyResolving() throws SociosException {
        // Dictionary of properties
        final Map<String, String> properties = new HashMap<String, String>();

        properties.put("jdbc.driver", "com.mysql.jdbc.Driver");
        properties.put("jdbc.url", "jdbc:mysql://localhost/socios_sns");
        properties.put("jdbc.login", "root");
        properties.put("jdbc.password", "");
        // This property provider is used to resolve variables in the string
        IVariableProvider propertyProvider = new StringUtil.IVariableProvider() {
            @Override
            public String getValue(String name) {
                return properties.get(name);
            }
        };

        JdbcConnector connector = new JdbcConnector(propertyProvider);

        GroupServiceImpl groupDao = new GroupServiceImpl();
        groupDao.open();

        Group myGroup = new Group();
        ObjectId objectId = new ObjectId();
        objectId.setId("siliconsentier");
        Source source = new Source();
        // OpenSocialSns ossValue = new OpenSocialSns();
        // ossValue.setBaseUri("twitter");
        // source.setOpenSocialSnsId(ossValue);
        objectId.setSource(source);
        source.setKnownSns(KnownSns.TWITTER);
        myGroup.setId(objectId);
        myGroup.setTitle("mygroup");
        myGroup.setDescription("mygroupdescription");

        // groupDao.storeGroup(myGroup);

    }
}
