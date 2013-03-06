/*
 * Copyright 2011 Arnim Bleier, Andreas Niekler and Patrick Jaehnichen
 * Licensed under the GNU Lesser General Public License.
 * http://www.gnu.org/licenses/lgpl.html
 */
 
package de.uni_leipzig.informatik.asv.utils;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CLDACorpus {

    private int[][] documents;
    private String[][] docs;
    private int vocabularySize = 0;
    private HashSet<String> vocabulary = new HashSet<String>();
    private HashMap<Integer, String> codeToWord = new HashMap<Integer, String>();
    private HashMap<String, Integer> wordToCode = new HashMap<String, Integer>();
    private int currentIndex = 0;
    private List<String> stopWords = new ArrayList<String>();
    
    // Glassfish Instance Root folder system variable
    private static String glassfishInstanceRootPropertyName = "com.sun.aas.instanceRoot";
    // "config" sub-folder name
    private static String glassfishDomainConfigurationFolderName = "config";

    public CLDACorpus(InputStream is) throws IOException {
        int length, word, counts;
        List<List<Integer>> docList = new ArrayList<List<Integer>>();
        List<Integer> doc;
        BufferedReader br = new BufferedReader(new InputStreamReader(is,
                "UTF-8"));
        String line = null;
        while ((line = br.readLine()) != null) {
            try {
                doc = new ArrayList<Integer>();
                String[] fields = line.split(" ");
                length = Integer.parseInt(fields[0]);
                for (int n = 0; n < length; n++) {
                    String[] wordCounts = fields[n + 1].split(":");
                    word = Integer.parseInt(wordCounts[0]);
                    counts = Integer.parseInt(wordCounts[1]);
                    for (int i = 0; i < counts; i++) {
                        doc.add(word);
                    }
                    if (word >= vocabularySize) {
                        vocabularySize = word + 1;
                    }
                }
                docList.add(doc);
            } catch (Exception e) {
                System.err.println(e.getMessage() + "\n");
            }
        }
        documents = new int[docList.size()][];
        for (int j = 0; j < docList.size(); j++) {
            doc = docList.get(j);
            documents[j] = new int[doc.size()];
            for (int i = 0; i < doc.size(); i++) {
                documents[j][i] = doc.get(i);
            }
        }
    }

    public CLDACorpus(List<String> corpus) {


        loadStopWordList();
        int length;
        int counter = 0;
        List<List<Integer>> docList = new ArrayList<List<Integer>>();
        List<Integer> doc;
        String word;

        for (String line : corpus) {

            doc = new ArrayList<Integer>();

            //specify delimiters
            String[] fields = line.split(" ");

            length = fields.length;
            for (int n = 0; n < length; n++) {

                word = fields[n];

                //remove usernames
                if(word.startsWith("@"))
                    continue;
                
                //remove stopwords
                if (stopWords.contains(word)) {
                    continue;
                }

                addWordToCodebook(word);
                int code = getWordCode(word);
                doc.add(code);
                counter++;
            }

            docList.add(doc);

        }

        documents = new int[docList.size()][];
        for (int j = 0; j < docList.size(); j++) {
            doc = docList.get(j);
            documents[j] = new int[doc.size()];
            for (int i = 0; i < doc.size(); i++) {
                documents[j][i] = doc.get(i);
            }
        }

        vocabularySize = vocabulary.size();
        System.out.println("@@ vocabularySize = " + vocabularySize);
        System.out.println("@@ counter = " + counter);
    }

    public int[][] getDocuments() {
        return documents;
    }

    public String[][] getDocs() {
        return docs;
    }

    public int getVocabularySize() {
        return vocabularySize;
    }

    private void addWordToCodebook(String word) {
        if (!vocabulary.contains(word)) {
            codeToWord.put(currentIndex, word);
            wordToCode.put(word, currentIndex);
            currentIndex++;
            vocabulary.add(word);
        }
    }

    public int getWordCode(String word) {
        return wordToCode.get(word);
    }

    public String getWordFromCode(int index) {
        return codeToWord.get(index);
    }

    public HashMap<Integer, String> getCodeToWord() {
        return codeToWord;
    }

    private void loadStopWordList() {

        try {

            // Instance Root folder
            final String instanceRoot = System.getProperty(glassfishInstanceRootPropertyName);
            if (instanceRoot == null) {
                throw new FileNotFoundException("Cannot find Glassfish instanceRoot. Is the com.sun.aas.instanceRoot system property set?");
            }

            // Instance Root + /config folder
            File configurationFolder = new File(instanceRoot + File.separator + glassfishDomainConfigurationFolderName);
            File configFile = new File(configurationFolder, "english.dat");

            // Open the file that is the first 
            // command line parameter
            FileInputStream fstream = new FileInputStream(configFile);
            // Get the object of DataInputStream
            DataInputStream in = new DataInputStream(fstream);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String line;
            //Read File Line By Line
            while ((line = br.readLine()) != null) {

                stopWords.add(line);
            }
            //Close the input stream
            in.close();
            
            
            //add twitter specific stop words
            stopWords.add("RT");
            stopWords.add("via");
            

        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: " + e.getMessage());

        }
    }
}
