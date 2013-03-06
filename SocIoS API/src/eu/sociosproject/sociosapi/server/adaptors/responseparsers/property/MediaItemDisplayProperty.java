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
 
package eu.sociosproject.sociosapi.server.adaptors.responseparsers.property;

import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosvoc.MediaItemDisplay;

public class MediaItemDisplayProperty extends Property<MediaItemDisplay>{
	
		private ValueInfo id;
		private ValueInfo title;		
		private ValueInfo source;
		private ValueInfo embeddedHtml;
		public ValueInfo getId() {
			return id;
		}
		public void setId(ValueInfo id) {
			this.id = id;
		}
		public ValueInfo getSource() {
			return source;
		}
		public void setSource(ValueInfo source) {
			this.source = source;
		}
		public ValueInfo getTitle() {
			return title;
		}
		public void setTitle(ValueInfo title) {
			this.title = title;
		}
		public ValueInfo getEmbeddedHtml() {
			return embeddedHtml;
		}
		public void setEmbeddedHtml(ValueInfo embeddedHtml) {
			this.embeddedHtml = embeddedHtml;
		}


		
}
