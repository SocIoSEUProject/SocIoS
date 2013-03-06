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
 
package eu.sociosproject.sociosapi.server.adaptors.flickr.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import eu.sociosproject.feedparsers.flickr.FlickrCategory;
import eu.sociosproject.feedparsers.flickr.FlickrContributor;
import eu.sociosproject.feedparsers.flickr.FlickrDeletedEntry;
import eu.sociosproject.feedparsers.flickr.FlickrEntry;
import eu.sociosproject.feedparsers.flickr.FlickrFeed;
import eu.sociosproject.feedparsers.flickr.FlickrLink;
import eu.sociosproject.feedparsers.flickr.FlickrMediaDescription;
import eu.sociosproject.feedparsers.flickr.FlickrUpdate;
import eu.sociosproject.feedparsers.flickr.Parser;
import eu.sociosproject.sociosapi.server.adaptors.listener.JMSPublisher;
import eu.sociosproject.sociosapi.server.update.events.SociosEvent;
import eu.sociosproject.sociosapi.server.update.events.CreateEvent;
import eu.sociosproject.sociosapi.server.update.events.DeleteEvent;
import eu.sociosproject.sociosapi.server.update.events.TargetType;
import eu.sociosproject.sociosapi.server.update.events.UpdateEvent;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.KnownSns;
import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.Source;

public class CallbackFunction extends HttpServlet {

	private static String secretToken = "myToken12";

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("charset=UTF-8");
		response.setStatus(200);

		PrintWriter out = response.getWriter();
		System.out.println("CallbackFunction is called");
		System.out.println("prin to try");

