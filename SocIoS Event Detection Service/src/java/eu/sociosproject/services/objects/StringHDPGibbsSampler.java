/*
 * Copyright 2011 Arnim Bleier, Andreas Niekler and Patrick Jaehnichen
 * Licensed under the GNU Lesser General Public License.
 * http://www.gnu.org/licenses/lgpl.html
 */
package eu.sociosproject.services.objects;

import cc.mallet.types.IDSorter;
import de.uni_leipzig.informatik.asv.hdp.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import de.uni_leipzig.informatik.asv.utils.*;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Hierarchical Dirichlet Processes Chinese Restaurant Franchise Sampler
 *
 * For more information on the algorithm see: Hierarchical Bayesian
 * Nonparametric Models with Applications. Y.W. Teh and M.I. Jordan. Bayesian
 * Nonparametrics, 2010. Cambridge University Press.
 * http://www.gatsby.ucl.ac.uk/~ywteh/research/npbayes/TehJor2010a.pdf
 *
 * For other known implementations see README.txt
 *
 * @author <a href="mailto:arnim.bleier+hdp@gmail.com">Arnim Bleier</a>
 */
public class StringHDPGibbsSampler {

    public double beta = 0.5; // default only
    public double gamma = 1.5;
    public double alpha = 1.0;
    private Random random = new Random();
    private double[] p;
    private double[] f;
    //
    protected DOCState[] docStates;
    //to be changed
    protected int[] numberOfTablesByTopic;
    protected int[] wordCountByTopic;
    //
    protected static int[][] wordCountByTopicAndTerm;
    //
    protected int sizeOfVocabulary;
    protected int totalNumberOfWords;
    protected int numberOfTopics = 1;
    protected int totalNumberOfTables;

    /**
     * Initially assign the words to tables and topics
     *
     * @param corpus {@link CLDACorpus} on which to fit the model
     */
    public void addInstances(int[][] documentsInput, int V) {

        sizeOfVocabulary = V;
        totalNumberOfWords = 0;

        docStates = new DOCState[documentsInput.length];
        for (int d = 0; d < documentsInput.length; d++) {
            docStates[d] = new DOCState(documentsInput[d], d);
            totalNumberOfWords += documentsInput[d].length;
        }
        int k, i, j;
        DOCState docState;
        p = new double[20];
        f = new double[20];
        numberOfTablesByTopic = new int[numberOfTopics + 1];
        wordCountByTopic = new int[numberOfTopics + 1];
        wordCountByTopicAndTerm = new int[numberOfTopics + 1][];
        for (k = 0; k <= numberOfTopics; k++) // var initialization done
        {
            wordCountByTopicAndTerm[k] = new int[sizeOfVocabulary];
        }
        for (k = 0; k < numberOfTopics; k++) {
            docState = docStates[k];
            for (i = 0; i < docState.documentLength; i++) {
                addWord(docState.docID, i, 0, k);
            }
        } // all topics have now one document
        for (j = numberOfTopics; j < docStates.length; j++) {
            docState = docStates[j];
            k = random.nextInt(numberOfTopics);
            for (i = 0; i < docState.documentLength; i++) {
                addWord(docState.docID, i, 0, k);
            }
        } // the words in the remaining documents are now assigned too
    }

    public int getSizeOfVocabulary() {

        return sizeOfVocabulary;
    }

    public DOCState[] getDocStates() {
        return docStates;
    }

    public int getTotalNumberOfWords() {
        return totalNumberOfWords;
    }

    public int getNumberOfTopics() {
        return numberOfTopics;
    }

    public int[][] getWordCountByTopicAndTerm() {
        return wordCountByTopicAndTerm;
    }

    /**
     * Step one step ahead
     *
     */
    protected void nextGibbsSweep() {
        int table;
        for (int d = 0; d < docStates.length; d++) {
            for (int i = 0; i < docStates[d].documentLength; i++) {
                removeWord(d, i); // remove the word i from the state
                table = sampleTable(d, i);
                if (table == docStates[d].numberOfTables) // new Table
                {
                    addWord(d, i, table, sampleTopic()); // sampling its Topic
                } else {
                    addWord(d, i, table, docStates[d].tableToTopic[table]); // existing Table
                }
            }
        }
        defragment();
    }

