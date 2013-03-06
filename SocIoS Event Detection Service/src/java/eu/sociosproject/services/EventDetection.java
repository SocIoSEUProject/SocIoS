/*
*    This file is part of SocIoS Event Detection Service.
*
*    SocIoS Event Detection Service is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    SocIoS Event Detection Service is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with SocIoS Event Detection Service.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
package eu.sociosproject.services;

import cc.mallet.types.IDSorter;
import de.uni_leipzig.informatik.asv.hdp.HDPGibbsSampler;
import de.uni_leipzig.informatik.asv.hdp.HDPGibbsSampler.DOCState;
import de.uni_leipzig.informatik.asv.utils.CLDACorpus;
import eu.sociosproject.ISocialFilteringService;
import eu.sociosproject.SocialFilteringService;
import eu.sociosproject.sociosvoc.*;
import eu.sociosproject.services.objects.StringHDPGibbsSampler;
import eu.sociosproject.sociosvoc.Activity;
import eu.sociosproject.sociosvoc.ActivityList;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author thanos
 */
@WebService(serviceName = "EventDetection")
public class EventDetection {
    
    
    //@WebServiceRef(wsdlLocation = "WEB-INF/wsdl/epart.atc.gr_8080/SocialFilteringService/SocialFilteringService.wsdl")
    //private SocialFilteringService service;
    

