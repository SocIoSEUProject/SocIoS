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

import java.util.ArrayList;
import java.util.List;

import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ValueInfo;
import eu.sociosproject.sociosvoc.Person;

/**
 * 
 * @author pielakm
 * 
 */
public class PersonProperty extends Property<Person> {
	private ValueInfo aboutMe;
	// private Account accounts;
	private List<ValueInfo> activities = new ArrayList<ValueInfo>();
	private List<AddressProperty> addresses = new ArrayList<AddressProperty>();
	private ValueInfo age;
	private ValueInfo anniversary;
	// private Appdata appData;
	private ValueInfo birthday;
	private ValueInfo bodyType;
	private List<ValueInfo> books = new ArrayList<ValueInfo>();
	private List<ValueInfo> cars = new ArrayList<ValueInfo>();
	private ValueInfo children;
	private ValueInfo connected;
	// private AddressProperty currentLocation;
	private ValueInfo displayName;
	private ValueInfo drinker;
	private List<ValueInfo> emails = new ArrayList<ValueInfo>();
	private ValueInfo ethnicity;
	private ValueInfo fashion;
	private List<ValueInfo> food = new ArrayList<ValueInfo>();
	private ValueInfo gender;
	private ValueInfo happiestWhen;
	private ValueInfo hasApp;
	private List<ValueInfo> heroes = new ArrayList<ValueInfo>();
	private ValueInfo humor;
	private ValueInfo id;
	private List<ValueInfo> ims = new ArrayList<ValueInfo>();
	private List<ValueInfo> interests = new ArrayList<ValueInfo>();
	private List<ValueInfo> jobInterests = new ArrayList<ValueInfo>();
	private List<ValueInfo> languagesSpoken = new ArrayList<ValueInfo>();
	private ValueInfo livingArrangement;
	private List<ValueInfo> lookingFor = new ArrayList<ValueInfo>();
	private List<ValueInfo> movies = new ArrayList<ValueInfo>();
	private List<ValueInfo> music = new ArrayList<ValueInfo>();
	private NameProperty name;
	// private NetworkPresence networkPresence;
	private ValueInfo nickname;
	private List<OrganizationProperty> organizations = new ArrayList<OrganizationProperty>();
	private ValueInfo pets;
	private List<ValueInfo> phoneNumbers = new ArrayList<ValueInfo>();
	private List<ValueInfo> photos = new ArrayList<ValueInfo>();
	private ValueInfo politicalViews;
	private ValueInfo preferredUsername;
	private ValueInfo profileSong;
	private ValueInfo profileUrl;
	private ValueInfo profileVideo;
	private ValueInfo published;
	private List<ValueInfo> quotes = new ArrayList<ValueInfo>();
	private List<ValueInfo> relationships = new ArrayList<ValueInfo>();
	private ValueInfo relationshipStatus;
	private ValueInfo religion;
	private ValueInfo romance;
	private ValueInfo scaredOf;
	private ValueInfo sexualOrientation;
	private ValueInfo smoker;
	private List<ValueInfo> sports = new ArrayList<ValueInfo>();
	private ValueInfo status;
	private List<ValueInfo> tags = new ArrayList<ValueInfo>();
	private ValueInfo thumbnailUrl;
	private List<ValueInfo> turnOffs = new ArrayList<ValueInfo>();
	private List<ValueInfo> turnOns = new ArrayList<ValueInfo>();;
	private List<ValueInfo> tvShows = new ArrayList<ValueInfo>();;
	private ValueInfo updated;
	private List<ValueInfo> urls = new ArrayList<ValueInfo>();;
	private ValueInfo utcOffset;
	private ValueInfo numFriends;
	private ValueInfo inDegree;
	private ValueInfo outDegree;
	private String socialNetwork;

	public ValueInfo getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(ValueInfo aboutMe) {
		this.aboutMe = aboutMe;
	}

	public List<ValueInfo> getActivities() {
		return activities;
	}

	public void setActivities(List<ValueInfo> activities) {
		this.activities = activities;
	}

