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
 
package eu.sociosproject.sociosapi;

/**
 * Please modify this class to meet your needs
 // * This class is not complete
 // */

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

//import eu.sociosproject.sociosvoc.KeyWordFilter;
//import eu.sociosproject.sociosvoc.MediaItemFilter;
//import eu.sociosproject.sociosapi.coreutilities.exceptions.SociosException;
import eu.sociosproject.sociosvoc.ActivityReturn;
import eu.sociosproject.sociosvoc.KeyWordFilter;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.PersonReturn;
import eu.sociosproject.sociosvoc.Source;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosapi.SociosException;

import eu.sociosproject.sociosvoc.InitiatorType;

import eu.sociosproject.sociosvoc.TopicsInSN;
//import eu.sociosproject.sociosvoc.Message;

///**
// * 
// */
public final class SociosApiTestClient {

	private SociosApiTestClient() {
	}

	public static void main(String args[]) throws java.lang.Exception {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.getInInterceptors().add(new LoggingInInterceptor());
		factory.getOutInterceptors().add(new LoggingOutInterceptor());
		factory.setServiceClass(SociosApi.class);
		factory.setAddress("http://localhost:8080/sociosApi/SociosApiImpl");
		SociosApi port = (SociosApi) factory.create();

		{
			System.out.println("registerListener.result="
					+ port.unregisterListener(InitiatorType.USER, "2"));
			System.out.println("registerListener.result="
					+ port.unregisterListener(InitiatorType.USER, "3"));
			System.out.println("registerListener.result="
					+ port.unregisterListener(InitiatorType.USER, "4"));

		}
		{
			System.out.println("ubregisterListener.result="
					+ port.unregisterListener(InitiatorType.TOPIC, "4"));
		}

		{
			System.out.println("Invoking registerListener...");
			java.lang.String _registerListener_eventListener_sociosApiUserKey = "29";
			eu.sociosproject.sociosvoc.SociosEventListener _registerListener_eventListener = new eu.sociosproject.sociosvoc.SociosEventListener();

			_registerListener_eventListener
					.setInitiatorType(InitiatorType.USER);
			eu.sociosproject.sociosvoc.ObjectId id = new ObjectId();
			id.setId("75665939@N02");
			// id.setId("74059645@N05");
			Source source = new Source();
			source.setKnownSns(KnownSns.FLICKR);
			id.setSource(source);
			_registerListener_eventListener.getTargets().add(id);

			eu.sociosproject.sociosvoc.ObjectId id1 = new ObjectId();
			Source source1 = new Source();
			id1.setId("123");
			source1.setKnownSns(KnownSns.DAILYMOTION);
			id1.setSource(source1);
			_registerListener_eventListener.getTargets().add(id1);

			eu.sociosproject.sociosvoc.ObjectId id2 = new ObjectId();
			Source source2 = new Source();
			id2.setId("456");
			source2.setKnownSns(KnownSns.FLICKR);
			id2.setSource(source2);
			_registerListener_eventListener.getTargets().add(id2);
			TopicsInSN topic = new TopicsInSN();
			topic.setKnownSns(KnownSns.FLICKR);
			topic.getTopics().add("tap dancing");

			_registerListener_eventListener.setTopics(topic);

			_registerListener_eventListener.setCallbackUrl("new_callback_url");
			_registerListener_eventListener.setServiceId("");
			_registerListener_eventListener
					.setInitiatorType(InitiatorType.TOPIC);

			System.out.println("registerListener.result="
					+ port.registerListener(_registerListener_eventListener));

		}
		

		{
			System.out.println("Invoking findPersons...");
			java.lang.String sociosApiUserKey = "";
			eu.sociosproject.sociosvoc.PersonFilter personFilter = null;
			eu.sociosproject.sociosvoc.MediaItemIdList mediaItemIdList = null;
			PersonReturn _findPersons__return = port.findPersons(sociosApiUserKey, personFilter, mediaItemIdList);

			for (int q = 0; q < _findPersons__return.getPersons().size(); q++)
				System.out.println("findPersons.Person["+ q + "]="
						+ _findPersons__return.getPersons().get(q).getDisplayName());

			for (int q = 0; q < _findPersons__return.getErrors().getError().size(); q++)
				System.out.println("findPersons.Error()[" + q + "]="
						+ _findPersons__return.getErrors().getError().get(q));

		}

		/*
		 * { System.out.println("Invoking getActivities..."); java.lang.String
		 * _getActivities_sociosApiUserKey = "";
		 * eu.sociosproject.sociosvoc.ActivityIdList _getActivities_activityIds
		 * = null; java.util.List<eu.sociosproject.sociosvoc.Activity>
		 * _getActivities__return = port.getActivities(_getActivities_sociosApiUserKey,_getActivities_activityIds);
		 * System.out.println("getActivities.result[0]=" + _getActivities__return.get(0).getBody());
		 */
		
		{
			System.out.println("Invoking getActivities...");
			java.lang.String sociosApiUserKey = "";
			eu.sociosproject.sociosvoc.ActivityIdList activityIds = null;
			ActivityReturn _getActivities__return = port.getActivities(sociosApiUserKey, activityIds);
						
			for (int q = 0; q < _getActivities__return.getActivities().size(); q++)
				System.out.println("getActivities.Activity["+ q + "]="
						+ _getActivities__return.getActivities().get(q).getBody());

			for (int q = 0; q < _getActivities__return.getErrors().getError().size(); q++)
				System.out.println("getActivities.Error()[" + q + "]="
						+ _getActivities__return.getErrors().getError().get(q));
		}
		
		
		
		/* } { System.out.println("Invoking getPersons..."); 
		 * java.lang.String _getPersons_sociosApiUserKey = "";
 		 * eu.sociosproject.sociosvoc.PersonIdList _getPersons_personIdList = new PersonIdList();
		 * ObjectId id = new ObjectId(); 
		 * id.setId("xh206n");
		 * _getPersons_personIdList.getPersonId().add(id);
		 * java.util.List<eu.sociosproject.sociosvoc.Person> _getPersons__return= port.getPersons(_getPersons_sociosApiUserKey, _getPersons_personIdList);
		 * System.out.println("getPersons.result=" +
		 * _getPersons__return.get(0).getProfileUrl());
		  } */

	{
			System.out.println("Invoking getPersons...");
			java.lang.String sociosApiUserKey = "";
			eu.sociosproject.sociosvoc.PersonIdList personIdList = new PersonIdList();
			ObjectId id = new ObjectId(); 
			id.setId("xh206n");
			personIdList.getPersonId().add(id);
			
			PersonReturn _getPersons__return = port.getPersons(sociosApiUserKey, personIdList);

			for (int q = 0; q < _getPersons__return.getPersons().size(); q++)
				System.out.println("getPersons.Person["+ q + "]="
						+ _getPersons__return.getPersons().get(q));
			
			for (int q = 0; q < _getPersons__return.getErrors().getError().size(); q++)
				System.out.println("getActivities.Error()[" + q + "]="
						+ _getPersons__return.getErrors().getError().get(q));
		}

		/*
		 * { System.out.println("Invoking findMediaItems..."); java.lang.String
		 * _findMediaItems_sociosApiUserKey = null; //
		 * eu.sociosproject.sociosvoc.MediaItemFilter
		 * _findMediaItems_filterMediaItem = null;
		 * 
		 * eu.sociosproject.sociosvoc.MediaItemFilter
		 * _findMediaItems_filterMediaItem = new MediaItemFilter();
		 * KeyWordFilter keyword = new KeyWordFilter();
		 * keyword.getKeyword().add("mirror");
		 * keyword.getKeyword().add("garden");
		 * _findMediaItems_filterMediaItem.setTags(keyword);
		 * System.out.println("kanw anazitisi me to titlo: " +
		 * _findMediaItems_filterMediaItem.getTags().getKeyword().get(0));
		 * eu.sociosproject.sociosvoc.PersonFilter _findMediaItems_filterPerson
		 * = null; eu.sociosproject.sociosvoc.PersonIdList
		 * _findMediaItems_personIdList = new PersonIdList(); ObjectId id = new
		 * ObjectId(); id.setId("74059645@N05"); Source source = new Source();
		 * source.setKnownSns(KnownSns.FLICKR); id.setSource(source);
		 * _findMediaItems_personIdList.getPersonId().add(id);
		 * java.util.List<eu.sociosproject.sociosvoc.MediaItem>
		 * _findMediaItems__return =
		 * port.findMediaItems(_findMediaItems_sociosApiUserKey,
		 * _findMediaItems_filterMediaItem, _findMediaItems_filterPerson,
		 * _findMediaItems_personIdList);
		 * 
		 * System.out.println("findMediaItems.size=" +
		 * _findMediaItems__return.size()); for(int q = 0; q <
		 * _findMediaItems__return.size(); q++) {
		 * System.out.println("findMediaItems.result[" + q + "]=" +
		 * _findMediaItems__return.get(q).getTags());
		 * System.out.println("findMediaItems.result[" + q + "]=" +
		 * _findMediaItems__return.get(q).getId().getId());
		 * 
		 * ObjectId userId =_findMediaItems__return.get(q).getUserId();
		 * if(userId != null) { Source src = userId.getSource(); if(src != null)
		 * { System.out.println("Source = " + src.getOtherId()); } }
		 * 
		 * }
		 * 
		 * } //System.out.println("findMediaItems.result=" +
		 * _findMediaItems__return.get(0).getDescription());
		 * 
		 * 
		 * /* { System.out.println("Invoking findConnectedActivities...");
		 * java.lang.String _findConnectedActivities_sociosApiUserKey = "";
		 * eu.sociosproject.sociosvoc.ActivityIdList
		 * _findConnectedActivities_activityIds = null;
		 * java.util.List<eu.sociosproject.sociosvoc.Activity>
		 * _findConnectedActivities__return =
		 * port.findConnectedActivities(_findConnectedActivities_sociosApiUserKey
		 * , _findConnectedActivities_activityIds);
		 * System.out.println("findConnectedActivities.result[0]=" +
		 * _findConnectedActivities__return.get(0).getBody());
		 * 
		 * 
		 * } {
		 * 
		 * try{ System.out.println("Invoking connectedPersons...");
		 * java.lang.String _connectedPersons_sociosApiUserKey = "17";
		 * //eu.sociosproject.sociosvoc.ObjectId _connectedPersons_personId =
		 * null; eu.sociosproject.sociosvoc.ObjectId _connectedPersons_personId
		 * = new ObjectId(); _connectedPersons_personId.setId("508798328");
		 * java.util.List<eu.sociosproject.sociosvoc.Person>
		 * _connectedPersons__return =
		 * port.connectedPersons(_connectedPersons_sociosApiUserKey,
		 * _connectedPersons_personId);
		 * 
		 * for(int q = 0; q < _connectedPersons__return.size(); q++)
		 * System.out.println("connectedPersons.result[" + q + "]=" +
		 * _connectedPersons__return.get(q).getDisplayName() + " , ");
		 * 
		 * } catch(Exception e) { e.printStackTrace(); }
		 * 
		 * //System.out.println("connectedPersons.result[0]=" +
		 * _connectedPersons__return.get(0).getAboutMe());
		 * 
		 * 
		 * }
		 * 
		 * 
		 * 
		 * 
		 * { System.out.println("Invoking findActivities..."); java.lang.String
		 * _findActivities_sociosApiUserKey = "2";
		 * eu.sociosproject.sociosvoc.ActivityFilter
		 * _findActivities_activityFilter = null;
		 * eu.sociosproject.sociosvoc.PersonFilter _findActivities_personFilter
		 * = null; eu.sociosproject.sociosvoc.MediaItemIdList
		 * _findActivities_mediaItemIdList = null;
		 * eu.sociosproject.sociosvoc.PersonIdList _findActivities_personIdList
		 * = new PersonIdList();
		 * 
		 * 
		 * ObjectId id = new ObjectId(); id.setId("75665939@N02"); //
		 * id.setId("74059645@N05"); // id.setId("100001570512130"); Source src
		 * = new Source(); src.setKnownSns(KnownSns.FLICKR);
		 * //src.setKnownSns(KnownSns.FACEBOOK); id.setSource(src);
		 * _findActivities_personIdList.getPersonId().add(id);
		 * java.util.List<eu.sociosproject.sociosvoc.Activity>
		 * _findActivities__return =
		 * port.findActivities(_findActivities_sociosApiUserKey,
		 * _findActivities_activityFilter, _findActivities_personFilter,
		 * _findActivities_mediaItemIdList, _findActivities_personIdList);
		 * 
		 * 
		 * if(_findActivities__return == null)
		 * System.out.println("response is null"); else {
		 * System.out.println("response is NOT null, size = " +
		 * _findActivities__return.size()); for(int q = 0; q <
		 * _findActivities__return.size(); q++) {
		 * System.out.println("findActivities.result[" + q + "]=" + " photo_id "
		 * +
		 * _findActivities__return.get(q).getMediaItems().get(q).getId().getId(
		 * )); System.out.println("findActivities.result[" + q + "]=" +
		 * " user_id " +
		 * _findActivities__return.get(q).getMediaItems().get(q).getUserId
		 * ().getId()); System.out.println("findActivities.result[" + q + "]=" +
		 * " title " +
		 * _findActivities__return.get(q).getMediaItems().get(q).getTitle());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return
		 * .get(q).getMediaItems().get(q).getNumComments());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getMediaItems().get(q).getNumViews());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getMediaItems().get(q).getUrl());
		 * 
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getUserId().getId());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getPostedTime());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getBody());
		 * System.out.println("findActivities.result[" + q + "]=" +
		 * _findActivities__return.get(q).getId().getId());
		 * 
		 * 
		 * } } }
		 */
		/*
		 * { System.out.println("Invoking getMediaItems..."); java.lang.String
		 * _getMediaItems_sociosApiUserKey = null;
		 * //eu.sociosproject.sociosvoc.MediaItemIdList
		 * _getMediaItems_mediaItemIdList = null;
		 * eu.sociosproject.sociosvoc.MediaItemIdList
		 * _getMediaItems_mediaItemIdList = new MediaItemIdList(); ObjectId obj
		 * = new ObjectId(); obj.setId("xix4gv"); Source src = new Source();
		 * src.setKnownSns(KnownSns.DAILYMOTION); obj.setSource(src);
		 * 
		 * _getMediaItems_mediaItemIdList.getMediaItemId().add(obj);
		 * System.out.println("mediaItem_id: " +
		 * _getMediaItems_mediaItemIdList.getMediaItemId().get(0));
		 * java.util.List<eu.sociosproject.sociosvoc.MediaItem>
		 * _getMediaItems__return =
		 * port.getMediaItems(_getMediaItems_sociosApiUserKey,
		 * _getMediaItems_mediaItemIdList);
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getDescription());
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getRating());
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getNumComments());
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getNumRatings());
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getNumFavorites());
		 * System.out.println("getMediaItems.result[0]=" +
		 * _getMediaItems__return.get(0).getId().getId());
		 * 
		 * }
		 * 
		 * /* { System.out.println("Invoking myConnectedPersons...");
		 * java.lang.String _myConnectedPersons_sociosApiUserKey = "";
		 * eu.sociosproject.sociosvoc.ObjectId _myConnectedPersons_personId =
		 * null; java.util.List<eu.sociosproject.sociosvoc.Person>
		 * _myConnectedPersons__return =
		 * port.myConnectedPersons(_myConnectedPersons_sociosApiUserKey,
		 * _myConnectedPersons_personId);
		 * System.out.println("connectedPersons.result[0]=" +
		 * _myConnectedPersons__return.get(0).getAboutMe());
		 * 
		 * 
		 * }
		 */

		System.exit(0);

	}
}
