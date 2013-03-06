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

import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.ObjectId;

/**
 * 
 * @author pielakm
 * 
 */
public class ActivityComparator extends AbstractComparator<Activity> {

	@Override
	public Boolean isTheSameProps(Activity t1, Activity t2) {
		AbstractComparator<ObjectId> objIdCompare = new ObjectIdComparator();
		int result = objIdCompare.compare(t1.getAppId(), t2.getAppId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}
		if (!isTheSameValues(t1.getBody(), t2.getBody(), "body"))
			return false;

		result = objIdCompare.compare(t1.getBodyId(), t2.getBodyId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}

		result = objIdCompare.compare(t1.getExternalId(), t2.getExternalId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}

		result = objIdCompare.compare(t1.getId(), t2.getId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}
		AbstractComparator<MediaItem> mediaItemCompare = new MediaItemComparator();
		result = mediaItemCompare.compareList(t1.getMediaItems(),
				t2.getMediaItems(), "mediaItemsList");
		if (result != 0){
			this.setErrorMessage(mediaItemCompare.getErrorMessage());
			return false;
		}
		if (!isTheSameValues(t1.getPostedTime(), t2.getPostedTime(),
				"postedTime"))
			return false;

		if (!isTheSameValues(t1.getPriority(), t2.getPriority(), "priority"))
			return false;

		if (!isTheSameValues(t1.getStreamFaviconUrl(),
				t2.getStreamFaviconUrl(), "streamFaviconUrl"))
			return false;

		if (!isTheSameValues(t1.getStreamSourceUrl(), t2.getStreamSourceUrl(),
				"streamSourceUrl"))
			return false;

		if (!isTheSameValues(t1.getStreamTitle(), t2.getStreamTitle(),
				"streamTitle"))
			return false;

		if (!isTheSameValues(t1.getTemplateParams(), t2.getTemplateParams(),
				"templateParams"))
			return false;

		if (!isTheSameValues(t1.getTitle(), t2.getTitle(), "title"))
			return false;

		result = objIdCompare.compare(t1.getTitleId(), t2.getTitleId());
		if (result != 0)
			return false;

		if (!isTheSameValues(t1.getUrl(), t2.getUrl(), "url"))
			return false;

		result = objIdCompare.compare(t1.getUserId(), t2.getUserId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}

		return true;
	}

}