    /**
     * Decide at which topic the table should be assigned to
     *
     * @return the index of the topic
     */
    private int sampleTopic() {
        double u, pSum = 0.0;
        int k;
        p = ensureCapacity(p, numberOfTopics);
        for (k = 0; k < numberOfTopics; k++) {
            pSum += numberOfTablesByTopic[k] * f[k];
            p[k] = pSum;
        }
        pSum += gamma / sizeOfVocabulary;
        p[numberOfTopics] = pSum;
        u = random.nextDouble() * pSum;
        for (k = 0; k <= numberOfTopics; k++) {
            if (u < p[k]) {
                break;
            }
        }
        return k;
    }

    /**
     * Decide at which table the word should be assigned to
     *
     * @param docID the index of the document of the current word
     * @param i the index of the current word
     * @return the index of the table
     */
    int sampleTable(int docID, int i) {
        int k, j;
        double pSum = 0.0, vb = sizeOfVocabulary * beta, fNew, u;
        DOCState docState = docStates[docID];
        f = ensureCapacity(f, numberOfTopics);
        p = ensureCapacity(p, docState.numberOfTables);
        fNew = gamma / sizeOfVocabulary;
        for (k = 0; k < numberOfTopics; k++) {
            f[k] = (wordCountByTopicAndTerm[k][docState.words[i].termIndex] + beta)
                    / (wordCountByTopic[k] + vb);
            fNew += numberOfTablesByTopic[k] * f[k];
        }
        for (j = 0; j < docState.numberOfTables; j++) {
            if (docState.wordCountByTable[j] > 0) {
                pSum += docState.wordCountByTable[j] * f[docState.tableToTopic[j]];
            }
            p[j] = pSum;
        }
        pSum += alpha * fNew / (totalNumberOfTables + gamma); // Probability for t = tNew
        p[docState.numberOfTables] = pSum;
        u = random.nextDouble() * pSum;
        for (j = 0; j <= docState.numberOfTables; j++) {
            if (u < p[j]) {
                break;	// decided which table the word i is assigned to
            }
        }
        return j;
    }

    /**
     * Method to call for fitting the model.
     *
     * @param doShuffle
     * @param shuffleLag
     * @param maxIter number of iterations to run
     * @param saveLag save interval
     * @param wordAssignmentsWriter {@link WordAssignmentsWriter}
     * @param topicsWriter {@link TopicsWriter}
     * @throws IOException
     */
    public void run(int shuffleLag, int maxIter, PrintStream log)
            throws IOException {
        for (int iter = 0; iter < maxIter; iter++) {
            if ((shuffleLag > 0) && (iter > 0) && (iter % shuffleLag == 0)) {
                doShuffle();
            }
            nextGibbsSweep();
            //log.println("iter = " + iter + " #topics = " + numberOfTopics + ", #tables = " + totalNumberOfTables);
        }
    }

    /**
     * Removes a word from the bookkeeping
     *
     * @param docID the id of the document the word belongs to
     * @param i the index of the word
     */
    protected void removeWord(int docID, int i) {
        DOCState docState = docStates[docID];
        int table = docState.words[i].tableAssignment;
        int k = docState.tableToTopic[table];
        docState.wordCountByTable[table]--;
        wordCountByTopic[k]--;
        wordCountByTopicAndTerm[k][docState.words[i].termIndex]--;
        if (docState.wordCountByTable[table] == 0) { // table is removed
            totalNumberOfTables--;
            numberOfTablesByTopic[k]--;
            docState.tableToTopic[table]--;
        }
    }

