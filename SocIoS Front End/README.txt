====================================================================
[Component Name] Version [Version] README
====================================================================

SocIos Front End
Software Release Number 1.0
12/02/2013

====================================================================
LICENSE AND COPYRIGHT 
====================================================================
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Created By :		Paul Brigden - Athens Technology Center
Created for Project :	SocIoS



====================================================================
INTRODUCTION 
====================================================================
An ASP.NET web application built upon the DotNetNuke framework. The 
Front End is ehe GUI that is utilized for the visualization of 
SocIoS results. 

It also handles user management, including user authentication.

====================================================================
NEW FEATURES AND FUNCTIONS IN THIS RELEASE 
====================================================================


[Differences from Previous Versions - N/A for now]


====================================================================
GETTING STARTED
====================================================================

SOFTWARE DEPENDENCIES
--------------------------------------------------------------------
SocIos Core Services
Socios Event Detection Service
Flexiprice
FlexiAuction
Games for Crowds
MIRS



PLATFORM SUPPORTED
--------------------------------------------------------------------
[Platform Supported]


INSTALLATION INSTRUCTIONS
--------------------------------------------------------------------
1) Create an MSSQL Server 2008 database.
2) Run the frontEndDb.sql file in order to create the tables
3) Unzip the frontEndWebsite.zip into the root directory of IIS
4) In IIS convert the Front End to an application
5) Set file permission in the folder in which the frontEndWebsite.zip
file was unzipped, as described here:
http://www.dotnetnuke.com/Resources/Blogs/EntryId/3282/Permissions-permissions-permissions.aspx

USING THE SOFTWARE
--------------------------------------------------------------------
*Logging in
Before using any of the Front End functionality you need to log in. There is a default host and administrator account included in the site:

Admin
Username: admin
Password: dnnadmin

Host
username: host
password: dnnhost

*Linking your social network account
Users can grant SocIos access to their information/content on supported social networks.

*Socios Tools
Is the main section where you can access fucntionality provided by the Front End
** Search Media
Search Media allows users to search social network content based on keywords.
**Manage Groups
Users can create groups, add people to groups, view group latest activities and events
** Pool of contacts
Users can see their friends/contacts from supported social networks.

*Go to FlexiPrice
Redirects users to the FlexiPrice component


TESTING THE SOFTWARE
--------------------------------------------------------------------
If the application loads in the browser it has been correctly installed.

====================================================================
CONTACT INFORMATION AND WEBSITE
====================================================================
We welcome your feedback, suggestions and contributions. Contact us
via email if you have questions, feedback, code submissions, 
and bug reports.

For general inquiries - [email of the person responsible for maintaining the component]

==================================================================

====================================================================
SOURCE CODE INFORMATION
====================================================================
*Functionality
In the DesktopModules folder you can find the modules that make up the Front End. Some modules were created
specifically for SocIos these are named with a Socios_ prefix.

In the Socios_MediaSearch folder you can find the Visual Studio 2010 solution file (Socios_MediaSearch.sln) which is used
to load all the custom modules into Visual Studio 2010.

*Look and feel
In the Portals\_default\Skins\sociosFrontEndV2 folder you can find the ascx, css files that were created to give SocIos its look and feel
[Design and architecture specifications]

====================================================================
DIRECTORY STRUCTURE 
====================================================================
[Describe Directory Structure]