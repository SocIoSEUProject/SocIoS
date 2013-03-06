====================================================================
Event Detection Service Version 1.0 README
====================================================================

Event Detection Service
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

The functionality of the Event Detection service consists of the following steps:
- It receives a set of user ids that correspond to a group of SocIoS users.
- It retrieves the recent activities of the input users in all supported SNs, calling the relevant methods of the Core Services.
- It filters out activity items that contain no textual content. The remaining items form a corpus of documents that is a fed to a module that implements the Latent Dirichlet Allocation (LDA) algorithm [1]. More specifically, we implement HDP-LDA [2] which is a non-parametric variation of LDA. This module will identify the latent topics of the activity stream.
- Finally, the activity items that pertain to the same latent topic are grouped together and are returned to the calling user.

[1]David M. Blei, Andrew Y. Ng, and Michael I. Jordan. 2003. Latent dirichlet allocation. J. Mach. Learn. Res. 3 (March 2003), 993-1022.
[2] Yee Whye Teh, Michael I. Jordan, Matthew J. Beal, David M. Blei, 2005, Hierarchical Dirichlet Processes.


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
Open source implementation of HDP : https://github.com/arnim/HDP
Core Service component, Social Filtering component

PLATFORM SUPPORTED
--------------------------------------------------------------------
The component has been successfully deployed in Windows 7 and Linux Ubuntu version 12.04


INSTALLATION INSTRUCTIONS
--------------------------------------------------------------------

Event Detection is packaged as a Netbeans project. Netbeans with JavaEE support is needed to open it.
We used Netbeans version 7.0.1 for our development.


USING THE SOFTWARE
--------------------------------------------------------------------
The deployment of the .jar file will expose a SOAP web service at the following URL
http://<host>:<port>/EventHDPGibbs/EventDetection?wsdl , which can be consumed by an appropriate SOAP client.


TESTING THE SOFTWARE
--------------------------------------------------------------------

We tested the Event Detection's functionality using soapUI version 4.0.1(http://www.soapui.org/)  
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
EventDetection.java is the implementation of the SOAP interface. It takes the the input documents and after a basic pre-processing, it feeds them to 
the LDA component. The LDA algorithm is implemented in StringHDPGibbsSampler.java , and is a modified version of the code found in
https://github.com/arnim/HDP


====================================================================
DIRECTORY STRUCTURE 
====================================================================

eu\sociosproject\services              : SOAP web service implementation
eu\sociosproject\services\objects      : LDA implementation is located here


