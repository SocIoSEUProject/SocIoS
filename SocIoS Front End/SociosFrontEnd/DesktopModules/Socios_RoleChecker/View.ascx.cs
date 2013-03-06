/*
*    This file is part of Socios Front End.
*
*    Socios Front End is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    Socios Front End is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with SocIoS Event Detection Service.  If not, see <http://www.gnu.org/licenses/>.
*
*/

using System;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DotNetNuke.Security.Roles;
using System.Web;
using SociosServices;


namespace DotNetNuke.Modules.Socios_RoleChecker
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_RoleChecker class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_RoleCheckerModuleBase, IActionable
    {

        #region Event Handlers

        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
        }
// localhost 90
                // frontend 88
        int ROLESELECTOR_TABID = 88;
        int MEDIASEARCH_TABID = 66;
        int PLAYER_HOMEPAGE_TABID = 89;
        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// -----------------------------------------------------------------------------
        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                
                
                if (TabId == ROLESELECTOR_TABID)
                {
                    
                }
                    // We are on any other page, and we need to check if the user has a socios role.
                else
                {pnlAll.Visible = false;
                    if (UserId > 0)
                    {
                        // Checking user role
                        if (!(UserInfo.IsInRole("Players") || UserInfo.IsInRole("Candidates") || UserInfo.IsInRole("Journalists")))
                        {
                            string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                            Response.Redirect(Globals.NavigateURL(ROLESELECTOR_TABID) + "?redirectUrl=" + HttpUtility.UrlEncode(currentUrl), true);
                        }

                    }
                }

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

        #region Optional Interfaces

        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(GetNextActionID(), Localization.GetString("EditModule", this.LocalResourceFile), "", "", "", EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }

        #endregion

        protected void hprlnk_Jounalist_Click(object sender, EventArgs e)
        {
            AssignRoleToUser("Journalists", Globals.NavigateURL( MEDIASEARCH_TABID));
        }

        protected void hprlnk_Candidate_Click(object sender, EventArgs e)
        {
            AssignRoleToUser("Candidates", Globals.NavigateURL(MEDIASEARCH_TABID));
            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            // Facebook info removed because a token of higher access is required
            tokenClient.DeleteAccessInfo(UserId,2);
        }

        protected void hprlnk_Player_Click(object sender, EventArgs e)
        {
            AssignRoleToUser("Players", Globals.NavigateURL(PLAYER_HOMEPAGE_TABID));
        }




        protected void AssignRoleToUser(string roleName, string redirectTo)
        {
            //Get the role information
            RoleController cntrl = new RoleController();
            RoleInfo roleInfo = cntrl.GetRoleByName(this.PortalId, roleName);

            // Clearing all roles allows the user to switch between roles
            RoleInfo roleInfoJournalist = cntrl.GetRoleByName(this.PortalId, "Journalists");
            RoleInfo roleInfoPlayer = cntrl.GetRoleByName(this.PortalId, "Players");
            RoleInfo roleInfoCandidate = cntrl.GetRoleByName(this.PortalId, "Candidates");

            RoleController.DeleteUserRole(UserInfo, roleInfoJournalist, PortalSettings, false);
            RoleController.DeleteUserRole(UserInfo, roleInfoPlayer, PortalSettings, false);
            RoleController.DeleteUserRole(UserInfo, roleInfoCandidate, PortalSettings, false);



            //Assign to user
            cntrl.AddUserRole(this.PortalId, UserId, roleInfo.RoleID, System.DateTime.Now.AddDays(-1), DotNetNuke.Common.Utilities.Null.NullDate);
            if(redirectTo != "")
                Response.Redirect(redirectTo);
            else if (Request.QueryString["redirectUrl"] != null)
                Response.Redirect(HttpUtility.UrlDecode(Request.QueryString["redirectUrl"]));
            else
                Response.Redirect("/");
        }

    }

}