    /**
     * Add a word to the bookkeeping
     *
     * @param docID	docID the id of the document the word belongs to
     * @param i the index of the word
     * @param table the table to which the word is assigned to
     * @param k the topic to which the word is assigned to
     */
    protected void addWord(int docID, int i, int table, int k) {
        DOCState docState = docStates[docID];
        docState.words[i].tableAssignment = table;
        docState.wordCountByTable[table]++;
        wordCountByTopic[k]++;
        wordCountByTopicAndTerm[k][docState.words[i].termIndex]++;
        if (docState.wordCountByTable[table] == 1) { // a new table is created
            docState.numberOfTables++;
            docState.tableToTopic[table] = k;
            totalNumberOfTables++;
            numberOfTablesByTopic[k]++;
            docState.tableToTopic = ensureCapacity(docState.tableToTopic, docState.numberOfTables);
            docState.wordCountByTable = ensureCapacity(docState.wordCountByTable, docState.numberOfTables);
            if (k == numberOfTopics) { // a new topic is created
                numberOfTopics++;
                numberOfTablesByTopic = ensureCapacity(numberOfTablesByTopic, numberOfTopics);
                wordCountByTopic = ensureCapacity(wordCountByTopic, numberOfTopics);
                wordCountByTopicAndTerm = add(wordCountByTopicAndTerm, new int[sizeOfVocabulary], numberOfTopics);
            }
        }
    }

    /**
     * Removes topics from the bookkeeping that have no words assigned to
     */
    protected void defragment() {
        int[] kOldToKNew = new int[numberOfTopics];
        int k, newNumberOfTopics = 0;
        for (k = 0; k < numberOfTopics; k++) {
            if (wordCountByTopic[k] > 0) {
                kOldToKNew[k] = newNumberOfTopics;
                swap(wordCountByTopic, newNumberOfTopics, k);
                swap(numberOfTablesByTopic, newNumberOfTopics, k);
                swap(wordCountByTopicAndTerm, newNumberOfTopics, k);
                newNumberOfTopics++;
            }
        }
        numberOfTopics = newNumberOfTopics;
        for (int j = 0; j < docStates.length; j++) {
            docStates[j].defragment(kOldToKNew);
        }
    }

    /**
     * Permute the ordering of documents and words in the bookkeeping
     */
    protected void doShuffle() {
        List<DOCState> h = Arrays.asList(docStates);
        Collections.shuffle(h);
        docStates = h.toArray(new DOCState[h.size()]);
        for (int j = 0; j < docStates.length; j++) {
            List<WordState> h2 = Arrays.asList(docStates[j].words);
            Collections.shuffle(h2);
            docStates[j].words = h2.toArray(new WordState[h2.size()]);
        }
    }

    public static void swap(int[] arr, int arg1, int arg2) {
        int t = arr[arg1];
        arr[arg1] = arr[arg2];
        arr[arg2] = t;
    }

    public static void swap(int[][] arr, int arg1, int arg2) {
        int[] t = arr[arg1];
        arr[arg1] = arr[arg2];
        arr[arg2] = t;
    }

    public static double[] ensureCapacity(double[] arr, int min) {
        int length = arr.length;
        if (min < length) {
            return arr;
        }
        double[] arr2 = new double[min * 2];
        for (int i = 0; i < length; i++) {
            arr2[i] = arr[i];
        }
        return arr2;
    }

    public static int[] ensureCapacity(int[] arr, int min) {
        int length = arr.length;
        if (min < length) {
            return arr;
        }
        int[] arr2 = new int[min * 2];
        for (int i = 0; i < length; i++) {
            arr2[i] = arr[i];
        }
        return arr2;
    }

    public static int[][] add(int[][] arr, int[] newElement, int index) {
        int length = arr.length;
        if (length <= index) {
            int[][] arr2 = new int[index * 2][];
            for (int i = 0; i < length; i++) {
                arr2[i] = arr[i];
            }
            arr = arr2;
        }
        arr[index] = newElement;
        return arr;
    }

    public class DOCState {

        int docID, documentLength, numberOfTables;
        int[] tableToTopic;
        int[] wordCountByTable;
        WordState[] words;

        public DOCState(int[] instance, int docID) {
            this.docID = docID;
            numberOfTables = 0;
            documentLength = instance.length;
            words = new WordState[documentLength];
            wordCountByTable = new int[2];
            tableToTopic = new int[2];
            for (int position = 0; position < documentLength; position++) {
                words[position] = new WordState(instance[position], -1);
            }
        }

        public int getDocID() {
            return docID;
        }

        public int getDocumentLength() {
            return documentLength;
        }

        public WordState[] getWords() {
            return words;
        }

        public int[] getTableToTopic() {
            return tableToTopic;
        }

