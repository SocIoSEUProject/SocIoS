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
 
package eu.sociosproject.sociosapi.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.jws.WebService;

import eu.sociosproject.sociosapi.SociosApi;
import eu.sociosproject.sociosapi.SociosException;
//import eu.sociosproject.sociosapi.coreutilities.exceptions.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.SnUnavailableException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.server.local.CompositeAdaptorFactoryLocal;
import eu.sociosproject.sociosapi.server.local.DbManagerLocal;
import eu.sociosproject.sociosapi.server.subscriptions.SubscriptionManager;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.LicenseType;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosvoc.InitiatorType;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;

import eu.sociosproject.sociosvoc.PersonReturn;
import eu.sociosproject.sociosvoc.MediaItemReturn;
import eu.sociosproject.sociosvoc.ActivityReturn;
import eu.sociosproject.sociosvoc.ErrorList;
import eu.sociosproject.sociosvoc.SociosError;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

@WebService(serviceName = "sociosApi", portName = "sociosApiSOAP", targetNamespace = "http://www.sociosproject.eu/sociosApi/", wsdlLocation = "./wsdl/socios-core-api.wsdl", endpointInterface = "eu.sociosproject.sociosapi.SociosApi")
@Stateless
public class SociosApiImpl implements SociosApi {
	// private final static Logger logger =
	// LoggerFactory.getLogger(SociosApiImpl.class);

	@EJB
	private CompositeAdaptorFactoryLocal compositeAdaptorFactory;

	@EJB
	private DbManagerLocal dbManager;

	@Override
	public PersonReturn findPersons(String sociosApiUserKey,
			PersonFilter personFilter, MediaItemIdList mediaItemIdList)
			throws SociosException {

		long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out.println(" SOCIOS_EVAL SociosApi findPersons is called at = "
				+ d);

		List<ObjectId> ids = null;

		if (personFilter != null)
			ids = personFilter.getId().getObjectId();
		else if (mediaItemIdList != null)
			ids = mediaItemIdList.getMediaItemId();

		PersonReturn fperson = compositeAdaptorFactory.create(sociosApiUserKey,
				resolveIds(ids)).findPersons(personFilter, mediaItemIdList);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling findPersons() and getting "
						+ fperson.getPersons().size()
						+ " results in "
						+ time
						+ " msec");

