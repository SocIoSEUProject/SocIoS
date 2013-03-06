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
 
 package gr.ntua.sentimentanalysis;

import Temp.StoreClassifier;
import javax.annotation.PostConstruct;
import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 *
 * @author Fotis Aisopos
 */

@WebService (name="SentimentAnalysis")
public class  SentimentAnalysisBean  {

    StoreClassifier stocl;

    @PostConstruct
    public void init() {

        System.out.println("Initializing service...");                

        String inputPath = "/home/socios/Desktop/SentimentData/trainingInstances.arff";
        String[] graphsPath = { "/home/socios/Desktop/SentimentData/negGraph",
                                "/home/socios/Desktop/SentimentData/neuGraph",
                                "/home/socios/Desktop/SentimentData/posGraph" };
        
//        String inputPath = "/home/gap2/Desktop/FotisGraphsAndServer/SentimentAnalysisServiceGraphs/trainingInstances.arff";
//        String[] graphsPath = { "/home/gap2/Desktop/FotisGraphsAndServer/SentimentAnalysisServiceGraphs/",
//                                "/home/gap2/Desktop/FotisGraphsAndServer/SentimentAnalysisServiceGraphs/",
//                                "/home/gap2/Desktop/FotisGraphsAndServer/SentimentAnalysisServiceGraphs/" };

        try {
            stocl = new StoreClassifier(inputPath, graphsPath);
            stocl.trainClassifier();
            System.out.println(stocl.classifyUnlabeledInstance("Testing tweet!!!!!"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


    @WebMethod(operationName="getTweetSentiment")
    public String getTextSentiment(String textObject) {
        int response=-1;
        try {
                 response= stocl.classifyUnlabeledInstance(textObject);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        if (response==0)
            return "negative";
        else if (response==1)
            return "neutral";
        else if (response==2)
            return "positive";
        else 
            return "";
    }
}