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
 
package eu.sociosproject.sociosapi.server.adaptors;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.google.common.collect.Lists;
//import com.sun.corba.se.spi.servicecontext.UEInfoServiceContext;

//import eu.sociosproject.sociosapi.coreutilities.exceptions.SociosException;
import eu.sociosproject.sociosapi.SociosException;
import eu.sociosproject.sociosapi.coreutilities.exceptions.InvalidInputException;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;
import eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities.JSONException;
import eu.sociosproject.sociosapi.server.adaptors.dailymotion.DailymotionAdaptor;
import eu.sociosproject.sociosapi.server.adaptors.flickr.FlickrAdaptor;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.ActivityIdList;
import eu.sociosproject.sociosvoc.ActivityReturn;
import eu.sociosproject.sociosvoc.ArrayOfObjectIds;
import eu.sociosproject.sociosvoc.ErrorList;
import eu.sociosproject.sociosvoc.InitiatorType;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemDisplay;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.MediaItemReturn;
import eu.sociosproject.sociosvoc.PersonReturn;
import eu.sociosproject.sociosvoc.SociosError;
import eu.sociosproject.sociosvoc.SociosException.Detail;
import eu.sociosproject.sociosvoc.Source;
import eu.sociosproject.sociosvoc.TopicsInSN;
//import eu.sociosproject.sociosvoc.Message;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Person;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;
import eu.sociosproject.sociosvoc.SociosEventListener;
import eu.sociosproject.sociosapi.server.adaptors.facebook.*;
import eu.sociosproject.sociosapi.server.local.CompositeLocal;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CompositeAdaptor implements /* SnsAdaptor */CompositeLocal {

	private final static Logger logger = LoggerFactory
			.getLogger(CompositeAdaptor.class);

	/*
	 * private abstract static class ListResultClosure<T> {
	 * 
	 * public List<T> on(List<SnsAdaptor> snsAdaptors) throws SociosException {
	 * 
	 * List<T> results = Lists.newArrayList(); for (SnsAdaptor snsAdaptor :
	 * snsAdaptors) { // TODO add try/catch // login
	 * 
	 * System.out.println("Calling sn " + snsAdaptor.getClass());
	 * System.out.println("Calling sn name " + snsAdaptor.getClass().getName());
	 * List<T> list = null; list = executeMethod(snsAdaptor); if (list == null)
	 * { throw new InvalidInputException( "CompositeAdaptor: no input"); } try {
	 * list = executeMethod(snsAdaptor); } catch (SociosException e) {
	 * e.printStackTrace(); // System.out.println("Message error " +
	 * e.getMessage()); // throw e; } if (list != null) results.addAll(list); }
	 * 
	 * return results; }
	 * 
	 * public abstract List<T> executeMethod(SnsAdaptor snsAdaptor) throws
	 * SociosException; }
	 */

	private abstract static class NewTypeResultClosure<T, S> {

		public T on(List<SnsAdaptor> snsAdaptors, String type)
				throws SociosException {

			if (type.equals("person")) {

				PersonReturn p = new PersonReturn();
				List<Person> results = Lists.newArrayList();
				ErrorList errors = new ErrorList();

				for (SnsAdaptor snsAdaptor : snsAdaptors) {

					System.out.println("Calling sn " + snsAdaptor.getClass());
					List<S> list = null;
					try {
						list = executeMethod(snsAdaptor);
						System.out.println("After execution");
					} catch (SociosException e) {
						System.out.println("1 Message error " + e.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						error.setException(convertException(e));
						errors.getError().add(error);

					} catch (Exception ex) {
						ex.printStackTrace();
						System.out.println("Message error " + ex.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						eu.sociosproject.sociosvoc.SociosException exc = new eu.sociosproject.sociosvoc.SociosException();
						eu.sociosproject.sociosvoc.SociosException.Detail detail = new Detail();
						detail.setMessage(ex.getMessage());
						exc.setDetail(detail);
						error.setException(exc);
						errors.getError().add(error);
						// throw e;
					}
					if (list != null) {
						System.out.println("list.size() = " + list.size());
						results.addAll((Collection<? extends Person>) list);
					} else
						System.out.println("list is null");

					p.setErrors(errors);
				}

				p.getPersons().addAll(results);
				return (T) p;
			} else if (type.equals("activity")) {

				ActivityReturn p = new ActivityReturn();
				List<Activity> results = Lists.newArrayList();
				ErrorList errors = new ErrorList();

				for (SnsAdaptor snsAdaptor : snsAdaptors) {

					System.out.println("Calling sn " + snsAdaptor.getClass());
					List<S> list = null;
					try {
						list = executeMethod(snsAdaptor);
						System.out.println("After execution");
					} catch (SociosException e) {
						// e.printStackTrace();
						System.out.println("1 Message error " + e.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						error.setException(convertException(e));
						errors.getError().add(error);
						// throw e;
					} catch (Exception ex) {
						// ex.printStackTrace();
						System.out.println("Message error " + ex.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						eu.sociosproject.sociosvoc.SociosException exc = new eu.sociosproject.sociosvoc.SociosException();
						eu.sociosproject.sociosvoc.SociosException.Detail detail = new Detail();
						detail.setMessage(ex.getMessage());
						exc.setDetail(detail);
						error.setException(exc);
						errors.getError().add(error);
						// throw e;
					}
					if (list != null) {
						System.out.println("list.size() = " + list.size());
						results.addAll((Collection<? extends Activity>) list);
					} else
						System.out.println("list is null");

					p.setErrors(errors);
				}

				p.getActivities().addAll(results);
				return (T) p;

			} else if (type.equals("mediaitem")) {

				MediaItemReturn p = new MediaItemReturn();
				List<MediaItem> results = Lists.newArrayList();
				ErrorList errors = new ErrorList();

				for (SnsAdaptor snsAdaptor : snsAdaptors) {

					System.out.println("Calling sn " + snsAdaptor.getClass());
					List<S> list = null;
					try {
						list = executeMethod(snsAdaptor);
						System.out.println("After execution");
					} catch (SociosException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("1 Message error " + e.getMessage());

						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						error.setException(convertException(e));
						errors.getError().add(error);

						// throw e;
					} catch (Exception ex) {
						// TODO Auto-generated catch block
						ex.printStackTrace();
						ex.fillInStackTrace();
						System.out.println("Message error " + ex.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(snsAdaptor));
						error.setSource(src);
						eu.sociosproject.sociosvoc.SociosException exc = new eu.sociosproject.sociosvoc.SociosException();
						eu.sociosproject.sociosvoc.SociosException.Detail detail = new Detail();
						detail.setMessage(ex.getMessage());
						exc.setDetail(detail);
						error.setException(exc);
						errors.getError().add(error);
						// throw e;
					}
					if (list != null) {
						System.out.println("list.size() = " + list.size());
						results.addAll((Collection<? extends MediaItem>) list);
					} else
						System.out.println("list is null");

					p.setErrors(errors);
				}

				p.getMediaItems().addAll(results);
				return (T) p;
			}
			return null;

		}

		public abstract List<S> executeMethod(SnsAdaptor snsAdaptor)
				throws SociosException;
	}

	private final List<SnsAdaptor> snsAdaptors;

	public CompositeAdaptor(List<SnsAdaptor> snsAdaptors) {
		this.snsAdaptors = snsAdaptors;
		System.out
				.println("@CompositeAdaptor::constructor snsAdaptors.size() == "
						+ snsAdaptors.size());
		// logger.debug("snsAdaptors");
	}

	@Override
	public PersonReturn getPersons(final PersonIdList personIdList)
			throws SociosException {

		return new NewTypeResultClosure<PersonReturn, Person>() {

			@Override
			public List<Person> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				long time = System.currentTimeMillis();
				
				PersonIdList newList = resolvePersonIdList(snsAdaptor,
						personIdList);
				// return snsAdaptor.getPersons(personIdList);
				List<Person> personList = snsAdaptor.getPersons(newList);

				time = System.currentTimeMillis() - time;

				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling getPersons() and getting "
						+ personList.size() + " results in " + time + " msec");

				return personList;
			}

		}.on(snsAdaptors, "person");

		/*
		 * return new ListResultClosure<Person>() {
		 * 
		 * @Override public List<Person> executeMethod(SnsAdaptor snsAdaptor)
		 * throws SociosException { PersonIdList newList =
		 * resolvePersonIdList(snsAdaptor, personIdList); // return
		 * snsAdaptor.getPersons(personIdList); return
		 * snsAdaptor.getPersons(newList); } }.on(snsAdaptors);
		 */
	}

	public PersonReturn findPersons(final PersonFilter personFilter,
			final MediaItemIdList mediaItemIdList) throws SociosException {

		return new NewTypeResultClosure<PersonReturn, Person>() {
			@Override
			public List<Person> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				long time = System.currentTimeMillis();
				if (personFilter != null)
					personFilter.setId(null);

				MediaItemIdList newList = resolveMediaItemList(snsAdaptor,
						mediaItemIdList);
				// return snsAdaptor.findPersons(personFilter, mediaItemIdList);
				List<Person> personList = snsAdaptor.findPersons(personFilter,
						newList);
				
				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling findMediaItems() and getting "
						+ personList.size() + " results in " + time + " msec");
				
				return personList;
			}
		}.on(snsAdaptors, "person");
	}

	/*
	 * @Override public void sendMessage(ObjectId personId, Message message) {
	 * for (SnsAdaptor snsAdaptor : snsAdaptors) { //TODO add try/catch login
	 * snsAdaptor.sendMessage(personId, message); } }
	 */

	@Override
	public ActivityReturn getActivities(final ActivityIdList activityIds)
			throws SociosException {
		return new NewTypeResultClosure<ActivityReturn, Activity>() {
			@Override
			public List<Activity> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				long time = System.currentTimeMillis();
				ActivityIdList newList = resolveActivityIdList(snsAdaptor,
						activityIds);
				// return snsAdaptor.getActivities(activityIds);
				List<Activity> activities = snsAdaptor.getActivities(newList);
				
				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling getActivities() and getting "
						+ activities.size() + " results in " + time + " msec");
				
				return activities;
			}
		}.on(snsAdaptors, "activity");
	}

	// @Override

	/*
	 * public List<Person> getPersons(final PersonIdList personIdList) throws
	 * SociosException { return new ListResultClosure<Person>() {
	 * 
	 * @Override public List<Person> executeMethod(SnsAdaptor snsAdaptor) throws
	 * SociosException { PersonIdList newList = resolvePersonIdList(snsAdaptor,
	 * personIdList); // return snsAdaptor.getPersons(personIdList); return
	 * snsAdaptor.getPersons(newList); } }.on(snsAdaptors); }
	 */

	@Override
	public MediaItemReturn findMediaItems(
			final MediaItemFilter filterMediaItem,
			final PersonFilter filterPerson, final PersonIdList personIdList)
			throws SociosException {

		System.out.println("compositeadaptor is called");

		final MediaItemReturn response = new MediaItemReturn();
		final List<MediaItem> total = Lists.newArrayList();
		final ErrorList errors = new ErrorList();

		ExecutorService pool = Executors.newFixedThreadPool(3);
		Set<Future<List<MediaItem>>> set = new HashSet<Future<List<MediaItem>>>();

		for (SnsAdaptor temp : snsAdaptors) {

			final SnsAdaptor adaptor = temp;

			Callable<List<MediaItem>> callable = new Callable<List<MediaItem>>() {

				@Override
				public List<MediaItem> call() {
					// public void call() {
					// System.out.println("in call method");
					List<MediaItem> results = Lists.newArrayList();

					if (filterMediaItem != null)
						filterMediaItem.setId(null);

					if (filterPerson != null)
						filterPerson.setId(null);

					System.out.println("Executing thread for adaptor : "
							+ adaptor.getClass());
					PersonIdList newList = resolvePersonIdList(adaptor,
							personIdList);

					printUserIds(filterMediaItem);
					MediaItemFilter newFilterItem = resolveMediaItemFilter(
							adaptor, filterMediaItem);
					printUserIds(newFilterItem);

					long time = System.currentTimeMillis();
					// Date d = new Date(time);
					// System.out.println(" SOCIOS_EVAL CORE "
					// + adaptor.getClass() + " , starting measure at = "
					// + d);
					try {
						results = adaptor
								.findMediaItems(
										resolveMediaItemFilter(adaptor,
												filterMediaItem), filterPerson,
										newList);
						// return results;

					} catch (SociosException e) {
						System.out.println("1 Message error " + e.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(adaptor));
						error.setSource(src);
						error.setException(convertException(e));
						errors.getError().add(error);

					} catch (Exception ex) {
						// e.printStackTrace();
						System.out.println("Message error " + ex.getMessage());
						SociosError error = new SociosError();
						Source src = new Source();
						src.setKnownSns(resolveSource(adaptor));
						error.setSource(src);
						eu.sociosproject.sociosvoc.SociosException exc = new eu.sociosproject.sociosvoc.SociosException();
						eu.sociosproject.sociosvoc.SociosException.Detail detail = new Detail();
						detail.setMessage(ex.getMessage());
						exc.setDetail(detail);
						error.setException(exc);
						errors.getError().add(error);

					}

					// System.out.println("Return results from "
					// + adaptor.getClass());
					total.addAll(results);

					time = System.currentTimeMillis() - time;
					System.out.println(" SOCIOS_EVAL CORE "
							+ adaptor.getClass()
							+ " calling findMediaItems() and getting "
							+ results.size() + " results in " + time + " msec");
					return results;

				}
			};
			Future<List<MediaItem>> future = pool.submit(callable);
			set.add(future);
		}

		for (Future<List<MediaItem>> future : set) {

			if (future != null) {
				List<MediaItem> list = null;

				try {
					list = future.get();

				} catch (InterruptedException e) {
					System.out
							.println("in compositeAdaptor occured InterruptedException : "
									+ e.getMessage());
					e.printStackTrace();
				} catch (ExecutionException e) {
					System.out
							.println("in compositeAdaptor occured ExecutionException : "
									+ e.getMessage());
					e.printStackTrace();
				}

				// if (list != null)
				// response.getMediaItems()..addAll(list);

			}

		}
		pool.shutdown();

		response.setErrors(errors);
		response.getMediaItems().addAll(total);

		// System.out.println("at the end results size is "
		// + response.getMediaItems().size());

		return response;
		/*
		 * return new ListResultClosure<MediaItem>() {
		 * 
		 * @Override public List<MediaItem> executeMethod(SnsAdaptor snsAdaptor)
		 * throws SociosException {
		 * 
		 * if(filterMediaItem != null) filterMediaItem.setId(null);
		 * 
		 * if(filterPerson != null) filterPerson.setId(null);
		 * 
		 * PersonIdList newList = resolvePersonIdList(snsAdaptor, personIdList);
		 * return snsAdaptor.findMediaItems(filterMediaItem, filterPerson,
		 * newList); } }.on(snsAdaptors);
		 */
	}

	@Override
	public ActivityReturn findConnectedActivities(
			final ActivityIdList activityIds) throws SociosException {

		return new NewTypeResultClosure<ActivityReturn, Activity>() {
			@Override
			public List<Activity> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				ActivityIdList newList = resolveActivityIdList(snsAdaptor,
						activityIds);
				// return snsAdaptor.findConnectedActivities(activityIds);
				return snsAdaptor.findConnectedActivities(newList);
			}
		}.on(snsAdaptors, "activity");
	}

	@Override
	public PersonReturn connectedPersons(final ObjectId personId)
			throws SociosException {
		return new NewTypeResultClosure<PersonReturn, Person>() {

			@Override
			public List<Person> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {
				
				long time = System.currentTimeMillis();
				
				List<Person> connected = snsAdaptor.connectedPersons(personId);
				
				time = System.currentTimeMillis() - time;
				
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling connectedPersons() and getting "
						+ connected.size() + " results in " + time + " msec");
				
				return connected;
			}
		}.on(snsAdaptors, "person");
	}

	@Override
	public PersonReturn myConnectedPersons(final ObjectId personId)
			throws SociosException {
		return new NewTypeResultClosure<PersonReturn, Person>() {
			@Override
			public List<Person> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {
				
				long time = System.currentTimeMillis();
				
				List<Person> myconnected = snsAdaptor
						.myConnectedPersons(personId);
				
				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling myConnectedPersons() and getting "
						+ myconnected.size() + " results in " + time + " msec");
				
				return myconnected;
			}
		}.on(snsAdaptors, "person");
	}

	@Override
	public ActivityReturn findActivities(final ActivityFilter activityFilter,
			final PersonFilter personFilter,
			final MediaItemIdList mediaItemIdList,
			final PersonIdList personIdList) throws SociosException {

		return new NewTypeResultClosure<ActivityReturn, Activity>() {
			@Override
			public List<Activity> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {
				long time = System.currentTimeMillis();

				if (activityFilter != null)
					activityFilter.setId(null);

				if (personFilter != null)
					personFilter.setId(null);

				MediaItemIdList mediaList = resolveMediaItemList(snsAdaptor,
						mediaItemIdList);
				PersonIdList personList = resolvePersonIdList(snsAdaptor,
						personIdList);
				// System.out.println("personList = " + personList.toString());

				// return snsAdaptor.findActivities(activityFilter,
				// personFilter, mediaItemIdList, personIdList);

				List<Activity> findactivities = snsAdaptor.findActivities(
						activityFilter, personFilter, mediaList, personList);

				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling findActivities() and getting "
						+ findactivities.size() + " results in " + time
						+ " msec");
				return findactivities;

			}
		}.on(snsAdaptors, "activity");
	}

	@Override
	public MediaItemReturn getMediaItems(final MediaItemIdList mediaItemIdList)
			throws SociosException {

		return new NewTypeResultClosure<MediaItemReturn, MediaItem>() {
			@Override
			public List<MediaItem> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				long time = System.currentTimeMillis();
				MediaItemIdList newList = resolveMediaItemList(snsAdaptor,
						mediaItemIdList);
				// return snsAdaptor.getMediaItems(mediaItemIdList);
				List<MediaItem> getmedia = snsAdaptor.getMediaItems(newList);
				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling getMediaItems() and getting "
						+ getmedia.size() + " results in " + time + " msec");
				return getmedia;

			}
		}.on(snsAdaptors, "mediaitem");
	}

	@Override
	public MediaItemReturn findMyMediaItems(final ObjectId personId)
			throws SociosException {

		return new NewTypeResultClosure<MediaItemReturn, MediaItem>() {
			@Override
			public List<MediaItem> executeMethod(SnsAdaptor snsAdaptor)
					throws SociosException {

				long time = System.currentTimeMillis();
				List<MediaItem> mymedia = snsAdaptor.findMyMediaItems(personId);

				time = System.currentTimeMillis() - time;
				System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
						+ " calling findMyMediaItems() and getting "
						+ mymedia.size() + " results in " + time + " msec");
				return mymedia;
			}
		}.on(snsAdaptors, "mediaitem");
	}

	@Override
	public MediaItemDisplay getMediaItemsDisplay(ObjectId mediaItemId)
			throws SociosException {
		long time = System.currentTimeMillis();

		MediaItemDisplay mediaItemDisplay = new MediaItemDisplay();

		for (SnsAdaptor snsAdaptor : snsAdaptors) {
			System.out.println("[@compositeAdaptor]Calling sn "
					+ snsAdaptor.getClass());
			ObjectId id = resolveObjectId(snsAdaptor, mediaItemId);
			System.out
					.println(resolveSource(snsAdaptor) + " will be invoked..");
			mediaItemDisplay = snsAdaptor.getMediaItemsDisplay(id);

			time = System.currentTimeMillis() - time;
			System.out.println(" SOCIOS_EVAL CORE " + snsAdaptor.getClass()
					+ " calling getMediaItemsDisplay() and getting "
					+ " results in " + time + " msec");
		}

		return mediaItemDisplay;
	}

	@Override
	public String registerListener(SociosEventListener eventListener)
			throws SociosException {
		String failedSubscriptions = "";
		for (SnsAdaptor snsAdaptor : snsAdaptors) {
			System.out.println("[@compositeAdaptor]Calling sn "
					+ snsAdaptor.getClass());
			SociosEventListener newEventListener = resolveSociosEventListener(
					snsAdaptor, eventListener);
			System.out
					.println(resolveSource(snsAdaptor) + " will be invoked..");
			String adaptorResult = snsAdaptor
					.registerListener(newEventListener);
			System.out.println(resolveSource(snsAdaptor) + " returned "
					+ adaptorResult);
			failedSubscriptions = failedSubscriptions.concat(adaptorResult);
		}
		System.out.println("registerListener will return "
				+ failedSubscriptions);

		return failedSubscriptions;
	}

	@Override
	public boolean unregisterListener(ObjectId id) throws SociosException {
		for (SnsAdaptor snsAdaptor : snsAdaptors) {
			System.out.println("Calling sn " + snsAdaptor.getClass());
			if (resolveSource(snsAdaptor).equals(id.getSource().getKnownSns()))
				return (snsAdaptor.unregisterListener(id));
		}
		return false;

	}

	@Override
	public boolean disable() throws SociosException {
		for (SnsAdaptor snsAdaptor : snsAdaptors) {
			System.out.println("Calling sn " + snsAdaptor.getClass());
			return (snsAdaptor.disable());
		}
		return false;

	}

	private SociosEventListener resolveSociosEventListener(
			SnsAdaptor snsAdaptor, SociosEventListener eventListener) {

		if (eventListener == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		SociosEventListener response = new SociosEventListener();

		System.out.println("[resolveSociosEventListener] = " + sn);

		if (eventListener.getInitiatorType().equals(null))
			return null;
		if (eventListener.getInitiatorType().equals(InitiatorType.USER)) {
			if (eventListener.getTargets().equals(null))
				return null;

			List<ObjectId> ids = eventListener.getTargets();

			for (ObjectId user : ids) {
				System.out.println("[resolveSociosEventListener] checking user"
						+ user.getId());
				if (user.getSource().getKnownSns().equals(sn)) {
					response.setInitiatorType(eventListener.getInitiatorType());
					response.getTargets().add(user);
					System.out
							.println("[resolveSociosEventListener] adding user"
									+ user.getId());
				}
			}
		} else if (eventListener.getInitiatorType().equals(InitiatorType.TOPIC)) {
			if (eventListener.getTopics().equals(null))
				return null;

			KnownSns topicSN = eventListener.getTopics().getKnownSns();

			if ((topicSN == null) || (topicSN.equals(sn))) {
				response.setInitiatorType(eventListener.getInitiatorType());
				TopicsInSN topicsInSN = new TopicsInSN();
				topicsInSN.setKnownSns(sn);
				for (String topic : eventListener.getTopics().getTopics())
					topicsInSN.getTopics().add(topic);
				response.setTopics(topicsInSN);
			}
		}

		return response;
	}

	private ActivityIdList resolveActivityIdList(SnsAdaptor snsAdaptor,
			ActivityIdList list) {

		if (list == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		ActivityIdList response = new ActivityIdList();

		System.out.println("[resolveActivityIdList] = " + sn);
		if (sn != null) {
			List<ObjectId> q = list.getActivityId();
			Iterator<ObjectId> it = q.iterator();
			while (it.hasNext()) {
				ObjectId id = it.next();
				if (id.getSource().getKnownSns().equals(sn)) {
					System.out.println("[resolveActivityIdList] adding source "
							+ id.getSource().getKnownSns());
					response.getActivityId().add(id);
				} else
					System.out
							.println("[resolveActivityIdList] discarding source "
									+ id.getSource().getKnownSns());
			}
			return response;
		}

		return null;

	}

	private MediaItemIdList resolveMediaItemList(SnsAdaptor snsAdaptor,
			MediaItemIdList list) {

		if (list == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		MediaItemIdList response = new MediaItemIdList();
		System.out.println("[resolveMediaItemList] = " + sn);
		if (sn != null) {
			List<ObjectId> q = list.getMediaItemId();
			Iterator<ObjectId> it = q.iterator();
			while (it.hasNext()) {
				ObjectId id = it.next();
				if (id.getSource().getKnownSns().equals(sn)) {
					System.out.println("[resolveMediaItemList] adding source "
							+ id.getSource().getKnownSns());
					response.getMediaItemId().add(id);
				} else
					System.out
							.println("[resolveMediaItemList] discarding source "
									+ id.getSource().getKnownSns());

			}
			return response;
		}

		return null;

	}

	private ObjectId resolveObjectId(SnsAdaptor snsAdaptor, ObjectId id) {

		if (id == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		ObjectId response = new ObjectId();
		System.out.println("[resolveObjectId] = " + sn);
		if (sn != null) {
			if (id.getSource().getKnownSns().equals(sn)) {
				System.out.println("[resolveMediaItemList] adding source "
						+ id.getSource().getKnownSns());
				response.setId(id.getId());
				response.setSource(id.getSource());
			} else
				System.out.println("[resolveMediaItemList] discarding source "
						+ id.getSource().getKnownSns());

		}
		return response;
	}

	private PersonIdList resolvePersonIdList(SnsAdaptor snsAdaptor,
			PersonIdList list) {

		if (list == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		PersonIdList response = new PersonIdList();
		System.out.println("[resolvePersonIdList] = " + sn);
		if (sn != null) {
			List<ObjectId> q = list.getPersonId();
			Iterator<ObjectId> it = q.iterator();
			while (it.hasNext()) {
				ObjectId id = it.next();
				if (id.getSource().getKnownSns().equals(sn)) {
					System.out.println("[resolvePersonIdList] adding source "
							+ id.getSource().getKnownSns());
					response.getPersonId().add(id);
				} else
					System.out
							.println("[resolvePersonIdList] discarding source "
									+ id.getSource().getKnownSns());

			}
			return response;
		}

		return null;

	}

	private void printUserIds(MediaItemFilter filter) {

		if (filter == null)
			return;

		if (filter.getUserId() != null
				&& filter.getUserId().getObjectId() != null) {
			System.out.println("User ids length = "
					+ filter.getUserId().getObjectId().size());
			for (ObjectId id : filter.getUserId().getObjectId()) {
				System.out.println(id.getId() + " - "
						+ id.getSource().getKnownSns().value());
			}
		}

	}

	private MediaItemFilter resolveMediaItemFilter(SnsAdaptor snsAdaptor,
			MediaItemFilter filter) {

		if (filter == null)
			return null;

		KnownSns sn = resolveSource(snsAdaptor);
		MediaItemFilter response = new MediaItemFilter();
		response.setCreated(filter.getCreated());
		response.setDescription(filter.getDescription());
		response.setId(filter.getId());
		response.setLicense(filter.getLicense());
		response.setTitle(filter.getTitle());
		response.setTags(filter.getTags());
		// System.out.println("tags = " + response.getTags().getKeyword());

		ArrayOfObjectIds array = new ArrayOfObjectIds();
		System.out.println("[resolveMediaItemFilter] = " + sn);
		if (sn != null) {

			if (filter.getUserId() != null
					&& filter.getUserId().getObjectId() != null) {
				System.out.println("1response = "
						+ filter.getUserId().getObjectId().get(0).getId());

				List<ObjectId> list = filter.getUserId().getObjectId();
				Iterator<ObjectId> it = list.iterator();
				while (it.hasNext()) {
					ObjectId id = it.next();
					if (id.getSource().getKnownSns().equals(sn)) {
						System.out
								.println("[resolveMediaItemFilter] adding source "
										+ id.getSource().getKnownSns());
						array.getObjectId().add(id);
					} else
						System.out
								.println("[resolveMediaItemFilter] discarding source "
										+ id.getSource().getKnownSns());
				}
			}

			response.setUserId(array);

			return response;
		}
		return null;
	}

	private static KnownSns resolveSource(SnsAdaptor snsAdaptor) {

		if (snsAdaptor instanceof FlickrAdaptor)
			return KnownSns.FLICKR;
		else if (snsAdaptor instanceof DailymotionAdaptor)
			return KnownSns.DAILYMOTION;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.facebook.FacebookAdapter)
			return KnownSns.FACEBOOK;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.twitter.TwitterAdapter)
			return KnownSns.TWITTER;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.myspace.MySpaceAdaptor)
			return KnownSns.MYSPACE;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.youtube.YoutubeAdaptor)
			return KnownSns.YOUTUBE;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.googlep.GooglepAdaptor)
			return KnownSns.GOOGLEP;
		else if (snsAdaptor instanceof eu.sociosproject.sociosapi.server.adaptors.instagram.InstagramAdaptor)
			return KnownSns.INSTAGRAM;
		else
			return null;
	}

	private static eu.sociosproject.sociosvoc.SociosException convertException(
			eu.sociosproject.sociosapi.SociosException input) {

		eu.sociosproject.sociosvoc.SociosException response = new eu.sociosproject.sociosvoc.SociosException();
		response.setFaultstring(input.getMessage());
		return response;

	}

}