	public List<AddressProperty> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<AddressProperty> addresses) {
		this.addresses = addresses;
	}

	public ValueInfo getAge() {
		return age;
	}

	public void setAge(ValueInfo age) {
		this.age = age;
	}

	public ValueInfo getAnniversary() {
		return anniversary;
	}

	public void setAnniversary(ValueInfo anniversary) {
		this.anniversary = anniversary;
	}

	public ValueInfo getBirthday() {
		return birthday;
	}

	public void setBirthday(ValueInfo birthday) {
		this.birthday = birthday;
	}

	public ValueInfo getBodyType() {
		return bodyType;
	}

	public void setBodyType(ValueInfo bodyType) {
		this.bodyType = bodyType;
	}

	public List<ValueInfo> getBooks() {
		return books;
	}

	public void setBooks(List<ValueInfo> books) {
		this.books = books;
	}

	public List<ValueInfo> getCars() {
		return cars;
	}

	public void setCars(List<ValueInfo> cars) {
		this.cars = cars;
	}

	public ValueInfo getChildren() {
		return children;
	}

	public void setChildren(ValueInfo children) {
		this.children = children;
	}

	public ValueInfo getConnected() {
		return connected;
	}

	public void setConnected(ValueInfo connected) {
		this.connected = connected;
	}

	public ValueInfo getDisplayName() {
		return displayName;
	}

	public void setDisplayName(ValueInfo displayName) {
		this.displayName = displayName;
	}

	public ValueInfo getDrinker() {
		return drinker;
	}

	public void setDrinker(ValueInfo drinker) {
		this.drinker = drinker;
	}

	public List<ValueInfo> getEmails() {
		return emails;
	}

	public void setEmails(List<ValueInfo> emails) {
		this.emails = emails;
	}

	public ValueInfo getEthnicity() {
		return ethnicity;
	}

	public void setEthnicity(ValueInfo ethnicity) {
		this.ethnicity = ethnicity;
	}

	public ValueInfo getFashion() {
		return fashion;
	}

	public void setFashion(ValueInfo fashion) {
		this.fashion = fashion;
	}

	public List<ValueInfo> getFood() {
		return food;
	}

	public void setFood(List<ValueInfo> food) {
		this.food = food;
	}

	public ValueInfo getGender() {
		return gender;
	}

	public void setGender(ValueInfo gender) {
		this.gender = gender;
	}

	public ValueInfo getHappiestWhen() {
		return happiestWhen;
	}

	public void setHappiestWhen(ValueInfo happiestWhen) {
		this.happiestWhen = happiestWhen;
	}

	public ValueInfo getHasApp() {
		return hasApp;
	}

	public void setHasApp(ValueInfo hasApp) {
		this.hasApp = hasApp;
	}

	public List<ValueInfo> getHeroes() {
		return heroes;
	}

	public void setHeroes(List<ValueInfo> heroes) {
		this.heroes = heroes;
	}

	public ValueInfo getHumor() {
		return humor;
	}

	public void setHumor(ValueInfo humor) {
		this.humor = humor;
	}

	public ValueInfo getId() {
		return id;
	}

	public void setId(ValueInfo id) {
		this.id = id;
	}

	public List<ValueInfo> getIms() {
		return ims;
	}

	public void setIms(List<ValueInfo> ims) {
		this.ims = ims;
	}

	public List<ValueInfo> getInterests() {
		return interests;
	}

	public void setInterests(List<ValueInfo> interests) {
		this.interests = interests;
	}

	public List<ValueInfo> getJobInterests() {
		return jobInterests;
	}

	public void setJobInterests(List<ValueInfo> jobInterests) {
		this.jobInterests = jobInterests;
	}

	public List<ValueInfo> getLanguagesSpoken() {
		return languagesSpoken;
	}

	public void setLanguagesSpoken(List<ValueInfo> languagesSpoken) {
		this.languagesSpoken = languagesSpoken;
	}

	public ValueInfo getLivingArrangement() {
		return livingArrangement;
	}

	public void setLivingArrangement(ValueInfo livingArrangement) {
		this.livingArrangement = livingArrangement;
	}

	public List<ValueInfo> getLookingFor() {
		return lookingFor;
	}

	public void setLookingFor(List<ValueInfo> lookingFor) {
		this.lookingFor = lookingFor;
	}

	public List<ValueInfo> getMovies() {
		return movies;
	}

	public void setMovies(List<ValueInfo> movies) {
		this.movies = movies;
	}

	public List<ValueInfo> getMusic() {
		return music;
	}

	public void setMusic(List<ValueInfo> music) {
		this.music = music;
	}

	public ValueInfo getNickname() {
		return nickname;
	}

	public void setNickname(ValueInfo nickname) {
		this.nickname = nickname;
	}

	public List<OrganizationProperty> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<OrganizationProperty> organizations) {
		this.organizations = organizations;
	}

	public ValueInfo getPets() {
		return pets;
	}

	public void setPets(ValueInfo pets) {
		this.pets = pets;
	}

	public List<ValueInfo> getPhoneNumbers() {
		return phoneNumbers;
	}

	public void setPhoneNumbers(List<ValueInfo> phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}

	public List<ValueInfo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<ValueInfo> photos) {
		this.photos = photos;
	}

	public ValueInfo getPoliticalViews() {
		return politicalViews;
	}

	public void setPoliticalViews(ValueInfo politicalViews) {
		this.politicalViews = politicalViews;
	}

	public ValueInfo getPreferredUsername() {
		return preferredUsername;
	}

	public void setPreferredUsername(ValueInfo preferredUsername) {
		this.preferredUsername = preferredUsername;
	}

	public ValueInfo getProfileSong() {
		return profileSong;
	}

	public void setProfileSong(ValueInfo profileSong) {
		this.profileSong = profileSong;
	}

	public ValueInfo getProfileUrl() {
		return profileUrl;
	}

	public void setProfileUrl(ValueInfo profileUrl) {
		this.profileUrl = profileUrl;
	}

	public ValueInfo getProfileVideo() {
		return profileVideo;
	}

	public void setProfileVideo(ValueInfo profileVideo) {
		this.profileVideo = profileVideo;
	}

	public ValueInfo getPublished() {
		return published;
	}

	public void setPublished(ValueInfo published) {
		this.published = published;
	}

	public List<ValueInfo> getQuotes() {
		return quotes;
	}

	public void setQuotes(List<ValueInfo> quotes) {
		this.quotes = quotes;
	}

	public List<ValueInfo> getRelationships() {
		return relationships;
	}

	public void setRelationships(List<ValueInfo> relationships) {
		this.relationships = relationships;
	}

	public ValueInfo getRelationshipStatus() {
		return relationshipStatus;
	}

	public void setRelationshipStatus(ValueInfo relationshipStatus) {
		this.relationshipStatus = relationshipStatus;
	}

	public ValueInfo getReligion() {
		return religion;
	}

	public void setReligion(ValueInfo religion) {
		this.religion = religion;
	}

	public ValueInfo getRomance() {
		return romance;
	}

	public void setRomance(ValueInfo romance) {
		this.romance = romance;
	}

	public ValueInfo getScaredOf() {
		return scaredOf;
	}

	public void setScaredOf(ValueInfo scaredOf) {
		this.scaredOf = scaredOf;
	}

	public ValueInfo getSexualOrientation() {
		return sexualOrientation;
	}

	public void setSexualOrientation(ValueInfo sexualOrientation) {
		this.sexualOrientation = sexualOrientation;
	}

	public ValueInfo getSmoker() {
		return smoker;
	}

	public void setSmoker(ValueInfo smoker) {
		this.smoker = smoker;
	}

	public List<ValueInfo> getSports() {
		return sports;
	}

	public void setSports(List<ValueInfo> sports) {
		this.sports = sports;
	}

	public ValueInfo getStatus() {
		return status;
	}

	public void setStatus(ValueInfo status) {
		this.status = status;
	}

	public List<ValueInfo> getTags() {
		return tags;
	}

	public void setTags(List<ValueInfo> tags) {
		this.tags = tags;
	}

	public ValueInfo getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(ValueInfo thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public List<ValueInfo> getTurnOffs() {
		return turnOffs;
	}

	public void setTurnOffs(List<ValueInfo> turnOffs) {
		this.turnOffs = turnOffs;
	}

	public List<ValueInfo> getTurnOns() {
		return turnOns;
	}

	public void setTurnOns(List<ValueInfo> turnOns) {
		this.turnOns = turnOns;
	}

	public List<ValueInfo> getTvShows() {
		return tvShows;
	}

	public void setTvShows(List<ValueInfo> tvShows) {
		this.tvShows = tvShows;
	}

	public ValueInfo getUpdated() {
		return updated;
	}

	public void setUpdated(ValueInfo updated) {
		this.updated = updated;
	}

	public List<ValueInfo> getUrls() {
		return urls;
	}

	public void setUrls(List<ValueInfo> urls) {
		this.urls = urls;
	}

	public ValueInfo getUtcOffset() {
		return utcOffset;
	}

	public void setUtcOffset(ValueInfo utcOffset) {
		this.utcOffset = utcOffset;
	}

	public ValueInfo getNumFriends() {
		return numFriends;
	}

	public void setNumFriends(ValueInfo numFriends) {
		this.numFriends = numFriends;
	}

	public ValueInfo getInDegree() {
		return inDegree;
	}

	public void setInDegree(ValueInfo inDegree) {
		this.inDegree = inDegree;
	}

	public ValueInfo getOutDegree() {
		return outDegree;
	}

	public void setOutDegree(ValueInfo outDegree) {
		this.outDegree = outDegree;
	}

	public NameProperty getName() {
		return name;
	}

	public void setName(NameProperty name) {
		this.name = name;
	}

	
	public String getSocialNetwork() {
		return socialNetwork;
	}

	public void setSocialNetwork(String socialNetwork) {
		this.socialNetwork = socialNetwork;
	}

}
