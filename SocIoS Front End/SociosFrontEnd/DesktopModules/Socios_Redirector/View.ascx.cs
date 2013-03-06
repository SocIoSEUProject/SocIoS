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
using System.Web;
using SociosServices;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
using System.Configuration;
using DotNetNuke.Security.Roles;


namespace DotNetNuke.Modules.Socios_Redirector
{
    public enum RedirectPages
    {
        Auction = 1,
        G4cAccess = 2

    };

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_Redirector class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_RedirectorModuleBase, IActionable
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


        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// -----------------------------------------------------------------------------
        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                if (TabId == 89 && UserId > -1)
                {
                    string accessToken = CreateAndStoreAccessToken();
                    lblLog.Text += "Accesstoken for userId " + UserId + ": " + accessToken + "<br/>";
                    hprlnk_goToGamesForCrowds.NavigateUrl = "http://epart.atc.gr/gamesForCrowds/socios/crowdGames/platform.html?accessToken=" + accessToken;
                    lblName.Text = UserInfo.DisplayName;
                }
                else
                {
                    pnlPlayer.Visible = false;
                    string redirectUrl = "";
                    if (Request.QueryString["type"] != null)
                    {
                        // Coming from http://frontend.sociosproject.eu/Redirector.aspx?type=1&auc=x
                        if (Convert.ToInt32(Request.QueryString["type"]) == (int)RedirectPages.Auction && Request.QueryString["auc"] != null)
                        {
lblLog.Text += "FlexiAuction Mode<br/>";
string auctionId = Request.QueryString["auc"];
                            if (UserId < 0)
                            {
                                lblLog.Text += "Non-authenticated user<br/>";
                                string returnUrl = "/Redirector.aspx?type=1&auc=" + auctionId;
                                string flexiRedirectUrl = "http://frontend.sociosproject.eu/Login.aspx?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
                                hprlnk_redirectTo.Text = flexiRedirectUrl;
                                hprlnk_redirectTo.NavigateUrl = flexiRedirectUrl;
                                Response.Redirect(flexiRedirectUrl,true);
                                lblLog.Text += "Redirect to: " + flexiRedirectUrl + "<br/>";
                                //Response.Redirect("http://frontend.sociosproject.eu/Login.aspx?ReturnUrl="+redirectUrl);
                            }
                            else
                            {
                                Session["offer_id"] = auctionId;
                                lblLog.Text += "Authenticated user<br/>";
                                // Call flexiauction API
                                string FLEXIPRICE_DOMAIN = "http://epart.atc.gr/flexiprice";
                                lblLog.Text += "Retrieving FlexiAuction token...<br/>";
                                SociosServices.FlexiPriceClient flexiClient = new FlexiPriceClient();
                                string token = flexiClient.GetAuctionUrl(UserId, UserInfo.DisplayName, Convert.ToInt32(auctionId));
                                //redirectUrl = "www.flexiprice.com?auctionId=" + token;
                                lblLog.Text += "FlexiAuction token: " + token + "<br/>";
                                redirectUrl = FLEXIPRICE_DOMAIN + "?token=" + token;
                                hprlnk_redirectTo.NavigateUrl = redirectUrl;
                                hprlnk_redirectTo.Text = redirectUrl;
                                lblLog.Text += "Redirect to: " + redirectUrl + "<br/>";
                                AssignRoleToUser("Candidates");
                                Response.Redirect(redirectUrl);
                            }

                        }
                        else if (Convert.ToInt32(Request.QueryString["type"]) == (int)RedirectPages.G4cAccess)
                        {
                            lblLog.Text += "G4C Mode<br/>";
                            string gameId = "-1";
                            if (UserId < 0)
                            {
                                if (Request.QueryString["gameId"] != null)
                                {
                                    gameId = Request.QueryString["gameId"];
                                }
                                string returnUrl = "/Redirector.aspx?type=2&gameId="+gameId;

                                hprlnk_redirectTo.Text = "http://frontend.sociosproject.eu/Login.aspx?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
                                hprlnk_redirectTo.NavigateUrl = "http://frontend.sociosproject.eu/Login.aspx?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
                                lblLog.Text += "Non-authenticated user<br/>";
                                lblLog.Text += "Redirect to: " + hprlnk_redirectTo.NavigateUrl + "<br/>";
                                Response.Redirect(hprlnk_redirectTo.NavigateUrl,true);
}
                            else
                            {
                                if (Request.QueryString["gameId"] != null)
                                {
                                    gameId = Request.QueryString["gameId"];
                                }
                                lblLog.Text += "Authenticated user<br/>";
                                // Create an access token and store in database
                                lblLog.Text += "Creating accesstoken...<br/>";
                                string accessToken = CreateAndStoreAccessToken();
                                lblLog.Text += "Accesstoken for userId " + UserId + ": " + accessToken + "<br/>";
                                redirectUrl = "http://epart.atc.gr/gamesForCrowds/socios/crowdGames/game.html?accessToken=" + accessToken;
                                if (gameId != "")
                                    redirectUrl += "&gameId=" + gameId;
                                lblLog.Text += "Redirect to: " + redirectUrl + "<br/>";
                                // Redirect to G4C with access token in url
                                hprlnk_redirectTo.Text = redirectUrl;
                                hprlnk_redirectTo.NavigateUrl = redirectUrl;
                                AssignRoleToUser("Players");
                                Response.Redirect(redirectUrl);
                            }
                        }
                    }
                    else if (UserInfo.IsInRole("Players") && !UserInfo.IsInRole("Candidates") && !UserInfo.IsInRole("Journalist"))
                    {
                        Response.Redirect("http://frontend.sociosproject.eu/PlayerHome.aspx",true);


                    }
                    else
                    {
                        redirectUrl = "No type specified";
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {

                lblLog.Text += exc.StackTrace;
                //Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void AssignRoleToUser(string roleName)
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
           // if (redirectTo != "")
              //  Response.Redirect(redirectTo);
           // else if (Request.QueryString["redirectUrl"] != null)
            //    Response.Redirect(HttpUtility.UrlDecode(Request.QueryString["redirectUrl"]));
            //else
             //   Response.Redirect("/");
        }

        protected string CreateAndStoreAccessToken()
        {
            try
            {
                string accessToken = Guid.NewGuid().ToString();
                // 
                String CONNECTION_STRING = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlParameter userIdPar = new SqlParameter("@UserId", UserId);
SqlParameter accessTokenPar = new SqlParameter("@AccessToken", accessToken);
SqlParameter createdOnPar = new SqlParameter("@CreatedOn", DateTime.Now);
SqlHelper.ExecuteScalar(conn, CommandType.Text, "DELETE FROM socios_UserAttributes WHERE UserId = @UserId", userIdPar);
                conn.Close();
                conn.Open();
SqlHelper.ExecuteScalar(conn, CommandType.Text, "INSERT INTO socios_UserAttributes(UserId, AccessToken, CreatedOn) VALUES (@UserId, @AccessToken, @CreatedOn)", userIdPar, accessTokenPar, createdOnPar);
                conn.Close();
return accessToken;
            }
            catch(Exception ex)
            {
                return ex.Message;
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

        protected void lnkbtnGetUserinfo_Click(object sender, EventArgs e)
        {
            
           string test = SociosUtil.TestGetUserInformation();
           lblLog.Text = "<p>" + test + "</p>";
           string test2 = "";
        }

        

        

    }

}
