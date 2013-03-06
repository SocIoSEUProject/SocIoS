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
 
package eu.sociosproject.sociosapi.server.update.events;

import eu.sociosproject.sociosvoc.ObjectId;

public class ConsentArrivedEvent extends SociosEvent {

	private static final long serialVersionUID = 1L;

	public ConsentArrivedEvent(TargetType targetType, ObjectId id, Object target) {
		super(targetType, id, target);
		// TODO Auto-generated constructor stub
	}


}
