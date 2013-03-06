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
 
package eu.sociosproject.sociosapi.junit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.io.File;

import org.junit.Test;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.junit.comparator.AbstractComparator;
import eu.sociosproject.sociosapi.junit.comparator.ActivityComparator;
import eu.sociosproject.sociosapi.junit.comparator.PersonComparator;
import eu.sociosproject.sociosapi.junit.tools.PropertiesTool;
import eu.sociosproject.sociosapi.server.adaptors.googlep.requestconstructor.PersonRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.googlep.responseparser.GooglepGetMethods;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.ActivityParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.PersonParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.ActivityProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.Address;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;

/**
 * 
 * @author pielakm
 * 
 */
public class GooglepAdaptorTest extends AbstractJUnitTestAdaptor {

	private final String pathToGoogleP = "tests/googlep";

	private PropertiesTool prop;

	public GooglepAdaptorTest() throws SociosException {
		String pathToPersonReq = pathToGoogleP + "/testRequest.properties";
		prop = new PropertiesTool(pathToPersonReq);
	}

	@Test
	public void testPersonParser() throws SociosException {
		String pathToFile = pathToGoogleP + "/parser/testPerson";
		Person parsedPersonObj = getPersonFromJSON(pathToFile);
		Person expectedPersonObj = getSamplePerson();

		AbstractComparator<Person> comparator = new PersonComparator();
		int result = comparator.compare(parsedPersonObj, expectedPersonObj);

		if (result == 0)
			assertEquals("Test personParser Successfull", true, true);
		else
			fail("Person " + comparator.toString());
	}

	@Test
	public void testActivityParser() throws SociosException {
		String pathToFile = pathToGoogleP + "/parser/testActivity";
		Activity parsedActivityObj = getActivityFromJSON(pathToFile);
		Activity expectedActivityObj = getSampleActivity();

		AbstractComparator<Activity> comparator = new ActivityComparator();
		int result = comparator.compare(parsedActivityObj, expectedActivityObj);
		if (result == 0)
			assertEquals("Test activityParser", true, true);
		else
			fail("Activity " + comparator.toString());
	}

	@Test
	public void testPersonRequestMaker() {

		PersonRequestMaker requestMaker = new PersonRequestMaker();
		String parsedReqGetPersonId = requestMaker
				.getPersonReguestById("sampleId");
		String expectReqGetPersonId = prop.getProperty("getperson");
		assertEquals("Test requestMaker, GetPerson", parsedReqGetPersonId,
				expectReqGetPersonId);

		String parsedFindPerson = requestMaker
				.getPersonRequestByQuery("sampleQuery");
		String expectFindPerson = prop.getProperty("findperson");
		assertEquals("Test requestMaker, FindPerson ", parsedFindPerson,
				expectFindPerson);
	}

	@Test
	public void testActivityRequestMaker() {
		
		
	}

	protected Person getPersonFromJSON(String pathFile) throws SociosException {
		String input = getStringFromFile(new File(pathFile));
		AbstractParser<Person> personParser = new PersonParser();
		PersonProperty personProp = GooglepGetMethods.getPersons();
		personProp.setObjJSONname("");
		Person person = personParser.parseToObj(input, personProp);
		return person;
	}

	protected Activity getActivityFromJSON(String pathFile)
			throws SociosException {
		String input = getStringFromFile(new File(pathFile));
		AbstractParser<Activity> activityParser = new ActivityParser();
		ActivityProperty activityProp = GooglepGetMethods.getActivities();
		activityProp.setObjJSONname("");
		Activity activity = activityParser.parseToObj(input, activityProp);
		return activity;
	}

	private Person getSamplePerson() {
		Person person = new Person();
		ObjectId objId = new ObjectId();
		objId.setId("107762823296681792004");
		person.setId(objId);
		person.setDisplayName("Socios SociosT");
		Name name = new Name();
		name.setGivenName("Socios");
		name.setFamilyName("SociosT");
		person.setName(name);
		person.setGender("male");
		person.setAboutMe("Hello Everybody! Socios Project!");
		person.setProfileUrl("https://plus.google.com/107762823296681792004");
		// address 3 locality
		Address address = new Address();
		address.setLocality("Saloniki");
		person.getAddresses().add(address);
		address = new Address();
		address.setLocality("Berlin");
		person.getAddresses().add(address);
		address = new Address();
		address.setLocality("Athens");
		address.setPrimary(false);
		person.getAddresses().add(address);
		person.getPhotos()
				.add("https://lh4.googleusercontent.com/-MzqKOr70Mos/AAAAAAAAAAI/AAAAAAAAAAA/3R2-BTIhn4w/photo.jpg?sz=50");
		person.getUrls().add("http://www.sociosproject.eu/");
		person.getUrls().add("https://plus.google.com/107762823296681792004");
		person.getUrls().add("https://www.googleapis.com/plus/v1/people/107762823296681792004");
		return person;
	}

	private Activity getSampleActivity() {
		Activity activity = new Activity();
		ObjectId objId = new ObjectId();
		objId.setId("z12nw55ikzrzfv1dz23kfzoazlrpxf4yl04");
		activity.setId(objId);
		
		activity.setTitle("The Miami Heat are the 2012 NBA Champions!!!!!!!!!!!!!");
		activity.setUrl("https://plus.google.com/107685861911873301019/posts/BYbVAT9z6Ge");
		objId = new ObjectId();
		objId.setId("107685861911873301019");
		activity.setUserId(objId);
		
		MediaItem mediaItem = new MediaItem();
		objId = new ObjectId();
		mediaItem.setId(objId);
		mediaItem.setDescription("146656932.JPG");
		mediaItem.setUrl("https://plus.google.com/photos/107685861911873301019/albums/5756703904292529873/5756703904934970594");
		mediaItem.setType(MediaItemType.IMAGE);
		activity.getMediaItems().add(mediaItem);
		return activity;
	}

}
