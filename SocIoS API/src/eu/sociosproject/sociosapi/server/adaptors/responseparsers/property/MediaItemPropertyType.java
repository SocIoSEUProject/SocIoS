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

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemPropertyType {
	private String image;
	private String video;
	private String audio;
	private String text;

	public String getImage() {
		return image;
	}

	public String getVideo() {
		return video;
	}

	public String getAudio() {
		return audio;
	}

	public String getText() {
		return text;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public void setText(String text) {
		this.text = text;
	}

}