        public void defragment(int[] kOldToKNew) {
            int[] tOldToTNew = new int[numberOfTables];
            int t, newNumberOfTables = 0;
            for (t = 0; t < numberOfTables; t++) {
                if (wordCountByTable[t] > 0) {
                    tOldToTNew[t] = newNumberOfTables;
                    tableToTopic[newNumberOfTables] = kOldToKNew[tableToTopic[t]];
                    swap(wordCountByTable, newNumberOfTables, t);
                    newNumberOfTables++;
                } else {
                    tableToTopic[t] = -1;
                }
            }
            numberOfTables = newNumberOfTables;
            for (int i = 0; i < documentLength; i++) {
                words[i].tableAssignment = tOldToTNew[words[i].tableAssignment];
            }
        }
    }

    public class WordState {

        int termIndex;
        int tableAssignment;

        public WordState(int wordIndex, int tableAssignment) {
            this.termIndex = wordIndex;
            this.tableAssignment = tableAssignment;
        }

        public int getTableAssignment() {
            return tableAssignment;
        }

        public int getTermIndex() {
            return termIndex;
        }
    }

    private static List<String> testInput() {

        List<String> response = new ArrayList<String>();
        try {
            // Open the file that is the first 
            // command line parameter
            FileInputStream fstream = new FileInputStream("input.txt");
            // Get the object of DataInputStream
            DataInputStream in = new DataInputStream(fstream);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String strLine;
            //Read File Line By Line
            while ((strLine = br.readLine()) != null) {
                // Print the content on the console
                //System.out.println(strLine);
                response.add(strLine);
            }
            //Close the input stream
            in.close();
            return response;
        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: " + e.getMessage());
            return null;
        }
    }

    private static List<Entry> findTopKTerms(int[][] list, int rowIndex, int top) {

        List<Entry> response = new ArrayList<Entry>();
        List<Entry> t = new ArrayList<Entry>();
        for (int i = 0; i < list[rowIndex].length; i++) {
            t.add(new Entry(i, list[rowIndex][i]));
        }

        Collections.sort(t);
        for (int i = 0; i < Math.min(top, t.size()); i++) {
            response.add(t.get(i));
        }

        return response;

    }

    /*
    public static void main(String[] args) throws IOException {

        StringHDPGibbsSampler hdp = new StringHDPGibbsSampler();
        //CLDACorpus corpus = new CLDACorpus(new FileInputStream(args[0]));
        CLDACorpus corpus = new CLDACorpus(testInput());
        //de.uni_leipzig.informatik.asv.utils.CLDACorpus corpus = new de.uni_leipzig.informatik.asv.utils.CLDACorpus(testInput());        
        hdp.addInstances(corpus.getDocuments(), corpus.getVocabularySize());

        System.out.println("sizeOfVocabulary = " + hdp.sizeOfVocabulary);
        System.out.println("totalNumberOfWords = " + hdp.totalNumberOfWords);
        System.out.println("NumberOfDocs = " + hdp.docStates.length);

        //hdp.run(0, 2000, System.out);
        hdp.run(0, 10000, System.out);

        System.out.println(" #topics = " + numberOfTopics + ", #tables = " + totalNumberOfTables);
        HashMap<Integer, List<Integer>> printTopicWords = printTopicWords(5);

       for (java.util.Map.Entry<Integer, List<Integer>> entry : printTopicWords.entrySet()) {
           System.out.println("For topic " + entry.getKey());           
           for (int i = 0; i < entry.getValue().size(); i++) {
                System.out.println("- " + corpus.getWordFromCode(entry.getValue().get(i)));
            }
        }


        //getTopicDocuments(0.0, -1);
        for(Integer i : getDocumentsForTopic(0)) {
            System.out.println(i);
        }


    }
     
     */
   
