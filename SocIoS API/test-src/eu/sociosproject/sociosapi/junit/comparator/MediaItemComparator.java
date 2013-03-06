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

import eu.sociosproject.sociosapi.junit.tools.ErrorMessage;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.ObjectId;

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemComparator extends AbstractComparator<MediaItem> {

	@Override
	public Boolean isTheSameProps(MediaItem t1, MediaItem t2) {
		AbstractComparator<ObjectId> objIdCompare = new ObjectIdComparator();
		int result = objIdCompare.compare(t1.getAlbumId(), t2.getAlbumId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(t1.getCreated(), t2.getCreated(), "created"))
			return false;

		if (!isTheSameValues(t1.getDescription(), t2.getDescription(),
				"description"))
			return false;

		if (!isTheSameValues(t1.getDuration(), t2.getDuration(), "duration"))
			return false;

		if (!isTheSameValues(t1.getExpirationDate(), t2.getExpirationDate(),
				"expirationDate"))
			return false;

		if (!isTheSameValues(t1.getFileSize(), t2.getFileSize(), "fileSize"))
			return false;

		result = objIdCompare.compare(t1.getId(), t2.getId());
		if (result != 0){
			this.setErrorMessage(objIdCompare.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(t1.getLanguage(), t2.getLanguage(), "language"))
			return false;

		AbstractComparator<Address> addressCompare = new AddressComparator();
		result = addressCompare.compare(t1.getLocation(), t2.getLocation());
		if (result != 0){
			this.setErrorMessage(addressCompare.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(t1.getMimeType(), t2.getMimeType(), "mimeType"))
			return false;

		if (!isTheSameValues(t1.getNumComments(), t2.getNumComments(),
				"numComments"))
			return false;

		if (!isTheSameValues(t1.getNumFavorites(), t2.getNumFavorites(),
				"numFavorites"))
			return false;

		if (!isTheSameValues(t1.getNumNegativeVotes(),
				t2.getNumNegativeVotes(), "numNegativeVotes"))
			return false;

		if (!isTheSameValues(t1.getNumPositiveVotes(),
				t2.getNumPositiveVotes(), "numPositiveVotes"))
			return false;

		if (!isTheSameValues(t1.getNumRatings(), t2.getNumRatings(),
				"numRatings"))
			return false;

		if (!isTheSameValues(t1.getNumResharings(), t2.getNumResharings(),
				"numResharings"))
			return false;

		if (!isTheSameValues(t1.getNumViews(), t2.getNumViews(), "numViews"))
			return false;

		if (!isTheSameValues(t1.getNumVotes(), t2.getNumVotes(), "numVotes"))
			return false;

		if (!isTheSameValues(t1.getRating(), t2.getRating(), "rating"))
			return false;

		if (!isTheSameValues(t1.getStartTime(), t2.getStartTime(), "startTime"))
			return false;

		if (!isTheSameValues(t1.getTaggedPeople(), t2.getTaggedPeople(),
				"taggedPeople"))
			return false;

		if (!isTheSameValues(t1.getTags(), t2.getTags(), "tags"))
			return false;

		if (!isTheSameValues(t1.getThumbnailUrl(), t2.getThumbnailUrl(),
				"thumbnaiUrl"))
			return false;

		if (!isTheSameValues(t1.getTitle(), t2.getTitle(), "title"))
			return false;

		if (t1.getType().compareTo(t2.getType()) != 0){
			ErrorMessage errorMessage = new ErrorMessage();
			errorMessage.setFaultProp("type");
			errorMessage.setFaultValueP1(t1.getType().toString());
			errorMessage.setFaultValueP2(t2.getType().toString());
			this.setErrorMessage(errorMessage);
			return false;
		}
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
