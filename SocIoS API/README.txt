====================================================================
Socios Core API Version 1.0 README
====================================================================

Socios Core API
Software Release Number 1.0
20/2/2013

====================================================================
LICENSE AND COPYRIGHT 
====================================================================
Copyright 2013 National Technical University of Athens

Licensed under the Apache License, Version 2.0 (the License"); you may not use this file except in compliance with the License. ou may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 

Created By : National Technical University of Athens
Created for Project :	SocIoS



====================================================================
INTRODUCTION 
====================================================================
[Component Overview]

The Core Services component acts as the main integration point for the underlying social network adaptors. 
It is responsible for receiving the client requests (where by client, we denote any auxiliary service) and 
distributing it appropriately to the various adaptors. It then collects the responses from them which are sent back to the client as a single list. 
The Core Services component exposes a SOAP web services endpoint, from which it can be consumed.  The code is available at:
 http://gforge.grid.ece.ntua.gr/svn/socios/trunk/SociosApiIllustrate 


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
Apache CXF
guava
gdata



PLATFORM SUPPORTED
--------------------------------------------------------------------
The component has been successfully deployed in Windows 7 and Linux Ubuntu version 12.04


INSTALLATION INSTRUCTIONS
--------------------------------------------------------------------
The core services middleware is packaged as an Eclipse project. Eclipse with JavaEE support is needed to open this project.
We used Eclipse Indigo for our development.


USING THE SOFTWARE
--------------------------------------------------------------------
The deployment of the .war file will expose a SOAP web service at the following URL
http://<host>:<port>/sociosApi/SociosApiImpl?wsdl . This interface is the entry point for the Core
Services and can be consumed by an appropriate SOAP client.


TESTING THE SOFTWARE
--------------------------------------------------------------------

We tested the Core Services functionality using soapUI version 4.0.1(http://www.soapui.org/)  
and WebServiceStudio(http://webservicestudio.codeplex.com/)


====================================================================
CONTACT INFORMATION AND WEBSITE
====================================================================
We welcome your feedback, suggestions and contributions. Contact us via email if you have questions, feedback, code submissions, and bug reports.

For general inquiries - nkardara@mail.ntua.gr

==================================================================

====================================================================
SOURCE CODE INFORMATION
====================================================================
The source has an hierarchical structure.On the lower level are the adaptors which send/receive requests from the selected social networks (Youtube, Flickr, Facebook, Twitter, Google+, MySpace, Dailymotion).
For each supported SN API, an adaptor has been implemented transforming SN data to the SocIoS object model, allowing the API consumers to access data from each underlying SN in a uniform way. 
On top of the adaptors, there is a generic entity called CompositeAdaptor, which is responsible for the aggregation of the indiviudal results sent by each adaptor. Finally, in the upper level is the SOAP web interface that is consumed by the clients. In the case of a new request a new instance of the CompositeAdaptor is created to handle it. 



====================================================================
DIRECTORY STRUCTURE 
====================================================================

eu\sociosproject\sociosapi\coreutilities\exceptions       : contains custom exceptions that can be thrown by Socios entities
eu\sociosproject\sociosapi\coreutilities\generalutilities : general utilities package
eu\sociosproject\sociosapi\coreutilities\networkutilities : network utilities, mostly for the conversion from and to JSON format
eu\sociosproject\sociosapi\server                         : The implementations of the SOAP interface and the CompositeAdaptor are placed here
eu\sociosproject\sociosapi\server\adaptors                : Adaptors implementation
eu\sociosproject\sociosapi\server\local                   : Web service client for remote calls to JPA entity
eu\sociosproject\sociosapi\server\update                  : Implementation of the update mechanism


