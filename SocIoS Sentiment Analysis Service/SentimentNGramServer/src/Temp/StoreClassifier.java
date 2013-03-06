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

import gr.demokritos.iit.jinsect.documentModel.comparators.NGramCachedGraphComparator;
import gr.demokritos.iit.jinsect.documentModel.representations.DocumentNGramGraph;
import gr.demokritos.iit.jinsect.documentModel.representations.DocumentNGramHGraph;
import gr.demokritos.iit.jinsect.structs.GraphSimilarity;
import weka.classifiers.Classifier;
import weka.classifiers.bayes.NaiveBayes;
import weka.core.DenseInstance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

/**
 *
 * @author gap2
 */

public class StoreClassifier {
 
    private final static int N_GRAM_SIZE = 3;
    private final static int NEGATIVE = 0;
    private final static int NEUTRAL = 1;
    private final static int POSITIVE = 2;
    
    private final static NGramCachedGraphComparator comparator = new NGramCachedGraphComparator();
    
    private Classifier classifier;
    private DocumentNGramGraph negativeGraph;
    private DocumentNGramGraph neutralGraph;
    private DocumentNGramGraph positiveGraph;
    private Instances instances;
    
    public StoreClassifier(String instancesPath, String[] graphPaths) throws Exception {
        System.out.println("\n\nLoading negative class graph...");
        negativeGraph = (DocumentNGramGraph) SerializationUtilities.loadSerializedObject(graphPaths[0]);
        System.out.println("\n\nLoading neutral class graph...");
        neutralGraph = (DocumentNGramGraph) SerializationUtilities.loadSerializedObject(graphPaths[1]);
        System.out.println("\n\nLoading positive class graph...");
        positiveGraph = (DocumentNGramGraph) SerializationUtilities.loadSerializedObject(graphPaths[2]);
        
        System.out.println("\n\nLoading instances...");
        DataSource source = new DataSource(instancesPath);
        instances = source.getDataSet();
        instances.setClassIndex(instances.numAttributes() - 1);
    }
    
    public int classifyUnlabeledInstance(String document) throws Exception {
        DocumentNGramGraph tempGraph = new DocumentNGramHGraph(N_GRAM_SIZE, N_GRAM_SIZE, N_GRAM_SIZE, 50);
        tempGraph.setDataString(document);
        
        GraphSimilarity negSimilarity = comparator.getSimilarityBetween(tempGraph, negativeGraph);
        GraphSimilarity neuSimilarity = comparator.getSimilarityBetween(tempGraph, neutralGraph);
        GraphSimilarity posSimilarity = comparator.getSimilarityBetween(tempGraph, positiveGraph);
        
        double[] values = new double[3*3+1];
        values[0] = negSimilarity.ContainmentSimilarity;
        values[1] = negSimilarity.ValueSimilarity/negSimilarity.SizeSimilarity;
        values[2] = negSimilarity.ValueSimilarity;
        values[3] = neuSimilarity.ContainmentSimilarity;
        values[4] = neuSimilarity.ValueSimilarity/neuSimilarity.SizeSimilarity;
        values[5] = neuSimilarity.ValueSimilarity;
        values[6] = posSimilarity.ContainmentSimilarity;
        values[7] = posSimilarity.ValueSimilarity/posSimilarity.SizeSimilarity;
        values[8] = posSimilarity.ValueSimilarity;
        values[9] = -1;
        
        DenseInstance tempInstance = new DenseInstance(1.0, values);
        tempInstance.setDataset(instances);
        double classIndex = classifier.classifyInstance(tempInstance);
        
        if (classIndex == 0) {
            return NEGATIVE;
        } else if (classIndex == 1) {
            return NEUTRAL;
        } else if (classIndex == 2) {
            return POSITIVE;
        }
        
        return -1;
    }
    
    public void trainClassifier() throws Exception {
        classifier = new NaiveBayes();
        classifier.buildClassifier(instances);
    }
 /*  Copied in the WS initialization method
  * 
    public static void main (String[] args) throws Exception {
        String inputPath = "/home/gap2/Desktop/graphs/trainingInstances.arff";
        String[] graphsPath = { "/home/gap2/Desktop/graphs/negGraph",
                                "/home/gap2/Desktop/graphs/neuGraph",
                                "/home/gap2/Desktop/graphs/posGraph" };
        
        StoreClassifier stocl = new StoreClassifier(inputPath, graphsPath);
        stocl.trainClassifier();
        System.out.println(stocl.classifyUnlabeledInstance("Testing tweet!!!!!"));
    }
  */
}