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
package eu.sociosproject.socialfiltering.client;

import java.io.File;
import java.net.URL;

import eu.sociosproject.GroupService;
import eu.sociosproject.IGroupService;

public class GroupServiceClient {
    public static void main(String args[]) throws Exception {
        GroupService customerServiceService;
        if (args.length != 0 && args[0].length() != 0) {
            File wsdlFile = new File(args[0]);
            URL wsdlURL;
            if (wsdlFile.exists()) {
                wsdlURL = wsdlFile.toURL();
            } else {
                wsdlURL = new URL(args[0]);
            }
            // Create the service client with specified wsdlurl
            customerServiceService = new GroupService(wsdlURL);
        } else {
            // Create the service client with its default wsdlurl
            customerServiceService = new GroupService();
        }

        IGroupService groupService = customerServiceService
            .getGroupServicePort();

        // Initialize the test class and call the tests
        SfsCli client = new SfsCli();
        client.setGroupService(groupService);

        System.exit(0);
    }

    protected GroupServiceClient() {
    }
}