    public HashMap<Integer, List<Integer>> getTopicDocuments(double threshold, int maxNumberOfTopics) {

        HashMap<Integer, List<Integer>> response = new HashMap<Integer, List<Integer>>(numberOfTopics);
        int t, docID;
        //out.println("#doc name topic proportion ...");

        IDSorter[] sortedTopics = new IDSorter[numberOfTopics];
        IDSorter[] sortedDocumentsByTopic = new IDSorter[numberOfTopics];

        for (int k = 0; k < numberOfTopics; k++) {
            sortedTopics[k] = new IDSorter(k, k);
            sortedDocumentsByTopic[k] = new IDSorter(k, k);
        }

        if (maxNumberOfTopics <= 0 || maxNumberOfTopics > numberOfTopics) {
            maxNumberOfTopics = numberOfTopics;
        }

        for (int d = 0; d < docStates.length; d++) {

            DOCState doc = docStates[d];
            int[] topicCounts = new int[numberOfTopics];

            System.out.println("@@@@@" + d + "    ");

            for (int j = 0; j < doc.documentLength; j++) {
                topicCounts[doc.tableToTopic[doc.words[j].tableAssignment]]++;
            }

            for (int k = 0; k < numberOfTopics; k++) {
                sortedTopics[k].set(k, topicCounts[k] / (doc.documentLength * 1.0));
            }
        }

            Arrays.sort(sortedTopics);
            for (int k = 0; k < maxNumberOfTopics; k++) {
                if (sortedTopics[k].getWeight() < threshold) {
                    break;
                }

                if (sortedTopics[k].getWeight() > 0) {
                    System.out.println(sortedTopics[k].getID() + "    " + sortedTopics[k].getWeight() + "    ");
                }
            }
        
       
    return response ;
}
    
       
    public List<Integer> getDocumentsForTopic(int topicId) {

        List<Integer> response = new ArrayList<Integer>(numberOfTopics);            

        IDSorter[] sortedDocs = new IDSorter[docStates.length];        
        
        for (int d = 0; d < docStates.length; d++) {

            int topicCount = 0;
            DOCState doc = docStates[d];
            sortedDocs[d] = new IDSorter(-1, -100);
            //System.out.println("******");
            for (int j = 0; j < doc.documentLength; j++) {
//                System.out.println("Word " + doc.words[j].termIndex);
//                System.out.println("Word/table assignment " + doc.words[j].tableAssignment);
//                System.out.println("Word/table/topic assignment " + doc.tableToTopic[doc.words[j].tableAssignment]);
                if(doc.tableToTopic[doc.words[j].tableAssignment] == topicId) 
                    topicCount++;
                //topicCounts[doc.tableToTopic[doc.words[j].tableAssignment]]++;
            }

            double proportion = (double)topicCount/(doc.documentLength * 1.0);
            //System.out.println(proportion);
            sortedDocs[d].set(d, proportion);
        }
            
            Arrays.sort(sortedDocs);
            for (int k = 0; k < Math.min(docStates.length, 5); k++) {

                if (sortedDocs[k].getWeight() > 0) {
                    //System.out.println("topic " + topicId + "    " +sortedDocs[k].getID() + "    " + sortedDocs[k].getWeight() + "    ");
                    response.add(sortedDocs[k].getID());
                }
            }
        
       
    return response ;
}
/**
 * Gets the top words for each topic
 * 
 * @param maxNumberOfWords
 */
public HashMap<Integer, List<Integer>> printTopicWords(int maxNumberOfWords) {

        HashMap<Integer, List<Integer>> response = new HashMap<Integer, List<Integer>>(numberOfTopics);

        if (maxNumberOfWords <= 0 || maxNumberOfWords > sizeOfVocabulary) {
            maxNumberOfWords = sizeOfVocabulary;
        }

        IDSorter[] sortedWords = new IDSorter[sizeOfVocabulary];
        for (int v = 0; v < sizeOfVocabulary; v++) {
            sortedWords[v] = new IDSorter(v, v);
        }

        for (int k = 0; k < numberOfTopics; k++) {

            List<Integer> item = new ArrayList<Integer>();
            for (int v = 0; v < sizeOfVocabulary; v++) {
                sortedWords[v].set(v, wordCountByTopicAndTerm[k][v]);
            }

            Arrays.sort(sortedWords);

            for (int v = 0; v < maxNumberOfWords; v++) {

                item.add(sortedWords[v].getID());
                //out.print(data.getAlphabet().lookupObject(sortedWords[v].getID()) + "    ");
            }
            
            response.put(k, item);
        }

        return response;
    }
    
   
}