    @WebMethod(operationName = "getEvents")
    public ActivityList getEvents(@WebParam(name = "clientId") ObjectId clientId, @WebParam(name = "groupId") ObjectId groupId) {        
       
        System.out.println("@EventDetection @getEvents START ");
        List<MediaItem> retrievedMediaItems = retrieveRecentMediaItems(clientId, groupId);
        if(retrievedMediaItems == null || retrievedMediaItems.isEmpty() ) {
            System.out.println("@EventDetection @getEvents I did not get any mediaItems ");
            return null;
        }
        
        System.out.println("@EventDetection retrievedMediaItems.size() = " + retrievedMediaItems.size());
        return getEventsFromMediaItems(retrievedMediaItems);
        
        
     }
    
    
    @WebMethod(operationName = "getEventsFromMediaItems")
    public ActivityList getEventsFromMediaItems( @WebParam(name = "corpus") List<MediaItem> mediaItems ){

        
            
        if(mediaItems == null || mediaItems.isEmpty() )
            return null;
                        
        
        List<String> text = mediaItemsToText(mediaItems);        
        ActivityList response = new ActivityList();        
        StringHDPGibbsSampler hdp = new StringHDPGibbsSampler();        		
        CLDACorpus corpus = new CLDACorpus(text);
        hdp.addInstances(corpus.getDocuments(), corpus.getVocabularySize());
                
        System.out.println("sizeOfVocabulary = " + hdp.getSizeOfVocabulary());
        System.out.println("totalNumberOfWords = " + hdp.getTotalNumberOfWords());
        StringHDPGibbsSampler.DOCState[] docStates = hdp.getDocStates();        
        System.out.println("NumberOfDocs = " + docStates.length);

        try {            
            
            
            hdp.addInstances(corpus.getDocuments() , corpus.getVocabularySize());       
            hdp.run(0, 10000, System.out);
            
            System.out.println("I got " + hdp.getNumberOfTopics() + " topics " ); 
            HashMap<Integer, List<Integer>> descriptions = printTopicWords(hdp, 10);
            
            for(int k = 0; k < hdp.getNumberOfTopics(); k++ ) {
                Activity a = new Activity();
                
                List<Integer> words = descriptions.get(k);
                String title = "";
                for(int i = 0; i < words.size(); i++ ) {
                    title += corpus.getWordFromCode(words.get(i)) ;
                    if(i != words.size() - 1)
                        title += ", ";
                }
                a.setTitle(title);
                
                List<Integer> documentsForTopic = hdp.getDocumentsForTopic(k); 
                //System.out.println("documentsForTopic.size() " + documentsForTopic.size());
                for(Integer docId : documentsForTopic ) {   
                    //System.out.println("Adding doc id " + docId);
                    a.getMediaItems().add(mediaItems.get(docId));
                }
                response.getActivity().add(a);                
            }
                                           
            return response;

        } catch (IOException ex) {
            Logger.getLogger(EventDetection.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
                       
    }
    
    
private HashMap<Integer, List<Integer>> printTopicWords(StringHDPGibbsSampler hdp, int maxNumberOfWords) {

        HashMap<Integer, List<Integer>> response = new HashMap<Integer, List<Integer>>(hdp.getNumberOfTopics());

        if (maxNumberOfWords <= 0 || maxNumberOfWords > hdp.getSizeOfVocabulary()) {
            maxNumberOfWords = hdp.getSizeOfVocabulary();
        }

        IDSorter[] sortedWords = new IDSorter[hdp.getSizeOfVocabulary()];
        for (int v = 0; v < hdp.getSizeOfVocabulary(); v++) {
            sortedWords[v] = new IDSorter(v, v);
        }

        for (int k = 0; k < hdp.getNumberOfTopics(); k++) {

            List<Integer> item = new ArrayList<Integer>();
            for (int v = 0; v < hdp.getSizeOfVocabulary(); v++) {
                sortedWords[v].set(v, hdp.getWordCountByTopicAndTerm()[k][v]);
            }

            Arrays.sort(sortedWords);

            for (int v = 0; v < maxNumberOfWords; v++) {

                if(sortedWords[v].getWeight() > 0)
                    item.add(sortedWords[v].getID());
                else 
                    break;
                //out.print(data.getAlphabet().lookupObject(sortedWords[v].getID()) + "    ");
            }
            
            response.put(k, item);
        }

        return response;
    }    
    
        
    private List<MediaItem> retrieveRecentMediaItems( ObjectId clientId, ObjectId groupId) {
       
        List<MediaItem> response = new ArrayList<MediaItem>();
                               
         if (clientId == null) {
            System.err.println("EventDetectionServiceError: Missing client id!");
            return null;
        }
   
        if (groupId == null) {
            System.err.println("EventDetectionServiceError: Missing group id!");
            return null;
        }
        
        ActivityReturnObject recentActivities = getRecentActivities(clientId, groupId);
        if(recentActivities == null)
            return null;
        
        if(recentActivities.getActivityReturn() == null)
            return null;
                
        List<Activity> activities = recentActivities.getActivityReturn().getActivities();
        for(Activity activity : activities ) {            
            List<MediaItem> mediaItems = activity.getMediaItems();
            response.addAll(mediaItems);
 
        }
         return response;
    }    
    
    
    private List<String> mediaItemsToText(List<MediaItem> mediaItems) {

        List<String> response = new ArrayList<String>();

        for (MediaItem item : mediaItems) {
  
            String text = "";
            String t = "";

            if (item.getDescription() != null) {
                text += item.getDescription() + " ";
            } 
            if (item.getTitle() != null) {
                text += item.getTitle() + " ";
            } 
            
            if (item.getTags() != null) {
                text += item.getTags();
            }
            
            if(text.trim().equals(""))
                t = " ";
            else {
                //String[] splits = text.split("[,\\s\\-:\\?]");
                String[] splits = text.split("[,\\s]");
                for(int i = 0; i < splits.length; i++) {
                    String split = splits[i];                    
                    split = split.replace("(", "");
                    split = split.replace(")", "");
                    t += split;
                    if(i != splits.length - 1)                          
                        t += " ";
            
                }
            }            
            
            response.add(t);
        }
        return response;
    }

    private ActivityReturnObject getRecentActivities(eu.sociosproject.sociosvoc.ObjectId clientId, eu.sociosproject.sociosvoc.ObjectId groupId) {   
        try {
            SocialFilteringService service = new SocialFilteringService(new URL("http://epart.atc.gr:8080/SocialFilteringService/SocialFilteringService?wsdl"));
            eu.sociosproject.ISocialFilteringService port = service.getSocialFilteringServicePort();
            return port.getRecentActivities(clientId, groupId);
        } catch (MalformedURLException ex) {
            Logger.getLogger(EventDetection.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
                   
}
