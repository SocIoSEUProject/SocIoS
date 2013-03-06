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

import eu.sociosproject.sociosvoc.ObjectId;

/**
 * 
 * @author pielakm
 *
 */
public class ObjectIdComparator extends AbstractComparator<ObjectId> {

	@Override
	public Boolean isTheSameProps(ObjectId t1, ObjectId t2) {
		if(!isTheSameValues(t1.getId(), t2.getId(), "id"))
			return false;
		
		if(!isTheSameValues(t1.getSource(), t2.getSource(), "source"))
			return false;
		
		return true;
	}

}
