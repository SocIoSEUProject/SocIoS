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
import eu.sociosproject.sociosvoc.Activity;

/**
 * 
 * @author pielakm
 * 
 */
public class ActivityProperty extends Property<Activity> {

	private ValueInfo appId;
	private ValueInfo body;
	private ValueInfo bodyId;
	private ValueInfo externalId;
	private ValueInfo id;
	private MediaItemProperty mediaItems;
	private ValueInfo postedTime;
	private ValueInfo priority;
	private ValueInfo source;
	private ValueInfo streamFaviconUrl;
	private ValueInfo streamSourceUrl;
	private ValueInfo streamTitle;
	private ValueInfo streamUrl;
	// private ActivityTemplateParams templateParams;
	private ValueInfo title;
	private ValueInfo titleId;
	private ValueInfo url;
	private ValueInfo userId;

	public ValueInfo getAppId() {
		return appId;
	}

	public void setAppId(ValueInfo appId) {
		this.appId = appId;
	}

	public ValueInfo getBody() {
		return body;
	}

	public void setBody(ValueInfo body) {
		this.body = body;
	}

	public ValueInfo getBodyId() {
		return bodyId;
	}

	public void setBodyId(ValueInfo bodyId) {
		this.bodyId = bodyId;
	}

	public ValueInfo getExternalId() {
		return externalId;
	}

	public void setExternalId(ValueInfo externalId) {
		this.externalId = externalId;
	}

	public ValueInfo getId() {
		return id;
	}

	public void setId(ValueInfo id) {
		this.id = id;
	}

	public MediaItemProperty getMediaItems() {
		return mediaItems;
	}

	public void setMediaItems(MediaItemProperty mediaItems) {
		this.mediaItems = mediaItems;
	}

	public ValueInfo getPostedTime() {
		return postedTime;
	}

	public void setPostedTime(ValueInfo postedTime) {
		this.postedTime = postedTime;
	}

	public ValueInfo getPriority() {
		return priority;
	}

	public void setPriority(ValueInfo priority) {
		this.priority = priority;
	}

	public ValueInfo getStreamFaviconUrl() {
		return streamFaviconUrl;
	}

	public void setStreamFaviconUrl(ValueInfo streamFaviconUrl) {
		this.streamFaviconUrl = streamFaviconUrl;
	}

	public ValueInfo getStreamSourceUrl() {
		return streamSourceUrl;
	}

	public void setStreamSourceUrl(ValueInfo streamSourceUrl) {
		this.streamSourceUrl = streamSourceUrl;
	}

	public ValueInfo getStreamTitle() {
		return streamTitle;
	}

	public void setStreamTitle(ValueInfo streamTitle) {
		this.streamTitle = streamTitle;
	}

	public ValueInfo getStreamUrl() {
		return streamUrl;
	}

	public void setStreamUrl(ValueInfo streamUrl) {
		this.streamUrl = streamUrl;
	}

	public ValueInfo getTitle() {
		return title;
	}

	public void setTitle(ValueInfo title) {
		this.title = title;
	}

	public ValueInfo getTitleId() {
		return titleId;
	}

	public void setTitleId(ValueInfo titleId) {
		this.titleId = titleId;
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

	public ValueInfo getSource() {
		return source;
	}

	public void setSource(ValueInfo source) {
		this.source = source;
	}
}
