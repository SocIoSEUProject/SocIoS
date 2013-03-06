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
import eu.sociosproject.sociosvoc.MediaItem;

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemProperty extends Property<MediaItem> {

	private ValueInfo id;
	private ValueInfo title;
	private ValueInfo created;
	private ValueInfo thumbnailUrl;
	private ValueInfo description;
	private ValueInfo duration;
	private AddressProperty location;
	private ValueInfo language;
	private ValueInfo albumId;
	private ValueInfo fileSize;
	private ValueInfo startTime;
	private ValueInfo rating;
	private ValueInfo numRatings;
	private ValueInfo numVotes;
	private ValueInfo numPositiveVotes;
	private ValueInfo numNegativeVotes;
	private ValueInfo numComments;
	private ValueInfo numViews;
	private ValueInfo numResharings;
	private ValueInfo numFavorites;
	private ValueInfo tags;
	private ValueInfo taggedPeople;
	private ValueInfo mimeType;
	private ValueInfo url;
	private ValueInfo userId;
	private ValueInfo expirationDate;
	private ValueInfo type;
	private MediaItemPropertyType typeProperty;
	private ValueInfo source;

	public ValueInfo getId() {
		return id;
	}

	public void setId(ValueInfo id) {
		this.id = id;
	}

	public ValueInfo getTitle() {
		return title;
	}

	public void setTitle(ValueInfo title) {
		this.title = title;
	}

	public ValueInfo getCreated() {
		return created;
	}

	public void setCreated(ValueInfo created) {
		this.created = created;
	}

	public ValueInfo getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(ValueInfo thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public ValueInfo getDescription() {
		return description;
	}

	public void setDescription(ValueInfo description) {
		this.description = description;
	}

	public ValueInfo getDuration() {
		return duration;
	}

	public void setDuration(ValueInfo duration) {
		this.duration = duration;
	}

	public AddressProperty getLocation() {
		return location;
	}

	public void setLocation(AddressProperty location) {
		this.location = location;
	}

	public ValueInfo getLanguage() {
		return language;
	}

	public void setLanguage(ValueInfo language) {
		this.language = language;
	}

	public ValueInfo getAlbumId() {
		return albumId;
	}

	public void setAlbumId(ValueInfo albumId) {
		this.albumId = albumId;
	}

	public ValueInfo getFileSize() {
		return fileSize;
	}

	public void setFileSize(ValueInfo fileSize) {
		this.fileSize = fileSize;
	}

	public ValueInfo getStartTime() {
		return startTime;
	}

	public void setStartTime(ValueInfo startTime) {
		this.startTime = startTime;
	}

	public ValueInfo getRating() {
		return rating;
	}

	public void setRating(ValueInfo rating) {
		this.rating = rating;
	}

	public ValueInfo getNumRatings() {
		return numRatings;
	}

	public void setNumRatings(ValueInfo numRatings) {
		this.numRatings = numRatings;
	}

	public ValueInfo getNumVotes() {
		return numVotes;
	}

	public void setNumVotes(ValueInfo numVotes) {
		this.numVotes = numVotes;
	}

	public ValueInfo getNumPositiveVotes() {
		return numPositiveVotes;
	}

	public void setNumPositiveVotes(ValueInfo numPositiveVotes) {
		this.numPositiveVotes = numPositiveVotes;
	}

	public ValueInfo getNumNegativeVotes() {
		return numNegativeVotes;
	}

	public void setNumNegativeVotes(ValueInfo numNegativeVotes) {
		this.numNegativeVotes = numNegativeVotes;
	}

	public ValueInfo getNumComments() {
		return numComments;
	}

	public void setNumComments(ValueInfo numComments) {
		this.numComments = numComments;
	}

	public ValueInfo getNumViews() {
		return numViews;
	}

	public void setNumViews(ValueInfo numViews) {
		this.numViews = numViews;
	}

	public ValueInfo getNumResharings() {
		return numResharings;
	}

	public void setNumResharings(ValueInfo numResharings) {
		this.numResharings = numResharings;
	}

	public ValueInfo getNumFavorites() {
		return numFavorites;
	}

	public void setNumFavorites(ValueInfo numFavorites) {
		this.numFavorites = numFavorites;
	}

	public ValueInfo getTags() {
		return tags;
	}

	public void setTags(ValueInfo tags) {
		this.tags = tags;
	}

	public ValueInfo getTaggedPeople() {
		return taggedPeople;
	}

	public void setTaggedPeople(ValueInfo taggedPeople) {
		this.taggedPeople = taggedPeople;
	}

	public ValueInfo getMimeType() {
		return mimeType;
	}

	public void setMimeType(ValueInfo mimeType) {
		this.mimeType = mimeType;
	}

	public ValueInfo getUrl() {
		return url;
	}

	public void setUrl(ValueInfo url) {
		this.url = url;
	}

	public ValueInfo getUserId() {
		return userId;
	}

	public void setUserId(ValueInfo userId) {
		this.userId = userId;
	}

	public ValueInfo getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(ValueInfo expirationDate) {
		this.expirationDate = expirationDate;
	}

	public ValueInfo getType() {
		return type;
	}

	public void setType(ValueInfo type) {
		this.type = type;
	}

	public MediaItemPropertyType getTypeProperty() {
		return typeProperty;
	}

	public void setTypeProperty(String image, String video, String audio,
			String text) {
		typeProperty = new MediaItemPropertyType();
		typeProperty.setAudio(audio);
		typeProperty.setVideo(video);
		typeProperty.setImage(image);
		typeProperty.setText(text);
	}

	public ValueInfo getSource() {
		return source;
	}

	public void setSource(ValueInfo source) {
		this.source = source;
	}

	
}
