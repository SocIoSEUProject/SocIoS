====================================================================
Sentiment Analysis service Version 1.0 README
====================================================================

Sentiment Analysis service
Software Release Number 1.0
20/2/2013

====================================================================
LICENSE AND COPYRIGHT 
====================================================================
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Created By :		Thanos Papaoikonomou
Created for Project :	SocIoS



====================================================================
INTRODUCTION 
====================================================================
[Component Overview]

The goal of this service is to extract sentiment expressive patterns from user generated content in social networks. The service will come to the aid of the SocIoS end users, helping them to categorize sentimentally charged text e.g. analyze social media posts to separate subjective from objective opinions or count the overall positive and negative feedback concerning a specific topic. The following steps summarize the functionality of the Sentiment Analysis service:

1. For each polarity class (positive, negative or neutral) we build a single n-gram graph, uniformly aggregating the documents comprising it. After merging all individual document graphs into the class graph, its edges encapsulate the most characteristic patterns contained in the class' content, such as recurring and neighbouring character sequences, special characters, and digits.

2. Upon the receipt of a new textual item (e.g. tweet, description), we build a new document graph Gti to represent it.

3. To estimate the similarity between a new document (e.g. tweet) graph Gti and a class graph GTp (positive, negative, neutral), we employ one of the established n-gram graph similarity metrics: i) Containment Similarity (CS), which expresses the proportion of edges of a small graph Gti that are shared with graph GTp, ii) Value Similarity (VS), which indicates how many of the edges contained in graph Gti are shared with graph GTp., considering also their weights. Normalized Value Similarity (NVS), which decouples value similarity from the effect of the largest graph's size.

4. The resulting features are fed to our classification algorithm. For our purposes we used the Naive Bayes Multinomial (NBM) algorithm and SVM

====================================================================
NEW FEATURES AND FUNCTIONS IN THIS RELEASE 
====================================================================

N/A


====================================================================
GETTING STARTED
====================================================================

SOFTWARE DEPENDENCIES
--------------------------------------------------------------------
Oracle JDK 1.6
Apache Ant
Metro Web services stack
Jinsect (a tool for creating n-gram graphs that is freely available at: http://sourceforge.net/projects/jinsect/),
Weka (a library of machine learning algorithms)


PLATFORM SUPPORTED
--------------------------------------------------------------------
The component has been successfully deployed in Windows 7 and Linux Ubuntu version 12.04


INSTALLATION INSTRUCTIONS
--------------------------------------------------------------------

Event Detection is packaged as a Netbeans project. Netbeans with JavaEE support is needed to open it.
We used Netbeans version 7.0.1 for our development.


USING THE SOFTWARE
--------------------------------------------------------------------
The deployment of the .war file will expose a SOAP web service at the following URL
http://<host>:<port>/ngrams/?wsdl . This interface is the entry point for the Core
Services and can be consumed by an appropriate SOAP client.


TESTING THE SOFTWARE
--------------------------------------------------------------------

We tested the Core Services functionality using soapUI version 4.0.1(http://www.soapui.org/)  
and WebServiceStudio(http://webservicestudio.codeplex.com/)


====================================================================
CONTACT INFORMATION AND WEBSITE
====================================================================
We welcome your feedback, suggestions and contributions. Contact us
via email if you have questions, feedback, code submissions, 
and bug reports.

For general inquiries - nkardara@mail.ntua.gr

==================================================================

====================================================================
SOURCE CODE INFORMATION
====================================================================

Sentiment analysis project has two distinct component. The frontent component, namely SentimentNGramServer.java which is the implementation of the SOAP interface. The back-end component which is located in the packages Temp and gr.ntua.sentimentanalysis

====================================================================
DIRECTORY STRUCTURE 
====================================================================

[root]                          : the implementation of the SOAP interface 
gr\ntua\sentimentanalysis       : responsible for the loading of the training dataset.
Temp							: classification algorithm and utilities