		return fperson;
	}

	@Override
	public PersonReturn getPersons(String sociosApiUserKey,
			PersonIdList personIdList) throws SociosException {

		long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out.println(" SOCIOS_EVAL SociosApi getPersons is called at = "
				+ d);

		List<ObjectId> ids = personIdList.getPersonId();
		for(int i=0; i<ids.size(); i++){
			System.out.println("personId = " + ids.get(i).getId());
		}
		PersonReturn gperson = compositeAdaptorFactory.create(sociosApiUserKey,
				resolveIds(ids)).getPersons(personIdList);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling getPersons() and getting "
						+ gperson.getPersons().size()
						+ " results in "
						+ time
						+ " msec");

		return gperson;
	}

	@Override
	public MediaItemReturn findMediaItems(String sociosApiUserKey,
			MediaItemFilter filterMediaItem, PersonFilter filterPerson,
			PersonIdList personIdList) throws SociosException {

		long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi findMediaItems is called at = "
						+ d);

		List<ObjectId> ids = null;
		boolean isCC = false;
		System.out.println("check");
		if (filterMediaItem != null
				&& (filterMediaItem.getId() != null || filterMediaItem
						.getUserId() != null)) {

			if (filterMediaItem.getLicense() != null
					&& filterMediaItem.getLicense().equals(LicenseType.CC)) {
				System.out.println("licence value = "
						+ filterMediaItem.getLicense().value());
				isCC = true;
				ids = filterMediaItem.getId().getObjectId();
			}

			else if (filterMediaItem.getUserId() != null) {
				ids = filterMediaItem.getUserId().getObjectId();
				System.out
						.println("[findMediaItems] getUserId list is not null. Size = "
								+ filterMediaItem.getUserId().getObjectId()
										.size());
				System.out.println("userId : "
						+ filterMediaItem.getUserId().getObjectId().get(0)
								.getId());
			} else if (filterMediaItem.getId() != null)
				ids = filterMediaItem.getId().getObjectId();

		} else if (filterPerson != null) {
			ids = filterPerson.getId().getObjectId();
		} else if (personIdList != null) {
			System.out
					.println("sociosApiImpl:  personIdList.getPersonId().size() = "
							+ personIdList.getPersonId().size());
			ids = personIdList.getPersonId();
			for (int i = 0; i < ids.size(); i++) {
				System.out.println("personid = " + ids.get(i).getId());
			}
		}

		// System.out.println("[findMediaItems] Printing Object ids");

		List<KnownSns> sns = resolveIds(ids);
		for (int i = 0; i < sns.size(); i++)
			System.out
					.println("which sns are called: " + sns.get(i).toString());
		List<KnownSns> ccSns = Lists.newArrayList();

		if (isCC) {
			System.out.println("CC IS TRUE");

			if (sns.contains(KnownSns.FLICKR))
				ccSns.add(KnownSns.FLICKR);

			if (sns.contains(KnownSns.YOUTUBE))
				;
			ccSns.add(KnownSns.YOUTUBE);
			for (int i = 0; i < ccSns.size(); i++)
				System.out.println("which sns are called with CC license: "
						+ ccSns.get(i).toString());

		} else if (!isCC) {

			ccSns = sns;
		}

		MediaItemReturn mediaItemReturn = compositeAdaptorFactory.create(
				sociosApiUserKey, ccSns).findMediaItems(filterMediaItem,
				filterPerson, personIdList);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling findMediaItems() and getting "
						+ mediaItemReturn.getMediaItems().size()
						+ " results in " + time + " msec");

		return mediaItemReturn;

		// MediaItemReturn result = null;
		// try {
		// result = compositeAdaptorFactory
		// .create(sociosApiUserKey, ccSns)
		// .findMediaItems(filterMediaItem, filterPerson, personIdList);
		// } catch (Exception e) {
		// throw new InvalidInputException(
		// "cathing errors in SociosApiImpl when compositeAdaptorFactory is called");
		// }
		// return result;
	}

	@Override
	public ActivityReturn findConnectedActivities(String sociosApiUserKey,
			ActivityIdList activityIds) throws SociosException {

		List<ObjectId> ids = activityIds.getActivityId();

		return compositeAdaptorFactory
				.create(sociosApiUserKey, resolveIds(ids))
				.findConnectedActivities(activityIds);
	}

	@Override
	public ActivityReturn getActivities(String sociosApiUserKey,
			ActivityIdList activityIds) throws SociosException {

		long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi getActivities is called at = "
						+ d);

		List<ObjectId> ids = activityIds.getActivityId();

		ActivityReturn activity = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).getActivities(activityIds);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling getActivities() and getting "
						+ activity.getActivities().size()
						+ " results in "
						+ time + " msec");

		return activity;
	}

	@Override
	public PersonReturn connectedPersons(String sociosApiUserKey,
			ObjectId personId) throws SociosException {

		long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi connectedPersons is called at = "
						+ d);

		List<ObjectId> ids = new ArrayList<ObjectId>();
		ids.add(personId);

		PersonReturn connectedPerson = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).connectedPersons(personId);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling connectedPersons() and getting "
						+ connectedPerson.getPersons().size()
						+ " results in "
						+ time + " msec");

		return connectedPerson;
	}

	@Override
	public PersonReturn myConnectedPersons(String sociosApiUserKey,
			ObjectId personId) throws SociosException {

		Long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi myConnectedPersons is called at = "
						+ d);
		List<ObjectId> ids = new ArrayList<ObjectId>();
		ids.add(personId);

		PersonReturn myconnectedPerson = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).myConnectedPersons(personId);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling myConnectedPersons() and getting "
						+ myconnectedPerson.getPersons().size()
						+ " results in " + time + " msec");
		return myconnectedPerson;
	}

	@Override
	public ActivityReturn findActivities(String sociosApiUserKey,
			ActivityFilter activityFilter, PersonFilter personFilter,
			MediaItemIdList mediaItemIdList, PersonIdList personIdList)
			throws SociosException {

		// System.out.println("[findActivities]Entering..");
		Long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi findActivities is called at = "
						+ d);
		List<ObjectId> ids = null;
		if (activityFilter != null) {
			if (activityFilter.getUserId() != null) {
				ids = activityFilter.getUserId().getObjectId();
				System.out.println("[findActivities activityFilter]ids.size = "
						+ ids.size());
			} else if (activityFilter.getId() != null)
				ids = activityFilter.getId().getObjectId();
		} else if (personFilter != null) {
			ids = personFilter.getId().getObjectId();
		} else if (mediaItemIdList != null) {
			ids = mediaItemIdList.getMediaItemId();
		} else if (personIdList != null) {
			ids = personIdList.getPersonId();
			System.out.println("findActivities personIdList ids size = "
					+ ids.size());
			for (int i = 0; i < ids.size(); i++) {
				System.out.println("personId = " + ids.get(i).getId());
			}
		}

		ActivityReturn factivity = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).findActivities(
				activityFilter, personFilter, mediaItemIdList, personIdList);

		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling findActivities() and getting "
						+ factivity.getActivities().size()
						+ " results in "
						+ time + " msec");
		return factivity;
	}

	@Override
	public MediaItemReturn getMediaItems(String sociosApiUserKey,
			MediaItemIdList mediaItemIdList) throws SociosException {

		// System.out.println("[SociosApiImpl:getMediaItems] called");
		Long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi getMediaItems is called at = "
						+ d);
		List<ObjectId> ids = mediaItemIdList.getMediaItemId();
		MediaItemReturn getmedia = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).getMediaItems(
				mediaItemIdList);
		time = System.currentTimeMillis() - time;
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling getMediaItems() and getting "
						+ getmedia.getMediaItems().size()
						+ " results in "
						+ time + " msec");
		return getmedia;
	}

	@Override
	public MediaItemReturn findMyMediaItems(String sociosApiUserKey,
			ObjectId personId) throws SociosException {
		// System.out.println("[SociosApiImpl:findMyMediaItems] called");
		Long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi findMyMediaItems is called at = "
						+ d);
		List<ObjectId> ids = new ArrayList<ObjectId>();
		ids.add(personId);

		MediaItemReturn findmymedia = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).findMyMediaItems(personId);
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling findMyMediaItems() and getting "
						+ findmymedia.getMediaItems().size()
						+ " results in "
						+ time + " msec");
		return findmymedia;
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(String sociosApiUserKey,
			ObjectId mediaItemId) throws SociosException {

		// System.out.println("[SociosApiImpl:getMediaItemsDisplay] called");
		// System.out.println("sociosApiUserKey = " + sociosApiUserKey);
		Long time = System.currentTimeMillis();
		Date d = new Date(time);
		System.out
				.println(" SOCIOS_EVAL SociosApi getMediaItemsDisplay is called at = "
						+ d);
		List<ObjectId> ids = new ArrayList<ObjectId>();
		ids.add(mediaItemId);

		MediaItemDisplay mediadisplay = compositeAdaptorFactory.create(
				sociosApiUserKey, resolveIds(ids)).getMediaItemsDisplay(
				mediaItemId);
		System.out
				.println(" SOCIOS_EVAL SOCIOSAPI, calling findMyMediaItems() and getting "
						+ mediadisplay + " results in " + time + " msec");
		return mediadisplay;
	}

	@Override
	public void interactWithUser(String sociosApiUserKey, ObjectId personId,
			ObjectId mediaItemId, String messageText) {
		// TODO Auto-generated method stub
	}

	@Override
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {
		System.out.println("registerListener Invoked");
		String results = "";

		if (eventListener == null)
			throw new InvalidInputException();

		if ((eventListener.getServiceId() == null)
				|| (eventListener.getServiceId().trim().equals("")))
			eventListener.setServiceId("0");
		SubscriptionManager sm = new SubscriptionManager();

		if ((eventListener.getInitiatorType() == null)
				|| (eventListener.getCallbackUrl() == null))
			throw new InvalidInputException();

		if (eventListener.getInitiatorType().equals(InitiatorType.USER)) {
			System.out
					.println("[@SociosApiImpl.registerListener]eventListener.getInitiatorType().equals(InitiatorType.USER)");

			List<ObjectId> ids = eventListener.getTargets();
			List<ObjectId> notSubscribed = new ArrayList<ObjectId>();
			System.out.println(ids.size());
			for (ObjectId id : ids) {
				System.out.println("Is subscribed " + id.getId() + " = "
						+ sm.isSubscribed(id));
				if (!sm.isSubscribed(id))
					notSubscribed.add(id);
				results = results
						+ "|"
						+ id.getId()
						+ "@"
						+ id.getSource().getKnownSns()
						+ ":"
						+ sm.createSubscription(
								Integer.parseInt(eventListener.getServiceId()),
								eventListener.getCallbackUrl(), id);

			}
			compositeAdaptorFactory.create("", resolveIds(notSubscribed))
					.registerListener(eventListener);

		} else if (eventListener.getInitiatorType().equals(InitiatorType.TOPIC)) {
			System.out
					.println("[@SociosApiImpl.registerListener]eventListener.getInitiatorType().equals(InitiatorType.TOPIC)");

			if (eventListener.getTopics().equals(null))
				throw new InvalidInputException();

			List<KnownSns> sns = new ArrayList<KnownSns>();
			results = sm.createTopicSubscription(
					Integer.parseInt(eventListener.getServiceId()),
					eventListener.getCallbackUrl(), eventListener.getTopics())
					+ "";
			if (eventListener.getTopics().getKnownSns() != null) {
				sns.add(eventListener.getTopics().getKnownSns());
				System.out
						.println("[@SociosApiImpl.registerListener]KnownSNS=="
								+ eventListener.getTopics().getKnownSns());
			} else {
				System.out
						.println("[@SociosApiImpl.registerListener]KnownSNS==null - will invoke all adaptors");
				// eventListener.getTopics().getKnownSns() is null -> create a
				// list with all available sn
				System.out
						.println("[registerListener]  Got null ids. Load everything!");
				sns.add(KnownSns.DAILYMOTION);
				// sns.add(KnownSns.FACEBOOK);
				sns.add(KnownSns.FLICKR);
				sns.add(KnownSns.MYSPACE);
				// sns.add(KnownSns.TWITTER);
				sns.add(KnownSns.YOUTUBE);
			}
			System.out.println("[@SociosApiImpl.registerListener]sns.size()=="
					+ sns.size());

			compositeAdaptorFactory.create("", sns)
					.registerListener(eventListener).toString();

		}
		return results;

	}

	@Override
	public boolean unregisterListener(InitiatorType initiatorType,
			String subscriptionId) throws SociosException {
		SubscriptionManager sm = new SubscriptionManager();
		try {
			if (initiatorType.equals(InitiatorType.USER)) {
				ObjectId id = sm.getSubscribedUser(Integer
						.parseInt(subscriptionId));
				System.out.println("Found subscribed user " + id.getId() + " "
						+ id.getSource().getKnownSns());

				boolean deletedFromDB = sm.deleteSubscription(Integer
						.parseInt(subscriptionId));
				if ((deletedFromDB) && (!sm.isSubscribed(id))) {
					List<ObjectId> ids = new ArrayList<ObjectId>();
					ids.add(id);
					return (compositeAdaptorFactory.create("", resolveIds(ids))
							.unregisterListener(id));
				}
				return deletedFromDB;
			} else if (initiatorType.equals(InitiatorType.TOPIC)) {
				KnownSns sn = sm.getSubscribedTopic(Integer
						.parseInt(subscriptionId));
				List<KnownSns> sns = new ArrayList<KnownSns>();
				sns.add(sn);
				if (compositeAdaptorFactory.create("", sns).disable())
					return sm.deleteTopicSubscription(Integer
							.parseInt(subscriptionId));
				return false;
			}
			return false;
		} catch (Exception ex) {
			throw new InvalidInputException();
		}
	}

	private List<KnownSns> resolveIds(List<ObjectId> ids)
			throws SociosException {

		List<KnownSns> sns = new ArrayList<KnownSns>();
		HashSet<KnownSns> set = new HashSet<KnownSns>();

		if (ids == null) {
			System.out.println("[resolveIds]  Got null ids. Load everything!");
			sns.add(KnownSns.DAILYMOTION);
			sns.add(KnownSns.FACEBOOK);
			sns.add(KnownSns.FLICKR);
			sns.add(KnownSns.MYSPACE);
			sns.add(KnownSns.TWITTER);
			sns.add(KnownSns.YOUTUBE);
			sns.add(KnownSns.GOOGLEP);
			sns.add(KnownSns.INSTAGRAM);
			return sns;
		}

		Iterator<ObjectId> it = ids.iterator();
		while (it.hasNext()) {
			ObjectId id = it.next();
			// System.out.println("before if statement [resolveIds] id.getId() = "
			// + id.getId() + " id.getSource().getKnownSns() "
			// + id.getSource().getKnownSns());

			if (id.getSource() != null && id.getSource().getKnownSns() != null) {
				// System.out.println("id.getSource().getKnownSns() = "
				// + id.getSource().getKnownSns());
				// sns.add(id.getSource().getKnownSns());
				set.add(id.getSource().getKnownSns());
			}
		}

		Iterator<KnownSns> it1 = set.iterator();
		while (it1.hasNext()) {
			KnownSns sn = it1.next();
			sns.add(sn);
		}

		return sns;

	}

	private void printObjectIds(List<ObjectId> list) {
		if (list == null)
			return;
		for (ObjectId id : list) {
			// System.out.print("[printObjectIds] id.id" + id.getId());
			if (id.getSource() != null)
				System.out.println("id.source " + id.getSource().getKnownSns());
			else
				System.out.println("id.source is null");
		}

	}

}
