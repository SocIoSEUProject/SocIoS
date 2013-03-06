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

import Classification.VectorModels;
import Utilities.ModelTypes.RepresentationModel;
import Utilities.SerializationUtilities;
import javax.annotation.PostConstruct;
import javax.jws.WebMethod;
import javax.jws.WebService;
import weka.classifiers.Classifier;
import weka.classifiers.functions.LibLINEAR;
import weka.core.Instance;
import weka.core.Instances;

/**
 *
 * @author gap2
 */
//@Stateless
@WebService(name="VectorModelSentimentAnalysis")
public class  VectorModelSentimentAnalysis  {

    public final static RepresentationModel REP_MODEL = RepresentationModel.CHARACTER_FOURGRAMS;
    
    public Classifier classifier;
    public Instances instances;
    public VectorModels vmcl;
    
    @PostConstruct
    public void init() throws Exception {
       System.out.println("Initializing service...");
    
       Thread training = new TrainingThread(this);
       training.start();
/*
        String[] inputPaths = { "C:\\FOT\\SentimentAnalysisServiceGraphs\\standfordTrainingSet\\trainingNegativeTweets",
                                "C:\\FOT\\SentimentAnalysisServiceGraphs\\standfordTrainingSet\\trainingPositiveTweets" };
        String[][] documents = new String[inputPaths.length][];
        for (int i = 0; i < inputPaths.length; i++) {
            documents[i] = (String[]) SerializationUtilities.loadSerializedObject(inputPaths[i]);
            System.out.println("Documents\t:\t" + documents[i].length);
        }
        
        System.out.println("Preparing instances...");
        vmcl = new VectorModels(0.5, 0.0, documents);
        vmcl.prepareData(true, REP_MODEL);
        instances = vmcl.getInstances();
        
        System.out.println("Training classifier...");
        classifier = new LibLINEAR();
        classifier.buildClassifier(instances);
        System.out.println("Classifier was trained!");
*/
    }


    @WebMethod(operationName="getTweetSentiment")
    public String getTextSentiment(String document) {
        Instance instance = vmcl.getInstance(-1, REP_MODEL, document);
        instance.setDataset(instances);

        int response = -1;
        try {
            response = (int) classifier.classifyInstance(instance);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (response==0) {
            return "negative";
        }
        else if (response==1) {
            return "positive";
        }
        else {
            return "unknown";
        }
    }
}