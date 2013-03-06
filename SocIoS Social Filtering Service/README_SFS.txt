====================================================================
Social Filtering Service, Version 1.0 README
====================================================================

Social Filtering Service (SFS)
Software Release Number 1.0
28/02/2013

====================================================================
LICENSE AND COPYRIGHT 
====================================================================
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Created By :		Mikhail Kotelnikov, Cognium Systems
Created for Project :	SocIoS

====================================================================
INTRODUCTION 
====================================================================
The main challenge addressed by the component consists first of providing two level filtering – at the channel level (e.g. social network account stream) and at the item level (e.g. individual post: single tweet or status) – and second of implementing a unified workflow for dealing with the three processes that are usually scattered in traditional work environment: content aggregation, content annotation, and content re-distribution.

The SFS comprises two sub-components: a GroupService and a FilteringService.

The GroupService provides methods allowing to manage groups of social network accounts (Person objects in the SocIoS object model): creation and deletion of groups, addition and removal of members. It is typically used for bringing together a set of various social network accounts which relate to a common topic. The GroupService implements a persistence layer for storing group membership information. Security checks are performed within the component for enforcing that only group owners get allowed to access group contents and activities.

The FilteringService interacts both with the SocIoS core services and with the GroupService for retrieving all activities associated with a given group of persons. Filtering is applied internally based on the provided filtering criteria.

====================================================================
NEW FEATURES AND FUNCTIONS IN THIS RELEASE 
====================================================================

[Differences from Previous Versions - N/A for now]

====================================================================
GETTING STARTED
====================================================================

SOFTWARE DEPENDENCIES
--------------------------------------------------------------------
The SFS uses the SocIoS core services for retrieving social network activities through a call to the findActivities method. The FilteringService interacts with the GroupService for getting the composition of the groups it receives queries about.

PLATFORM SUPPORTED
--------------------------------------------------------------------
J2EE

INSTALLATION INSTRUCTIONS
--------------------------------------------------------------------
Deploy the component WAR file into the application deployment folder of the target J2EE application server. The build of the WAR file is described in the next paragraph.
2. Copy the configuration file socios-sfs.cfg into the application server configuration directory and edit the database connection details – JDBC class, database connection URL, user login and password.
3. Edit the Web service configuration file sfs-application-context.xml and set the end-points of the Socios services used by the FilteringService.

USING THE SOFTWARE
--------------------------------------------------------------------
The SFS component is used in two main places of the first version of the SocIoS prototype: first for managing groups of users, second for displaying the activities of a specific group.

TESTING THE SOFTWARE
--------------------------------------------------------------------
The following development tools were used to build SFS:
- Maven for managing the project itself and its dependency relations ;
- Apache CXF framework for developing the Web service layer (http://cxf.apache.org/) ;
- JDBC for managing the persistence layer ;
- JUnit to automate the continuous verification of the component core functionalities behaviour.
The standard Maven command line mvn clean install launches the build process leading to a deployable WAR file.

Once deployed and configured, the service can be tested manually by running the following command against any running instance of the SocIoS platform comprising the SFS : mvn -Pclient.

====================================================================
CONTACT INFORMATION AND WEBSITE
====================================================================
We welcome your feedback, suggestions and contributions. Contact us
via email if you have questions, feedback, code submissions, 
and bug reports.

For general inquiries - mikhail.kotelnikov@cogniumsystems.com

==================================================================

====================================================================
SOURCE CODE INFORMATION
====================================================================
The SFS comprises two sub-components: a GroupService and a FilteringService. 

The GroupService includes a database persistence layer. Security checks are performed within the component for enforcing that only group owners get allowed to access group contents and activities. 

The FilteringService interacts both with the SocIoS core services and with the GroupService for retrieving all activities associated with a given group of persons within the target social networks. Filtering is applied internally based on the provided filtering criteria.

The GroupService persistence layer is managed within a set of relational tables listed below:
________________________________________________________________________
Table name 			Description
________________________________________________________________________
sfs_social_networks		List of social networks
sfs_users			List of SocIoS users using the service
sfs_groups			Table associating group ids to user ids
sfs_group_members		Table listing the members of each group
________________________________________________________________________

The component APIs are described below as a list of available functions:

1. addMembers / removeMembers (ObjectId, PersonList, ObjectId)
The function adds / removes accounts to / from a group.
- ObjectId sessionId: identifier of the session associated with the current client
- PersonList people: list of people to add/remove in/from the specified group
- ObjectId groupId: the identifier of the group to get modified.

2. createGroup (ObjectId, PersonList, Group) 
This function creates a group.
- ObjectId sessionId: the identifier of the session associated with the current client
- PersonList people: initial list of group members
- Group group: initial object containing the description of the group to be populated Description

3. deleteGroup (ObjectId, GroupId)
This function deletes a group.
- ObjectId sessionId: identifier of the session associated with the current client
- ObjectId groupId: identifier of the group to be deleted Description

4. getGroupMembers(ObjectId sessionId, ObjectId groupId)
Returns the members of the target group for the given user.
- ObjectId sessionId: the identifier of the session associated with the current client
- ObjectId groupId: identifier of the target group Output
- Output: PersonList (list of members)

5. getGroups(ObjectId sessionId)
- ObjectId sessionId Output
- Output: GroupList (A list of all groups already defined by the user corresponding to the current session)

6. getRecentActivities (ObjectId sessionId, GroupId groupId)
The function retrieves the target group members activities.
- ObjectId sessionId
- GroupId groupId 
- Output: ActivityList (list of activities matching the input parameter values).

====================================================================
DIRECTORY STRUCTURE 
====================================================================
The SFS source directory structure is as follows, complying with the
standard Maven project layout:
- java
  |- eu.sociosproject
     |- sociosapi
     |- socialfiltering
        |- client
        |- database
        |- memory
        |- server
- resources
- webapp

The java directory contains the Java packages of the service:
- eu.sociosproject.sociosapi: this package contains the Socios API
Java classes generated automatically from the Socios WSDL files using
the CXF framework.
- eu.sociosproject.socialfiltering: this package contains 2 Java
interfaces describing the abstract methods of the SFS classes :
IGroupService for managing groups, and ISocialFilteringService for
filtering activities by group.
- eu.sociosproject.socialfiltering.client: this package contains a set
of classes used for testing locally the SFS endpoints.
- eu.sociosproject.socialfiltering.database: this package contains the
implementation of the SFS using persistent storage in a relational
database (MySQL by default).
- eu.sociosproject.socialfiltering.memory: this package contains an
in-memory of the the SFS (no data persistence).
- eu.sociosproject.socialfiltering.server: this package is obsolete
and should be removed.

The resources directory contains the follwing files:
- Socios core API WSDL and XSD files.
- SFS WSDL files.
- The SFS configuration file (socios-sfs.cfg).
- An XML file for configuring how an SFS client can access the SFS
deployed on a server.

The webapp directory contains XML files for configuring the SFS webapp itself:
- webapp.xml declares the CXF servlet.
- cxf-servlet.xml declares how the CXF servlet has to delegate HTTP
calls to the SFS GroupService or to the SFS filtering service
depending on the endpoint called.