		try {

			System.out.println("mesa sto try");
			String challenge = request.getParameter("challenge");
			String verifyToken = request.getParameter("verify_token");
			String user_id = request.getParameter("user_id"); // pairnw to id tou user
																
			System.out.println("CallbackFunction is called for user_id: " + user_id + " for topic " + request.getParameter("topic"));
			
			if (challenge != null) {

				if (verifyToken.trim().equals(secretToken)) {
					System.out.println("Challenge given : " + challenge + new Date());
					out.println(challenge);
				}
			} else {

				Source src = new Source();
				src.setKnownSns(KnownSns.FLICKR);
				System.out.println(src.getKnownSns().toString());

				System.out.println("sto else");
				String topic = request.getParameter("topic");
				System.out.println("topic: " + topic);
				String requestString = getStringFromInputStream(request.getInputStream());
				System.out.println("feedxml output gia callbackfunction: " + requestString); //pairnw to feedxml

				out.println("Ok");
				
				try {
					ArrayList<SociosEvent> events = new ArrayList<SociosEvent>();

					eu.sociosproject.feedparsers.flickr.Parser parser = new Parser();
					FlickrFeed flickrFeed = Parser.parseFeed(requestString);
					System.out.println("flickrFeed.getUpdated(): " + flickrFeed.getUpdated()); // mallon pote pairnw feed

					List<FlickrEntry> entries = flickrFeed.getEntries();
					List<FlickrDeletedEntry> deletedEntries = flickrFeed.getDeletedEntries();

					// ean exw entry
					if (flickrFeed.getEntries() != null
							&& !flickrFeed.getEntries().isEmpty()) {

						for (FlickrEntry entry : entries) {

							System.out.println("updated_date: "	+ entry.getUpdated());

							List<FlickrUpdate> flickrUpdates = entry.getFlickrUpdates();
							for (FlickrUpdate updateType : flickrUpdates) {
								System.out.println("update_type: " + updateType.getType()); // pote egine upload i photo
																
								if ("created".equals(updateType.getType())) {
									System.out.println("exw create event me targetType:MediaItem");

									CreateEvent createMediaItem = new CreateEvent();
									createMediaItem.setTargetType(TargetType.MEDIAITEM);
									
									System.out.println("createMediaItem.getTargetType: " + createMediaItem.getTargetType().toString());
									
									ObjectId obj_1 = new ObjectId();
									obj_1.setId(entry.getAuthor().getNsid()); // to id tou user															
									obj_1.setSource(src);
									System.out.println("obj_1.getSource(): " + obj_1.getSource().getKnownSns());
									createMediaItem.setId(obj_1);
									
									System.out.println("getUserid-->createMediaItem.getId().getId()" + createMediaItem.getId().getId());
									
									MediaItem mediaItem = new MediaItem();
									ObjectId objMediaItem = new ObjectId();

									String uri = entry.getId();
									String delim = "/";
									String tokens[] = uri.split(delim);
									String mediaItem_id = tokens[(tokens.length) - 1];

									objMediaItem.setId(mediaItem_id);
									mediaItem.setId(objMediaItem); // to id tis foto
																
																		
									List<FlickrLink> links = entry.getLinks();
									for (FlickrLink link : links) {
										if ("text/html".equals(link.getType())) {

											mediaItem.setUrl(link.getHref());
											System.out.println("photo_url: " + mediaItem.getUrl()); // photo_url
										}
									}


									mediaItem.setTitle(entry.getTitle()); // title tis photo
																			
									List<FlickrMediaDescription> descriptions = entry.getDescriptions();
									for (FlickrMediaDescription description : descriptions) {
										mediaItem.setDescription(description.getContent()); // description tis foto
									}
									
									List<FlickrCategory> categories = entry.getCategories();
						            for (FlickrCategory category : categories) {
						            	mediaItem.setTags(category.getTerm());		//tag 
						            }

									GregorianCalendar gc = new GregorianCalendar();
									gc.setTime(entry.getDateTaken()); 
									XMLGregorianCalendar xmlgc = DatatypeFactory.newInstance().newXMLGregorianCalendar(gc);
									mediaItem.setCreated(xmlgc);			// date_taken

									createMediaItem.setTarget(mediaItem);
									
									System.out.println("createMediaItem.getTarget().toString(): " + createMediaItem.getTarget().toString());
									System.out.println("photo_id--> mediaItem.getId().getId(): " + mediaItem.getId().getId());
									System.out.println("photo_url--> mediaItem.getUrl(): " + mediaItem.getUrl());
									System.out.println("photo_title-->mediaItem.getTitle(): " + mediaItem.getTitle());
									System.out.println("photo_description-->mediaItem.getDescription(): " + mediaItem.getDescription());
									System.out.println("photo_tags-->mediaItem.getTags(): " + mediaItem.getTags());
									System.out.println("photo_dateTaken-->mediaItem.getCreated().toString(): " + mediaItem.getCreated().toString());
									events.add(createMediaItem);

								} else if (updateType.getType().trim().equals("comments")) {

									System.out.println("exw create event me targetType:Actvity");

									CreateEvent createActivity = new CreateEvent();
									createActivity.setTargetType(TargetType.ACTIVITY);

									System.out.println("createActivity.getTargetType: "	+ createActivity.getTargetType().toString());

									ObjectId obj_2 = new ObjectId();
									obj_2.setId(entry.getAuthor().getNsid()); // to id tou user
																				
									obj_2.setSource(src);
									createActivity.setId(obj_2);

									System.out.println("createActivity.getId tou user: " + createActivity.getId().getId());

									Activity activity = new Activity();

									ObjectId objActivity = new ObjectId();
									List<FlickrContributor> contributors = entry.getContributors();
									for (FlickrContributor contributor : contributors) {

										objActivity.setId(contributor.getNsid());
										activity.setUserId(objActivity); // to id tou contributor pou exei kanei to comment
																			
										System.out.println("activity.getUserId().getId()  poios ekane to comment : " + activity.getUserId().getId());
									}

									MediaItem mediaItem_activity = new MediaItem();
									ObjectId objMediaAct = new ObjectId();

									String uri = entry.getId();
									String delim = "/";
									String tokens[] = uri.split(delim);
									String mediaItem_id = tokens[(tokens.length) - 1];

									System.out.println("MediaItem_id: " + tokens[(tokens.length) - 1]);
									objMediaAct.setId(mediaItem_id);
									mediaItem_activity.setId(objMediaAct); // to id tis foto
																			
									GregorianCalendar gc_2 = new GregorianCalendar();
									gc_2.setTime(entry.getDateTaken()); // date_taken
									XMLGregorianCalendar xmlgc_2 = DatatypeFactory.newInstance().newXMLGregorianCalendar(gc_2);
									mediaItem_activity.setCreated(xmlgc_2);

									mediaItem_activity.setTitle(entry.getTitle()); // to title tis foto

									List<FlickrMediaDescription> descriptions = entry.getDescriptions();
									for (FlickrMediaDescription description : descriptions) {
										mediaItem_activity.setDescription(description.getContent()); // description tis foto
																		
									}

									List<FlickrLink> links = entry.getLinks();
									for (FlickrLink link : links) {
										if ("text/html".equals(link.getType())) {

											mediaItem_activity.setUrl(link.getHref());
											System.out.println("photo_url: " + mediaItem_activity.getUrl()); // photo_url
										}
									}

									mediaItem_activity.setNumComments(entry.getComments()); // numComments
									mediaItem_activity.setNumViews(entry.getViews()); // numViews

									List<FlickrCategory> categories = entry.getCategories();
									for (FlickrCategory category : categories) {
										mediaItem_activity.setTags(category.getTerm());  //tag
									}

									activity.getMediaItems().add(mediaItem_activity);

									createActivity.setTarget(activity);
									System.out.println("createActivity.getTarget(): " + createActivity.getTarget());
									System.out.println("activity.getMediaItems().get(0) to description tis photo: "	+ activity.getMediaItems().get(0).getDescription());
									System.out.println("activity.getMediaItems().get(0) title tis photo: " + activity.getMediaItems().get(0).getTitle());
									System.out.println("activity.getMediaItems().get(0) url tis photo: " + activity.getMediaItems().get(0).getUrl());
									System.out.println("activity.getMediaItems().get(0) date taken tis photo: "	+ activity.getMediaItems().get(0).getCreated());
									System.out.println("activity.getMediaItems().get(0) to id tis photo: " + activity.getMediaItems().get(0).getId().getId());
									System.out.println("activity.getMediaItems().get(0) numComments tis photo: " + activity.getMediaItems().get(0).getNumComments());
									System.out.println("activity.getMediaItems().get(0) numViews tis photo: " + activity.getMediaItems().get(0).getNumViews());
									System.out.println("activity.getMediaItems().get(0) tags tis photo: " + activity.getMediaItems().get(0).getTags());

									events.add(createActivity);

								}// end else if
								
								else{
									System.out.println("exw update event me targetType:MediaItem");
									System.out.println("What kind of update I have: " + updateType.getType());
									
									UpdateEvent updateEvent = new UpdateEvent();
									updateEvent.setTargetType(TargetType.MEDIAITEM);						
									
									System.out.println("updateEvent.getTargetType: " + updateEvent.getTargetType().toString());
									
									ObjectId updateObj_id = new ObjectId();
									updateObj_id.setId(entry.getAuthor().getNsid()); // to id tou user															
									updateObj_id.setSource(src);
									
									updateEvent.setId(updateObj_id);
									
									System.out.println("getUserid-->updateEvent.getId().getId(): " + updateEvent.getId().getId());
									
									MediaItem updateMediaItem = new MediaItem();
									ObjectId updateObj = new ObjectId();

									String uri = entry.getId();
									String delim = "/";
									String tokens[] = uri.split(delim);
									String mediaItem_id = tokens[(tokens.length) - 1];

									updateObj.setId(mediaItem_id);
									updateMediaItem.setId(updateObj); // to id tis foto
																
									List<FlickrLink> links = entry.getLinks();
									for (FlickrLink link : links) {
										if ("text/html".equals(link.getType())) {

											updateMediaItem.setUrl(link.getHref());
											System.out.println("photo_url: " + updateMediaItem.getUrl()); // photo_url
										}
									}

									updateMediaItem.setTitle(entry.getTitle()); // title tis photo
																			
									List<FlickrMediaDescription> descriptions = entry.getDescriptions();
									for (FlickrMediaDescription description : descriptions) {
										updateMediaItem.setDescription(description.getContent()); // description tis foto
									}
									
									List<FlickrCategory> categories = entry.getCategories();
						            for (FlickrCategory category : categories) {
						            	updateMediaItem.setTags(category.getTerm());		//tag 
						            }

									GregorianCalendar gc = new GregorianCalendar();
									gc.setTime(entry.getDateTaken()); 
									XMLGregorianCalendar xmlgc = DatatypeFactory.newInstance().newXMLGregorianCalendar(gc);
									updateMediaItem.setCreated(xmlgc);			// date_taken

									
									updateMediaItem.setNumComments(entry.getComments());    // numComments
									updateMediaItem.setNumViews(entry.getViews());       // numViews
																	
									
									updateEvent.setTarget(updateMediaItem);
									
									System.out.println("updateEvent.getTarget().toString(): " + updateEvent.getTarget().toString());
									System.out.println("photo_id--> updateMediaItem.getId().getId(): " + updateMediaItem.getId().getId());
									System.out.println("photo_url--> updateMediaItem.getUrl(): " + updateMediaItem.getUrl());
									System.out.println("photo_title-->updateMediaItem.getTitle(): " + updateMediaItem.getTitle());
									System.out.println("photo_description-->updateMediaItem.getDescription(): " + updateMediaItem.getDescription());
									System.out.println("photo_tags-->updateMediaItem.getTags(): " + updateMediaItem.getTags());
									System.out.println("photo_dateTaken-->updateMediaItem.getCreated().toString(): " + updateMediaItem.getCreated().toString());
									System.out.println("phoTO_numComments-->updateMediaItem.getNumComments(): " + updateMediaItem.getNumComments());
									System.out.println("photo_numViews-->updateMediaItem.getNumViews(): " + updateMediaItem.getNumViews());
									
									events.add(updateEvent);
									
								}
									
								
							}// end for(FlickrUpdate updateType : flickrUpdates){
								
						}// for(FlickrEntry entry : entries){
					}// if(flickrFeed.getEntries() != null && !flickrFeed.getEntries().isEmpty())
						

					else if (flickrFeed.getDeletedEntries() != null	&& !flickrFeed.getDeletedEntries().isEmpty()) {
						for (FlickrDeletedEntry deletedEntry : deletedEntries) {

							System.out.println("exw deleted event");
							System.out.println("deletedEntry_updated: " + deletedEntry.getWhen().toString());
							
							DeleteEvent deletedEvent = new DeleteEvent();
							deletedEvent.setTargetType(TargetType.MEDIAITEM);
							System.out.println("deletedEvent.getTargetType().toString(): " + deletedEvent.getTargetType().toString());
							
							ObjectId deletedObj = new ObjectId();
							deletedObj.setId(user_id); // pairnw to id tou user
							deletedObj.setSource(src);
                            deletedEvent.setId(deletedObj);
                            
							System.out.println("user_id-->deletedObj.getId(): " + deletedObj.getId());
														
							MediaItem deletedMediaItem = new MediaItem();
							ObjectId deletedMediaObj = new ObjectId();

							String deletedPhoto_uri = deletedEntry.getRef();
							String delim = "/";
							String deletedtokens[] = deletedPhoto_uri.split(delim);
							String deletedMediaItem_id = deletedtokens[(deletedtokens.length) - 1];
							deletedMediaObj.setId(deletedMediaItem_id);
							deletedMediaItem.setId(deletedMediaObj); // pairnw to photo_id
																		

							FlickrLink link = deletedEntry.getLink();
							deletedMediaItem.setUrl(link.getHref()); // pairnw to photo_url
																		
							deletedEvent.setTarget(deletedMediaItem);
							
							System.out.println("deletedEvent.getTarget(): " + deletedEvent.getTarget());
							System.out.println("photo_id-->deletedMediaItem.getId().getId(): " + deletedMediaItem.getId().getId());
							System.out.println("photo_url-->deletedMediaItem.getUrl(): " + deletedMediaItem.getUrl());
							
							events.add(deletedEvent);

						}// end for (FlickrDeletedEntry deletedEntry : deletedEntries) {
							
					}// end else if (flickrFeed.getDeletedEntries() != && !flickrFeed.getDeletedEntries().isEmpty())
						 

					System.out.println("Publishing events..");
					publishEvents(events);

				} catch (Exception e) {
					System.out.println("mesa sto catch");
					System.out.println(e.getMessage());
				}
			}
		} finally {
			out.close();
		}
	}

	private void publishEvents(ArrayList<SociosEvent> events) {

		JMSPublisher publisher = new JMSPublisher();

		for (SociosEvent event : events)
			try {
				publisher.publishMessage(event);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		System.out.println("mesa sti doGet");
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		System.out.println("mesa sti doPost");
	}

	/**
	 * Returns a short description of the servlet.
	 * 
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

	private static String getStringFromInputStream(InputStream stream) {

		InputStreamReader inReader = new InputStreamReader(stream);
		BufferedReader in = new BufferedReader(inReader);
		StringBuilder output = new StringBuilder();

		try {
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				if (!inputLine.isEmpty()) {
					output.append(inputLine);
				}
			}
			in.close();

		} catch (IOException ex) {
			return ex.getMessage();
		}

		return output.toString();
	}
}
