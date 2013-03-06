/*
*    This file is part of SocIoS Sentiment Analysis Service.
*
*    SocIoS Sentiment Analysis Service is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    SocIoS Sentiment Analysis Service is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with SocIoS Sentiment Analysis Service.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
 package Temp;

import Models.TokenNGramGraphs;
import gr.demokritos.iit.jinsect.documentModel.representations.DocumentNGramGraph;
import gr.demokritos.iit.jinsect.documentModel.representations.DocumentWordGraph;
import java.io.File;
import java.util.Random;

/**
 *
 * @author gap2
 */

public class BuildGraphs {
 
    private static final int nSize = 1;
    
    public static void main (String[] args) {
        String inputDir = "/home/gap2/Data/sentimentAnalysis/twitterProprietaryDataset/";
        String outputDir = "/home/gap2/Data/sentimentAnalysis/twitterProprietaryGraphs/";
        
        File directory = new File(inputDir);
        File[] datasetFiles = directory.listFiles();
        for (File file : datasetFiles) {
            System.out.println("\n\nLoading " + file.getName());
            String[] tweetsArray = (String[]) SerializationUtilities.loadSerializedObject(file.getAbsolutePath());
            int noOfTweets = tweetsArray.length;
            System.out.println("Loaded tweets\t:\t" + noOfTweets);
            
            int noOfDocuments = 0;
            Random random = new Random(2);
            final DocumentNGramGraph graphModel = new DocumentWordGraph(nSize, nSize, nSize);
            final DocumentNGramGraph tempGraph = new DocumentNGramGraph(nSize, nSize, nSize);
            for (int i = 0; i < noOfTweets; i++) {
                if (i%10000 == 0) {
                    System.out.println(i);
                }
                
                if (random.nextDouble() < 0.66) {
                    continue;
                }
                
                noOfDocuments++;
                tempGraph.setDataString(tweetsArray[i]);
                graphModel.merge(tempGraph, 1.0 - (noOfDocuments-1.0)/noOfDocuments);
            }
            System.out.println("No of documents\t:\t" + noOfDocuments);
            SerializationUtilities.storeSerializedObject(graphModel, outputDir+file.getName());
        }
    }
}