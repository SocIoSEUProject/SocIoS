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

import eu.sociosproject.sociosvoc.Account;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Organization;
import eu.sociosproject.sociosvoc.Person;

/**
 * appData
 * 
 * @author pielakm
 * 
 */
public class PersonComparator extends AbstractComparator<Person> {

	@Override
	public Boolean isTheSameProps(Person p1, Person p2) {
		AbstractComparator<Account> accountCptor = new AccountComparator();
		int result = accountCptor.compare(p1.getAccounts(), p2.getAccounts());
		if (result != 0) {
			this.setErrorMessage(accountCptor.getErrorMessage());
			return false;
		}

		AbstractComparator<Activity> activityComparator = new ActivityComparator();
		Boolean isEqualActivList = activityComparator.isTheSameValuesInList(
				p1.getActivities(), p2.getActivities(), "activitiesList");
		if (!isEqualActivList) {
			this.setErrorMessage(activityComparator.getErrorMessage());
			return false;
		}

		AbstractComparator<Address> addressComparator = new AddressComparator();
		result = addressComparator.compareList(p1.getAddresses(),
				p2.getAddresses(), "addressesList");
		if (result != 0) {
			this.setErrorMessage(addressComparator.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(p1.getAboutMe(), p2.getAboutMe(), "aboutMe"))
			return false;

		if (!isTheSameValues(p1.getAge(), p2.getAge(), "age"))
			return false;

		if (!isTheSameValues(p1.getAnniversary(), p2.getAnniversary(),
				"anniversary"))
			return false;

		if (!isTheSameValues(p1.getBirthday(), p2.getBirthday(), "birthday"))
			return false;

		if (!isTheSameValues(p1.getBodyType(), p2.getBodyType(), "bodyType"))
			return false;

		if (!isTheSameValuesInList(p1.getBooks(), p2.getBooks(), "booksList"))
			return false;

		if (!isTheSameValuesInList(p1.getCars(), p2.getCars(), "carsList"))
			return false;

		if (!isTheSameValues(p1.getChildren(), p2.getChildren(), "children"))
			return false;

		result = addressComparator.compare(p1.getCurrentLocation(),
				p2.getCurrentLocation());
		if (result != 0) {
			this.setErrorMessage(addressComparator.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(p1.getDisplayName(), p2.getDisplayName(),
				"displayName"))
			return false;

		if (!isTheSameValues(p1.getDrinker(), p2.getDrinker(), "drinker"))
			return false;

		if (!isTheSameValuesInList(p1.getEmails(), p2.getEmails(), "emailsList"))
			return false;

		if (!isTheSameValues(p1.getEthnicity(), p2.getEthnicity(), "ethnicity"))
			return false;

		if (!isTheSameValuesInList(p1.getFood(), p2.getFood(), "food"))
			return false;

		if (!isTheSameValues(p1.getFashion(), p2.getFashion(), "fashion"))
			return false;
		if (!isTheSameValues(p1.getGender(), p2.getGender(), "gender"))
			return false;

		if (!isTheSameValuesInList(p1.getHeroes(), p2.getHeroes(), "heroesList"))
			return false;

		if (!isTheSameValues(p1.getHappiestWhen(), p2.getHappiestWhen(),
				"happiestWhen"))
			return false;
		if (!isTheSameValues(p1.getHumor(), p2.getHumor(), "humor"))
			return false;

		AbstractComparator<ObjectId> objIdComparator = new ObjectIdComparator();
		result = objIdComparator.compare(p1.getId(), p2.getId());
		if (result != 0) {
			this.setErrorMessage(objIdComparator.getErrorMessage());
			return false;
		}

		if (!isTheSameValuesInList(p1.getIms(), p2.getIms(), "imsList"))
			return false;

		if (!isTheSameValuesInList(p1.getInterests(), p2.getInterests(),
				"interestesList"))
			return false;

		if (!isTheSameValues(p1.getInDegree(), p2.getInDegree(), "inDegree"))
			return false;

		if (!isTheSameValuesInList(p1.getLanguagesSpoken(),
				p2.getLanguagesSpoken(), "languageSpokenList"))
			return false;

		if (!isTheSameValues(p1.getLivingArrangement(),
				p2.getLivingArrangement(), "livingArrangement"))
			return false;

		if (!isTheSameValuesInList(p1.getLookingFor(), p2.getLookingFor(),
				"lookingForList"))
			return false;

		if (!isTheSameValuesInList(p1.getMovies(), p2.getMovies(), "moviesList"))
			return false;

		if (!isTheSameValuesInList(p1.getMusic(), p2.getMusic(), "musicList"))
			return false;

		AbstractComparator<Name> nameComparator = new NameComparator();
		result = nameComparator.compare(p1.getName(), p2.getName());
		if (result != 0) {
			this.setErrorMessage(nameComparator.getErrorMessage());
			return false;
		}

		if (!isTheSameValuesEnum(p1.getNetworkPresence(),
				p2.getNetworkPresence(), "networkPresence"))
			return false;

		if (!isTheSameValues(p1.getNickname(), p2.getNickname(), "nickName"))
			return false;

		if (!isTheSameValues(p1.getNumFriends(), p2.getNumFriends(),
				"numFriends"))
			return false;

		AbstractComparator<Organization> organizationComparator = new OrganizationComparator();
		result = organizationComparator.compareList(p1.getOrganizations(),
				p2.getOrganizations(), "organizationsList");
		if (result != 0) {
			this.setErrorMessage(organizationComparator.getErrorMessage());
			return false;
		}

		if (!isTheSameValues(p1.getOutDegree(), p2.getOutDegree(), "outDegree"))
			return false;

		if (!isTheSameValuesInList(p1.getPhoneNumbers(), p2.getPhoneNumbers(),
				"phoneNumbersList"))
			return false;

		if (!isTheSameValuesInList(p1.getPhotos(), p2.getPhotos(), "photosList"))
			return false;

		if (!isTheSameValues(p1.getPublished(), p2.getPublished(), "published"))
			return false;

		if (!isTheSameValues(p1.getPets(), p2.getPets(), "pets"))
			return false;

		if (!isTheSameValues(p1.getPoliticalViews(), p2.getPoliticalViews(),
				"politicalViews"))
			return false;

		if (!isTheSameValues(p1.getPreferredUsername(),
				p2.getPreferredUsername(), "preferredUserName"))
			return false;

		if (!isTheSameValues(p1.getProfileSong(), p2.getProfileSong(),
				"profileSong"))
			return false;

		if (!isTheSameValues(p1.getProfileUrl(), p2.getProfileUrl(),
				"profileUrl"))
			return false;

		if (!isTheSameValues(p1.getProfileVideo(), p2.getProfileVideo(),
				"profileVideo"))
			return false;

		if (!isTheSameValuesInList(p1.getRelationships(),
				p2.getRelationships(), "relationshipsList"))
			return false;

		if (!isTheSameValues(p1.getRelationshipStatus(),
				p2.getRelationshipStatus(), "relationshipStatus"))
			return false;

		if (!isTheSameValues(p1.getReligion(), p2.getReligion(), "religion"))
			return false;

		if (!isTheSameValues(p1.getRomance(), p2.getRomance(), "romance"))
			return false;

		if (!isTheSameValuesInList(p1.getSports(), p2.getSports(), "sportsList"))
			return false;

		if (!isTheSameValues(p1.getScaredOf(), p2.getScaredOf(), "scaredOf"))
			return false;

		if (!isTheSameValues(p1.getSexualOrientation(),
				p2.getSexualOrientation(), "sexualOrientation"))
			return false;

		if (!isTheSameValues(p1.getSmoker(), p2.getSmoker(), "smoker"))
			return false;

		if (!isTheSameValues(p1.getStatus(), p2.getStatus(), "status"))
			return false;

		if (!isTheSameValuesInList(p1.getTags(), p2.getTags(), "tagsList"))
			return false;

		if (!isTheSameValuesInList(p1.getTurnOffs(), p2.getTurnOffs(),
				"turnoffsList"))
			return false;

		if (!isTheSameValuesInList(p1.getTurnOns(), p2.getTurnOns(),
				"turnonsList"))
			return false;

		if (!isTheSameValuesInList(p1.getTvShows(), p2.getTvShows(),
				"tvshowsList"))
			return false;

		if (!isTheSameValues(p1.getThumbnailUrl(), p2.getThumbnailUrl(),
				"thumbnailUrl"))
			return false;

		if (!isTheSameValuesInList(p1.getUrls(), p2.getUrls(), "urlsList"))
			return false;

		if (!isTheSameValues(p1.getUtcOffset(), p2.getUtcOffset(), "utcOffset"))
			return false;

		return true;
	}
}
