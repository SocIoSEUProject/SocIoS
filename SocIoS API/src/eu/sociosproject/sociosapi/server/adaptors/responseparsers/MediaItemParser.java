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
 
package eu.sociosproject.sociosapi.server.adaptors.responseparsers;

import java.math.BigInteger;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.generalutilities.DateUtilities;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONObject;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.AddressProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.Property;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.License;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Source;

/**
 * 
 * @author pielakm
 * 
 */
public class MediaItemParser extends AbstractParser<MediaItem> {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public MediaItem parseToObj(JSONObject jObject, Property<MediaItem> property)
			throws SociosException {

		// System.out.println("in MediaItemParser");

		logger.debug("parse - 1");
		BigInteger big = new BigInteger("-1");

		MediaItem mediaItem = new MediaItem();
		MediaItemProperty mProperty = (MediaItemProperty) property;

		if (!isEmptyOrNull(mProperty.getCreated())) {
			// System.out.println("getCreated");
			Long created_time = Long.parseLong((String) (getValue(
					mProperty.getCreated(), jObject)));
			// System.out.println("created_time = " + created_time);
			Date created = DateUtilities.timeStamptoDate(created_time);
			XMLGregorianCalendar xmlTakenTime = DateUtilities
					.asXMLGregorianCalendar(created);
			mediaItem.setCreated(xmlTakenTime);
			// System.out.println("mediaItem.getCreated = " +
			// mediaItem.getCreated().toString());
		}

		// if (!isEmptyOrNull(mProperty.getDescription())) {
		// String description = (String) getValue(mProperty.getDescription(),
		// jObject);
		// mediaItem.setDescription(description);
		// }

		if (!isEmptyOrNull(mProperty.getId())) {
			// System.out.println("getId");
			String id = (String) getValue(mProperty.getId(), jObject);
			// System.out.println("id = " + id);
			ObjectId objId = new ObjectId();
			objId.setId(id);
			Source source = new Source();
			source.setKnownSns(KnownSns.INSTAGRAM);
			objId.setSource(source);
			mediaItem.setId(objId);
		}

		if (!isEmptyOrNull(mProperty.getMimeType())) {
			// System.out.println("getMimeType");
			String mimeType = (String) getValue(mProperty.getMimeType(),
					jObject);
			mediaItem.setMimeType(mimeType);
		}
		if (!isEmptyOrNull(mProperty.getNumComments())) {
			// System.out.println("getNumComments");
			Integer primValue = (Integer) getValue(mProperty.getNumComments(),
					jObject);
			BigInteger value = BigInteger.valueOf(primValue.intValue());
			mediaItem.setNumComments(value);
		}
		 if (!isEmptyOrNull(mProperty.getNumFavorites())) {
		 Integer primValue = (Integer) getValue(mProperty.getNumFavorites(),
		 jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumFavorites(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumFavorites())){
		 mediaItem.setNumFavorites(big);
		 }
		 if (!isEmptyOrNull(mProperty.getNumNegativeVotes())) {
		 Integer primValue = (Integer) getValue(
		 mProperty.getNumNegativeVotes(), jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumNegativeVotes(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumNegativeVotes())){
		 mediaItem.setNumNegativeVotes(big);
		 }
		if (!isEmptyOrNull(mProperty.getNumPositiveVotes())) {
			// System.out.println("getNumPositiveVotes");
			Integer primValue = (Integer) getValue(
					mProperty.getNumPositiveVotes(), jObject);
			BigInteger value = BigInteger.valueOf(primValue.intValue());
			mediaItem.setNumPositiveVotes(value);
		}
		 if (!isEmptyOrNull(mProperty.getNumRatings())) {
		 Integer primValue = (Integer) getValue(mProperty.getNumRatings(),
		 jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumRatings(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumRatings())){
		 mediaItem.setNumRatings(big);
		 }
		 if (!isEmptyOrNull(mProperty.getNumResharings())) {
		 Integer primValue = (Integer) getValue(
		 mProperty.getNumResharings(), jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumResharings(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumResharings())){
		 mediaItem.setNumResharings(big);
		 }

		 if (!isEmptyOrNull(mProperty.getNumViews())) {
		 Integer primValue = (Integer) getValue(mProperty.getNumViews(),
		 jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumViews(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumViews())){
		 mediaItem.setNumViews(big);
		 }
		 if (!isEmptyOrNull(mProperty.getNumVotes())) {
		 Integer primValue = (Integer) getValue(mProperty.getNumVotes(),
		 jObject);
		 BigInteger value = BigInteger.valueOf(primValue.intValue());
		 mediaItem.setNumVotes(value);
		 }
		 else if(isEmptyOrNull(mProperty.getNumVotes())){
		 mediaItem.setNumVotes(big);
		 }
		 if (!isEmptyOrNull(mProperty.getRating())) {
		 Double value = (Double) getValue(mProperty.getRating(), jObject);
		 mediaItem.setRating(value);
		 }
		 else if(isEmptyOrNull(mProperty.getRating())){
		 mediaItem.setRating(-1.0);
		 }

		if (!isEmptyOrNull(mProperty.getTags())) {
			// System.out.println("getTags");
			String value = (String) getValue(mProperty.getTags(), jObject);
			String tagsValue = value.replace(";", "; ");
			mediaItem.setTags(tagsValue);
			// System.out.println("tags = " + tagsValue);
			String[] titleValue = value.split(";");
			StringBuilder builder = new StringBuilder();
			if (titleValue.length <= 5) {
				for (int i = 0; i < titleValue.length; i++) {
					builder.append(titleValue[i]);
					builder.append(" ");
				}
			} else if (titleValue.length > 5) {
				for (int i = 0; i < 5; i++) {
					builder.append(titleValue[i]);
					builder.append(" ");
				}
			}
			// System.out.println("title = " + builder);
			mediaItem.setTitle(builder.toString());
		}

		if (!isEmptyOrNull(mProperty.getThumbnailUrl())) {
			// System.out.println("getThumbnailUrl");
			String value = (String) getValue(mProperty.getThumbnailUrl(),
					jObject);
			mediaItem.setThumbnailUrl(value);
		}
		// oxi auto
		// if (!isEmptyOrNull(mProperty.getTitle())) {
		// String value = (String) getValue(mProperty.getTitle(), jObject);
		// mediaItem.setTitle(value);
		// }

		if (!isEmptyOrNull(mProperty.getType())
				&& !isEmptyOrNull(mProperty.getTypeProperty())) {
			// System.out.println("getType");
			String type = (String) getValue(mProperty.getType(), jObject);
			MediaItemType value = getType(type, mProperty);
			if (value != null)
				mediaItem.setType(value);
		}
		if (!isEmptyOrNull(mProperty.getUrl())) {
			// System.out.println("getUrl");
			String link = (String) getValue(mProperty.getUrl(), jObject);
			mediaItem.setUrl(link);
		}
		if (!isEmptyOrNull(mProperty.getUserId())) {
			// System.out.println("getUserId");
			String userId = (String) getValue(mProperty.getUserId(), jObject);
			ObjectId objId = new ObjectId();
			Source source = new Source();
			source.setKnownSns(KnownSns.INSTAGRAM);
			objId.setSource(source);
			objId.setId(userId);
			mediaItem.setUserId(objId);
		}

		License licenseUrl = new License();
		licenseUrl.setUrl("http://instagram.com/legal/terms/");
		mediaItem.setLicense(licenseUrl);

		return mediaItem;
	}

	public MediaItemType getType(String type, MediaItemProperty prop) {
		if (type.equals(prop.getTypeProperty().getImage())) {
			return MediaItemType.IMAGE;
		} else if (type.equals(prop.getTypeProperty().getAudio())) {
			return MediaItemType.AUDIO;
		} else if (type.equals(prop.getTypeProperty().getVideo())) {
			return MediaItemType.VIDEO;
		} else if (type.equals(prop.getTypeProperty().getText())) {
			return MediaItemType.TEXT;
		} else
			return null;
	}

}
