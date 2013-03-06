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
package eu.sociosproject.socialfiltering.memory;

import java.util.UUID;

import eu.sociosproject.sociosvoc.ObjectId;

/**
 * @author kotelnikov
 */
public class IdUtil {

    public static ObjectId newObjectId() {
        String id = "id-" + UUID.randomUUID().toString();
        ObjectId result = new ObjectId();
        result.setId(id);
        return result;
    }

}
