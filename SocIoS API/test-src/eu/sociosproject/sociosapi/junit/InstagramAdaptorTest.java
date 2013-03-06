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
import java.math.BigInteger;

import org.junit.Test;

import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.junit.comparator.AbstractComparator;
import eu.sociosproject.sociosapi.junit.comparator.MediaItemComparator;
import eu.sociosproject.sociosapi.junit.comparator.PersonComparator;
import eu.sociosproject.sociosapi.junit.tools.PropertiesTool;
import eu.sociosproject.sociosapi.server.adaptors.AbstractParser;
import eu.sociosproject.sociosapi.server.adaptors.instagram.requestconstructor.MediaItemRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.instagram.requestconstructor.PersonRequestMaker;
import eu.sociosproject.sociosapi.server.adaptors.instagram.responseparser.InstagramFindMethods;
import eu.sociosproject.sociosapi.server.adaptors.instagram.responseparser.InstagramGetMethods;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.MediaItemParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.PersonParser;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.MediaItemProperty;
import eu.sociosproject.sociosapi.server.adaptors.responseparsers.property.PersonProperty;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemType;
import eu.sociosproject.sociosvoc.Name;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;

/**
 * this test class check corrections of calling instagram services 
 * 
 * @author pielakm
 *
 */
public class InstagramAdaptorTest extends AbstractJUnitTestAdaptor{
	/**
	 * 
	 */
	private final String pathToInstagram = "tests/instagram";
	
	/**
	 * 
	 */
	private PropertiesTool prop;

	public InstagramAdaptorTest() throws SociosException {
		String pathToPersonReq = pathToInstagram + "/testRequest.properties";
		prop = new PropertiesTool(pathToPersonReq);
	}
	
	@Test
	public void testPersonRequestMaker(){
		PersonRequestMaker requestMaker = new PersonRequestMaker();
		
		String parsedReqGetPersonId = requestMaker.getPersonById("sampleId");
		String expectReqGetPersonId = prop.getProperty("getperson");
		assertEquals("Test requestMaker, GetPerson", parsedReqGetPersonId,
				expectReqGetPersonId);

		String parsedReqFindPerson = requestMaker.getPersonByQuery("sampleQuery", 10);
		String expectReqFindPerson = prop.getProperty("findperson");
		assertEquals("Test requestMaker, FindPerson ", parsedReqFindPerson,
				expectReqFindPerson);
		
		String parsedReqGetFollow = requestMaker.getFollowPersonsByUserId("sampleUserId");
		String expectReqGetFollow = prop.getProperty("getfollow");
		
		assertEquals("Test requestMaker, GetFollowPersonByUserId ", parsedReqGetFollow,
				expectReqGetFollow);
	
	}
	
	@Test
	public void testMediaItemRequestMaker(){
		MediaItemRequestMaker requestMaker = new MediaItemRequestMaker();
		
		/*
		String  parsedReqGetMediaItemId = requestMaker.getMediaItemById("sampleId");
		String 	expectReqGetMediaItemId = prop.getProperty("getmediaitem");
		assertEquals("Test requestMaker, GetMediaItem", parsedReqGetMediaItemId,
				expectReqGetMediaItemId);
		
		String parsedReqFindMediaItem = requestMaker.getMediaItemBySearch("10", "10", "1", "1", "1");
		String expectFindMediaItem = prop.getProperty("findmediaitem");
		assertEquals("Test requestMaker, FindMediaItem ", parsedReqFindMediaItem,
				expectFindMediaItem);
		
		String  parsedReqGetMediaItemByTagName = requestMaker.getMediaItemByTagName("sampleTagName");
		String 	expectReqGetMediaItemByTagName = prop.getProperty("getMediaItemByTagName");
		assertEquals("Test requestMaker, getMediaItemByTagName", parsedReqGetMediaItemByTagName,
				expectReqGetMediaItemByTagName);
		
		String  parsedReqGetMediaItemByUserId = requestMaker.getMediaItemByUserId("sampleUserId");
		String 	expectReqGetMediaItemByUserId = prop.getProperty("getMediaItemByUserId");
		assertEquals("Test requestMaker, getMediaItemByUserId", parsedReqGetMediaItemByUserId,
				expectReqGetMediaItemByUserId);
				*/
		
	}
	
	@Test
	public void testMediaItemParser() throws SociosException{
		String pathToFile = pathToInstagram + "/parser/testMediaItem";
		String input = getStringFromFile(new File(pathToFile));
		
		AbstractParser<MediaItem> mediaItemParser = new MediaItemParser();
		MediaItemProperty findMediaItems = InstagramFindMethods.findMediaItems();
		findMediaItems.setObjJSONname("data");
		
		
		MediaItem parsedMediaItem = mediaItemParser.parseToObj(input, findMediaItems);
		MediaItem expectMediaItem = getSampleMediaItem();
		
		AbstractComparator<MediaItem> comparator = new MediaItemComparator();
		int result = comparator.compare(parsedMediaItem, expectMediaItem);

		if (result == 0)
			assertEquals("Test mediaItemParser Successfull", true, true);
		else
			fail("MediaItem " + comparator.toString());

	}
	
	@Test
	public void testPersonParser() throws SociosException{
		String pathToFile = pathToInstagram + "/parser/testPerson";
		String input = getStringFromFile(new File(pathToFile));
		
		AbstractParser<Person> personParser = new PersonParser();
		PersonProperty getPersons = InstagramGetMethods.getPersons();
		getPersons.setObjJSONname("data");
		
		Person parsedPerson = personParser.parseToObj(input, getPersons);
		Person expectPerson = getSamplePerson();
		
		AbstractComparator<Person> comparator = new PersonComparator();
		int result = comparator.compare(parsedPerson, expectPerson);

		if (result == 0)
			assertEquals("Test mediaItemParser Successfull", true, true);
		else
			fail("MediaItem " + comparator.toString());
	}
	
	/**
	 * 
	 * @return
	 */
	private Person getSamplePerson() {
		Person person = new Person();
		//id
		ObjectId objId = new ObjectId();
		objId.setId("1574083");
		person.setId(objId);
		// username
		person.setDisplayName("snoopdogg");
		// fullname
		Name name = new Name();
		name.setFormatted("Snoop Dogg");
		person.setName(name);
		// profile_picture
		person.getPhotos().add("http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg");
		// bio
		person.setAboutMe("This is my bio");
		// website
		person.getUrls().add("http://snoopdogg.com");
		
		return person;
	}
	
	/**
	 * 
	 * @return
	 */
	private MediaItem getSampleMediaItem() {
		MediaItem mediaItem = new MediaItem();
		// id
		ObjectId objId = new ObjectId();
		objId.setId("3");
		mediaItem.setId(objId);
		// user -> id
		objId = new ObjectId();
		objId.setId("3");
		mediaItem.setUserId(objId);
		// link
		mediaItem.setUrl("http://instagr.am/p/D/");
		// tags
		mediaItem.setTags("socios;socios2");
		// type
		mediaItem.setType(MediaItemType.IMAGE);
		// images -> thumbnail
		mediaItem.setThumbnailUrl("http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_5.jpg");
		// likes -> count
		mediaItem.setNumPositiveVotes(new BigInteger("1"));
		// created_time TODO
		
		return mediaItem;
	}

}
