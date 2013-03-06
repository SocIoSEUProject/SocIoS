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
using SociosServices;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Generic;
using SociosServices.SocialFilteringGroupService2;
using SociosServices.TokenService;
using SociosServices.UserService;
using SociosServices.SocialFiltering;
using SociosServices.DigitalPurseService;
using DotNetNuke.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Text;
using DotNetNuke.Services.Installer.Log;
using DotNetNuke.Services.Log.SiteLog;
using System.Diagnostics;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
using System.Configuration;
using System.Globalization;
using SociosServices.EventDetectionService;
using System.Web.UI;
using SociosServices.WebSkeletonServiceLive;
using System.Web;
namespace DotNetNuke.Modules.Socios_Scenario1
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_Scenario1 class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------


    public partial class View : Socios_Scenario1ModuleBase, IActionable
    {



        public enum SocialNetwork
        {
            FLICKR = 1,
            FACEBOOK = 2,
            TWITTER = 3,
            YOUTUBE = 4,
            MYSPACE = 5,
            DAILYMOTION = 6,
            GOOGLEPLUS = 7,
        }

        public enum ScenarioView
        {
            SEARCH = 1,
            GROUPS = 2,
            CONTACTS = 3
        }

        string FLEXIPRICE_DOMAIN = "http://epart.atc.gr/flexiprice/";
        //string FLEXIPRICE_DOMAIN = "http://dev.flexiprice.info/";

        public Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo> accessInfoDictionary = new Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>();

        Dictionary<string, int> resultsPerSn = new Dictionary<string, int>();
        private Logger _Log = new Logger();
        String CONNECTION_STRING = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString();
        // koita thelw ta kala kai twn 2, protimw sindiasmo
        #region Event Handlers
        string groupSession = "";
        SociosServices.SocialFilteringGroupService2.ObjectId groupSessionObj = new SociosServices.SocialFilteringGroupService2.ObjectId();
        GroupServiceClient groupClient = new GroupServiceClient();
        EventDetectionServiceClient eventDetectionClient = new EventDetectionServiceClient();
        ReputationServiceClient reputationClient = new ReputationServiceClient();
        RecommendationServiceClient recommendationClient = new RecommendationServiceClient();
        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
        }
        ArrayList urls = new ArrayList();

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// -----------------------------------------------------------------------------
        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                if(UserInfo.IsInRole("Administrator"))
                    pnlLog.Visible = true;
                else
                    pnlLog.Visible = false;


                //Session["SelectedMediaItems"] = new Dictionary<string, FlexiAuctionMediaItem>();
                // Who has selected the mediaItems
                if (Session["SelectedMediaItemsUserId"] != null)
                {
                    int selectedMediaItemsUserId = (int)Session["SelectedMediaItemsUserId"];
                    if (selectedMediaItemsUserId != UserId)
                    {      // If the userId currently logged in is different to that who had selected the items then the selected media
                        // items cart is cleared. It indicates a user logged out and back in again.
                        if (Session["SelectedMediaItems"] != null)
                        {
                            Dictionary<string, FlexiAuctionMediaItem> items = (Dictionary<string, FlexiAuctionMediaItem>)Session["SelectedMediaItems"];
                            foreach (var item in items)
                            {

                                UpdateCachedMediaItemSelectState(Convert.ToInt32(item.Key), false);
                            }
                            Session["SelectedMediaItems"] = null;
                            Session["SelectedMediaItemsUserId"] = null;
                        }
                    }
                }
                else
                {
                    Session["SelectedMediaItemsUserId"] = UserId;
                }

                if (Request.QueryString["offer_id"] != null)
                    Session["offer_id"] = Request.QueryString["offer_id"];
                //SkeletonServiceClient clientHtml = new SociosServices.SkeletonServiceClient();
               // string test = clientHtml.GetMediaItemsHtml();
            // lblLog.Text += test                 ;
            // txtLog.Text = test;
            
                Page.ClientScript.RegisterClientScriptInclude("stickyfloat.js", this.TemplateSourceDirectory + "/js/stickyfloat.js");
                Page.ClientScript.RegisterClientScriptInclude("Scenario1.js", this.TemplateSourceDirectory + "/js/Scenario1.js");
                Page.ClientScript.RegisterClientScriptInclude("jquery.expander.min.js", this.TemplateSourceDirectory + "/js/jquery.expander.min.js");
                string groupSession = "GRP_SSSION_" + UserId;
                groupSessionObj.id = groupSession;
                groupSessionObj.source = new SociosServices.SocialFilteringGroupService2.Source();
                groupSessionObj.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.FACEBOOK;

                Session["NotificationClearedForNewOnes"] = null;

                if (Session["NextLoadHideNotification"] != null)
                {
                    lbl_Notification.Visible = false;
                    lbl_Notification.Text = "";
                    Session["NextLoadHideNotification"] = null;
                }
                if (lbl_Notification.Visible)
                {
                    Session["NextLoadHideNotification"] = true;
                }
                

                if (!IsPostBack && !ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                {

                    Session["SearchUserId"] = UserId;
                    if (ddlAllGroups.Items.Count == 0)
                    {
                        LoadAllGroups();
                    }
                    if (UserId > 0)
                    {
RefreshDigitalPurseBalance();
                    }
                    

                    
                    if (Convert.ToInt32(Request.QueryString["v"]) == (int)ScenarioView.SEARCH)
                    {
                        GoToSearchMediaPage();
                    }
                    else if (Convert.ToInt32(Request.QueryString["v"]) == (int)ScenarioView.GROUPS)
                    {
                        GoToManageGroups();
                    }
                    else if (Convert.ToInt32(Request.QueryString["v"]) == (int)ScenarioView.CONTACTS)
                    {
                        GoToPoolOfContacts();
                    }

                    //if (Request.QueryString["mode"] != null)
                    if (UserInfo.IsInRole("Candidates"))
                    {
                        LoadMediaItemSelectionMode();
                        pnlFlexipriceInfo.Visible = false;
                        //lblDigitalPurseWrap.Visible = false;
                        //hprlnk_goToFlexiprice.Visible = false;
                        hprlnk_goToFlexiauction.Visible = true;

                        // Deactivating social networks that do not support selecting own
                        // MediaItems
                        li_chkbxGooglePlusSearch.Attributes["class"] = "disabledOption";
                        li_chkbxInstagramSearch.Attributes["class"] = "disabledOption";
                        li_chkbxMySpaceSearch.Attributes["class"] = "disabledOption";
                        li_chkbxTwitterSearch.Attributes["class"] = "disabledOption";
                        li_chkbxYouTubeSearch.Attributes["class"] = "disabledOption";

                        chkbxGooglePlusSearch.Enabled = false;
                        chkbxInstagramSearch.Enabled = false;
                        chkbxMySpaceSearch.Enabled = false;
                        chkbxTwitterSearch.Enabled = false;
                        chkbxYouTubeSearch.Enabled = false;

                        chkbxGooglePlusSearch.Checked = false;
                        chkbxInstagramSearch.Checked = false;
                        chkbxMySpaceSearch.Checked = false;
                        chkbxTwitterSearch.Checked = false;
                        chkbxYouTubeSearch.Checked = false;

                        pnl_SearchOptionsLicense.Visible = false;

                    }
                    else
                    {
                        //lblDigitalPurseWrap.Visible = true;
                        pnlFlexipriceInfo.Visible = true;
                        pnlSearchHistory.Visible = true;

                        hprlnk_goToFlexiprice.Visible = true;
                        hprlnk_goToFlexiauction.Visible = false;

                        pnl_SearchOptionsLicense.Visible = true;

                        // Activating all deactivated social networks
                        li_chkbxGooglePlusSearch.Attributes["class"] = "";
                        li_chkbxInstagramSearch.Attributes["class"] = "";
                        li_chkbxMySpaceSearch.Attributes["class"] = "";
                        li_chkbxTwitterSearch.Attributes["class"] = "";
                        li_chkbxYouTubeSearch.Attributes["class"] = "";

                        chkbxGooglePlusSearch.Enabled = true;
                        chkbxInstagramSearch.Enabled = true;
                        chkbxMySpaceSearch.Enabled = true;
                        chkbxTwitterSearch.Enabled = true;
                        chkbxYouTubeSearch.Enabled = true;
                    }


                    if (Session["searchResultsFilter"] != null)
                    {
                        if (((RadListViewFilterExpressionCollection)Session["searchResultsFilter"]).Count > 0)
                            radlstvwMediaItems.FilterExpressions.Add(((RadListViewFilterExpressionCollection)Session["searchResultsFilter"])[0]);

                    }

                    if (Session["FindMediaItemsResultsCache"] == null)
                    {
                        Session["FindMediaItemsResultsCache"] = new List<SociosServices.WebSkeletonServiceLive.MediaItem>();
                    }
                    if (Session["currentMediaItemsPage"] == null)
                    {
                        Session["currentMediaItemsPage"] = 0;
                    }

                   

                    // TESTING REP AND REC KEEP FOR REFERENCE
                    bool personFound = false;


                    // TREE TESTING END

                    //string groupSession = "GRP_SSSION_" + UserId;
                    //groupSessionObj.id = groupSession;
                    //groupSessionObj.source = new SociosServices.SocialFilteringGroupService2.Source();
                    //groupSessionObj.source.knownSns = SociosServices.SocialFilteringGroupService2.KnownSns.FACEBOOK;





                    txtConsentFormText.Text = "Dear user, I would like to invite you to share... by visting the link http://frontend.sociosproject.eu. For more information, please refer to:  http://frontend.sociosproject.eu";
                    txtConsentFrom.Text = "Me";
                    txtConsentTo.Text = "User451";

                    if (Request.QueryString["widget"] != null)
                    {
                        pnlWidgetWrapper.Visible = true;
                        lnkbtn_MenuShowManageGroups.Visible = false;
                        lnkbtn_MenuShowSearchMedia.Visible = false;
                        pnl_MediaSearch.Visible = true;

                       // main_container.CssClass = "widg-main-container";

                        Image2.Visible = false;
                        lnkbtn_MenuShow.Visible = false;
                        pnlFlexipriceInfo.Visible = false;
                        pnl_MediaSearch.Visible = false;

                        //widg_lstvwMediaItems.DataBind();

                    }
                    else
                    {
                        pnlWidgetWrapper.Visible = false;
                        main_container.CssClass = "main-container";

                        Image2.Visible = true;
                        lnkbtn_MenuShow.Visible = true;
                        pnlFlexipriceInfo.Visible = true;
                        pnl_MediaSearch.Visible = true;
                    }


                    //if (Request.QueryString["mode"] != null)
                    if (UserInfo.IsInRole("Candidates"))
                    {
                        SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();

                        List<KeyValuePair<string, string>> usernames = new List<KeyValuePair<string, string>>();
                        SociosServices.TokenServiceClient client = new SociosServices.TokenServiceClient();
                        accessInfo[] userSnDetails = client.GetUserTokens(UserId);
                        List<int> authenticatedSns = new List<int>();
                        if (userSnDetails != null)
                        {
                           //lblAuctionModeInfo.Text = "My Social Networks' status: ";
                            
                            foreach (accessInfo user in userSnDetails)
                            {
                                string snName = GetSnNameFromId(user.accessInfoPK.snsId);
                                usernames.Add(new KeyValuePair<string, string>(snName, user.snsUserId));
                                if (user.accessInfoPK.snsId == 1)
                                {
                                    authenticatedSns.Add(1);
                                }
                                if (user.accessInfoPK.snsId == 2)
                                {
                                    authenticatedSns.Add(2);
                                      }
                                //if (user.accessInfoPK.snsId == 3)
                                //{
                                //    lblAuctionModeInfo.Text += "twUserId: " + user.snsUserId + " | ";
                                //}
                                //if (user.accessInfoPK.snsId == 4)
                                //{
                                //    lblAuctionModeInfo.Text += "ytUserId: " + user.snsUserId + " | ";
                                //}
                                //if (user.accessInfoPK.snsId == 5)
                                //{
                                //    lblAuctionModeInfo.Text += "msUserId: " + user.snsUserId + " | ";
                                //}
                                if (user.accessInfoPK.snsId == 6)
                                {
                                    authenticatedSns.Add(6);
                                }
                            }

                        }
                        lblAuctionModeInfo.Text = "<div class='authenticationPanel'>";
                        lblAuctionModeInfo.Text += "Authentication status";
                        lblAuctionModeInfo.Text += "<div class='cleared'></div>";
                            lblAuctionModeInfo.Text += " <span><img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/flickr.png\" alt=\"\" title=\"Flickr\">";
                            if (authenticatedSns.Contains(1))
                            {
                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/tick.png\" alt=\"\" title=\"Flickr authenticated\">";
                                li_chkbxFlickRSearch.Attributes["class"] = "";
                                chkbxFlickRSearch.Enabled = true;
                            }
                            else
                            {

                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/warning.png\" alt=\"\" title=\"Flickr authentication required\"> <a href=\"http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx\">Authenticate</a>";

                                li_chkbxFlickRSearch.Attributes["class"] = "disabledOption";
                                chkbxFlickRSearch.Enabled = false;
                                chkbxFlickRSearch.Checked = false;
                            }
                            lblAuctionModeInfo.Text += "</span>";


                            lblAuctionModeInfo.Text += " <span><img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/facebook.png\" alt=\"\" title=\"Facebook\">";
                            if (authenticatedSns.Contains(2))
                            {
                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/tick.png\" alt=\"\" title=\"Facebook authenticated\">";
                                li_chkbxFacebookSearch.Attributes["class"] = "";
                                chkbxFacebookSearch.Enabled = true;
                              
                            }
                            else
                            {
                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/warning.png\" alt=\"\" title=\"Facebook authentication required\"> <a href=\"http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx\">Authenticate</a>";

                                li_chkbxFacebookSearch.Attributes["class"] = "disabledOption";
                                chkbxFacebookSearch.Enabled = false;
                                chkbxFacebookSearch.Checked = true;
                            }
                            lblAuctionModeInfo.Text += "</span>";

                            lblAuctionModeInfo.Text += "<span><img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/dailymotion.png\" alt=\"\" title=\"Dailymotion\">";
                            if (authenticatedSns.Contains(6))
                            {
                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/tick.png\" alt=\"\" title=\"Dailymotion authenticated\">";

                                li_chkbxDailymotionSearch.Attributes["class"] = "";
                                chkbxDailymotionSearch.Enabled = true;
                            }
                            else
                            {
                                lblAuctionModeInfo.Text += "<img width=\"16px\" src=\"/DesktopModules/Socios_Scenario1/Images/warning.png\" alt=\"\" title=\"Dailymotion authentication required\"> <a href=\"http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx\">Authenticate</a>";

                                li_chkbxDailymotionSearch.Attributes["class"] = "disabledOption";
                                chkbxDailymotionSearch.Enabled = false;
                                chkbxDailymotionSearch.Checked = false;
                            }
                            lblAuctionModeInfo.Text += "</span>";
                            lblAuctionModeInfo.Text += "<div class='cleared'></div>";
                            lblAuctionModeInfo.Text += "</div>";

                       
                    }





                }

                if (!ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                {
                    // RefreshDigitalPurseBalance();
                }



                if (!IsPostBack)
                {
                    if (UserId > 0)
                    {
                        if (UserInfo.IsInRole("Journalists"))
                        {
                            CheckFlexipriceStatus();
                            lblJournalistMediaSearchInfo.Visible = true;
                            lblCandidateMediaSearchInfo.Visible = false;
                          
                        }
                        if (UserInfo.IsInRole("Candidates"))
                        {
                            CheckFlexiauctionStatus();
                            lbl_PendingTransactions.Visible = false;
                            lbl_NoPendingTransactions.Visible = false;

                            lblJournalistMediaSearchInfo.Visible = false;
                            lblCandidateMediaSearchInfo.Visible = true;
                        }

                        string accessToken = CreateAndStoreAccessToken();
                        lblLog.Text += "Accesstoken for userId " + UserId + ": " + accessToken + "<br/>";
                        hprlnk_goToGamesForCrowds.NavigateUrl = "http://epart.atc.gr/gamesForCrowds/socios/crowdGames/platform.html?accessToken=" + accessToken;
                            
                        //RefreshDigitalPurseBalance();
                    }

                    InitialiseSnTree();

                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
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
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        protected void LoadMediaItemSelectionMode()
        {
            pnlMediaItemCart.Visible = true;
            pnlSearchHistory.Visible = false;

            btnSearch.Visible = false;
            pnlItemSelectionModeTop.Visible = true;

            pnlOnlyRecommended.Visible = false;
            txtSearch.Visible = false;


            lblAuctionModeInfo.Visible = true;
        }

        //protected void LoadMediaItemDefaultMode()
        //{
        //    pnlMediaItemCart.Visible = false;
        //    pnlSearchHistory.Visible = true;

        //    btnSearch.Visible = true;
        //    pnlItemSelectionModeTop.Visible = false;

        //    pnlOnlyRecommended.Visible = true;
        //    txtSearch.Visible = true;


        //    lblAuctionModeInfo.Visible = false;
        //}

        protected void InitialiseSnTree()
        {
            treevw_AllSocialNetworks.Nodes.Clear();
            RadTreeNode allNode = new RadTreeNode("All", "all");

            RadTreeNode fbNode = new RadTreeNode("Facebook", "Facebook");
            fbNode.ImageUrl = "Images/facebook16x16.png";
            RadTreeNode frNode = new RadTreeNode("FlickR", "FlickR");
            frNode.ImageUrl = "Images/flickr16x16.png";
            RadTreeNode twNode = new RadTreeNode("Twitter", "Twitter");
            twNode.ImageUrl = "Images/twitter16x16.png";
            RadTreeNode ytNode = new RadTreeNode("YouTube", "YouTube");
            ytNode.ImageUrl = "Images/youtube16x16.png";
            RadTreeNode dmNode = new RadTreeNode("Dailymotion", "Dailymotion");
            dmNode.ImageUrl = "Images/dailymotion16x16.png";
            RadTreeNode msNode = new RadTreeNode("MySpace", "MySpace");
            msNode.ImageUrl = "Images/myspace16x16.png";
            RadTreeNode gpNode = new RadTreeNode("GooglePlus", "GoogleP");
            gpNode.ImageUrl = "Images/googleplus16x16.png";
            RadTreeNode instNode = new RadTreeNode("Instagram", "Instagram");
            instNode.ImageUrl = "Images/instagram16x16.png";
            treevw_AllSocialNetworks.Nodes.Add(allNode);
            treevw_AllSocialNetworks.Nodes.Add(fbNode);
            treevw_AllSocialNetworks.Nodes.Add(frNode);
            treevw_AllSocialNetworks.Nodes.Add(twNode);
            treevw_AllSocialNetworks.Nodes.Add(ytNode);
            treevw_AllSocialNetworks.Nodes.Add(dmNode);
            treevw_AllSocialNetworks.Nodes.Add(msNode);
            treevw_AllSocialNetworks.Nodes.Add(gpNode);
            treevw_AllSocialNetworks.Nodes.Add(instNode);

        }

        /// <summary>
        /// Loading Flexiprice link token and letting user know if he has pending
        // transactions
        /// </summary>
        protected void CheckFlexipriceStatus()
        {
            try
            {
                //SociosUtil.Log("Checking Flexiprice status:");
                SociosServices.FlexiPriceClient flexiClient = new FlexiPriceClient();

                List<KeyValuePair<string, string>> usernames = new List<KeyValuePair<string, string>>();
                SociosServices.TokenServiceClient client = new SociosServices.TokenServiceClient();
                accessInfo[] userSnDetails = client.GetUserTokens(UserId);
                if (userSnDetails != null)
                {

                    foreach (accessInfo user in userSnDetails)
                    {
                        string snName = GetSnNameFromId(user.accessInfoPK.snsId);
                        usernames.Add(new KeyValuePair<string, string>(snName, user.snsUserId));
                    }
                }
                KeyValuePair<string, bool> urlAndFlag = flexiClient.GetTransactionsUrlAndFlag(UserId, UserInfo.DisplayName, usernames);

                string getTransactionUrl = FLEXIPRICE_DOMAIN + "?token=" + urlAndFlag.Key;
                bool userHasPendingTransactions = urlAndFlag.Value;
                if (userHasPendingTransactions)
                {
                    lbl_PendingTransactions.Visible = true;
                    lbl_NoPendingTransactions.Visible = false;
                }
                else
                {
                    lbl_PendingTransactions.Visible = false;
                    lbl_NoPendingTransactions.Visible = true;
                }

                // SociosUtil.Log("Flexiprice url: " + getTransactionUrl);
                hprlnk_goToFlexiprice.NavigateUrl = getTransactionUrl;
            }
            catch (Exception ex)
            {

            }

        }

        /// <summary>
        /// Loading Flexiprice link token and letting user know if he has pending
        // transactions
        /// </summary>
        protected void CheckFlexiauctionStatus()
        {
            //SociosUtil.Log("Checking Flexiprice status:");
            SociosServices.FlexiPriceClient flexiClient = new FlexiPriceClient();

            //    List<KeyValuePair<string, string>> usernames = new List<KeyValuePair<string, string>>();
            //  SociosServices.TokenServiceClient client = new SociosServices.TokenServiceClient();
            //  accessInfo[] userSnDetails = client.GetUserTokens(UserId);
            //   if (userSnDetails != null)
            //   {

            //      foreach (accessInfo user in userSnDetails)
            //     {
            //         string snName = GetSnNameFromId(user.accessInfoPK.snsId);
            //        usernames.Add(new KeyValuePair<string, string>(snName, user.snsUserId));
            //    }
            //    }
            //    KeyValuePair<string, bool> urlAndFlag = flexiClient.GetTransactionsUrlAndFlag(UserId, UserInfo.DisplayName, usernames);
            string token = flexiClient.GetAuctionUrl(UserId, UserInfo.DisplayName);
            string flexiauctionUrl = FLEXIPRICE_DOMAIN + "?token=" + token;
            // bool userHasPendingTransactions = urlAndFlag.Value;
            //if (userHasPendingTransactions)
            //{
            //    lbl_PendingTransactions.Visible = true;
            //    lbl_NoPendingTransactions.Visible = false;
            //}
            //else
            //{
            //    lbl_PendingTransactions.Visible = false;
            //    lbl_NoPendingTransactions.Visible = true;
            //}

            // SociosUtil.Log("Flexiprice url: " + getTransactionUrl);
            hprlnk_goToFlexiauction.NavigateUrl = flexiauctionUrl;

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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                bool inWidgetMode = Request.QueryString["widget"] != null;
                // (Request.QueryString["mode"] != null)
                // Reset cacheSessionId so that for old results are never displayed when starting a new search
                ClearSearchCacheSessionIds();
                pnl_FindMediaItemsError.Visible = false;
                ddlSortResults.ClearSelection();
                radlstvwMediaItems.Visible = true;
                pnlBeforeFirstSearch.Visible = false;

                InitialiseSnTree();

                radlstvwMediaItems.FilterExpressions.Clear();
                String[] searchTerms = txtSearch.Text.Split(' ');
                if (inWidgetMode)
                {
                    searchTerms = txtSearchWidg.Text.Split(' ');
                }
               
                

                SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                List<string> keywords = new List<string>();
                string[] words = keywords.ToArray();

                int userId = 2;// UserId;

                List<SociosServices.WebSkeletonServiceLive.KnownSns> sources = new List<SociosServices.WebSkeletonServiceLive.KnownSns>();

                
                if (inWidgetMode)
                {
                    if (chkbxDailymotionSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION);
                    if (chkbxFacebookSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK);

                    if (chkbxFlickRSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);

                    if (chkbxGooglePlusSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP);
                    if (chkbxMySpaceSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE);

                    if (chkbxTwitterSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER);

                    if (chkbxYouTubeSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE);
                    if (chkbxInstagramSearchWidg.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.INSTAGRAM);
                }
                else
                {
                    if (chkbxDailymotionSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION);
                    if (chkbxFacebookSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK);

                    if (chkbxFlickRSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);

                    if (chkbxGooglePlusSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP);
                    if (chkbxMySpaceSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE);

                    if (chkbxTwitterSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER);

                    if (chkbxYouTubeSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE);
                    if (chkbxInstagramSearch.Checked)
                        sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.INSTAGRAM);
                }
                

                SociosServices.WebSkeletonServiceLive.License license = new SociosServices.WebSkeletonServiceLive.License();
                license.licenseType = SociosServices.WebSkeletonServiceLive.LicenseType.ALL;

                if (rdbtnCcLicense.Checked)
                {
                    license.licenseType = SociosServices.WebSkeletonServiceLive.LicenseType.CC;
                }

                bool USE_CACHED_RESULTS = false;
                bool GET_RECOMMENDED_RESULTS = chkbx_OnlyRecommended.Checked;
                Session["mediaItemsSearchUsingRecommended"] = GET_RECOMMENDED_RESULTS;
                var items = new SociosServices.WebSkeletonServiceLive.MediaItem[1];
                var recommendedItems = new SociosServices.RecommendationService.MediaItem[1];
                if (!USE_CACHED_RESULTS)
                {
                    if (GET_RECOMMENDED_RESULTS)
                    {
                        recommendedItems = recommendationClient.GetRecommendedMediaItems(txtSearch.Text, 50);
                        int test = 0;
                    }
                    else
                    {
                        items = client.FindMediaItems(searchTerms, userId, sources, license.licenseType);
                    }


                }
                if (inWidgetMode)
                {
                    widg_lstvwMediaItems.DataSource = items;
                    widg_lstvwMediaItems.DataBind();
                    widg_lstvwMediaItems.Visible = true;

                }
                else
                {


                    if (!GET_RECOMMENDED_RESULTS && items != null && items.Length > 0)
                    {

                        // Session["findMediaItemsCacheSessionId"] = "5cab70f9-513b-49c0-baf3-d5c70c0d2839";
                        if (!USE_CACHED_RESULTS)
                        {
                            Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> itemsDictionary = new Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>();
                            int i = 0;
                            foreach (var item in items)
                            {
                                itemsDictionary.Add(i, item);
                                i++;
                            }
                            Session["findMediaItemsCache"] = itemsDictionary;
                            AddMediaItemsToCache(itemsDictionary);

                            // ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                            //  double score = ranking.GetMediaItemScore(itemsList[1]);
                            // double[] scores = ranking.GetMediaItemsScore(items); 
                        }
                        else
                        {
                            Session["findMediaItemsCacheSessionId"] = "71bcb1a4-9760-40e1-8383-0e39915d475b";
                        }

                        RadListViewSortExpression expression;

                        radlstvwMediaItems.SortExpressions.Clear();
                        radlstvwMediaItems.FilterExpressions.Clear();
                        expression = new RadListViewSortExpression();
                        expression.FieldName = "createdDate";
                        expression.SortOrder = RadListViewSortOrder.Descending;

                        radlstvwMediaItems.SortExpressions.AddSortExpression(expression);
                        radlstvwMediaItems.Rebind();


                        radlstvwMediaItems.DataBind();
                        UpdateSnTreeNodesCounters();
                        radlstvwMediaItems.Visible = true;
                    }
                    else if (GET_RECOMMENDED_RESULTS && recommendedItems != null && recommendedItems.Length > 0 && recommendedItems[0] != null)
                    {






                        // Session["findMediaItemsCacheSessionId"] = "5cab70f9-513b-49c0-baf3-d5c70c0d2839";
                        if (!USE_CACHED_RESULTS)
                        {
                            Dictionary<int, SociosServices.RecommendationService.MediaItem> itemsDictionary = new Dictionary<int, SociosServices.RecommendationService.MediaItem>();
                            int i = 0;
                            foreach (var item in recommendedItems)
                            {
                                itemsDictionary.Add(i, item);
                                i++;
                            }
                            Session["findMediaItemsCache"] = itemsDictionary;
                            AddMediaItemsToCache(itemsDictionary);
                            // ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                            //double score = ranking.GetMediaItemScore(itemsList[1]);
                            //double[] scores = ranking.GetMediaItemsScore(items); 
                        }
                        else
                        {
                            Session["findMediaItemsCacheSessionId"] = "71bcb1a4-9760-40e1-8383-0e39915d475b";
                        }

                        radlstvwMediaItems.FilterExpressions.Clear();
                        radlstvwMediaItems.DataBind();

                        RadListViewSortExpression expression = new RadListViewSortExpression();
                        expression.FieldName = "createdDate";
                        expression.SortOrder = RadListViewSortOrder.Descending;
                        radlstvwMediaItems.SortExpressions.AddSortExpression(expression);
                        radlstvwMediaItems.Rebind();

                        foreach (RadTreeNode node in treevw_AllSocialNetworks.Nodes)
                        {
                            if (resultsPerSn.ContainsKey(node.Value.ToLower()))
                            {
                                //node.Text += " (" + resultsPerSn[node.Value.ToLower()] + ")";
                                node.Text += " <span class=\"resultsCount\">(" + resultsPerSn[node.Value.ToLower()] + ")</span>";
                            }

                        }
                        radlstvwMediaItems.Visible = true;
                    }


                    else
                    {
                        pnl_FindMediaItemsError.Visible = true;

                    }
                }

                updtpnlSearchMedia.Update();

            }
            catch (Exception ex)
            {
                pnl_FindMediaItemsError.Visible = true;
                if (UserId == 1)
                {
                    lbl_FindMediaItemsError.Text = ex.Message;
                }
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }
        protected void btnClearMediaItemSelection_Click(object sender, EventArgs e)
        {
            if (Session["SelectedMediaItems"] != null)
            {
                Dictionary<string, FlexiAuctionMediaItem> items = (Dictionary<string, FlexiAuctionMediaItem>)Session["SelectedMediaItems"];
                foreach (var item in items)
                {

                    UpdateCachedMediaItemSelectState ( Convert.ToInt32( item.Key), false);
                }
                Session["SelectedMediaItems"] = null;
                lstvwMediaItemsCart.DataBind();
                radlstvwMediaItems.DataBind();
                updtpnlSearchMedia.Update();
                updpnl_MediaItemsCart.Update();

            }
            
        }

        protected void btnConfirmMediaItemSelection_Click(object sender, EventArgs e)
        {

            // FlexiAuctionMediaItem item = new FlexiAuctionMediaItem(
            if (Session["SelectedMediaItems"] != null)
            {
                Dictionary<string, FlexiAuctionMediaItem> items = (Dictionary<string, FlexiAuctionMediaItem>)Session["SelectedMediaItems"];
                SociosServices.FlexiPriceClient flexiClient = new FlexiPriceClient();
                string token = flexiClient.ConfirmSelectedMediaItems(UserId, items);
                string auctionUrl = FLEXIPRICE_DOMAIN + "?token=" + token;

                string message = "window.close(); alert('Your Mediaitems have been sent to FlexiAuction. Please close this tab and go back to FlexiAuction tab. Items ("+ items.Count +"):";
                foreach (var item in items)
                {
                    message += "  |  Item: " + item.Key + ":" + item.Value.sns + ":" + item.Value.item_id;
                }
                message += "');";
                ScriptManager.RegisterClientScriptBlock(updpnl_MediaItemsCart, typeof(UpdatePanel), updpnl_MediaItemsCart.ClientID, message, true);
                //if (confirm("Close Window?")) {
                //close();
                //}
                //Response.Redirect(auctionUrl);
            }
        }

        protected void btnGetUsersItems_Click(object sender, EventArgs e)
        {
            try
            {
                lbl_FindMediaItemsError.Text = "";
                pnl_FindMediaItemsError.Visible = true;
                //  (Request.QueryString["mode"] != null)
                // Reset cacheSessionId so that for old results are never displayed when starting a new search
                ClearSearchCacheSessionIds();
                //pnl_FindMediaItemsError.Visible = false;
                ddlSortResults.ClearSelection();
                radlstvwMediaItems.Visible = true;
                pnlBeforeFirstSearch.Visible = false;

                InitialiseSnTree();

                radlstvwMediaItems.FilterExpressions.Clear();
                String[] searchTerms = txtSearch.Text.Split(' ');

                SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                List<string> keywords = new List<string>();
                string[] words = keywords.ToArray();

                int userId = 2;// UserId;

                //List<SociosServices.WebSkeletonServiceLive.KnownSns> sources = new List<SociosServices.WebSkeletonServiceLive.KnownSns>();



                //if (chkbxDailymotionSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION);
                //if (chkbxFacebookSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK);

                //if (chkbxFlickRSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);

                //if (chkbxGooglePlusSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP);
                //if (chkbxMySpaceSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE);

                //if (chkbxTwitterSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER);

                //if (chkbxYouTubeSearch.Checked)
                //    sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE);

                bool USE_CACHED_RESULTS = false;
                //var items = new SociosServices.WebSkeletonServiceLive.MediaItem[1];
                var items = new List<SociosServices.WebSkeletonServiceLive.MediaItem>();
                if (!USE_CACHED_RESULTS)
                {

                    pnlMediaItemCart.Visible = true;
                    pnlSearchHistory.Visible = false;
                    lblAuctionModeInfo.Visible = true;


                    SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
                    string dmUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.DAILYMOTION);
                    string ytUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.YOUTUBE);
                    string twUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.TWITTER);
                    string msUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.MYSPACE);
                    string frUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.FLICKR);
                    string fbUserId = tokenClient.GetUsernameFromUserId(UserId.ToString(), SociosServices.UserService.socialNetwork.FACEBOOK);

                    lblAuctionModeInfo.Text += "dmUserId: " + dmUserId + " | ";
                    lblAuctionModeInfo.Text += "ytUserId: " + ytUserId + " | ";
                    lblAuctionModeInfo.Text += "twUserId: " + twUserId + " | ";
                    lblAuctionModeInfo.Text += "msUserId: " + msUserId + " | ";
                    lblAuctionModeInfo.Text += "frUserId: " + frUserId + " | ";
                    lblAuctionModeInfo.Text += "fbUserId: " + fbUserId + " | ";

                    int validUserIdsCount = 0;
                    int currentUserId = 0;



                    Dictionary<SociosServices.WebSkeletonServiceLive.KnownSns, string> snsUsers = new Dictionary<SociosServices.WebSkeletonServiceLive.KnownSns, string>();


                    accessInfo[] userSnDetails = tokenClient.GetUserTokens(UserId);
                    if (userSnDetails != null)
                    {
                        lblAuctionModeInfo.Text = "My UserId: " + UserId + " | ";
                        foreach (accessInfo user in userSnDetails)
                        {
                            string snName = GetSnNameFromId(user.accessInfoPK.snsId);

                            if (user.accessInfoPK.snsId == 1 && chkbxFlickRSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "frUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR, user.snsUserId);

                            }
                            if (user.accessInfoPK.snsId == 2 && chkbxFacebookSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "fbUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK, user.snsUserId);
                            }
                            if (user.accessInfoPK.snsId == 3 && chkbxTwitterSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "twUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER, user.snsUserId);
                            }
                            if (user.accessInfoPK.snsId == 4 && chkbxYouTubeSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "ytUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE, user.snsUserId);
                            }
                            if (user.accessInfoPK.snsId == 5 && chkbxMySpaceSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "msUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE, user.snsUserId);
                            }
                            if (user.accessInfoPK.snsId == 6 && chkbxDailymotionSearch.Checked)
                            {
                                lblAuctionModeInfo.Text += "dmUserId: " + user.snsUserId + " | ";
                                snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION, user.snsUserId);
                            }

                        }


                    }


                    //if(dmUserId != "")
                    //      snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION,dmUserId);
                    // if(ytUserId != "")
                    //    snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE,ytUserId);
                    // if(twUserId != "")
                    //    snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER,twUserId);
                    // if(msUserId != "")
                    //    snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE,msUserId);
                    // if(frUserId != "")
                    //    snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR,frUserId);
                    //if(fbUserId != "")
                    //    snsUsers.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK,fbUserId);



                    SociosServices.WebSkeletonServiceLive.ObjectId[] userIds = new SociosServices.WebSkeletonServiceLive.ObjectId[snsUsers.Count];

                    foreach (var item in snsUsers)
                    {
                        SociosServices.WebSkeletonServiceLive.ObjectId obj1 = new SociosServices.WebSkeletonServiceLive.ObjectId();
                        obj1.id = item.Value;
                        SociosServices.WebSkeletonServiceLive.Source source = new SociosServices.WebSkeletonServiceLive.Source();
                        source.Item = item.Key;
                        //obj1.source.Item = item.Key;
                        userIds[currentUserId] = obj1;
                        currentUserId++;



                        SociosServices.WebSkeletonServiceLive.MediaItemReturn result = client.FindMyMediaItems(item.Value, UserId, source);


                        if (result != null)
                        {
                            if(result.mediaItems != null)
                                items.AddRange(result.mediaItems);// = result.mediaItems;

                            SociosServices.WebSkeletonServiceLive.SociosError[] errors = result.errors;
                            if (errors != null && errors.Length > 0)
                            {
                                RenderFindMediaItemsErrors(errors);
                            }
                        }
                        else
                        {
                            pnl_FindMediaItemsError.Visible = true;
                        }



                    }


                    //FindMyMediaItems
                    //MediaItemReturn result = client.FindMediaItemsByUserId(userIds,UserId);



                    //items = client.Find(.FindMediaItems(searchTerms, userId, sources);
                }



                if (items != null && items.Count > 0)
                {

                    // Session["findMediaItemsCacheSessionId"] = "5cab70f9-513b-49c0-baf3-d5c70c0d2839";
                    if (!USE_CACHED_RESULTS)
                    {
                        Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> itemsDictionary = new Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>();
                        int i = 0;
                        foreach (var item in items)
                        {
                            
                            itemsDictionary.Add(i, item);
                            i++;
                        }
                        Session["findMediaItemsCache"] = itemsDictionary;
                        AddMediaItemsToCache(itemsDictionary);

                        // ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                        //double score = ranking.GetMediaItemScore(itemsList[1]);
                        //double[] scores = ranking.GetMediaItemsScore(items); 
                    }
                    else
                    {
                        Session["findMediaItemsCacheSessionId"] = "71bcb1a4-9760-40e1-8383-0e39915d475b";
                    }

                    RadListViewSortExpression expression;

                    radlstvwMediaItems.SortExpressions.Clear();
                    radlstvwMediaItems.FilterExpressions.Clear();
                    expression = new RadListViewSortExpression();
                    expression.FieldName = "createdDate";
                    expression.SortOrder = RadListViewSortOrder.Descending;

                    radlstvwMediaItems.SortExpressions.AddSortExpression(expression);
                    radlstvwMediaItems.Rebind();


                    radlstvwMediaItems.DataBind();
                    UpdateSnTreeNodesCounters();
                    radlstvwMediaItems.Visible = true;
                    //pnl_FindMediaItemsError.Visible = false;
                }
                else
                {
                    // pnl_FindMediaItemsError.Visible = true;

                }

                if (lbl_FindMediaItemsError.Text == "")
                {
                    pnl_FindMediaItemsError.Visible = false;
                }
                updtpnlSearchMedia.Update();

            }
            catch (Exception ex)
            {
                pnl_FindMediaItemsError.Visible = true;
                if (UserId == 1)
                {
                    lbl_FindMediaItemsError.Text = ex.Message;
                }
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }

        protected void RenderFindMediaItemsErrors(SociosServices.WebSkeletonServiceLive.SociosError[] errors)
        {
            lbl_FindMediaItemsError.Visible = true;
            foreach (var error in errors)
            {
                if (error.source != null && error.exception != null & error.exception.faultstring != null)
                {
                    lbl_FindMediaItemsError.Text += "<div><b>" + error.source.Item + "</b> | " + error.exception.faultstring + "</div>";
                }
                else if (error.source != null)
                {
                    lbl_FindMediaItemsError.Text += "<div><b>" + error.source.Item + "</b> | " + "No error specified from Core Services" + "</div>";
                }


            }
        }

        protected void UpdateSnTreeNodesCounters()
        {
            InitialiseSnTree();
            foreach (RadTreeNode node in treevw_AllSocialNetworks.Nodes)
            {
                if (resultsPerSn.ContainsKey(node.Value.ToLower()))
                {
                    node.Text += " <span class=\"resultsCount\">(" + resultsPerSn[node.Value.ToLower()] + ")</span>";
                }
                else
                {
                    node.Text += " <span class=\"resultsCount\">(0)</span>";
                }

            }
        }

        protected void lstvwMediaItems_ItemCommand(object sender, System.Web.UI.WebControls.ListViewCommandEventArgs e)
        {
            if (e.CommandName == "GetProfileUrl")
            {
                string[] itemUserInfo = e.CommandArgument.ToString().Split(':');
                if (itemUserInfo.Length > 1)
                {
                    //string userSnsId =
                    // GetProfileUrl(e.CommandArgument.ToString().Split(':')[0], e.CommandArgument.ToString().Split(':')[1]);

                }
            }

        }


        protected void radLstvwMediaItems_ItemDataBound(object sender, RadListViewItemEventArgs e)
        {
            Panel pnlAuthorDifferentiator = (Panel)e.Item.FindControl("pnlAuthorDifferentiator");
            UpdatePanel updtpnlAssignPrice = (UpdatePanel)e.Item.FindControl("updtpnlAssignPrice");
            UpdatePanel updtpnlRanking = (UpdatePanel)e.Item.FindControl("updtpnlRanking");
            UpdatePanel updtpnl_sentiment = (UpdatePanel)e.Item.FindControl("updtpnl_sentiment");
            UpdatePanel updpnl_selectItem = (UpdatePanel)e.Item.FindControl("updpnl_selectItem");
           
            //if(Request.QueryString["mode"] != null)
            if (UserInfo.IsInRole("Candidates"))
            {
                pnlAuthorDifferentiator.Visible = false;
                updtpnlAssignPrice.Visible = false;
                updtpnlRanking.Visible = false;
                updtpnl_sentiment.Visible = false;
            }
            else
            {
                updpnl_selectItem.Visible = false;
            }


            HiddenField hdnfld_mirsRanking = (HiddenField)e.Item.FindControl("hdnfld_mirsRanking");
            Panel pnl_rankingButton = (Panel)e.Item.FindControl("pnl_rankingButton");
            Panel pnl_rankingStars = (Panel)e.Item.FindControl("pnl_rankingStars");

            Panel pnl_loadingRanking = (Panel)e.Item.FindControl("pnl_loadingRanking");

            double ranking = Convert.ToDouble(hdnfld_mirsRanking.Value);
            if (ranking > -0.5)
            {
                pnl_rankingButton.Visible = false;
                pnl_rankingStars.Visible = true;
                pnl_loadingRanking.Visible = false;
            }

            Label lblLicenseType = (Label)e.Item.FindControl("lblLicenseType");
            Label lblLicenseUrl = (Label)e.Item.FindControl("lblLicenseUrl");
            HyperLink hprlnkLicense = (HyperLink)e.Item.FindControl("hprlnkLicense");
            Image imgLicense = (Image)e.Item.FindControl("imgLicense");
            hprlnkLicense.NavigateUrl = lblLicenseUrl.Text;

            hprlnkLicense.Visible = false;
            
            if (lblLicenseType.Text == "CC")
            {
                //hprlnkLicense.Visible = true;
                imgLicense.ImageUrl = "Images/cc22.png";
            }
            else if (lblLicenseType.Text == "Unknown")
            {
                imgLicense.ImageUrl = "Images/licenseUnknown.png";
            }
            else if (lblLicenseType.Text == "ALL")
            {
                imgLicense.ImageUrl = "Images/licenseUnknown.png";
                lblLicenseType.Text = "Unknown";
            }
            else
            {
                imgLicense.ImageUrl = "Images/licenseUnknown.png";
                lblLicenseType.Text = "Unknown";
            }
            hprlnkLicense.ToolTip = "License: " + lblLicenseType.Text;

        }

        protected void lstvw_AllGroupEvents_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

            Label lblEventName = (Label)e.Item.FindControl("lblEventName");
            string eventName = lblEventName.Text;
            if (eventName.Length > 14)
            {
                lblEventName.Text = eventName.Substring(0, 13) + "..";
            }

        }

        protected SociosServices.WebSkeletonServiceLive.KnownSns GetKnownSns(string source)
        {
            switch (source)
            {
                case "facebook":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;
                case "twitter":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER;
                case "dailymotion":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION;
                case "youtube":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE;
                case "flickr":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR;
                case "myspace":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE;
                case "instagram":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.INSTAGRAM;
                case "googlep":
                    return SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP;
                default:
                    return SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;
            }
        }

        protected void lstvwMediaItemsCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "deselectMediaItem")
            {
                UpdateCachedMediaItemSelectState(Convert.ToInt32(e.CommandArgument.ToString()), false);
                lstvwMediaItemsCart.DataBind();
                radlstvwMediaItems.DataBind();

                foreach (var item in radlstvwMediaItems.Items)
                {
                    UpdatePanel updpnl_selectItem = (UpdatePanel)item.FindControl("updpnl_selectItem");
                    if (updpnl_selectItem != null)
                        updpnl_selectItem.Update();
                }

                updpnl_MediaItemsCart.Update();
                RemoveMediaItemFromSelectedItemsCache(e.CommandArgument.ToString());
                //updtpnlSearchMedia.Update();
            }
        }

        protected void AddMediaItemToSelectedItemsCache(string cacheId, string item_id, string sns, string url, string media_type)
        {
            if (Session["SelectedMediaItems"] == null)
            {
                Session["SelectedMediaItems"] = new Dictionary<string, FlexiAuctionMediaItem>();
                // Who has selected the mediaItems
                Session["SelectedMediaItemsUserId"] = UserId;
            }
            Dictionary<string, FlexiAuctionMediaItem> items = (Dictionary<string, FlexiAuctionMediaItem>)Session["SelectedMediaItems"];
            if (!items.ContainsKey("cacheId"))
            {
                string offer_id = "-1";
                if (Session["offer_id"] != null)
                {
                    offer_id = Session["offer_id"].ToString();
                }
                FlexiAuctionMediaItem item = new FlexiAuctionMediaItem(item_id, sns, Server.UrlEncode(url), media_type, offer_id);
                items.Add(cacheId, item);
            }
        }

        protected void RemoveMediaItemFromSelectedItemsCache(string cacheId)
        {
            if (Session["SelectedMediaItems"] != null)
            {
                Dictionary<string, FlexiAuctionMediaItem> items = (Dictionary<string, FlexiAuctionMediaItem>)Session["SelectedMediaItems"];
                items.Remove(cacheId);
            }
        }

        // FlexiAuctionMediaItem item  = new FlexiAuctionMediaItem(
        protected void dnnlstvw_SearchHistory_ItemCommand(object sender, RadListViewCommandEventArgs e)
        {
            int facebookCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("FacebookResults")).Value);
            int twitterCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("TwitterResults")).Value);
            int dailymotionCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("DailymotionResults")).Value);
            int googlepCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("GooglepResults")).Value);
            int youtubeCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("YoutubeResults")).Value);
            int myspaceCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("MyspaceResults")).Value);
            int flickrCount = Convert.ToInt32(((HiddenField)e.ListViewItem.FindControl("FlickrResults")).Value);
            int allCount = Convert.ToInt32(((Label)e.ListViewItem.FindControl("lblAllResults")).Text);




            resultsPerSn.Clear();
            resultsPerSn.Add("all", allCount);
            resultsPerSn.Add("facebook", facebookCount);
            resultsPerSn.Add("twitter", twitterCount);
            resultsPerSn.Add("dailymotion", dailymotionCount);
            resultsPerSn.Add("youtube", youtubeCount);
            resultsPerSn.Add("flickr", flickrCount);
            resultsPerSn.Add("myspace", myspaceCount);
            resultsPerSn.Add("googlep", googlepCount);

            Session["findMediaItemsCacheSessionId"] = e.CommandArgument;
            UpdateSnTreeNodesCounters();
            radlstvwMediaItems.DataBind();

            pnl_FindMediaItemsError.Visible = false;
            ddlSortResults.ClearSelection();
            radlstvwMediaItems.Visible = true;
            pnlBeforeFirstSearch.Visible = false;
            updtpnlSearchMedia.Update();
        }

        protected void radLstvwMediaItems_ItemCommand(object sender, RadListViewCommandEventArgs e)
        {
            try
            {
                SociosServices.WebSkeletonServiceLive.KnownSns source = new SociosServices.WebSkeletonServiceLive.KnownSns();

                HiddenField hdnfld_Source = (HiddenField)e.ListViewItem.FindControl("hdnfld_source");
                HiddenField hdnfld_url = (HiddenField)e.ListViewItem.FindControl("hdnfld_url");

                source = GetKnownSns(hdnfld_Source.Value);

                if (e.CommandName == "sendMessage")
                {
                    TextBox messageBox = (TextBox)e.ListViewItem.FindControl("txtConsentFormText");
                    TextBox fromBox = (TextBox)e.ListViewItem.FindControl("txtConsentFrom");
                    string message = messageBox.Text;
                    if (message.Length > 500)
                    {
                        message = message.Substring(0, 498);
                    }
                    var client = new YouTubeClient();
                    string videoId = e.CommandArgument.ToString().Replace("http://www.youtube.com/embed/", "");
                    client.addMessage(fromBox.Text, videoId, message);
                }
                else if (e.CommandName == "AssignPrice")
                {
                    SociosServices.FlexiPriceClient flexiClient = new FlexiPriceClient();
                    Label lbl_MediaItemTitle = (Label)e.ListViewItem.FindControl("lbl_MediaItemTitle");

                    HiddenField hdnfld_source = (HiddenField)e.ListViewItem.FindControl("hdnfld_source");
                    HiddenField hdnfld_ownerId = (HiddenField)e.ListViewItem.FindControl("hdnfld_ownerId");
                    HiddenField hdnfld_mirsRanking = (HiddenField)e.ListViewItem.FindControl("hdnfld_mirsRanking");
                    string itemName = "";
                    if (lbl_MediaItemTitle != null)
                    {
                        itemName = lbl_MediaItemTitle.Text;
                    }
                    int user_id = UserId;
                    string realName = UserInfo.DisplayName;

                    string wholeParam = e.CommandArgument.ToString();
                    string[] paramParts = wholeParam.Split(':');
                    string mediaItemId = paramParts[0]; //e.CommandArgument.ToString();


                    string ownerId = hdnfld_source.Value + ":" + hdnfld_ownerId.Value;



                    double score = -1;
                    bool usingRecommended = (bool)Session["mediaItemsSearchUsingRecommended"];



                    int key = Convert.ToInt32(paramParts[1]);
                    if (usingRecommended)
                    {
                        double.TryParse(hdnfld_mirsRanking.Value, out score);
                    }
                    else
                    {
                        Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>)Session["findMediaItemsCache"];
                        ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                        var rankingResult = ranking.GetMediaItemScore(itemsDictionary[key]);
                        score = rankingResult.Key;
                    }


                    //score = 2.0;







                    string token = flexiClient.AssignPrice(user_id, score, realName, mediaItemId, itemName, ownerId);
                    string assignPriceUrl = FLEXIPRICE_DOMAIN + "?token=" + token;

                    //Session["CurrentDiigoEntry"]

                    Literal ltrlAssignPriceRedirector = (Literal)e.ListViewItem.FindControl("ltrlAssignPriceRedirector");

                    //ltrlAssignPriceRedirector.Text = "<script>window.open(\"" + assignPriceUrl + "\")</script>";
                    ltrlAssignPriceRedirector.Text = "<a target='_blank' class='assignPriceLink'  href='" + assignPriceUrl + "'>Go to Flexiprice now</a>";
                    ltrlAssignPriceRedirector.Visible = true;
                    Button btn_assignPrice = (Button)e.ListViewItem.FindControl("btn_assignPrice");
                    btn_assignPrice.Visible = false;
                    //Response.Redirect(assignPriceUrl);
                }
                else if (e.CommandName == "GetProfileUrl")
                {
                    string[] itemUserInfo = e.CommandArgument.ToString().Split(':');
                    if (itemUserInfo.Length > 1)
                    {
                        //string userSnsId =
                        // GetProfileUrl(e.CommandArgument.ToString().Split(':')[0], e.CommandArgument.ToString().Split(':')[1]);

                    }
                }
                else if (e.CommandName == "GetItemRanking")
                {
                    Literal ltrl_ItemRankingStars = (Literal)e.ListViewItem.FindControl("ltrl_ItemRankingStars");
                    string summaryConcat = "";
                    bool usingRecommended = false;
                    if (Session["mediaItemsSearchUsingRecommended"] != null)
                    {
                        usingRecommended = (bool)Session["mediaItemsSearchUsingRecommended"];
                    }
                    int key = Convert.ToInt32(e.CommandArgument);
                    double score = -1;
                    SociosServices.WebSkeletonServiceLive.KnownSns currentSource = SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;

                    if (usingRecommended)
                    {
                        Dictionary<int, SociosServices.RecommendationService.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.RecommendationService.MediaItem>)Session["findMediaItemsCache"];
                        ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                        SociosServices.WebSkeletonServiceLive.ObjectId id = new SociosServices.WebSkeletonServiceLive.ObjectId();
                        SociosServices.RecommendationService.ObjectId idRec = new SociosServices.RecommendationService.ObjectId();
                        idRec = itemsDictionary[key].id;


                        id.id = idRec.id;
                        // id.source.Item = idRec.source.knownSns;

                        SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                        SociosServices.WebSkeletonServiceLive.ObjectId obj = new SociosServices.WebSkeletonServiceLive.ObjectId();
                        SociosServices.WebSkeletonServiceLive.ObjectId[] objs = { obj };
                        var test = client.GetMediaItems(objs);



                        var rankingResult = ranking.GetMediaItemScore(test[0]);
                        score = rankingResult.Key;
                    }
                    else
                    {
                        Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>)Session["findMediaItemsCache"];
                        ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                       currentSource = itemsDictionary[key].id.source.Item;
                        if (currentSource != SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK &&
  currentSource  != SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP)
                        {
                            var rankingResult = ranking.GetMediaItemScore(itemsDictionary[key]);
                            string[] summary = ranking.GetMediaRankingSummary(itemsDictionary[key]);
                            int words = summary.Length;
                            int i = 0;
                            foreach (string word in summary)
                            {
                                summaryConcat += word;
                                if (i < words - 1)
                                    summaryConcat += "\n";
                            }

                            // double score = ranking.
                            //  double[] scores = ranking.GetMediaItemsScore(items); 

                            score = rankingResult.Key;

                            int cacheDictionaryId = Convert.ToInt32(e.CommandArgument);

                            HiddenField hdnfld_CacheId = (HiddenField)e.ListViewItem.FindControl("hdnfld_CacheId");
                            int cacheId = Convert.ToInt32(hdnfld_CacheId.Value);

                            // UPDATE MIRS RANKING OF MEDIAITEM IN DATABASE
                            UpdateCachedMediaItemRanking(cacheId, score.ToString());
                        }
                        else
                        {

                        }
                        
                        Panel pnl_loadingRanking = (Panel)e.ListViewItem.FindControl("pnl_loadingRanking");
                        pnl_loadingRanking.Visible = false;
                    }


                    //DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, rankingResult.Value);

                    Button lnkbtn_GetItemRanking = (Button)e.ListViewItem.FindControl("lnkbtn_GetItemRanking");
                    lnkbtn_GetItemRanking.Visible = false;
                    
                    if (currentSource != SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK &&
 currentSource != SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP)
                    {
                        ltrl_ItemRankingStars.Text = GetRankingStarsHtml(score.ToString(), summaryConcat);
                    }
                    else if (currentSource == SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK)
                    {
                        ltrl_ItemRankingStars.Text = GetRankingStarsHtml("401", summaryConcat);
                    }
                    else if (currentSource == SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP)
                    {
                        ltrl_ItemRankingStars.Text = GetRankingStarsHtml("402", summaryConcat);
                    }
                    //ltrl_ItemRankingStars.Text += "<span title='" + summaryConcat + "'>(?)</span>";
                    //lnkbtn_GetItemRanking.Text = score.ToString();
                }
                else if (e.CommandName == "getUserDetails")
                {
                    Image imgAuthorIcon = (Image)e.ListViewItem.FindControl("imgAuthorIcon");
                    Panel pnl_GetPersonError = (Panel)e.ListViewItem.FindControl("pnl_GetPersonError");
                    pnl_GetPersonError.Visible = false;
                    Label lblUsername = (Label)e.ListViewItem.FindControl("lblUsername");
                    Label lblDisplayName = (Label)e.ListViewItem.FindControl("lblDisplayName");
                    HyperLink hprlnkUserProfile = (HyperLink)e.ListViewItem.FindControl("hprlnkUserProfile");

                    LinkButton lnkbtn_getUserDetails = (LinkButton)e.ListViewItem.FindControl("lnkbtn_getUserDetails");


                    string userId = e.CommandArgument.ToString();
                    SociosServices.WebSkeletonServiceLive.Person person = new SociosServices.WebSkeletonServiceLive.Person();
                    if (source == SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE)
                    {

                        person.preferredUsername = userId;
                        person.displayName = userId;
                        person.profileUrl = "http://www.youtube.com/user/" + userId;
                        person.thumbnailUrl = "http://frontend.sociosproject.eu/images/no-profile.png";
                    }
                    //else if (source == SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER)
                    //{
                    //    string twitterUsername = GetTwitterUsernameFromUrl(hdnfld_url.Value);
                    //    person.preferredUsername = twitterUsername;
                    //    person.displayName = twitterUsername;
                    //     person.profileUrl = "http://www.twitter.com/" + person.displayName;
                    //    person.thumbnailUrl = "http://frontend.sociosproject.eu/images/no-profile.png";
                    //}
                    //else if (source == SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER)
                    //{
                    //    string twitterUsername = GetTwitterUsernameFromUrl(hdnfld_url.Value);
                    //    person.preferredUsername = twitterUsername;
                    //    person.displayName = twitterUsername;
                    //     person.profileUrl = "http://www.twitter.com/" + person.displayName;
                    //    person.thumbnailUrl = "http://frontend.sociosproject.eu/images/no-profile.png";
                    //}

                    else
                    {
                        SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                        // sociosApiUserKey = 1 for admin tokens
                        person = client.GetPersonUsername(2, userId, source);
                    }


                    if (person != null)
                    {
                        lblUsername.Text = person.displayName;


                        imgAuthorIcon.ImageUrl = person.thumbnailUrl;

                        Label lblUserId = (Label)e.ListViewItem.FindControl("lblUserId");
                        lblUserId.Text = userId;
                        lblUserId.Visible = true;

                        if (person.preferredUsername != null)
                            lblUsername.Text = person.preferredUsername;
                        lblUsername.Visible = true;

                        if (person.displayName != null)
                            lblDisplayName.Text = person.displayName;
                        lblDisplayName.Visible = true;

                        if (person.profileUrl != null)
                        {
                            hprlnkUserProfile.NavigateUrl = person.profileUrl;
                        }
                        hprlnkUserProfile.Visible = true;



                        lnkbtn_getUserDetails.Visible = false;

                        // Panel pnlItemTools = (Panel) e.ListViewItem.FindControl("pnlItemTools");
                        // pnlItemTools.Visible = true;
                        Label lbl_AddUserToGroup = (Label)e.ListViewItem.FindControl("lbl_AddUserToGroup");

                        lbl_AddUserToGroup.Visible = true;


                        Page.ClientScript.RegisterClientScriptInclude("GetNextAuthor.js", this.TemplateSourceDirectory + "/js/GetNextAuthor.js");
                        //PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

                        // Getting recommendation summary
                        Button lnkbtn_GetItemRanking = (Button)e.ListViewItem.FindControl("lnkbtn_GetItemRanking");
                        int key = Convert.ToInt32(lnkbtn_GetItemRanking.CommandArgument);

                        try
                        {

                            Dictionary<int, SociosServices.RecommendationService.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.RecommendationService.MediaItem>)Session["findMediaItemsCache"];
                            ContentRankingServiceClient ranking = new ContentRankingServiceClient();

                            if (itemsDictionary != null)
                            {
                                string[] summary = ranking.GetMediaRankingSummary(itemsDictionary[key]);
                                string summaryConcat = "No summary";
                                int words = summary.Length;
                                if (summary != null)
                                {
                                    summaryConcat = "";
                                }
                                int i = 0;
                                foreach (string word in summary)
                                {
                                    summaryConcat += word;
                                    if (i < words - 1)
                                        summaryConcat += "\n";
                                }


                                Panel pnl_rankingStars = (Panel)e.ListViewItem.FindControl("pnl_rankingStars");
                                pnl_rankingStars.ToolTip = summaryConcat;
                                pnl_rankingStars.Visible = true;
                            }
                            else
                            {

                                Literal ltrl_ItemRankingStars = (Literal)e.ListViewItem.FindControl("ltrl_ItemRankingStars");
                                if (hdnfld_Source.Value == "googlep")
                                {
                                    ltrl_ItemRankingStars.Text = GetRankingStarsHtml("402", "");
                                }
                                else if (hdnfld_Source.Value == "facebook")
                                {
                                    ltrl_ItemRankingStars.Text = GetRankingStarsHtml("401", "");
                                }
                               
                                Panel pnl_loadingRanking = (Panel)e.ListViewItem.FindControl("pnl_loadingRanking");
                                pnl_loadingRanking.Visible = false;
                    
                            }


                        }
                        catch (Exception ex)
                        {
                            Panel pnl_rankingStars = (Panel)e.ListViewItem.FindControl("pnl_rankingStars");
                            pnl_rankingStars.ToolTip = "Error retrieving summary: "+ ex.Message;
                        }
                        // Panel pnl_rankingStars 

                    }
                    else
                    {
                        lnkbtn_getUserDetails.CssClass = "ErrorGettingPerson hidden";
                        pnl_GetPersonError.Visible = true;
                        imgAuthorIcon.Visible = false;
                    }


                    Label lblTitle = (Label)e.ListViewItem.FindControl("lblTitle");
                    Label lblDescription = (Label)e.ListViewItem.FindControl("lblDescription");


                    //Label lblSentiment = (Label)e.ListViewItem.FindControl("lblSentiment");
                    Panel pnlSentiment = (Panel)e.ListViewItem.FindControl("pnlSentiment");



                    if (chkbx_UseSentiment.Checked)
                    {
                        try
                        {
                            SentimentAnalysisServiceClient sentimentClient = new SentimentAnalysisServiceClient();
                            string result = "Error evaluating the ";
                            if (lblDescription.Text.Length == 0)
                            {
                                result = sentimentClient.GetStringSentiment(lblTitle.Text);
                            }
                            else
                            {
                                result = sentimentClient.GetStringSentiment(lblDescription.Text);
                            }
                            pnlSentiment.CssClass = "sentiment-" + result;
                            pnlSentiment.ToolTip = UppercaseFirst(result) + " sentiment";
                        }
                        catch (Exception ex)
                        {
                            pnlSentiment.CssClass = "sentiment-error";
                            pnlSentiment.ToolTip = "Error retrieving sentiment";
                        }
                    }
                    else
                    {
                        pnlSentiment.CssClass = "sentiment-error";
                        pnlSentiment.ToolTip = "Sentiment not requested";
                    }

                    HyperLink hprlnkLicense = (HyperLink)e.ListViewItem.FindControl("hprlnkLicense");
                    hprlnkLicense.Visible = true;
                    if (true)
                    {
                    // FindControl   
                        //
                        Label lblMediaItemSource = (Label)e.ListViewItem.FindControl("lblMediaItemSource");
                        Label lblItemId = (Label)e.ListViewItem.FindControl("lblItemId");
                    

                        SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                        SociosServices.WebSkeletonServiceLive.ObjectId obj = new SociosServices.WebSkeletonServiceLive.ObjectId();
                        SociosServices.WebSkeletonServiceLive.ObjectId[] objs = { obj };

                        obj.id = lblItemId.Text;
                        obj.source = new SociosServices.WebSkeletonServiceLive.Source();
                        if (lblMediaItemSource.Text.ToLower() == "facebook")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;
                        else if (lblMediaItemSource.Text.ToLower() == "dailymotion")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION;
                        else if (lblMediaItemSource.Text.ToLower() == "flickr")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR;
                        else if (lblMediaItemSource.Text.ToLower() == "googlep")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.GOOGLEP;
                        else if (lblMediaItemSource.Text.ToLower() == "instagram")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.INSTAGRAM;
                        else if (lblMediaItemSource.Text.ToLower() == "myspace")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE;
                        else if (lblMediaItemSource.Text.ToLower() == "twitter")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER;
                        else if (lblMediaItemSource.Text.ToLower() == "youtube")
                            obj.source.Item = SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE;


                        if (obj.source.Item == SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR)
                        {
                            try{
                            SociosServices.WebSkeletonServiceLive.MediaItem[] itemDetails = client.GetMediaItems(objs);
                            if(itemDetails.Length > 0)
                            {
                                
                                hprlnkLicense.NavigateUrl = itemDetails[0].license.url;
                                hprlnkLicense.ToolTip = itemDetails[0].license.name;

                            }
                            
                            }
                            catch(Exception ex)
                            {

                            }
                          
                        }
                
                        //try
                        //{
                        //    SentimentAnalysisServiceClient sentimentClient = new SentimentAnalysisServiceClient();
                        //    string result = "Error evaluating the ";
                        //    if (lblDescription.Text.Length == 0)
                        //    {
                        //        result = sentimentClient.GetStringSentiment(lblTitle.Text);
                        //    }
                        //    else
                        //    {
                        //        result = sentimentClient.GetStringSentiment(lblDescription.Text);
                        //    }
                        //    pnlSentiment.CssClass = "sentiment-" + result;
                        //    pnlSentiment.ToolTip = UppercaseFirst(result) + " sentiment";
                        //}
                        //catch (Exception ex)
                        //{
                        //    pnlSentiment.CssClass = "sentiment-error";
                        //    pnlSentiment.ToolTip = "Error retrieving sentiment";
                        //}
                    }
                    else
                    {
                        pnlSentiment.CssClass = "sentiment-error";
                        pnlSentiment.ToolTip = "Sentiment not requested";
                    }






                    Panel pnlAuthorLoading = (Panel)e.ListViewItem.FindControl("pnlAuthorLoading");
                    pnlAuthorLoading.Visible = false;

                }
                else if (e.CommandName == "selectMediaItem")
                {
                    LinkButton lnkbtnSelectMediaItem = (LinkButton)e.ListViewItem.FindControl("lnkbtnSelectMediaItem");
                    lnkbtnSelectMediaItem.Visible = false;

                    Label lblStatus = (Label)e.ListViewItem.FindControl("lblStatus");
                    Label lblMediaItemSource = (Label)e.ListViewItem.FindControl("lblMediaItemSource");
                    Label lblUrl = (Label)e.ListViewItem.FindControl("lblUrl");
                    Label lblItemId = (Label)e.ListViewItem.FindControl("lblItemId");
                    Label lblMediaType = (Label)e.ListViewItem.FindControl("lblMediaType");
                    


                    Panel pnlSelectOptionsWrap = (Panel)e.ListViewItem.FindControl("pnlSelectOptionsWrap");


                    lblStatus.Visible = true;


                    pnlSelectOptionsWrap.CssClass = "selectOptionsWrapTrue";
                    UpdatePanel updpnl_selectItem = (UpdatePanel)e.ListViewItem.FindControl("updpnl_selectItem");
                    //UpdatePanel UpdatePanel2 = (UpdatePanel)e.ListViewItem.FindControl("UpdatePanel2");

                    LinkButton lnkbtnDeselectMediaItem = (LinkButton)e.ListViewItem.FindControl("lnkbtnDeselectMediaItem");
                    lnkbtnDeselectMediaItem.Visible = true;

                    //lbl_Notification.Visible = true;
                    //lbl_Notification.Text += "<p>MediaItem selected</p>";
                    updpnl_notification.Update();
                    UpdateCachedMediaItemSelectState(Convert.ToInt32(e.CommandArgument.ToString()), true);
                    lstvwMediaItemsCart.DataBind();
                    //lstvwMediaItemsCart.Visible = false;
                    updpnl_MediaItemsCart.Update();



                    AddMediaItemToSelectedItemsCache(e.CommandArgument.ToString(), /*lblMediaItemSource.Text + ":" +*/ lblItemId.Text, lblMediaItemSource.Text, lblUrl.Text, lblMediaType.Text);



                    //updtpnlWrap.Update();
                }
                else if (e.CommandName == "deselectMediaItem")
                {
                    Panel pnlSelectOptionsWrap = (Panel)e.ListViewItem.FindControl("pnlSelectOptionsWrap");
                    pnlSelectOptionsWrap.CssClass = "selectOptionsWrapFalse";
                    Label lblStatus = (Label)e.ListViewItem.FindControl("lblStatus");
                    lblStatus.Visible = false;

                    LinkButton lnkbtnSelectMediaItem = (LinkButton)e.ListViewItem.FindControl("lnkbtnSelectMediaItem");
                    lnkbtnSelectMediaItem.Visible = true;

                    LinkButton lnkbtnDeselectMediaItem = (LinkButton)e.ListViewItem.FindControl("lnkbtnDeselectMediaItem");
                    lnkbtnDeselectMediaItem.Visible = false;


                    UpdateCachedMediaItemSelectState(Convert.ToInt32(e.CommandArgument.ToString()), false);
                    lstvwMediaItemsCart.DataBind();

                    updpnl_MediaItemsCart.Update();
                    RemoveMediaItemFromSelectedItemsCache(e.CommandArgument.ToString());
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                //throw;
            }
        }



        static string UppercaseFirst(string s)
        {
            // Check for empty string.
            if (string.IsNullOrEmpty(s))
            {
                return string.Empty;
            }
            // Return char and concat substring.
            return char.ToUpper(s[0]) + s.Substring(1);
        }

        /// <summary>
        /// Code: 401 = Facebook Not Supported
        /// Code: 402 = GooglePlus Not Supported
        /// </summary>
        /// <param name="scoreString"></param>
        /// <param name="summaryConcat"></param>
        /// <returns></returns>
        protected string GetRankingStarsHtml(string scoreString, string summaryConcat)
        {
            double score = -1;
            double scoreConverted = -1;
            if (double.TryParse(scoreString, out scoreConverted))
            {
                score = scoreConverted;
            }
            
            score = score * 5;
            string fullStar = "<span class='full-star'></span>";
            string emptyStar = "<span class='empty-star'></span>";
            string stars = fullStar;
            if (score == 401 * 5)
            {
                return "<span title='Facebook Ranking Not Supported'><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span> Facebook ranking not supported</span>";
            }
            if (score == 402 * 5)
            {
                return "<span title='GooglePlus Ranking Not Supported'><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span><span class='inactive-star'></span> GooglePlus ranking not supported</span>";
            }
           


            if (score > 1.5)
                stars += fullStar;
            else
                stars += emptyStar;

            if (score > 2.5)
                stars += fullStar;
            else
                stars += emptyStar;
            if (score > 3.5)
                stars += fullStar;
            else
                stars += emptyStar;
            if (score > 4.5)
                stars += fullStar;
            else
                stars += emptyStar;

            string formattedScore = score.ToString("0.##");

            return "<span title='" + summaryConcat + "'>" + stars + " (" + formattedScore + ")" + "</span>";
        }


        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            String authToken = "1/bz_nvk-v7aA4BcSRhJDd8H1HnmfljomTXVQEjCBKWFs";

            var client = new YouTubeClient();
            //var persons = client.GetConnectedPersons(authToken);

        }

        public string GetProfileUrl(object sociosUserInfo)
        {
            string[] itemUserInfo = sociosUserInfo.ToString().Split(':');
            string mediaItemUrl = "";
            if (itemUserInfo.Length > 1)
            {
                string lowerSource = itemUserInfo[1].ToLower();
                string userSnsId = itemUserInfo[0];
                if (itemUserInfo.Length > 3)
                    mediaItemUrl = itemUserInfo[3];

                //string userSnsId =
                //GetProfileUrl(e.CommandArgument.ToString().Split(':')[0], e.CommandArgument.ToString().Split(':')[1]);
                if (lowerSource == "facebook")
                {
                    return "http://www.facebook.com/" + userSnsId;
                }
                else if (lowerSource == "flickr")
                {
                    return "http://www.flickr.com/people/" + userSnsId;
                }
                else if (lowerSource == "youtube")
                {
                    return "http://www.youtube.com/user/" + userSnsId;
                }
                else if (lowerSource == "twitter")
                {
                    //https://twitter.com/#!/OlympicBoycott/status/204411571429052417
                    String[] urlParts = mediaItemUrl.Split('/');
                    if (urlParts.Length > 3)
                    {
                        return "http://www.twitter.com/" + urlParts[4];
                    }

                }

            }
            return "#";
            //string myScript = "";
            //myScript += "alert('" + userSnsId + ":" + source + "');";

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, true);




        }

        protected String GetTwitterUsernameFromUrl(string url)
        {
            //https://twitter.com/#!/OlympicBoycott/status/204411571429052417
            String[] urlParts = url.Split('/');
            if (urlParts.Length > 3)
            {
                return urlParts[4];
            }
            return "";
        }

        protected void lnkbtn_MyGroups_Click(object sender, EventArgs e)
        {
            LoadAllGroups();
            //LoadGroupsToDropDownList(ddlAllGroups);
        }

        protected void lnkbtn_NewGroup_Click(object sender, EventArgs e)
        {
            pnl_NewGroup.Visible = true;
            //LoadGroupsToDropDownList(ddlAllGroups);
        }



        protected void lnkbtn_AddNewGroup_Click(object sender, EventArgs e)
        {
            SociosServices.SocialFilteringGroupService2.Group test =
                 CreateNewGroup(txt_NewGroupTitle.Text, txt_NewGroupDescription.Text);
            LoadAllGroups();
            pnl_NewGroup.Visible = false;
            txt_NewGroupTitle.Text = "";
            txt_NewGroupDescription.Text = "";


        }

        protected SociosServices.SocialFilteringGroupService2.Group CreateNewGroup(string title, string description)
        {
            try
            {
                SociosServices.SocialFilteringGroupService2.Group group = new SociosServices.SocialFilteringGroupService2.Group();
                return groupClient.CreateGroup(groupSessionObj, title, description);

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        protected void LoadAllGroups()
        {
            try
            {
                SociosServices.SocialFilteringGroupService2.Group[] groups = groupClient.GetGroups(groupSessionObj);
                Session["AllGroupsCache"] = groups;
                lstvw_AllGroups.DataSource = groups;
                LoadGroupsToDropDownList(ddlAllGroups, groups);
                lstvw_AllGroups.DataBind();
            }
            catch (Exception ex)
            {
                string error = ex.StackTrace;
            }
        }

        protected void LoadGroupsToDropDownList(DropDownList ddlToPopulate, SociosServices.SocialFilteringGroupService2.Group[] groups)
        {

            ListItemCollection items = new ListItemCollection();
            ddlToPopulate.Items.Clear();
            foreach (SociosServices.SocialFilteringGroupService2.Group group in groups)
            {
                ListItem newItem = new ListItem(group.title, group.id.id);
                ddlToPopulate.Items.Add(newItem);
            }
        }

        protected SociosServices.SocialFilteringGroupService2.Person[] GetGroupPeople(string groupObjectId)
        {
            return groupClient.GetGroupMembers(groupSessionObj, groupObjectId);
        }





        protected void lstvw_AllGroups_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            if (e.CommandName == "DeleteGroup")
            {
                groupClient.DeleteGroup(groupSessionObj, e.CommandArgument.ToString());
                LoadAllGroups();
                //LoadGroupsToDropDownList(ddlAllGroups);
            }
            else if (e.CommandName == "ShowPeopleInGroup")
            {
                foreach (ListViewItem item in lstvw_AllGroups.Items)
                {
                    Panel pnl_ManagePeople = (Panel)item.FindControl("pnl_ManagePeople");
                    pnl_ManagePeople.Visible = false;
                    item.Visible = false;
                }

                // Group title
                Label lbl_ItemGroupTitle = (Label)e.Item.FindControl("lbl_GroupTitle");


                lbl_GroupTitle.Text = lbl_ItemGroupTitle.Text;
                //pnl_GroupDetails.Visible = true;

                pnl_IndividualGroupFunctions.Visible = true;
                pnl_AllGroupFunctions.Visible = false;
                Panel pnl_CurrentManagePeople = (Panel)e.Item.FindControl("pnl_ManagePeople");
                e.Item.Visible = true;
                pnl_CurrentManagePeople.Visible = true;

                ListView lstvw_AllPeopleInGroup = (ListView)e.Item.FindControl("lstvw_AllPeopleInGroup");
                Session["Scenario1_CurrentGroup"] = e.CommandArgument.ToString();


                SociosServices.SocialFilteringGroupService2.Person[] groupPeople = GetGroupPeople(e.CommandArgument.ToString());
                lstvw_AllPeopleInGroup.DataSource = groupPeople;
                // We store the group people in the cache in order to access the usernames when displaying a groups activities.
                // Because mediaItems do not contain usernames.
                Session["GroupPeople"] = groupPeople;
                //SociosServices.SocialFilteringGroupService2.Person persosa = new SociosServices.SocialFilteringGroupService2.Person();

                lstvw_AllPeopleInGroup.DataBind();


                Panel item_pnl_IndividualGroupFunctions = (Panel)e.Item.FindControl("pnl_IndividualGroupFunctions");
                item_pnl_IndividualGroupFunctions.Visible = true;

                //LinkButton lnkbtn_GetLatestEvents = (LinkButton)e.Item.FindControl("lnkbtn_GetLatestEvents");
                //lnkbtn_GetLatestEvents.Visible = true;

                LinkButton lnkbtn_ShowGroupPeople = (LinkButton)e.Item.FindControl("lnkbtn_ShowGroupPeople");
                lnkbtn_ShowGroupPeople.Visible = false;





            }
            else if (e.CommandName == "AddPersonToGroup")
            {



                string currentGroupId = Session["Scenario1_CurrentGroup"].ToString();
                TextBox txt_NewPersonId = (TextBox)e.Item.FindControl("txt_NewPersonId");
                TextBox txt_NewPersonName = (TextBox)e.Item.FindControl("txt_NewPersonName");

                DnnComboBox ddlAddGroupMemberSn = (DnnComboBox)e.Item.FindControl("ddlAddGroupMemberSn");

                string userId = ValidateUser(txt_NewPersonName.Text, e);
                if (userId != null)
                {
                    Label lbl_UserFound = (Label)e.Item.FindControl("lbl_UserFound");
                    if (AddPersonToGroup(currentGroupId, txt_NewPersonName.Text, userId, ddlAddGroupMemberSn.SelectedValue))
                    {

                        lbl_UserFound.Text = txt_NewPersonName.Text + " added to group!";
                        var test = GetGroupPeople(e.CommandArgument.ToString());

                        ListView lstvw_AllPeopleInGroup = (ListView)e.Item.FindControl("lstvw_AllPeopleInGroup");
                        lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(e.CommandArgument.ToString());
                        lstvw_AllPeopleInGroup.DataBind();
                    }
                    else
                    {
                        lbl_UserFound.Text = "There was a problem adding " + txt_NewPersonName.Text + " to the group";
                    }

                }


                // ListView lstvw_AllPeopleInGroup = (ListView)e.Item.FindControl("lstvw_AllPeopleInGroup");
                // lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(currentGroupId);
                // lstvw_AllPeopleInGroup.DataBind();
            }
            else if (e.CommandName == "GetGroupLatestEvents")
            {
                string groupId = e.CommandArgument.ToString();
                groupId = e.CommandArgument.ToString();
                GetAndCacheLatestEvents(groupId);

                GoToSearchMediaPage();

                lblCurrentMediaSearchTitle.Text = "Group <span style='color:#000;'>" + lbl_GroupTitle.Text + "</span> Latest Highlights";
                lblCurrentMediaSearchTitle.Visible = true;
                lblCurrentTitle.Visible = false;

                pnl_SearchPanel.Visible = false;

                radlstvwMediaItems.DataSourceID = sqldtsrc_GetGroupEventsItemsCache.ID;
                radlstvwMediaItems.Visible = true;
                pnlBeforeFirstSearch.Visible = false;
                pnlFilterByUser.Visible = true;
                pnlFilterByEvent.Visible = true;

                radlstvwMediaItems.FilterExpressions.Clear();
                radlstvwMediaItems.DataBind();
                UpdateSnTreeNodesCounters();


                string currentGroupId = Session["Scenario1_CurrentGroup"].ToString();
                lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(currentGroupId);
                lstvw_AllPeopleInGroup.DataBind();
                //RenderLatestEvents(groupId);
                //pnl_LatestActivities.Visible = false;
                //pnl_LatestEvents.Visible = true;
                //lbl_selectAGroupForEvents.Visible = false;
            }
            else if (e.CommandName == "GetGroupActivities")
            {
                string groupId = e.CommandArgument.ToString();
                GetAndCacheGroupActivities(groupId);


                GoToSearchMediaPage();
                lblCurrentMediaSearchTitle.Text = "Group <span style='color:#000;'>" + lbl_GroupTitle.Text + "</span> Latest Content";

                lblCurrentMediaSearchTitle.Visible = true;
                lblCurrentTitle.Visible = false;

                pnl_SearchPanel.Visible = false;

                radlstvwMediaItems.DataSourceID = sqldtsrc_GetGroupActivitiesItemsCache.ID;
                radlstvwMediaItems.Visible = true;
                pnlBeforeFirstSearch.Visible = false;
                pnlFilterByUser.Visible = true;

                radlstvwMediaItems.FilterExpressions.Clear();
                radlstvwMediaItems.DataBind();
                UpdateSnTreeNodesCounters();

                string currentGroupId = Session["Scenario1_CurrentGroup"].ToString();
                lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(currentGroupId);
                lstvw_AllPeopleInGroup.DataBind();
            }




        }

        protected void GoToSearchMediaPage()
        {
            CheckFlexipriceStatus();
            CheckFlexiauctionStatus();
            //lblCurrentTitle.Text = "Search Media";
            pnl_ManageGroups.Visible = false;
            pnl_MediaSearch.Visible = true;
            pnl_PoolOfContacts.Visible = false;
            imgMediaSearch.ImageUrl = "Images/searchMediaActive.png";
            imgManageGroups.ImageUrl = "Images/manageGroups.png";
            imgPoolOfContacts.ImageUrl = "Images/poolOfContacts.png";
        }

        protected string ValidateUser(string username, ListViewCommandEventArgs e)
        {

            DnnComboBox ddlAddGroupMemberSn = (DnnComboBox)e.Item.FindControl("ddlAddGroupMemberSn");
            Panel pnl_UserNotFound = (Panel)e.Item.FindControl("pnl_UserNotFound");
            Panel pnl_UserFound = (Panel)e.Item.FindControl("pnl_UserFound");

            Label lbl_UserNotFound = (Label)e.Item.FindControl("lbl_UserNotFound");

            pnl_UserNotFound.Visible = false;
            pnl_UserFound.Visible = false;
            string sn = ddlAddGroupMemberSn.SelectedValue;
            SociosServices.UserService.socialNetwork sns = socialNetwork.FLICKR;
            switch (sn)
            {
                case "flickr":
                    sns = socialNetwork.FLICKR;
                    break;
                case "facebook":
                    sns = socialNetwork.FACEBOOK;
                    break;
                case "twitter":
                    sns = socialNetwork.TWITTER;
                    break;
                case "youtube":
                    sns = socialNetwork.YOUTUBE;
                    break;
                case "myspace":
                    sns = socialNetwork.MYSPACE;
                    break;
                case "dailymotion":
                    sns = socialNetwork.DAILYMOTION;
                    break;
            }
            lbl_UserNotFound.Text = "No such user could be found on " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(sn);

            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            string userSnId = tokenClient.GetUsernameFromUserId(username, sns);
            if (userSnId != null)
            {

                return userSnId;
            }
            else
                pnl_UserNotFound.Visible = true;

            return null;

        }

        protected bool AddPersonToGroup(string groupId, string name, string personId, string socialNetwork)
        {

            try
            {

                SociosServices.SocialFilteringGroupService2.Person newPerson = new SociosServices.SocialFilteringGroupService2.Person();

                newPerson.id = new SociosServices.SocialFilteringGroupService2.ObjectId();

                newPerson.id.id = personId.Replace("\n", "").Replace("\r", "").Trim();

                newPerson.id.source = new SociosServices.SocialFilteringGroupService2.Source();

                newPerson.id.source.Item = new SociosServices.SocialFilteringGroupService2.KnownSns();

                socialNetwork = socialNetwork.Replace("\n", "").Replace("\r", "").Trim();
                if (socialNetwork == "facebook")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.FACEBOOK;
                else if (socialNetwork == "dailymotion")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.DAILYMOTION;
                else if (socialNetwork == "flickr")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.FLICKR;
                else if (socialNetwork == "googlep")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.GOOGLEP;
                else if (socialNetwork == "instagram")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.INSTAGRAM;
                else if (socialNetwork == "myspace")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.MYSPACE;
                else if (socialNetwork == "twitter")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.TWITTER;
                else if (socialNetwork == "youtube")
                    newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.YOUTUBE;



                newPerson.preferredUsername = name.Replace("\n", "").Replace("\r", "").Replace(" ", "").Trim();

                SociosServices.SocialFilteringGroupService2.Person[] people = new SociosServices.SocialFilteringGroupService2.Person[] { newPerson };
                if (Session["NotificationClearedForNewOnes"] == null)
                {
                    lbl_Notification.Text = "";
                    Session["NotificationClearedForNewOnes"] = true;
                }
                if (groupClient.addMembers(groupSessionObj, people, groupId))
                {
                    lbl_Notification.Text += "<p>User '" + name + "' successfully added to group '" + groupId + "'</p>";
                }
                else
                {
                    lbl_Notification.Text += "There was a problem adding the user to the group";
                }

                lbl_Notification.Visible = true;
                Session["NextLoadHideNotification"] = null;

                
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        protected void lstvw_AllPeople_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "RemovePersonFromGroup")
                {
                    SociosServices.SocialFilteringGroupService2.Person newPerson = new SociosServices.SocialFilteringGroupService2.Person();
                    newPerson.id = new SociosServices.SocialFilteringGroupService2.ObjectId();

                    newPerson.id.id = e.CommandArgument.ToString().Split(':')[1];
                    newPerson.id.source = new SociosServices.SocialFilteringGroupService2.Source();
                    newPerson.id.source.Item = new SociosServices.SocialFilteringGroupService2.KnownSns();



                    string socialNetwork = e.CommandArgument.ToString().Split(':')[0];
                    if (socialNetwork.ToLower() == "facebook")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.FACEBOOK;
                    else if (socialNetwork.ToLower() == "dailymotion")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.DAILYMOTION;
                    else if (socialNetwork.ToLower() == "flickr")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.FLICKR;
                    else if (socialNetwork.ToLower() == "googlep")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.GOOGLEP;
                    else if (socialNetwork.ToLower() == "instagram")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.INSTAGRAM;
                    else if (socialNetwork.ToLower() == "myspace")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.MYSPACE;
                    else if (socialNetwork.ToLower() == "twitter")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.TWITTER;
                    else if (socialNetwork.ToLower() == "youtube")
                        newPerson.id.source.Item = SociosServices.SocialFilteringGroupService2.KnownSns.YOUTUBE;


                    SociosServices.SocialFilteringGroupService2.Person[] people = new SociosServices.SocialFilteringGroupService2.Person[] { newPerson };
                    string currentGroupId = Session["Scenario1_CurrentGroup"].ToString();
                    groupClient.RemoveMembers(groupSessionObj, people, currentGroupId);
                    ListView lstvw_AllPeopleInGroup = (ListView)e.Item.Parent.Parent.Parent;
                    lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(currentGroupId);
                    lstvw_AllPeopleInGroup.DataBind();


                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }

        }

        protected void lstvw_ActivitiesAllPeople_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "FilterActivitiesByUser")
                {

                    foreach (var item in lstvw_AllGroupEvents.Items)
                    {
                        ((LinkButton)item.FindControl("lnkbtn_FilterByEvent")).CssClass = "";
                    }

                    foreach (var item in lstvw_AllPeopleInGroup.Items)
                    {
                        ((LinkButton)item.FindControl("lnkbtn_FilterByUser")).CssClass = "";
                    }
                    SetSearchResultsFilters(e.CommandArgument.ToString(), "userId_Id");
                    LinkButton trigger = (LinkButton)e.Item.FindControl("lnkbtn_FilterByUser");
                    trigger.CssClass = "activeUser";
                    //updtpnlSearchMedia.Update();


                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }

        }

        protected void lstvw_AllGroupEvents_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                // Make all user filters inactive
                foreach (var item in lstvw_AllPeopleInGroup.Items)
                {
                    ((LinkButton)item.FindControl("lnkbtn_FilterByUser")).CssClass = "";
                }
                if (e.CommandName == "FilterActivitiesByEvent")
                {
                    foreach (var item in lstvw_AllGroupEvents.Items)
                    {
                        ((LinkButton)item.FindControl("lnkbtn_FilterByEvent")).CssClass = "";
                    }
                    SetSearchResultsFilters(e.CommandArgument.ToString(), "eventId");
                    LinkButton trigger = (LinkButton)e.Item.FindControl("lnkbtn_FilterByEvent");
                    trigger.CssClass = "activeUser";
                    //updtpnlSearchMedia.Update();


                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }

        }

        protected void btn_AddPersonToGroup_Click(object sender, EventArgs e)
        {
            AddPersonToGroup(ddlAllGroups.SelectedValue, hdnfld_AddPersonName.Value, hdnfld_AddPersonId.Value, hdnfld_AddPersonSource.Value);
        }

        protected void lnkbtn_BackToAllGroups_Click(object sender, EventArgs e)
        {
            pnl_AllGroupFunctions.Visible = true;
            pnl_IndividualGroupFunctions.Visible = false;
            SociosServices.SocialFilteringGroupService2.Group[] groups = groupClient.GetGroups(groupSessionObj);
            lstvw_AllGroups.DataSource = (SociosServices.SocialFilteringGroupService2.Group[])Session["AllGroupsCache"];
            lstvw_AllGroups.DataBind();
            foreach (var item in lstvw_AllGroups.Items)
            {
                item.Visible = true;
                Panel pnl_CurrentManagePeople = (Panel)item.FindControl("pnl_ManagePeople");
                pnl_CurrentManagePeople.Visible = false;
            }
        }



        protected void btn_AddPersonToNewGroup_Click(object sender, EventArgs e)
        {

            string newGroupTitle = txt_AddUser_CreateGroupName.Text;
            string newGroupDescription = txt_AddUser_CreateGroupDescription.Text;
            SociosServices.SocialFilteringGroupService2.Group newGroup = CreateNewGroup(newGroupTitle, newGroupDescription);
            AddPersonToGroup(newGroup.id.id, hdnfld_AddPersonName.Value, hdnfld_AddPersonId.Value, hdnfld_AddPersonSource.Value);
            LoadAllGroups();
            if (Session["NotificationClearedForNewOnes"] == null)
            {
                lbl_Notification.Text = "";
                Session["NotificationClearedForNewOnes"] = true;
            }
            lbl_Notification.Visible = true;
            lbl_Notification.Text += "<p>New group '" + txt_AddUser_CreateGroupName.Text + "' successfully created</p>";
            Session["NextLoadHideNotification"] = null;
            txt_AddUser_CreateGroupName.Text = "";
            txt_AddUser_CreateGroupDescription.Text = "";
        }

        protected void lnkbtn_MenuShowSearchMedia_Click(object sender, EventArgs e)
        {
            //if (Request.QueryString["mode"] != null)
            if (UserInfo.IsInRole("Candidates"))
            {
                //string[] param = new string[1] { "v=" + (int)ScenarioView.SEARCH };
                //string url = DotNetNuke.Common.Globals.NavigateURL(66, "", param);
               // Response.Redirect(url, true);
            }
            // If the user is in the Search Media page and he clicks on the Search Media button again
            // then the Search page get reinitialised
            if (imgMediaSearch.ImageUrl == "Images/searchMediaActive.png")
            {
                Session["findGroupEventsCacheSessionId"] = null;
                Session["findMediaItemsCacheSessionId"] = null;
                Session["findGroupActivitiesCacheSessionId"] = null;
                lblCurrentMediaSearchTitle.Text = "Search Media";
                InitialiseSnTree();

            }

            if (Session["findGroupEventsCacheSessionId"] == null &&
                Session["findMediaItemsCacheSessionId"] == null &&
                Session["findGroupActivitiesCacheSessionId"] == null)
            {
                lblCurrentMediaSearchTitle.Text = "Search Media";
            }

            lblCurrentTitle.Visible = false;
            lblCurrentMediaSearchTitle.Visible = true;
            GoToSearchMediaPage();
            pnl_SearchPanel.Visible = true;
            radlstvwMediaItems.Visible = false;
            radlstvwMediaItems.DataSourceID = sqldtsrc_FindMediaItemsCache.ID;
            pnlBeforeFirstSearch.Visible = true;
            pnlFilterByUser.Visible = false;
            pnlFilterByEvent.Visible = false;

            // If a search has already been executed we want to show the mediaItems results
            // of that search and also the web controls associated to that kind of search
            // i.e "Filter by users" for activities

            if (Session["findMediaItemsCacheSessionId"] != null)
            {
                lblCurrentMediaSearchTitle.Text = "Search Media";
                pnlBeforeFirstSearch.Visible = false;
                radlstvwMediaItems.Visible = true;
            }

            if (Session["findGroupActivitiesCacheSessionId"] != null)
            {
                pnl_SearchPanel.Visible = false;
                radlstvwMediaItems.Visible = true;
                radlstvwMediaItems.DataSourceID = sqldtsrc_GetGroupActivitiesItemsCache.ID;
                radlstvwMediaItems.DataBind();
                pnlBeforeFirstSearch.Visible = false;
                pnlFilterByUser.Visible = true;
            }

            if (Session["findGroupEventsCacheSessionId"] != null)
            {
                pnl_SearchPanel.Visible = false;
                radlstvwMediaItems.Visible = true;
                radlstvwMediaItems.DataSourceID = sqldtsrc_GetGroupEventsItemsCache.ID;
                radlstvwMediaItems.DataBind();
                pnlBeforeFirstSearch.Visible = false;
                pnlFilterByUser.Visible = true;
                pnlFilterByEvent.Visible = true;
            }


        }

        protected void lnkbtn_MenuShowManageGroups_Click(object sender, EventArgs e)
        {
            GoToManageGroups();

            pnl_IndividualGroupFunctions.Visible = false;
            pnl_AllGroupFunctions.Visible = true;
        }

        protected void GoToManageGroups()
        {
            lblCurrentTitle.Text = "My Groups";

            lblCurrentTitle.Visible = true;
            lblCurrentMediaSearchTitle.Visible = false;

            LoadAllGroups();
            pnl_ManageGroups.Visible = true;
            pnl_MediaSearch.Visible = false;
            pnl_PoolOfContacts.Visible = false;
            imgMediaSearch.ImageUrl = "Images/searchMedia.png";
            imgManageGroups.ImageUrl = "Images/manageGroupsActive.png";
            imgPoolOfContacts.ImageUrl = "Images/poolOfContacts.png";
        }

        protected void lnkbtn_MenuShowPoolOfContacts_Click(object sender, EventArgs e)
        {
            GoToPoolOfContacts();
        }

        protected void GoToPoolOfContacts()
        {
            lblCurrentTitle.Text = "My Pool of Contacts";

            lblCurrentTitle.Visible = true;
            lblCurrentMediaSearchTitle.Visible = false;

            imgMediaSearch.ImageUrl = "Images/searchMedia.png";
            imgManageGroups.ImageUrl = "Images/manageGroups.png";
            imgPoolOfContacts.ImageUrl = "Images/poolOfContactsActive.png";

            Session["forceNoBalanceRefresh"] = false;
            RefreshAccessTokensFromDB();

            //SociosServices.TokenService.accessInfo[] accessInfo = (SociosServices.TokenService.accessInfo[])Session["UserAccessTokensCacheArray"];
            bool atLeastOneTokenAvailable = false;
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION))
            {
                lnbtn_GetDailymotionConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FLICKR))
            {
                lnbtn_GetFlickrConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE))
            {
                lnbtn_GetYoutubeConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM))
            {
                lnbtn_GetInstagramConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            //if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.TWITTER))
            //{
              //  lnbtn_GetTwitterConnnectedPeople.Visible = true;
              //  atLeastOneTokenAvailable = true;
            //}
            //if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE))
            //{
            //    lnbtn_GetMyspaceConnnectedPeople.Visible = true;
            //    atLeastOneTokenAvailable = true;
            //}
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK))
            {
                lnbtn_GetFacebookConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            if (!atLeastOneTokenAvailable)
            {
                pnlNoSnIdsAvailable.Visible = true;
            }
            else
            {
                lblSnsIdsAvailable.Visible = true;
            }

            //LoadAllGroups();
            pnl_ManageGroups.Visible = false;
            pnl_MediaSearch.Visible = false;
            pnl_PoolOfContacts.Visible = true;
        }


        protected void GetAndCacheLatestEvents(string groupId)
        {
            ClearSearchCacheSessionIds();
            SociosServices.EventDetectionService.Activity[] results = GetLatestEvents(groupId);
            // Dictionary<int, SociosServices.EventDetectionService.MediaItem> mediaItems = new Dictionary<int, SociosServices.EventDetectionService.MediaItem>();
            Dictionary<int, string> events = new Dictionary<int, string>();

            List<KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>> mediaItems = new List<KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>>();

            if (results != null)
            {
                int eventId = 0;
                foreach (SociosServices.EventDetectionService.Activity activity in results)
                {

                    if (activity != null && activity.mediaItems != null && activity.mediaItems.Length > 0)
                    {
                        //if (list.activity[0].mediaItems != null)
                        //{
                        string eventName = activity.title;
                        //foreach (var activity in list.activity)
                       // {

                           // if (activity.mediaItems != null)
                           // {
                                foreach (var mediaitem in activity.mediaItems)
                                {


                                    int currentEventId = eventId;

                                    KeyValuePair<int, SociosServices.EventDetectionService.MediaItem> mediaitemWithEvent =
                                      new KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>(currentEventId, mediaitem);
                                    mediaItems.Add(mediaitemWithEvent);

                                    // Creating list of events, so events can be filtered by eventId
                                    //if (!events.ContainsValue(list.activity[0].body))
                                    // {
                                    if (!events.ContainsKey(currentEventId))
                                    {
                                        //if (list.activity[0].body == null)
                                        //list.activity[0].body = "Event " + currentEventId;
                                        if (eventName == "")
                                        {
                                            eventName = "Event " + eventId;
                                        }
                                        events.Add(currentEventId, eventName/*list.activity[0].body*/);

                                    }
                                }
                                //}



                           // }
                        //}
                        //}

                    }
                    eventId++;
                }
            }

            lstvw_AllGroupEvents.DataSource = events;
            lstvw_AllGroupEvents.DataBind();





            // Store activity mediaitems

            Dictionary<int, KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>> itemsDictionary = new Dictionary<int, KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>>();
            int i = 0;

            foreach (var item in mediaItems)
            {
                itemsDictionary.Add(i, item);
                i++;
            }
            AddMediaItemsToCache(itemsDictionary);



            //radlstvw_GetEvents.DataSource = activities;
            //radlstvw_GetEvents.DataBind();
        }

        protected void ClearSearchCacheSessionIds()
        {
            Session["findGroupEventsCacheSessionId"] = null;
            Session["findMediaItemsCacheSessionId"] = null;
            Session["findGroupActivitiesCacheSessionId"] = null;
        }

        protected void GetAndCacheGroupActivities(string groupId)
        {
            ClearSearchCacheSessionIds();



            SociosServices.SocialFiltering.Activity[] activities = GetGroupActivities(groupId);
            List<SociosServices.SocialFiltering.MediaItem> mediaItems = new List<SociosServices.SocialFiltering.MediaItem>();
            if (activities != null)
            {
                foreach (var activity in activities)
                {
                    if (activity.mediaItems != null)
                    {
                        foreach (var mediaItem in activity.mediaItems)
                        {
                            mediaItems.Add(mediaItem);
                        }
                    }
                }
            }
            // Store activity mediaitems
            Dictionary<int, SociosServices.SocialFiltering.MediaItem> itemsDictionary = new Dictionary<int, SociosServices.SocialFiltering.MediaItem>();
            int i = 0;
            foreach (var item in mediaItems)
            {
                itemsDictionary.Add(i, item);
                i++;
            }
            AddMediaItemsToCache(itemsDictionary);
        }

        public string RenderEvent(SociosServices.EventDetectionService.Activity[] activities)
        {
            string response = "";

            foreach (SociosServices.EventDetectionService.Activity activity in activities)
            {
                response += "<div class='activity-media-item media-item-" + activity.appId.source.knownSns.ToString().ToLower() + "'>" +

                    "<div class='activity-title'>" + activity.title + "</div>" + "<div class='activity-body'><a href='" + activity.url + "'>" + activity.url + "</a></div></div>";
                //  activity.
                //   response += "<span></span>"
                //break;
            }

            //SociosServices.EventDetectionService.Activity currentActivity = 
            return response;
        }

        public string RenderActivityMediaItems(SociosServices.SocialFiltering.MediaItem[] mediaItems)
        {
            string response = "";
            if (mediaItems != null)
            {
                foreach (SociosServices.SocialFiltering.MediaItem item in mediaItems)
                {
                    //string title = item.title;
                    //string body = item.
                    response += //"<div class='activity-media-item media-item-" + activity.appId.source.knownSns.ToString().ToLower() + "'>" +

                        "<div class='activity-title'>" + item.title + "</div>" + "<div class='activity-body'><a href='" + item.url + "'>" + item.url + "</a>";
                    //response +="<div class='activity-mediaitem-author'>" + item.userId.id +"</div>";
                    response += "</div>";
                    break;
                    //  activity.
                    //   response += "<span></span>"
                }
            }

            //SociosServices.EventDetectionService.Activity currentActivity = 
            return response;
        }

        public string GetMediaItemIFrame(SociosServices.WebSkeletonServiceLive.ObjectId id, object itemUrl)
        {
            string url = "http://";
            if (id != null && id.source != null && itemUrl != null)
            {

                if (id.source.Item.ToString().ToLower() == "youtube")
                {

                    string[] attributes = id.id.Split(':');
                    int length = attributes.Length;

                    url += "www.youtube.com/embed/" + attributes[length - 1];
                }
                else if (id.source.Item.ToString().ToLower() == "dailymotion")
                {
                    url += "www.dailymotion.com/embed/video/" + id.id;
                }
                else if (id.source.Item.ToString().ToLower() == "flickr")
                {
                    if (itemUrl != null)
                        url = (string)itemUrl;
                }
                else
                {
                    return "";
                }
                urls.Add(url);
                return "<iframe width=\"560\" height=\"315\" src=\"" + url + "\" frameborder=\"0\" allowfullscreen></iframe>";

            }

            return "";







        }

        protected string GetPersonReputationScore(SociosServices.ReputationService.Person person)
        {
            double score = 0.0;
            score = reputationClient.GetPersonReputationScore(person);
            int test = 0;
            return score.ToString();
        }

        protected SociosServices.RecommendationService.Person[] GetRecommendedPersons(string keywords)
        {
            SociosServices.RecommendationService.Person[] persons = recommendationClient.GetRecommendedPersons(keywords);
            int test = 0;
            return persons;
        }



        public string GetMediaItemId(object source, object id)
        {
            try
            {
                SociosServices.WebSkeletonServiceLive.ObjectId itemId = (SociosServices.WebSkeletonServiceLive.ObjectId)id;

                string sourceString = "unknownSource";
                if (source as string != null)
                {
                    if (((string)source).ToLower() == "youtube")
                    {
                        sourceString = itemId.id;
                    }
                    else if (((string)source).ToLower() == "flickr")
                    {
                        sourceString = itemId.id;
                    }
                    else if (((string)source).ToLower() == "dailymotion")
                    {
                        sourceString = itemId.id;
                    }
                    else if (((string)source).ToLower() == "twitter")
                    {
                        sourceString = itemId.id;
                    }
                    else
                    {
                        sourceString = itemId.id;
                    }
                }
                else
                {
                    sourceString = itemId.id;
                }

                return sourceString;
            }
            catch (Exception ex)
            {
                return "error_retrieving_mediaitem_source";
            }
        }

        public string GetCachedMediaItemId(string source, string id)
        {
            try
            {
                // SociosServices.WebSkeletonServiceLive.ObjectId itemId = (SociosServices.WebSkeletonServiceLive.ObjectId)id;

                string sourceString = "unknownSource";
                if (source as string != null)
                {
                    if (((string)source).ToLower() == "youtube")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else if (((string)source).ToLower() == "flickr")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else if (((string)source).ToLower() == "dailymotion")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else if (((string)source).ToLower() == "twitter")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else if (((string)source).ToLower() == "facebook")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else if (((string)source).ToLower() == "myspace")
                    {
                        sourceString = source.ToLower() + "_" + id;
                    }
                    else
                    {
                        sourceString = source.ToLower() + id;
                    }
                }
                else
                {
                    sourceString += id;
                }

                return sourceString;
            }
            catch (Exception ex)
            {
                return "error_retrieving_mediaitem_source";
            }
        }

        public string GetMediaItemSource(object source)
        {
            try
            {
                if (source as string != null)
                {
                    if (((string)source).ToLower() == "youtube")
                    {
                        return "youtube";
                    }
                    else if (((string)source).ToLower() == "flickr")
                    {
                        return "flickr";
                    }
                    else if (((string)source).ToLower() == "facebook")
                    {
                        return "facebook";
                    }
                    else if (((string)source).ToLower() == "dailymotion")
                    {
                        return "dailymotion";
                    }
                    else if (((string)source).ToLower() == "twitter")
                    {
                        return "twitter";
                    }
                    else if (((string)source).ToLower() == "myspace")
                    {
                        return "myspace";
                    }
                }


                SociosServices.WebSkeletonServiceLive.KnownSns sourceFormatted = new SociosServices.WebSkeletonServiceLive.KnownSns();

                if (source != null)
                {
                    // sourceFormatted = (SociosServices.WebSkeletonServiceLive.KnownSns)source;

                    return sourceFormatted.ToString().ToLower();
                }
                return "no-source-found";
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return error;
            }
        }

        public string GetCachedMediaItemSource(string source)
        {
            try
            {
                if (source as string != null)
                {
                    if (((string)source).ToLower() == "youtube")
                    {
                        return "youtube";
                    }
                    else if (((string)source).ToLower() == "flickr")
                    {
                        return "flickr";
                    }
                    else if (((string)source).ToLower() == "dailymotion")
                    {
                        return "dailymotion";
                    }
                    else if (((string)source).ToLower() == "twitter")
                    {
                        return "twitter";
                    }
                    else if (((string)source).ToLower() == "facebook")
                    {
                        return "facebook";
                    }
                    else if (((string)source).ToLower() == "myspace")
                    {
                        return "myspace";
                    }
                    else if (((string)source).ToLower() == "googlep")
                    {
                        return "googlep";
                    }
                    else if (((string)source).ToLower() == "instagram")
                    {
                        return "instagram";
                    }
                }


                SociosServices.WebSkeletonServiceLive.KnownSns sourceFormatted = new SociosServices.WebSkeletonServiceLive.KnownSns();

                if (source != null)
                {
                    // sourceFormatted = (SociosServices.WebSkeletonServiceLive.KnownSns)source;

                    return sourceFormatted.ToString().ToLower();
                }
                return "no-source-found";
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return error;
            }
        }

        public string GetUserPhotoUrl(string sociosUserInfo)
        {
            try
            {
                string[] itemUserInfo = sociosUserInfo.ToString().Split(':');
                if (itemUserInfo.Length > 1)
                {
                    //string userSnsId =
                    if (itemUserInfo[1].ToLower() == "facebook")
                    {
                        return "http://graph.facebook.com/" + itemUserInfo[0] + "/picture";
                    }
                    else
                    {
                    }

                    //GetProfileUrl(e.CommandArgument.ToString().Split(':')[0], e.CommandArgument.ToString().Split(':')[1]);

                } return "http://frontend.sociosproject.eu/images/no-profile.png";
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                return ex.Message;
            }
        }

        protected string GetProfileUrl()
        {
            //string userId = "13403905@N03";
            ////SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            string profileUrl = "";// client.GetPersonUsername(userId, SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);
            return profileUrl;

        }

        protected void CheckAccessTokensStatus()
        {
            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            //tokenClient.SetUserAccessToken(99, 2, "testAccessTokenFromFrontEnd");

        }

        protected void RefreshAccessTokensFromDB()
        {
            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            SociosServices.TokenService.accessInfo[] accessInfo = tokenClient.GetUserTokens(UserInfo.UserID);
            Session["UserAccessTokensCacheArray"] = accessInfo;
            accessInfoDictionary.Clear();
            if (accessInfo != null)
            {
                foreach (SociosServices.TokenService.accessInfo info in accessInfo)
                {
                    SociosServices.SociosUtil.UtilSocialNetwork currentSn = SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK;
                    int c = info.accessInfoPK.snsId;
                    if (c == 1)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.FLICKR;
                    else if (c == 2)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK;
                    else if (c == 3)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.TWITTER;
                    else if (c == 4)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE;
                    else if (c == 5)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE;
                    else if (c == 6)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION;
                    else if (c == 8)
                        currentSn = SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM;

                    accessInfoDictionary.Add(currentSn, info);
                    //accessInfo.SetValue(currentSn,info);

                }
                Session["UserAccessTokensCache"] = accessInfoDictionary;
            }
        }

        protected void lnkbtn_RefreshAccess_Click(object sender, EventArgs e)
        {
            //SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();


            RefreshAccessTokensFromDB();
            accessInfo[] info = (accessInfo[])Session["UserAccessTokensCache"];
            if (Session["UserAccessTokensCacheArray"] != null)
            {
                //info = (accessInfo[])Session["UserAccessTokensCacheArray"];
            }
            else
            {
                //info = tokenClient.GetUserTokens(Convert.ToInt32(txtUserId.Text));
            }

            Dictionary<int, string> snsIdsList = new Dictionary<int, string>();
            if (info != null)
            {
                //lbl_AccessInfo.Text = ""; // GET_ACCESS_TOKENS

                int i = 0; // number of tokens found





                foreach (accessInfo token in info)
                {
                    snsIdsList.Add(token.accessInfoPK.snsId, token.accessToken);
                }


            }
            else
            {
                //lbl_AccessInfo.Text = "<br/>No access tokens available for user: " + txtUserId.Text; // GET_ACCESS_TOKENS
            }
            //string[] snsNames = { "facebook", "twitter", "flickr", "youtube", "dailymotion" };
            Dictionary<int, string> allSnsNamesInts = new Dictionary<int, string>();
            allSnsNamesInts.Add(1, "flickr");
            allSnsNamesInts.Add(2, "facebook");
            allSnsNamesInts.Add(3, "twitter");
            allSnsNamesInts.Add(4, "youtube");
            allSnsNamesInts.Add(5, "myspace");
            allSnsNamesInts.Add(6, "dailymotion");
            // List<string> snsNamesList = new List<string>(snsNames);
            //int[] snsIds = { 1, 2, 3, 4, 5, 6 };
            // List<int> snsIdsList = new List<int>(snsIds); 
            foreach (KeyValuePair<int, string> snName in allSnsNamesInts)
            {
                bool tokenAvailable = false;
                string accessToken = "";
                if (info != null)
                {

                    if (snsIdsList.ContainsKey(snName.Key))
                    {
                        tokenAvailable = true;
                        //accessToken = token.accessToken;
                    }

                }
                if (tokenAvailable)
                {
                    //lbl_AccessInfo.Text += "<img alt='" + accessToken + "'  src='DesktopModules/Socios_Scenario1/Images/" + snName.Value.ToLower() + ".png'/>"; // GET_ACCESS_TOKENS

                }
                else
                {
                    //lbl_AccessInfo.Text += "<img alt='" + accessToken + "' src='DesktopModules/Socios_Scenario1/Images/" + snName.Value.ToLower() + "-bw.png'/>"; // GET_ACCESS_TOKENS
                }

            }
        }

        protected void lnkbtn_GetConnectedPeople_Click(object sender, EventArgs e)
        {
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            List<SociosServices.WebSkeletonServiceLive.KnownSns> sources = new List<SociosServices.WebSkeletonServiceLive.KnownSns>();
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION);
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK);
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE);
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER);
            sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE);

            // -- FlickR (worked)
            //string userId = "35592727@N03";
            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR;

            // -- Facebook (not worked)
            //string userId = "100001570512130";
            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;


            // -- Dailymotion (worked)
            //string userId = "xlbjg5";
            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION;

            // -- YouTube (not worked / requires authentication)
            //string userId = "xpmp3";
            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE;

            // -- Myspace (not worked)
            //string userId = "slauriere@gmail.com";
            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE;

            // -- Twitter (not worked)
            string userId = "digitalps";
            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER;


            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetConnectedPersons(userId, source);
            int test = 1;
            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }


            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataBind();

        }






        protected void lnbtn_GetFlickrConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            // cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)

            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.FLICKR].snsUserId;// "35592727@N03";

            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetConnectedPersons(userId, source);


            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
                else
                {
                    Session["connectedPersonsCacheSessionId"] = "-1";
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();
        }

        protected void lnbtn_GetTwitterConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)

            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.TWITTER].snsUserId;// "35592727@N03";

            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetMyConnectedPersons(UserId, userId, source);


            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();
        }

        protected void lnbtn_GetFacebookConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)

            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK].snsUserId;// "35592727@N03";

            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetMyConnectedPersons(UserId, userId, source);


            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();
        }

        //protected void lnbtn_GetMyspaceConnnectedPeople_Click(object sender, EventArgs e)
        //{
        //    cbbx_ConnectedPersons.Visible = false;
        //    Session["connectedPersonsCacheSessionId"] = -1;
        //    radlstvwConnectedPersons.Visible = true;
        //    //cbbx_ConnectedPersons.Visible = true;
        //    SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
        //    // -- Dailymotion (worked)

        //    accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
        //    string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE].snsUserId;// "35592727@N03";

        //    SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE;
        //    SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetMyConnectedPersons(UserId, userId, source);


        //    bool USE_CACHED_RESULTS = false;
        //    if (!USE_CACHED_RESULTS)
        //    {
        //        if (persons != null && persons.Length > 0)
        //        {
        //            List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
        //            AddConnectedPersonsToCache(people);
        //        }
        //    }
        //    else
        //    {
        //        Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
        //    }
        //    //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
        //    radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
        //    radlstvwConnectedPersons.DataBind();
        //}

        protected string GetUsernameFromUserId(string userId, SociosServices.WebSkeletonServiceLive.KnownSns source)
        {
            return "";
        }

        protected void lnbtn_GetDailymotionConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)
            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];

            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION].snsUserId;
            //string userId = "xlbjg5";
            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetConnectedPersons(userId, source);
            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();
        }


        protected void lnbtn_GetYoutubeConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)

            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].snsUserId;// "35592727@N03";

            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetMyConnectedPersons(UserId, userId, source);


            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();
        }


        protected void lnbtn_GetInstagramConnnectedPeople_Click(object sender, EventArgs e)
        {
            //cbbx_ConnectedPersons.Visible = false;
            //Session["connectedPersonsCacheSessionId"] = -1;
            //radlstvwConnectedPersons.Visible = true;
            ////cbbx_ConnectedPersons.Visible = true;
            //SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            //// -- Dailymotion (worked)

            //accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            //string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].snsUserId;// "35592727@N03";

            //SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE;
            //SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetMyConnectedPersons(UserId, userId, source);


            //bool USE_CACHED_RESULTS = false;
            //if (!USE_CACHED_RESULTS)
            //{
            //    if (persons != null && persons.Length > 0)
            //    {
            //        List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
            //        AddConnectedPersonsToCache(people);
            //    }
            //}
            //else
            //{
            //    Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            //}
            ////radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            //radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            //radlstvwConnectedPersons.DataBind();


            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)
            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];

            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM].snsUserId;
            //string userId = "xlbjg5";
            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.INSTAGRAM;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetConnectedPersons(userId, source);
            bool USE_CACHED_RESULTS = false;
            if (!USE_CACHED_RESULTS)
            {
                if (persons != null && persons.Length > 0)
                {
                    List<SociosServices.WebSkeletonServiceLive.Person> people = new List<SociosServices.WebSkeletonServiceLive.Person>(persons);
                    AddConnectedPersonsToCache(people);
                }
            }
            else
            {
                Session["connectedPersonsCacheSessionId"] = "188eadd8-0691-4566-9fe4-ba05cae50c93";
            }
            //radlstvwConnectedPersons.DataSource = sqldtsrc_ConnectedPersonsCache;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonsCache.ID;
            radlstvwConnectedPersons.DataBind();

        }














        protected void lnkbtn_AddPersonToGroup_Click(object sender, EventArgs e)
        {

            AddPersonToGroup("id-fe620a36-4292-4f2f-b535-ab4e8b77b01b", "Paul", "idofperson", "facebook");
        }

        protected SociosServices.WebSkeletonServiceLive.Person GetPerson(string username, SociosServices.WebSkeletonServiceLive.KnownSns source, out bool personFound)
        {
            SociosUtil.Log("Calling GetPerson()...");
            Stopwatch timer = new Stopwatch();
            timer.Start();
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            personFound = false;
            SociosServices.WebSkeletonServiceLive.Person[] persons = client.GetPerson(username, source);
            SociosUtil.Log("GetPerson() Complete. People count: " + persons.Length, timer.ElapsedMilliseconds);
            if (persons.Length > 0)
            {
                personFound = true;
                return persons[0];
            }

            return new SociosServices.WebSkeletonServiceLive.Person();
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

            e.InputParameters["parameter1"] = TextBox6.Text;
            e.InputParameters["parameter2"] = TextBox7.Text;
        }

        public List<SociosServices.WebSkeletonServiceLive.MediaItem> GetFindMediaItemsResultsCache()
        {
            if (Session["FindMediaItemsResultsCache"] != null)
            {
                return (List<SociosServices.WebSkeletonServiceLive.MediaItem>)Session["FineMediaItemsResultsCache"];
            }
            else
            {
                return new List<SociosServices.WebSkeletonServiceLive.MediaItem>();
            }
        }


        //    private void Log(string logString, double timeElapsedMilliseconds)
        //{
        //        string logEntry = "[" + DateTime.Now.ToString("MMM ddd d HH:mm:ss:fff") + "] " + logString;
        //        if(timeElapsedMilliseconds > -1)
        //        {
        //            logEntry += " | "+ TimeSpan.FromMilliseconds(timeElapsedMilliseconds).TotalSeconds + "sec";
        //        }
        //    System.Diagnostics.Debug.WriteLine( logEntry);

        //}


        protected void AddMediaItemsToCache(Dictionary<int, KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>> items)
        {
            try
            {
                // Setting the other sessionIds to null so back end understands
                // the current "Mediaitem display mode" we are currently in
                Session["findGroupActivitiesCacheSessionId"] = null;
                Session["findMediaItemsCacheSessionId"] = null;

                Guid guid = Guid.NewGuid();
                Session["findGroupEventsCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                //if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                //{
                CountItemsPerSn(items.Values);

                //}
                foreach (var item in items)
                {

                    // Count results while were adding them to the Database

                    string userId_Id = "";
                    if (item.Value.Value.userId != null)
                    {
                        userId_Id = item.Value.Value.userId.id;
                    }

                    string itemString = "notSet";
                    if (item.Value.Value.userId != null)
                    {
                        itemString = item.Value.Value.userId.source.knownSns.ToString().ToLower();
                        if (itemString == "facebook")
                        {

                        }
                    }
                    else
                    {
                        itemString = item.Value.Value.id.source.knownSns.ToString().ToLower();
                    }



                    string url = "";
                    if (item.Value.Value.url != null)
                    {
                        url = item.Value.Value.url;
                    }

                    string title = "";
                    if (item.Value.Value.title != null)
                    {
                        title = item.Value.Value.title;

                    }

                    if (title.Length == 0)
                    {
                        if (item.Value.Value.description != null)
                        {
                            title = item.Value.Value.description;
                            if (title.Length > 50)
                                title = title.Substring(0, 49) + "..";
                        }

                    }
                    //item.userId.source.Item.
                    string thumbnailUrl = "";
                    if (item.Value.Value.thumbnailUrl != null)
                    {
                        thumbnailUrl = item.Value.Value.thumbnailUrl;

                    }

                    //string idPar = item.id.;
                    string description = "";
                    if (item.Value.Value.description != null)
                    {
                        description = item.Value.Value.description;
                    }
                    string tags = "";
                    if (item.Value.Value.tags != null)
                    {
                        tags = item.Value.Value.tags;
                    }
                    string id_id = "";
                    if (item.Value.Value.id != null && item.Value.Value.id.id != null)
                    {
                        id_id = item.Value.Value.id.id;
                    }



                    DateTime createdDate = item.Value.Value.created;
                    bool createdDateSpecified = true;
                    if (createdDate.Year < 1970 || createdDate.Year > 2050)
                    {
                        createdDateSpecified = false;
                        createdDate = DateTime.Now;
                    }


                    SqlParameter userId_IdPar = new SqlParameter("@userId_Id", userId_Id);
                    SqlParameter itemPar = new SqlParameter("@Item", itemString);
                    SqlParameter urlPar = new SqlParameter("@Url", url);
                    SqlParameter titlePar = new SqlParameter("@Title", title);
                    SqlParameter thumbnailUrlPar = new SqlParameter("@ThumbnailUrl", thumbnailUrl);
                    SqlParameter idPar = new SqlParameter("@Id", "");
                    SqlParameter descriptionPar = new SqlParameter("@Description", description);
                    SqlParameter tagsPar = new SqlParameter("@Tags", tags);
                    SqlParameter sessionIdPar = new SqlParameter("@sessionId", sessionId);
                    SqlParameter id_idPar = new SqlParameter("@Id_Id", id_id);
                    SqlParameter createdPar = new SqlParameter("@createdDate", createdDate);
                    SqlParameter createdDateSpecifiedPar = new SqlParameter("@createdDateSpecified", createdDateSpecified);

                    SqlParameter cacheDictionaryIdPar = new SqlParameter("@cacheDictionaryId", item.Key);


                    SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", "-1");

                    SqlParameter eventIdPar = new SqlParameter("@eventId", item.Value.Key);


                    SqlHelper.ExecuteScalar(tr, CommandType.Text, "INSERT INTO socios_FindMediaItemsCache (userId_Id, Item,Url, Title, ThumbnailUrl, Id, Description, Tags, SessionId, Id_Id, createdDate, createdDateSpecified, cacheDictionaryId, mirsRanking, eventId) VALUES (@userId_Id, @Item,@Url, @Title, @ThumbnailUrl, @Id, @Description, @Tags, @SessionId, @Id_Id, @createdDate, @createdDateSpecified, @cacheDictionaryId, @mirsRanking, @eventId)", userId_IdPar, itemPar, urlPar, titlePar, thumbnailUrlPar, idPar, descriptionPar, tagsPar, sessionIdPar, id_idPar, createdPar, createdDateSpecifiedPar, cacheDictionaryIdPar, mirsRankingPar, eventIdPar);
                }

                tr.Commit();
                conn.Close();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }

        protected void RegisterSearchInHistory(string searchTerms, string searchGuid, int resultsCount)
        {
            SqlParameter searchTermsPar = new SqlParameter("@SearchTerms", searchTerms);
            SqlParameter UserIdPar = new SqlParameter("@UserId", UserId);
            SqlParameter SearchGuidPar = new SqlParameter("@SearchGuid", searchGuid);
            SqlParameter ResultsCountPar = new SqlParameter("@ResultsCount", resultsCount);

            int facebookResults = -1;
            if (resultsPerSn.ContainsKey("facebook"))
                facebookResults = resultsPerSn["facebook"];
            SqlParameter FacebookResultsPar = new SqlParameter("@FacebookResults", facebookResults);

            int twitterResults = -1;
            if (resultsPerSn.ContainsKey("twitter"))
                twitterResults = resultsPerSn["twitter"];
            SqlParameter TwitterResultsPar = new SqlParameter("@TwitterResults", twitterResults);

            int dailymotionResults = -1;
            if (resultsPerSn.ContainsKey("dailymotion"))
                dailymotionResults = resultsPerSn["dailymotion"];
            SqlParameter DailymotionResultsPar = new SqlParameter("@DailymotionResults", dailymotionResults);

            int youtubeResults = -1;
            if (resultsPerSn.ContainsKey("youtube"))
                youtubeResults = resultsPerSn["youtube"];
            SqlParameter YoutubeResultsPar = new SqlParameter("@YoutubeResults", youtubeResults);

            int flickrResults = -1;
            if (resultsPerSn.ContainsKey("flickr"))
                flickrResults = resultsPerSn["flickr"];
            SqlParameter FlickrResultsPar = new SqlParameter("@FlickrResults", flickrResults);

            int myspaceResults = -1;
            if (resultsPerSn.ContainsKey("myspace"))
                myspaceResults = resultsPerSn["myspace"];
            SqlParameter MyspaceResultsPar = new SqlParameter("@MyspaceResults", myspaceResults);

            int googlepResults = -1;
            if (resultsPerSn.ContainsKey("googlep"))
                googlepResults = resultsPerSn["googlep"];
            SqlParameter GooglepResultsPar = new SqlParameter("@GooglepResults", googlepResults);



            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            conn.Open();
            SqlHelper.ExecuteScalar(conn, CommandType.Text, "INSERT INTO socios_MediaItemsSearchHistory (SearchTerms, UserId, SearchDate, SearchGuid, ResultsCount, FacebookResults, TwitterResults, DailymotionResults, YoutubeResults, FlickrResults, MyspaceResults, GooglepResults) VALUES (@SearchTerms, @UserId, getdate(), @SearchGuid, @ResultsCount, @FacebookResults, @TwitterResults, @DailymotionResults, @YoutubeResults, @FlickrResults, @MyspaceResults, @GooglepResults)", searchTermsPar, UserIdPar, SearchGuidPar, ResultsCountPar, FacebookResultsPar, TwitterResultsPar, DailymotionResultsPar, YoutubeResultsPar, FlickrResultsPar, MyspaceResultsPar, GooglepResultsPar);
            conn.Close();

        }

        protected void AddMediaItemsToCache(Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> items)
        {
            try
            {
                // oh he doesnt have a country to defend X-O


                // Setting the other sessionIds to null so back end understands
                // the current "Mediaitem display mode" we are currently in
                Session["findGroupActivitiesCacheSessionId"] = null;
                Session["findGroupEventsCacheSessionId"] = null;

                Guid guid = Guid.NewGuid();
                Session["findMediaItemsCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                //SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                // if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                //{
                CountItemsPerSn(items.Values);

                // }
                foreach (KeyValuePair<int, SociosServices.WebSkeletonServiceLive.MediaItem> item in items)
                {

                    // Count results while were adding them to the Database
                    if (item.Value != null)
                    {
                        string userId_Id = "";
                        if (item.Value.userId != null)
                        {
                            userId_Id = item.Value.userId.id;
                        }

                        string itemString = "notSet";
                        if (item.Value != null && item.Value.userId != null)
                        {
                            if (item.Value.userId.source != null)
                            {
                                itemString = item.Value.userId.source.Item.ToString().ToLower();
                            }
                            else
                            {
                                itemString = item.Value.id.source.Item.ToString().ToLower();
                            }
                        }
                        else
                        {
                            itemString = item.Value.id.source.Item.ToString().ToLower();
                        }

                        
                            



                        string url = "";
                        if (item.Value.url != null)
                        {
                            url = item.Value.url;
                        }

                        string title = "";
                        if (item.Value.title != null)
                        {
                            title = item.Value.title;
                            

                        }

                        if (title.Length == 0)
                        {
                            if (item.Value.description != null)
                            {
                                title = item.Value.description;
                                if (title.Length > 50)
                                    title = title.Substring(0, 49) + "..";
                            }
                            if(title.Length == 0)
                                    title = "No title";

                        }
                        //item.userId.source.Item.
                        string thumbnailUrl = "";
                        if (item.Value.thumbnailUrl != null)
                        {
                            thumbnailUrl = item.Value.thumbnailUrl;

                        }

                        //string idPar = item.id.;
                        string description = "";
                        if (item.Value.description != null)
                        {
                            description = item.Value.description;
                        }
                        string tags = "";
                        if (item.Value.tags != null)
                        {
                            tags = item.Value.tags;
                        }
                        string id_id = "";
                        if (item.Value.id.id != null)
                        {
                            id_id = item.Value.id.id;
                        }



                        DateTime createdDate = item.Value.created;
                        bool createdDateSpecified = true;
                        if (createdDate.Year < 1970 || createdDate.Year > 2050)
                        {
                            createdDateSpecified = false;
                            createdDate = DateTime.Now.AddMonths(-24);
                        }


                        string licenseType = "unknown";
                        string licenseUrl = "#";
                        if (item.Value.license != null)
                        {
                            if (item.Value.license.licenseType != null)
                                licenseType = item.Value.license.licenseType.ToString();
                            if (item.Value.license.url != null)
                                licenseUrl = item.Value.license.url;
                        }
                        if (rdbtnCcLicense.Checked)
                        {
                            licenseType = "CC";
                        }

                        string mediaType = "UNKNOWN";
                        if (item.Value.type != null)
                        {
                            mediaType = item.Value.type.ToString();
                        }

                        //if (itemString == "twitter")
                        //    mediaType = "TEXT";
                        //else if (itemString == "dailymotion")
                        //    mediaType = "VIDEO";
                        //else if (itemString == "youtube")
                        //    mediaType = "VIDEO";
                        //else if (itemString == "flickr")
                        //    mediaType = "IMAGE";
                        //else if (itemString == "instagram")
                        //    mediaType = "IMAGE";
                        //else if (itemString == "myspace")
                        //    mediaType = "VIDEO";
                        //else if (itemString == "googleplus")
                        //    mediaType = "VIDEO";

                        SqlParameter userId_IdPar = new SqlParameter("@userId_Id", userId_Id);
                        SqlParameter itemPar = new SqlParameter("@Item", itemString);
                        SqlParameter urlPar = new SqlParameter("@Url", url);
                        SqlParameter titlePar = new SqlParameter("@Title", title);
                        SqlParameter thumbnailUrlPar = new SqlParameter("@ThumbnailUrl", thumbnailUrl);
                        SqlParameter idPar = new SqlParameter("@Id", "");
                        SqlParameter descriptionPar = new SqlParameter("@Description", description);
                        SqlParameter tagsPar = new SqlParameter("@Tags", tags);
                        SqlParameter sessionIdPar = new SqlParameter("@sessionId", sessionId);
                        SqlParameter id_idPar = new SqlParameter("@Id_Id", id_id);
                        SqlParameter createdPar = new SqlParameter("@createdDate", createdDate);
                        SqlParameter createdDateSpecifiedPar = new SqlParameter("@createdDateSpecified", createdDateSpecified);
                        SqlParameter licenseTypePar = new SqlParameter("@licenseType", licenseType);
                        SqlParameter licenseUrlPar = new SqlParameter("@licenseUrl", licenseUrl);
                        SqlParameter cacheDictionaryIdPar = new SqlParameter("@cacheDictionaryId", item.Key);
                        SqlParameter mediaTypePar = new SqlParameter("@mediaType", mediaType);

                        SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", "-1");


                        SqlHelper.ExecuteScalar(conn, CommandType.Text, "INSERT INTO socios_FindMediaItemsCache (userId_Id, Item,Url, Title, ThumbnailUrl, Id, Description, Tags, SessionId, Id_Id, createdDate, createdDateSpecified, cacheDictionaryId, mirsRanking, licenseType, licenseUrl, mediaType) VALUES (@userId_Id, @Item,@Url, @Title, @ThumbnailUrl, @Id, @Description, @Tags, @SessionId, @Id_Id, @createdDate, @createdDateSpecified, @cacheDictionaryId, @mirsRanking, @licenseType, @licenseUrl, @mediaType)", userId_IdPar, itemPar, urlPar, titlePar, thumbnailUrlPar, idPar, descriptionPar, tagsPar, sessionIdPar, id_idPar, createdPar, createdDateSpecifiedPar, cacheDictionaryIdPar, licenseTypePar, licenseUrlPar, mirsRankingPar, mediaTypePar);
                    }



                    //tr.Commit();
                    conn.Close();

                    
                }
                //if (Request.QueryString["mode"] == null)
                if (UserInfo.IsInRole("Journalists"))
                {
                    RegisterSearchInHistory(txtSearch.Text, Session["findMediaItemsCacheSessionId"].ToString(), items.Count);
                    dnnlstvw_SearchHistory.DataBind();

                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }

        protected void AddMediaItemsToCache(Dictionary<int, SociosServices.RecommendationService.MediaItem> items)
        {
            try
            {
                // Setting the other sessionIds to null so back end understands
                // the current "Mediaitem display mode" we are currently in
                Session["findGroupActivitiesCacheSessionId"] = null;
                Session["findGroupEventsCacheSessionId"] = null;

                Guid guid = Guid.NewGuid();
                Session["findMediaItemsCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                // if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                //{
                CountItemsPerSn(items.Values);

                //}
                foreach (KeyValuePair<int, SociosServices.RecommendationService.MediaItem> item in items)
                {

                    // Count results while were adding them to the Database



                    string userId_Id = "";
                    string itemString = "notSet";
                    if (item.Value.userId != null)
                    {
                        userId_Id = item.Value.userId.id;
                        if (item.Value.userId.source.knownSns != null)
                        {
                            itemString = item.Value.userId.source.knownSns.ToString().ToLower();
                        }
                    }







                    string url = "";
                    if (item.Value.url != null)
                    {
                        url = item.Value.url;
                    }

                    string title = "";
                    if (item.Value.title != null)
                    {
                        title = item.Value.title;

                    }

                    if (title.Length == 0)
                    {
                        if (item.Value.description != null)
                        {
                            title = item.Value.description;
                            if (title.Length > 50)
                                title = title.Substring(0, 49) + "..";
                        }

                    }
                    //item.userId.source.Item.
                    string thumbnailUrl = "";
                    if (item.Value.thumbnailUrl != null)
                    {
                        thumbnailUrl = item.Value.thumbnailUrl;

                    }

                    //string idPar = item.id.;
                    string description = "";
                    if (item.Value.description != null)
                    {
                        description = item.Value.description;
                    }
                    string tags = "";
                    if (item.Value.tags != null)
                    {
                        tags = item.Value.tags;
                    }
                    string id_id = "";
                    if (item.Value.id.id != null)
                    {
                        id_id = item.Value.id.id;
                    }



                    DateTime createdDate = item.Value.created;
                    bool createdDateSpecified = true;
                    if (createdDate.Year < 1970 || createdDate.Year > 2050)
                    {
                        createdDateSpecified = false;
                        createdDate = DateTime.Now;
                    }

                    string mirsRanking = item.Value.rating.ToString();



                    SqlParameter userId_IdPar = new SqlParameter("@userId_Id", userId_Id);
                    SqlParameter itemPar = new SqlParameter("@Item", itemString);
                    SqlParameter urlPar = new SqlParameter("@Url", url);
                    SqlParameter titlePar = new SqlParameter("@Title", title);
                    SqlParameter thumbnailUrlPar = new SqlParameter("@ThumbnailUrl", thumbnailUrl);
                    SqlParameter idPar = new SqlParameter("@Id", "");
                    SqlParameter descriptionPar = new SqlParameter("@Description", description);
                    SqlParameter tagsPar = new SqlParameter("@Tags", tags);
                    SqlParameter sessionIdPar = new SqlParameter("@sessionId", sessionId);
                    SqlParameter id_idPar = new SqlParameter("@Id_Id", id_id);
                    SqlParameter createdPar = new SqlParameter("@createdDate", createdDate);
                    SqlParameter createdDateSpecifiedPar = new SqlParameter("@createdDateSpecified", createdDateSpecified);

                    SqlParameter cacheDictionaryIdPar = new SqlParameter("@cacheDictionaryId", item.Key);

                    SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", mirsRanking);





                    SqlHelper.ExecuteScalar(tr, CommandType.Text, "INSERT INTO socios_FindMediaItemsCache (userId_Id, Item,Url, Title, ThumbnailUrl, Id, Description, Tags, SessionId, Id_Id, createdDate, createdDateSpecified, cacheDictionaryId, mirsRanking) VALUES (@userId_Id, @Item,@Url, @Title, @ThumbnailUrl, @Id, @Description, @Tags, @SessionId, @Id_Id, @createdDate, @createdDateSpecified, @cacheDictionaryId, @mirsRanking)", userId_IdPar, itemPar, urlPar, titlePar, thumbnailUrlPar, idPar, descriptionPar, tagsPar, sessionIdPar, id_idPar, createdPar, createdDateSpecifiedPar, cacheDictionaryIdPar, mirsRankingPar);
                }

                tr.Commit();
                conn.Close();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }

        protected void AddMediaItemsToCache(Dictionary<int, SociosServices.SocialFiltering.MediaItem> items)
        {
            try
            {
                // Setting the other sessionIds to null so back end understands
                // the current "Mediaitem display mode" we are currently in
                Session["findMediaItemsCacheSessionId"] = null;
                Session["findGroupEventsCacheSessionId"] = null;



                Guid guid = Guid.NewGuid();
                Session["findGroupActivitiesCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                //if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                //{
                CountItemsPerSn(items.Values);

                //}
                foreach (KeyValuePair<int, SociosServices.SocialFiltering.MediaItem> item in items)
                {

                    // Count results while were adding them to the Database



                    string userId_Id = "";
                    string itemString = "notSet";
                    if (item.Value.userId != null)
                    {
                        userId_Id = item.Value.userId.id;
                        if (item.Value.userId.source.Item != null)
                        {
                            itemString = item.Value.userId.source.Item.ToString().ToLower();
                        }
                    }
                    else
                    {
                        itemString = item.Value.id.source.Item.ToString();
                    }







                    string url = "";
                    if (item.Value.url != null)
                    {
                        url = item.Value.url;
                    }

                    string title = "";
                    if (item.Value.title != null)
                    {
                        title = item.Value.title;

                    }

                    if (title.Length == 0)
                    {
                        
                            
                      
                        if (item.Value.description != null)
                        {
                            title = item.Value.description;
                            if (title.Length > 50)
                                title = title.Substring(0, 49) + "..";
                        }
                        if (title.Length == 0)
                            title = "No title";
                        

                    }
                    //item.userId.source.Item.
                    string thumbnailUrl = "";
                    if (item.Value.thumbnailUrl != null)
                    {
                        thumbnailUrl = item.Value.thumbnailUrl;

                    }

                    //string idPar = item.id.;
                    string description = "";
                    if (item.Value.description != null)
                    {
                        description = item.Value.description;
                    }
                    string tags = "";
                    if (item.Value.tags != null)
                    {
                        tags = item.Value.tags;
                    }
                    string id_id = "";
                    if (item.Value.id != null && item.Value.id.id != null)
                    {
                        id_id = item.Value.id.id;
                    }



                    DateTime createdDate = item.Value.created;
                    bool createdDateSpecified = true;
                    if (createdDate.Year < 1970 || createdDate.Year > 2050)
                    {
                        createdDateSpecified = false;
                        createdDate = DateTime.Now;
                    }

                    //string mirsRanking = item.Value.rating.ToString();



                    SqlParameter userId_IdPar = new SqlParameter("@userId_Id", userId_Id);
                    SqlParameter itemPar = new SqlParameter("@Item", itemString);
                    SqlParameter urlPar = new SqlParameter("@Url", url);
                    SqlParameter titlePar = new SqlParameter("@Title", title);
                    SqlParameter thumbnailUrlPar = new SqlParameter("@ThumbnailUrl", thumbnailUrl);
                    SqlParameter idPar = new SqlParameter("@Id", "");
                    SqlParameter descriptionPar = new SqlParameter("@Description", description);
                    SqlParameter tagsPar = new SqlParameter("@Tags", tags);
                    SqlParameter sessionIdPar = new SqlParameter("@sessionId", sessionId);
                    SqlParameter id_idPar = new SqlParameter("@Id_Id", id_id);
                    SqlParameter createdPar = new SqlParameter("@createdDate", createdDate);
                    SqlParameter createdDateSpecifiedPar = new SqlParameter("@createdDateSpecified", createdDateSpecified);

                    SqlParameter cacheDictionaryIdPar = new SqlParameter("@cacheDictionaryId", item.Key);

                    SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", "-1");





                    SqlHelper.ExecuteScalar(tr, CommandType.Text, "INSERT INTO socios_FindMediaItemsCache (userId_Id, Item,Url, Title, ThumbnailUrl, Id, Description, Tags, SessionId, Id_Id, createdDate, createdDateSpecified, cacheDictionaryId, mirsRanking) VALUES (@userId_Id, @Item,@Url, @Title, @ThumbnailUrl, @Id, @Description, @Tags, @SessionId, @Id_Id, @createdDate, @createdDateSpecified, @cacheDictionaryId, @mirsRanking)", userId_IdPar, itemPar, urlPar, titlePar, thumbnailUrlPar, idPar, descriptionPar, tagsPar, sessionIdPar, id_idPar, createdPar, createdDateSpecifiedPar, cacheDictionaryIdPar, mirsRankingPar);
                }

                tr.Commit();
                conn.Close();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);

            }
        }

        protected void AddConnectedPersonsToCache(List<SociosServices.WebSkeletonServiceLive.Person> people)
        {
            Guid guid = Guid.NewGuid();
            Session["connectedPersonsCacheSessionId"] = guid.ToString();
            //txtSearchSessionId.Text = guid;
            string sessionId = guid.ToString();
            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            conn.Open();
            SqlTransaction tr = conn.BeginTransaction();

            foreach (SociosServices.WebSkeletonServiceLive.Person person in people)
            {
                // Count results while were adding them to the Database



                string username = person.displayName;

                string profileUrl = person.profileUrl;
                string userId = "";
                string source = "";
                if (person.id != null)
                {
                    userId = person.id.id;
                    if (person.id.source != null)
                    {
                        source = person.id.source.Item.ToString();
                    }
                }
                string thumbnailUrl = "http://frontend.sociosproject.eu/images/no-profile.png";
                if (person.thumbnailUrl != null && person.thumbnailUrl != "")
                    thumbnailUrl = person.thumbnailUrl;



                SqlParameter usernamePar = new SqlParameter("@username", username);
                SqlParameter userIdPar = new SqlParameter("@userId", userId);
                SqlParameter profileUrlPar = new SqlParameter("@profileUrl", profileUrl);
                SqlParameter sourcePar = new SqlParameter("@source", source);
                SqlParameter sessionIdPar = new SqlParameter("@sessionId", sessionId);
                SqlParameter thumbnailUrlPar = new SqlParameter("@thumbnailUrl", thumbnailUrl);
                SqlHelper.ExecuteScalar(tr, CommandType.Text, "INSERT INTO socios_ConnectedPersonsCache (username, userId, profileUrl, source, sessionId, thumbnailUrl) VALUES (@username, @userId, @profileUrl, @source, @sessionId, @thumbnailUrl)", usernamePar, profileUrlPar, sourcePar, sessionIdPar, userIdPar, thumbnailUrlPar);
            }


            cbbx_ConnectedPersons.Visible = true;

            tr.Commit();
            conn.Close();
        }

        protected void CountItemsPerSn(Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>.ValueCollection items)
        {
            try
            {
                resultsPerSn.Clear();
                resultsPerSn.Add("all", 0);
                resultsPerSn.Add("facebook", 0);
                resultsPerSn.Add("twitter", 0);
                resultsPerSn.Add("dailymotion", 0);
                resultsPerSn.Add("youtube", 0);
                resultsPerSn.Add("flickr", 0);
                resultsPerSn.Add("myspace", 0);
                resultsPerSn.Add("googlep", 0);
                resultsPerSn.Add("instagram", 0);
                foreach (SociosServices.WebSkeletonServiceLive.MediaItem item in items)
                {
                    string itemString = "";
                    if (item.userId != null && item.userId.source != null)
                    {


                        itemString = item.userId.source.Item.ToString().ToLower();
                        resultsPerSn[itemString] += 1;
                    }
                    else
                    {
                        itemString = item.id.source.Item.ToString().ToLower();
                        resultsPerSn[itemString] += 1;
                    }
                    resultsPerSn["all"] += 1;
                }
            }
            catch (Exception ex)
            {
                // throw ex;
            }
        }

        protected void CountItemsPerSn(Dictionary<int, SociosServices.RecommendationService.MediaItem>.ValueCollection items)
        {
            try
            {

                resultsPerSn.Clear();
                resultsPerSn.Add("all", 0);
                resultsPerSn.Add("facebook", 0);
                resultsPerSn.Add("twitter", 0);
                resultsPerSn.Add("dailymotion", 0);
                resultsPerSn.Add("youtube", 0);
                resultsPerSn.Add("flickr", 0);
                resultsPerSn.Add("myspace", 0);
                resultsPerSn.Add("googleplus", 0);
                resultsPerSn.Add("instagram", 0);
                foreach (SociosServices.RecommendationService.MediaItem item in items)
                {
                    string itemString = ""; // 
                    if (item.userId != null)
                    {
                        itemString = item.userId.source.knownSns.ToString().ToLower();
                    }
                    if (itemString != "")
                        resultsPerSn[itemString] += 1;

                    resultsPerSn["all"] += 1;
                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }

        protected void CountItemsPerSn(Dictionary<int, KeyValuePair<int, SociosServices.EventDetectionService.MediaItem>>.ValueCollection items)
        {
            try
            {

                resultsPerSn.Clear();
                resultsPerSn.Add("all", 0);
                resultsPerSn.Add("facebook", 0);
                resultsPerSn.Add("twitter", 0);
                resultsPerSn.Add("dailymotion", 0);
                resultsPerSn.Add("youtube", 0);
                resultsPerSn.Add("flickr", 0);
                resultsPerSn.Add("myspace", 0);
                resultsPerSn.Add("googleplus", 0);
                resultsPerSn.Add("instagram", 0);
                foreach (var item in items)
                {
                    string itemString = ""; // 
                    if (item.Value.userId != null)
                    {
                        itemString = item.Value.userId.source.knownSns.ToString().ToLower();
                    }

                    if (itemString == "googlep")
                        itemString = "googleplus";


                    if (itemString != "" && resultsPerSn.ContainsKey(itemString))
                        resultsPerSn[itemString] += 1;
                    else
                    {
                       
                    }
                    lblLog.Text += " " + itemString + " ";
                    lblLog.Visible = true;
                    pnlLog.Visible = true;
                    resultsPerSn["all"] += 1;
                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }


        protected void CountItemsPerSn(Dictionary<int, SociosServices.SocialFiltering.MediaItem>.ValueCollection items)
        {
            try
            {

                resultsPerSn.Clear();
                resultsPerSn.Add("all", 0);
                resultsPerSn.Add("facebook", 0);
                resultsPerSn.Add("twitter", 0);
                resultsPerSn.Add("dailymotion", 0);
                resultsPerSn.Add("youtube", 0);
                resultsPerSn.Add("flickr", 0);
                resultsPerSn.Add("myspace", 0);
                resultsPerSn.Add("googlep", 0);
                resultsPerSn.Add("instagram", 0);
                foreach (SociosServices.SocialFiltering.MediaItem item in items)
                {
                    string itemString = ""; // 
                    if (item.userId != null)
                    {
                        itemString = item.userId.source.Item.ToString().ToLower();
                        if (itemString == "googlep")
                            itemString = "googlep";
                    }
                    if (itemString != "")
                        resultsPerSn[itemString] += 1;

                    resultsPerSn["all"] += 1;
                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }


        protected void CountItemsPerSn(Dictionary<int, SociosServices.EventDetectionService.MediaItem>.ValueCollection items)
        {
            try
            {

                resultsPerSn.Clear();
                resultsPerSn.Add("all", 0);
                resultsPerSn.Add("facebook", 0);
                resultsPerSn.Add("twitter", 0);
                resultsPerSn.Add("dailymotion", 0);
                resultsPerSn.Add("youtube", 0);
                resultsPerSn.Add("flickr", 0);
                resultsPerSn.Add("myspace", 0);
                resultsPerSn.Add("googleplus", 0);
                resultsPerSn.Add("instagram", 0);
                foreach (SociosServices.EventDetectionService.MediaItem item in items)
                {
                    string itemString = ""; // 
                    if (item.userId != null)
                    {
                        itemString = item.userId.source.knownSns.ToString().ToLower();
                    }
                    if (itemString != "")
                        resultsPerSn[itemString] += 1;

                    resultsPerSn["all"] += 1;
                }
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }




        protected void ddlSortResults_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //radlstvwMediaItems.FilterExpressions.BuildExpression().EqualTo("Item", "youtube").Or().EqualTo("Item", "flickr").Build();
            RadListViewSortExpression expression;

            radlstvwMediaItems.SortExpressions.Clear();
            expression = new RadListViewSortExpression();
            string selectedSorter = (sender as RadComboBox).SelectedValue;

            bool sortingDirection = false;
            if (Session["SortingDirection"] == null)
            {
                Session["SortingDirection"] = false;
            }
            sortingDirection = (bool)Session["SortingDirection"];

            if (Session["CurrentSortingField"] == null)
            {

                Session["CurrentSortingField"] = selectedSorter;
            }
            else
            {
                string current = Session["CurrentSortingField"].ToString();
                if (Session["CurrentSortingField"] != selectedSorter)
                {
                    sortingDirection = true;
                    Session["SortingDirection"] = true;
                }
            }

            Session["CurrentSortingField"] = selectedSorter;


            switch (selectedSorter)
            {
                case "Title":
                    // expression.SortOrder = RadListViewSortOrder.Ascending;
                    expression.FieldName = selectedSorter;
                    expression.SortOrder = RadListViewSortOrder.Ascending;
                    break;
                case "Item":

                    //expression.SortOrder = RadListViewSortOrder.Ascending;
                    expression.FieldName = selectedSorter;
                    break;
                case "createdDate":
                    // expression.SortOrder = RadListViewSortOrder.Ascending;
                    expression.FieldName = selectedSorter;
                    expression.SortOrder = RadListViewSortOrder.Descending;
                    break;
                case "mirsRanking":
                    expression.SortOrder = RadListViewSortOrder.Descending;
                    expression.FieldName = selectedSorter;
                    break;
            }


            if (sortingDirection)
            {
                //expression.SortOrder = RadListViewSortOrder.Ascending;
                Session["SortingDirection"] = !(bool)Session["SortingDirection"];
            }
            else
            {
                // expression.SortOrder = RadListViewSortOrder.Descending;
                Session["SortingDirection"] = !(bool)Session["SortingDirection"];
            }

            radlstvwMediaItems.SortExpressions.AddSortExpression(expression);
            radlstvwMediaItems.Rebind();
            radlstvwMediaItems.CurrentPageIndex = 0;
            //ddlSortResults.ClearSelection();
        }

        protected void treevw_AllSocialNetworks_NodeClick(object sender, RadTreeNodeEventArgs args)
        {
            //IList<RadTreeNode> nodes = treevw_AllSocialNetworks.CheckedNodes;
            List<string> selectedSns = new List<string>();
            //foreach (RadTreeNode node in nodes)
            //{
            //    if (node.Checked)
            //        selectedSns.Add(node.Text.ToLower());
            //}
            ddlSortResults.ClearSelection();
            selectedSns.Add(args.Node.Value.ToLower());
            updtpnlSearchMedia.Update();
            SetSearchResultsFilters(selectedSns);

        }

        protected void SetSearchResultsFilters(List<string> selectedSns)
        {

            radlstvwMediaItems.FilterExpressions.Clear();
            foreach (string sn in selectedSns)
            {
                if (sn != "all")
                {

                    RadListViewFilterExpression filter = new RadListViewGroupFilterExpression(RadListViewGroupFilterOperator.Or)
                    {
                        Expressions =   {  new
                        RadListViewEqualToFilterExpression<string>("Item"){CurrentValue = sn}
                     }
                    };
                    radlstvwMediaItems.FilterExpressions.Add(filter);
                }

            }
            Session["searchResultsFilter"] = radlstvwMediaItems.FilterExpressions;
            radlstvwMediaItems.Rebind();







            //RadListViewFilterExpression filterRealName = new RadListViewFilterExpression("RealName", FilterExpression.BinaryOperation.AND, GridKnownFunction.Contains, GridFilterCellElement.ParameterName);
            // filterRealName.Parameters.Add(GridFilterCellElement.ParameterName, "Your value 1");




        }

        protected void SetSearchResultsFilters(string userId, string fieldName)
        {

            radlstvwMediaItems.FilterExpressions.Clear();



            RadListViewFilterExpression filter = new RadListViewGroupFilterExpression(RadListViewGroupFilterOperator.Or)
            {
                Expressions =   {  new
                        RadListViewEqualToFilterExpression<string>(fieldName){CurrentValue = userId}
                     }
            };
            radlstvwMediaItems.FilterExpressions.Add(filter);

            Session["searchResultsFilter"] = radlstvwMediaItems.FilterExpressions;
            radlstvwMediaItems.Rebind();

        }

        static string GetDifferenceDate(DateTime date1, DateTime date2)
        {
            if (DateTime.Compare(date1, date2) >= 0)
            {
                TimeSpan ts = date1.Subtract(date2);
                return string.Format("{0} days, {1} hours, {2} minutes, {3} seconds",
                    ts.Days, ts.Hours, ts.Minutes, ts.Seconds);
            }
            else
                return "Not valid";
        }

        public string GetMediaItemDate(DateTime date, string dateDefined)
        {
            if (dateDefined == "True")
            {
                return date.ToString("dd MMM yyyy - @HH:mm:ss");
            }
            else
            {
                return "Date/time not available";
            }
        }


        public string GetGroupMemberSource(object id_id)
        {
            try
            {
                if (id_id != null)
                {
                    //SociosServices.SocialFilteringGroupService2.KnownSns source = (SociosServices.SocialFilteringGroupService2.KnownSns)id_id;
                    return id_id.ToString().ToLower();// source.ToString().ToLower();
                }
                //string snAndId = (string)id_id;
                //return snAndId.Split(':')[0];
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        protected void cbbx_ConnectedPersons_OnSelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs args)
        {
            var test = args;
            var test2 = args;

            cbbx_ConnectedPersons.ClearSelection();
            RadListBoxItem tlrkIem = new RadListBoxItem(args.Text, args.Value);
            hdnfld_singleConnectedPersonUsername.Value = args.Value;
            radlstvwConnectedPersons.DataSourceID = sqldtsrc_ConnectedPersonCache.ID;
            radlstvwConnectedPersons.DataBind();

            // if (!ItemAlreadyInList(lstbxtrkSelectedReferencePeopleOrg, tlrkIem))
            // {
            //     lstbxtrkSelectedReferencePeopleOrg.Items.Add(tlrkIem);
            // }
        }


        protected SociosServices.SocialFiltering.Activity[] GetGroupActivities(string groupIdPar)
        {
            try
            {
                SociosServices.SocialFiltering.ObjectId clientId = new SociosServices.SocialFiltering.ObjectId();
                clientId.id = "2";// UserId.ToString();

                SociosServices.SocialFiltering.ObjectId groupId = new SociosServices.SocialFiltering.ObjectId();
                groupId.id = groupIdPar;
                SocialFilteringClient client = new SocialFilteringClient();
                return client.GetActivities(clientId, groupId);
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
                return null;
            }
        }


        protected SociosServices.EventDetectionService.Activity[] GetLatestEvents(string groupIdPar)
        {
            try
            {
                SociosServices.EventDetectionService.ObjectId clientId = new SociosServices.EventDetectionService.ObjectId();
                clientId.id = "2";// UserId.ToString();

                SociosServices.EventDetectionService.ObjectId groupId = new SociosServices.EventDetectionService.ObjectId();
                groupId.id = groupIdPar;

                EventDetectionServiceClient client = new EventDetectionServiceClient();
                return client.GetEvents(clientId, groupId);
            }
            catch (Exception ex)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
                return null;
            }
        }

        protected string GetSnNameFromId(int snId)
        {
            string snName = "illegalSnId";
            switch (snId)
            {
                case 1:
                    snName = "flickr";
                    break;
                case 2:
                    snName = "facebook";
                    break;
                case 3:
                    snName = "twitter";
                    break;
                case 4:
                    snName = "youtube";
                    break;
                case 5:
                    snName = "myspace";
                    break;
                case 6:
                    snName = "dailymotion";
                    break;
                case 7:
                    snName = "googleplus";
                    break;
            }
            return snName;
        }

        protected void RefreshDigitalPurseBalance()
        {
            DigitalPurseServiceClient client = new DigitalPurseServiceClient();
            int userId = UserId;
            balanceReport report = client.ViewBalance(userId);
            if (report != null)
            {
                if (!report.success && report.reason.Contains("not exist"))
                {
                    client.CreateBalance(UserId, 30000);
                    report = client.ViewBalance(UserId);
                }
                lblDigitalPurseBalance.Text = string.Format("{0:n}", report.balance);
            }
            else
            {
                lblDigitalPurseBalance.Text = "N/A";
            }

        }

        public string GetActivitySource(SociosServices.SocialFiltering.ObjectId id)
        {
            if (id != null)
            {
                return id.source.Item.ToString().ToLower();
            }
            else
            {
                return "unknown";
            }
        }

        public string GetActivitySource(SociosServices.EventDetectionService.ObjectId id)
        {
            if (id != null)
            {
                return id.source.knownSns.ToString().ToLower();
            }
            else
            {
                return "unknown";
            }
        }


        public string GetActivityMediaItemAuthor(string userId)
        {
            if (Session["GroupPeople"] != null)
            {
                SociosServices.SocialFilteringGroupService2.Person[] groupPeople = (SociosServices.SocialFilteringGroupService2.Person[])Session["GroupPeople"];
                foreach (var person in groupPeople)
                {
                    if (person.id.id == userId)
                    {
                        return person.preferredUsername;
                    }
                }
            }
            return userId;
        }


        protected void UpdateCachedMediaItemRanking(int cacheId, string rating)
        {
            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            conn.Open();
            SqlTransaction tr = conn.BeginTransaction();
            SqlParameter cacheIdPar = new SqlParameter("@cacheId", cacheId);
            SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", rating);
            SqlHelper.ExecuteScalar(tr, CommandType.Text, "UPDATE socios_FindMediaItemsCache SET  mirsRanking = @mirsRanking WHERE cacheId = @cacheId", cacheIdPar, mirsRankingPar);
            tr.Commit();
            conn.Close();
        }

        protected void UpdateCachedMediaItemSelectState(int cacheId, bool selected)
        {
            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            conn.Open();
            SqlTransaction tr = conn.BeginTransaction();
            SqlParameter cacheIdPar = new SqlParameter("@cacheId", cacheId);
            SqlParameter selectedPar = new SqlParameter("@selected", DbType.Boolean);
            selectedPar.Value = selected;
            SqlHelper.ExecuteScalar(tr, CommandType.Text, "UPDATE socios_FindMediaItemsCache SET  selected = @selected WHERE cacheId = @cacheId", cacheIdPar, selectedPar);
            tr.Commit();
            conn.Close();
        }

        //protected void UpdateCachedMediaItemSelectState(string cacheSessionId, bool selected)
        //{
        //    SqlConnection conn = new SqlConnection(CONNECTION_STRING);
        //    conn.Open();
        //    SqlTransaction tr = conn.BeginTransaction();
        //    SqlParameter cacheIdPar = new SqlParameter("@cacheId", cacheId);
        //    SqlParameter selectedPar = new SqlParameter("@selected", DbType.Boolean);
        //    selectedPar.Value = selected;
        //    SqlHelper.ExecuteScalar(tr, CommandType.Text, "UPDATE socios_FindMediaItemsCache SET  selected = @selected WHERE cacheId = @cacheId", cacheIdPar, selectedPar);
        //    tr.Commit();
        //    conn.Close();
        //}

        public string CutString(string text, int length)
        {
            if (text.Length > length - 1)
                return text.Substring(0, length - 1) + "..";
            else
                return text;

        }
    }
}
