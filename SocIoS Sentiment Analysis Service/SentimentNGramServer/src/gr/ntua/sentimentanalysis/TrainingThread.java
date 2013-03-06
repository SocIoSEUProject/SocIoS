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
import Temp.SerializationUtilities;
import weka.classifiers.functions.LibLINEAR;

/**
 *
 * @author Fot
 */

public class TrainingThread  extends Thread {

	//Thread runner;
        VectorModelSentimentAnalysis a;

 
	public TrainingThread(VectorModelSentimentAnalysis b) {
            a=b;
	}

	public void run() {
		//Display info about this particular thread
		System.out.println(Thread.currentThread());
                        String[] inputPaths = { "C:\\FOT\\SentimentAnalysisServiceGraphs\\standfordTrainingSet\\trainingNegativeTweets",
                                "C:\\FOT\\SentimentAnalysisServiceGraphs\\standfordTrainingSet\\trainingPositiveTweets" };
        String[][] documents = new String[inputPaths.length][];
        for (int i = 0; i < inputPaths.length; i++) {
            documents[i] = (String[]) SerializationUtilities.loadSerializedObject(inputPaths[i]);
            System.out.println("Documents\t:\t" + documents[i].length);
        }

        System.out.println("Preparing instances...");
        a.vmcl = new VectorModels(0.5, 0.0, documents);
        a.vmcl.prepareData(true, a.REP_MODEL);
        a.instances = a.vmcl.getInstances();

        System.out.println("Training classifier...");
        a.classifier = new LibLINEAR();
        try {

           a.classifier.buildClassifier(a.instances);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Classifier was trained!");
	}
}

