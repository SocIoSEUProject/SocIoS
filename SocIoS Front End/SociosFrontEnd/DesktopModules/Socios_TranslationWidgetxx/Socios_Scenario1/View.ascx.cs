/*
' Copyright (c) 2010  DotNetNuke Corporation
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
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
        }
        //string FLEXIPRICE_DOMAIN = "http://epart.atc.gr/flexiprice/";
        string FLEXIPRICE_DOMAIN = "http://dev.flexiprice.info/";

        public Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo> accessInfoDictionary = new Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>();

        Dictionary<string, int> resultsPerSn = new Dictionary<string, int>();
        private Logger _Log = new Logger();
        String CONNECTION_STRING = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString();

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
                // var testActivities =  GetGroupActivities("id-1e84ba55-0bfe-4659-8f76-e1eea2862e35");
                // treevw_AllSocialNetworks.LoadContentFile("DesktopModules/Socios_Scenario1/treeView.xml");
                // treevw_AllSocialNetworks.LoadXml("<Tree><Node Text=\"Books\"/><Node Text=\"Music\"/></Tree>");

                // var testActivities = GetGroupActivities("id-1e84ba55-0bfe-4659-8f76-e1eea2862e35");
                //var testActivities2 = GetGroupActivities("id-20fbe9a9-3147-46c5-b59a-29b97e44347d");
                //var testActivities3 = GetGroupActivities("id-9962b652-e32e-4e85-836b-fb298b129593");
                //var testActivities4 = GetGroupActivities("id-ee220a5b-589a-47e6-9bc9-9cb0b6de9500");
                //var testActivities5 = GetGroupActivities("id-c75f02d5-02ba-400a-8b5d-10149b550bde");


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
                // NewWebServiceService userClient = new NewWebServiceService();

                //   SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
                // tokenClient.SetUserAccessToken(99, 2, "testAccessTokenFromFrontEnd");

                // userInfo user = tokenClient.GetUsernameFromAccessToken("337773939-CSXtCrVeWamTmXe3wGvmY0DEn7l3qpC4yXyy8R0r", "6C6E1d3mEb7lH8FCxwIUnPZ1aX8EQBZ0dWOjHVFKw", 3);
                // string username = user.username;
                // string snUserId = user.userId;
                // _Log.AddInfo("Test info");
                // _Log.AddInfo("PageLoad");
                // _Log.AddFailure("Failure");
                // SociosUtil.Log("Page Load");
                lbl_Notification.Visible = false;
                lbl_Notification.Text = "";
                //_Log.Logs.
                // TESTING

                // GET PERSON TEST
                // bool personFound = false;
                //SociosServices.WebSkeletonServiceLive.Person person = GetPerson("100001570512130", SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK, out personFound);
                //
                //"dKzWF4UspzgVXl31dNhw@rftX05xlV7CcnBqhCPgk9AhgeHeBpdDUObgqgTSbOBE@375898591-vErgkLPDcC7JdgWJvgFDmoVOw7TpvzPP5jHdEyBj@QT4GOHwvNgTq5de14sZta5FKyfzmPI3YJ51lYvgEnMo"
               // SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
               // SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken("375898591-vErgkLPDcC7JdgWJvgFDmoVOw7TpvzPP5jHdEyBj", "QT4GOHwvNgTq5de14sZta5FKyfzmPI3YJ51lYvgEnMo", SociosServices.UserService.socialNetwork.TWITTER);
                    

                // TESTING REP AND REC KEEP FOR REFERENCE
                bool personFound = false;


                // TREE TESTING END

                string groupSession = "GRP_SSSION_" + UserId;
                groupSessionObj.id = groupSession;
                groupSessionObj.source = new SociosServices.SocialFilteringGroupService2.Source();
                groupSessionObj.source.knownSns = SociosServices.SocialFilteringGroupService2.KnownSns.FACEBOOK;

                            
                
                Page.ClientScript.RegisterClientScriptInclude("stickyfloat.js", this.TemplateSourceDirectory + "/js/stickyfloat.js");
                Page.ClientScript.RegisterClientScriptInclude("Scenario1.js", this.TemplateSourceDirectory + "/js/Scenario1.js?v=4");

               
                Page.ClientScript.RegisterClientScriptInclude("jquery.expander.min.js", this.TemplateSourceDirectory + "/js/jquery.expander.min.js");


               

                txtConsentFormText.Text = "Dear user, I would like to invite you to share... by visting the link http://frontend.sociosproject.eu. For more information, please refer to:  http://frontend.sociosproject.eu";
                txtConsentFrom.Text = "Me";
                txtConsentTo.Text = "User451";

                if (Request.QueryString["widget"] != null)
                {
                    lnkbtn_MenuShowManageGroups.Visible = false;
                    lnkbtn_MenuShowSearchMedia.Visible = false;
                    pnl_MediaSearch.Visible = true;
                    pnl_SortingLinks.Visible = false;
                    main_container.CssClass = "widg-main-container";
                }
                else
                {
                    main_container.CssClass = "main-container";
                }

                if (!IsPostBack && !ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                {
                     if (ddlAllGroups.Items.Count == 0)
                    {
                        LoadAllGroups();
                    }   
                }

                if (!ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                {
                    RefreshDigitalPurseBalance();
                }

               
             
                if (!IsPostBack)
                {
                    if (UserId > 0)
                    {
                        CheckFlexipriceStatus();
                        //RefreshDigitalPurseBalance();
                    }
                    RadTreeNode allNode = new RadTreeNode("All", "all");

                    RadTreeNode fbNode = new RadTreeNode("Facebook", "Facebook");
                    fbNode.ImageUrl = "Images/facebook.png";
                    RadTreeNode frNode = new RadTreeNode("FlickR", "FlickR");
                    frNode.ImageUrl = "Images/flickr.png";
                    RadTreeNode twNode = new RadTreeNode("Twitter", "Twitter");
                    twNode.ImageUrl = "Images/twitter.png";
                    RadTreeNode ytNode = new RadTreeNode("YouTube", "YouTube");
                    ytNode.ImageUrl = "Images/youtube.png";
                    RadTreeNode dmNode = new RadTreeNode("Dailymotion", "Dailymotion");
                    dmNode.ImageUrl = "Images/dailymotion.png";
                    RadTreeNode msNode = new RadTreeNode("MySpace", "MySpace");
                    msNode.ImageUrl = "Images/myspace.png";
                    treevw_AllSocialNetworks.Nodes.Add(allNode);
                    treevw_AllSocialNetworks.Nodes.Add(fbNode);
                    treevw_AllSocialNetworks.Nodes.Add(frNode);
                    treevw_AllSocialNetworks.Nodes.Add(twNode);
                    treevw_AllSocialNetworks.Nodes.Add(ytNode);
                    treevw_AllSocialNetworks.Nodes.Add(dmNode);
                    treevw_AllSocialNetworks.Nodes.Add(msNode);


                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// <summary>
        /// Loading Flexiprice link token and letting user know if he has pending
        // transactions
        /// </summary>
        protected void CheckFlexipriceStatus()
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
                // Reset cacheSessionId so that for old results are never displayed when starting a new search
                Session["findMediaItemsCacheSessionId"] = -1;
                pnl_FindMediaItemsError.Visible = false;
                ddlSortResults.ClearSelection();
                radlstvwMediaItems.Visible = true;
                pnlBeforeFirstSearch.Visible = false;
                treevw_AllSocialNetworks.Nodes.Clear();
                RadTreeNode allNode = new RadTreeNode("All", "all");

                RadTreeNode fbNode = new RadTreeNode("Facebook", "Facebook");
                fbNode.ImageUrl = "Images/facebook.png";
                RadTreeNode frNode = new RadTreeNode("FlickR", "FlickR");
                frNode.ImageUrl = "Images/flickr.png";
                RadTreeNode twNode = new RadTreeNode("Twitter", "Twitter");
                twNode.ImageUrl = "Images/twitter.png";
                RadTreeNode ytNode = new RadTreeNode("YouTube", "YouTube");
                ytNode.ImageUrl = "Images/youtube.png";
                RadTreeNode dmNode = new RadTreeNode("Dailymotion", "Dailymotion");
                dmNode.ImageUrl = "Images/dailymotion.png";
                RadTreeNode msNode = new RadTreeNode("MySpace", "MySpace");
                msNode.ImageUrl = "Images/myspace.png";
                treevw_AllSocialNetworks.Nodes.Add(allNode);
                treevw_AllSocialNetworks.Nodes.Add(fbNode);
                treevw_AllSocialNetworks.Nodes.Add(frNode);
                treevw_AllSocialNetworks.Nodes.Add(twNode);
                treevw_AllSocialNetworks.Nodes.Add(ytNode);
                treevw_AllSocialNetworks.Nodes.Add(dmNode);
                treevw_AllSocialNetworks.Nodes.Add(msNode);
                radlstvwMediaItems.FilterExpressions.Clear();
                String[] searchTerms = txtSearch.Text.Split(' ');

                SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                List<string> keywords = new List<string>();
                string[] words = keywords.ToArray();

                int userId = 2;// UserId;

                List<SociosServices.WebSkeletonServiceLive.KnownSns> sources = new List<SociosServices.WebSkeletonServiceLive.KnownSns>();
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.DAILYMOTION);
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK);
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.FLICKR);
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE);
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.TWITTER);
                sources.Add(SociosServices.WebSkeletonServiceLive.KnownSns.YOUTUBE);
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
                        //return recommendedItems;
                        //recommendedItems = 
                    }
                    else
                    {
                        items = client.FindMediaItems(searchTerms, userId, sources);
                    }


                }
                if (Request.QueryString["widget"] != null)
                {
                    //widg_lstvwMediaItems.DataSource = items;
                    //widg_lstvwMediaItems.DataBind();
                    //widg_lstvwMediaItems.Visible = true;

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
                            //double score = ranking.GetMediaItemScore(itemsList[1]);
                            //double[] scores = ranking.GetMediaItemsScore(items); 
                        }
                        else
                        {
                            Session["findMediaItemsCacheSessionId"] = "71bcb1a4-9760-40e1-8383-0e39915d475b";
                        }

                        radlstvwMediaItems.DataBind();
                        foreach (RadTreeNode node in treevw_AllSocialNetworks.Nodes)
                        {
                            if (resultsPerSn.ContainsKey(node.Value.ToLower()))
                            {
                                node.Text += " (" + resultsPerSn[node.Value.ToLower()] + ")";
                            }

                        }
                        radlstvwMediaItems.Visible = true;
                    }
                    else if (GET_RECOMMENDED_RESULTS && recommendedItems != null && recommendedItems[0] != null)
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
                                node.Text += " (" + resultsPerSn[node.Value.ToLower()] + ")";
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
            HiddenField hdnfld_mirsRanking = (HiddenField)e.Item.FindControl("hdnfld_mirsRanking");
            Panel pnl_rankingButton = (Panel)e.Item.FindControl("pnl_rankingButton");
            Panel pnl_rankingStars = (Panel)e.Item.FindControl("pnl_rankingStars");
            if (hdnfld_mirsRanking.Value != "na")
            {
                pnl_rankingButton.Visible = false;
                pnl_rankingStars.Visible = true;
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
                default:
                    return SociosServices.WebSkeletonServiceLive.KnownSns.FACEBOOK;
            }
        }

        protected void radLstvwMediaItems_ItemCommand(object sender, RadListViewCommandEventArgs e)
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
                bool usingRecommended = (bool)Session["mediaItemsSearchUsingRecommended"];
                int key = Convert.ToInt32(e.CommandArgument);
                double score = -1;
                if (usingRecommended)
                {
                    Dictionary<int, SociosServices.RecommendationService.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.RecommendationService.MediaItem>)Session["findMediaItemsCache"];
                    ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                    SociosServices.WebSkeletonServiceLive.ObjectId id = new SociosServices.WebSkeletonServiceLive.ObjectId();
                    SociosServices.RecommendationService.ObjectId idRec = new SociosServices.RecommendationService.ObjectId();
                    idRec = itemsDictionary[key].id;


                    id.id = idRec.id;
                    id.source.Item = idRec.source.knownSns;

                    SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
                    SociosServices.WebSkeletonServiceLive.ObjectId obj = new SociosServices.WebSkeletonServiceLive.ObjectId();
                    SociosServices.WebSkeletonServiceLive.ObjectId[] objs = { obj };
                    var test = client.GetMediaItems(objs);

                    //itemsDictionary[key].id.


                    var rankingResult = ranking.GetMediaItemScore(test[0]);
                    score = rankingResult.Key;
                }
                else
                {
                    Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> itemsDictionary = (Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem>)Session["findMediaItemsCache"];
                    ContentRankingServiceClient ranking = new ContentRankingServiceClient();
                    var rankingResult = ranking.GetMediaItemScore(itemsDictionary[key]);
                    score = rankingResult.Key;
                }


                //DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, rankingResult.Value);

                Button lnkbtn_GetItemRanking = (Button)e.ListViewItem.FindControl("lnkbtn_GetItemRanking");
                lnkbtn_GetItemRanking.Visible = false;
                Literal ltrl_ItemRankingStars = (Literal)e.ListViewItem.FindControl("ltrl_ItemRankingStars");

                ltrl_ItemRankingStars.Text = GetRankingStarsHtml(score.ToString());
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
                HyperLink hprlnkMessageUser = (HyperLink) e.ListViewItem.FindControl("hprlnkMessageUser");
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
                    person = client.GetPersonUsername(1, userId, source);
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
                        hprlnkMessageUser.NavigateUrl = person.profileUrl;
                    }
                    hprlnkUserProfile.Visible = true;



                    lnkbtn_getUserDetails.Visible = false;
                  
                   Panel pnlItemTools = (Panel) e.ListViewItem.FindControl("pnlItemTools");
                   pnlItemTools.Visible = true;
                   Page.ClientScript.RegisterClientScriptInclude("GetNextAuthor.js", this.TemplateSourceDirectory + "/js/GetNextAuthor.js");
                   //PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

                }
                else
                {
                    lnkbtn_getUserDetails.CssClass = "ErrorGettingPerson hidden";
                  pnl_GetPersonError.Visible = true;
                  imgAuthorIcon.Visible = false;
                }
                Panel pnlAuthorLoading = (Panel) e.ListViewItem.FindControl("pnlAuthorLoading");
                pnlAuthorLoading.Visible = false;

            }
        }

        

        protected string GetRankingStarsHtml(string scoreString)
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

            //if (score > 1)
            //    stars += fullStar;
            //else
            //    stars += emptyStar;

            //if (score > 2)
            //    stars += fullStar;
            //else
            //    stars += emptyStar;
            //if (score > 3)
            //    stars += fullStar;
            //else
            //    stars += emptyStar;
            //if (score > 4)
            //    stars += fullStar;
            //else
            //    stars += emptyStar;



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

            return stars + " (" + formattedScore + ")";
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
                }
                Panel pnl_CurrentManagePeople = (Panel)e.Item.FindControl("pnl_ManagePeople");
                pnl_CurrentManagePeople.Visible = true;
                ListView lstvw_AllPeopleInGroup = (ListView)e.Item.FindControl("lstvw_AllPeopleInGroup");
                Session["Scenario1_CurrentGroup"] = e.CommandArgument.ToString();
         
                lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(e.CommandArgument.ToString());
                SociosServices.SocialFilteringGroupService2.Person persosa = new SociosServices.SocialFilteringGroupService2.Person();

                lstvw_AllPeopleInGroup.DataBind();



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

                RenderLatestEvents(groupId);
                pnl_LatestActivities.Visible = false;
                pnl_LatestEvents.Visible = true;
                //lbl_selectAGroupForEvents.Visible = false;
            }
            else if (e.CommandName == "GetGroupActivities")
            {
                //RenderLatestEvents();
                //lbl_selectAGroupForEvents.Visible = false;\\

                string groupId = e.CommandArgument.ToString();


                // groupId = "id-ee220a5b-589a-47e6-9bc9-9cb0b6de9500";
                //groupId = "id-1e84ba55-0bfe-4659-8f76-e1eea2862e35";

                // Returns FlickR
                //groupId = "id-c75f02d5-02ba-400a-8b5d-10149b550bde";
                RenderGroupActivities(groupId);
                pnl_LatestEvents.Visible = false;
                pnl_LatestActivities.Visible = true;


            }
            //

            //if (e.CommandName == "RemovePersonFromGroup")
            //{
            //    string currentGroupId = Session["Scenario1_CurrentGroup"].ToString();

            //    ListView lstvw_AllPeopleInGroup = (ListView)e.Item.FindControl("lstvw_AllPeopleInGroup");

            //    lstvw_AllPeopleInGroup.DataSource = GetGroupPeople(currentGroupId);
            //    lstvw_AllPeopleInGroup.DataBind();

            //}





        }

        protected string ValidateUser(string username, ListViewCommandEventArgs e)
        {
            
            DnnComboBox ddlAddGroupMemberSn = (DnnComboBox) e.Item.FindControl("ddlAddGroupMemberSn");
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
          string userSnId =  tokenClient.GetUsernameFromUserId(username, sns);
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
                newPerson.id.source.openSocialSnsId = new SociosServices.SocialFilteringGroupService2.OpenSocialSns();
                                newPerson.id.source.openSocialSnsId.baseUri = socialNetwork.Replace("\n", "").Replace("\r", "").Trim();
                newPerson.preferredUsername = name.Replace("\n", "").Replace("\r", "").Replace(" ", "").Trim();
                SociosServices.SocialFilteringGroupService2.Person[] people = new SociosServices.SocialFilteringGroupService2.Person[] { newPerson };
                groupClient.addMembers(groupSessionObj, people, groupId);
                lbl_Notification.Visible = true;
                lbl_Notification.Text += "<p>User '" + name + "' successfully added to group '" + groupId + "'</p>";
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
                    newPerson.id.source.openSocialSnsId = new SociosServices.SocialFilteringGroupService2.OpenSocialSns();
                    newPerson.id.source.openSocialSnsId.baseUri = e.CommandArgument.ToString().Split(':')[0];
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

        protected void btn_AddPersonToGroup_Click(object sender, EventArgs e)
        {
            AddPersonToGroup(ddlAllGroups.SelectedValue, hdnfld_AddPersonName.Value, hdnfld_AddPersonId.Value, hdnfld_AddPersonSource.Value);
        }

        protected void btn_AddPersonToNewGroup_Click(object sender, EventArgs e)
        {

            string newGroupTitle = txt_AddUser_CreateGroupName.Text;
            string newGroupDescription = txt_AddUser_CreateGroupDescription.Text;
            SociosServices.SocialFilteringGroupService2.Group newGroup = CreateNewGroup(newGroupTitle, newGroupDescription);
            AddPersonToGroup(newGroup.id.id, hdnfld_AddPersonName.Value, hdnfld_AddPersonId.Value, hdnfld_AddPersonSource.Value);
            LoadAllGroups();
            lbl_Notification.Visible = true;
            lbl_Notification.Text += "<p>New group '" + txt_AddUser_CreateGroupName.Text + "' successfully created</p>";

        }

        protected void lnkbtn_MenuShowSearchMedia_Click(object sender, EventArgs e)
        {
            CheckFlexipriceStatus();
            lblCurrentTitle.Text = "Search Media";
            pnl_ManageGroups.Visible = false;
            pnl_MediaSearch.Visible = true;
            pnl_PoolOfContacts.Visible = false;
        }

        protected void lnkbtn_MenuShowManageGroups_Click(object sender, EventArgs e)
        {
            lblCurrentTitle.Text = "Manage Groups";
            LoadAllGroups();
            pnl_ManageGroups.Visible = true;
            pnl_MediaSearch.Visible = false;
            pnl_PoolOfContacts.Visible = false;
        }

        protected void lnkbtn_MenuShowPoolOfContacts_Click(object sender, EventArgs e)
        {
            lblCurrentTitle.Text = "Pool of Contacts";
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
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.TWITTER))
            {
                lnbtn_GetTwitterConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE))
            {
                lnbtn_GetMyspaceConnnectedPeople.Visible = true;
                atLeastOneTokenAvailable = true;
            }
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


        protected void RenderLatestEvents(string groupId)
        {

            ActivityList1[] results = GetLatestEvents(groupId);
            List<SociosServices.EventDetectionService.Activity> activities = new List<SociosServices.EventDetectionService.Activity>();
            if (results != null)
            {
                foreach (ActivityList1 list in results)
                {
                    if (list.activity.Length > 0)
                    {
                        activities.Add(list.activity[0]);
                    }
                }
            }
            radlstvw_GetEvents.DataSource = activities;
            radlstvw_GetEvents.DataBind();
        }

        protected void RenderGroupActivities(string groupId)
        {
            //int[] userIds = new int[] { 1, 2, 3, 4, 5, 6, 7, 8 };
            //SociosServices.EventDetectionService.ActivityList1[] results = eventDetectionClient.GetEvents(userIds);
            //lstvw_LatestEvents.DataSource = results;
            //lstvw_LatestEvents.DataBind();
            SociosServices.SocialFiltering.Activity[] activities = GetGroupActivities(groupId);

            //SociosServices.SocialFiltering.Activity activity = new SociosServices.SocialFiltering.Activity();
            if (activities != null)
            {
                if (activities.Length > 0)
                {
                    pnl_GetActivitiesError.Visible = false;
                    radlstvw_GetActivities.DataSource = activities;// activity.id.source.knownSns;
                    radlstvw_GetActivities.DataBind();
                }
            }
            else
            {
                pnl_GetActivitiesError.Visible = true;
            }
            // var testActivities4 = 


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

        protected void lnbtn_GetMyspaceConnnectedPeople_Click(object sender, EventArgs e)
        {
            cbbx_ConnectedPersons.Visible = false;
            Session["connectedPersonsCacheSessionId"] = -1;
            radlstvwConnectedPersons.Visible = true;
            //cbbx_ConnectedPersons.Visible = true;
            SkeletonServiceClient client = new SociosServices.SkeletonServiceClient();
            // -- Dailymotion (worked)

            accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
            string userId = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE].snsUserId;// "35592727@N03";

            SociosServices.WebSkeletonServiceLive.KnownSns source = SociosServices.WebSkeletonServiceLive.KnownSns.MYSPACE;
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
        protected void AddMediaItemsToCache(Dictionary<int, SociosServices.WebSkeletonServiceLive.MediaItem> items)
        {
            try
            {
                Guid guid = Guid.NewGuid();
                Session["findMediaItemsCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                {
                    CountItemsPerSn(items.Values);

                }
                foreach (KeyValuePair<int, SociosServices.WebSkeletonServiceLive.MediaItem> item in items)
                {

                    // Count results while were adding them to the Database

                    string userId_Id = "";
                    if (item.Value.userId != null)
                    {
                        userId_Id = item.Value.userId.id;
                    }

                    string itemString = "notSet";
                    if (item.Value.userId != null)
                    {
                        itemString = item.Value.userId.source.Item.ToString().ToLower();
                        if (itemString == "facebook")
                        {

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


                    SqlParameter mirsRankingPar = new SqlParameter("@mirsRanking", "na");


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

        protected void AddMediaItemsToCache(Dictionary<int, SociosServices.RecommendationService.MediaItem> items)
        {
            try
            {
                Guid guid = Guid.NewGuid();
                Session["findMediaItemsCacheSessionId"] = guid.ToString();
                //txtSearchSessionId.Text = guid;
                string sessionId = guid.ToString();
                SqlConnection conn = new SqlConnection(CONNECTION_STRING);
                conn.Open();
                SqlTransaction tr = conn.BeginTransaction();

                // If it contains the ( character it means the items have been counted before
                if (!treevw_AllSocialNetworks.Nodes[0].Text.Contains("("))
                {
                    CountItemsPerSn(items.Values);

                }
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

            resultsPerSn.Clear();
            resultsPerSn.Add("all", 0);
            resultsPerSn.Add("facebook", 0);
            resultsPerSn.Add("twitter", 0);
            resultsPerSn.Add("dailymotion", 0);
            resultsPerSn.Add("youtube", 0);
            resultsPerSn.Add("flickr", 0);
            resultsPerSn.Add("myspace", 0);
            foreach (SociosServices.WebSkeletonServiceLive.MediaItem item in items)
            {
                string itemString = "";
                if (item.userId != null)
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
                    // expression.SortOrder = RadListViewSortOrder.Ascending;
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
            string snAndId = (string)id_id;
            return snAndId.Split(':')[0];
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
                clientId.id = "1";// UserId.ToString();

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
        

        protected SociosServices.EventDetectionService.ActivityList1[] GetLatestEvents(string groupIdPar)
        {
            try
            {
                SociosServices.EventDetectionService.ObjectId clientId = new SociosServices.EventDetectionService.ObjectId();
                clientId.id = "1";// UserId.ToString();

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
            }
            return snName;
        }

        protected void RefreshDigitalPurseBalance()
        {
            DigitalPurseServiceClient client = new DigitalPurseServiceClient();
            int userId = UserId;
            balanceReport report = client.ViewBalance(userId);
            if (!report.success && report.reason.Contains("not exist"))
            {
                client.CreateBalance(UserId, 30000);
                report = client.ViewBalance(UserId);
            }
            lblDigitalPurseBalance.Text = string.Format("{0:n}", report.balance);
        }

        public string GetActivitySource(SociosServices.SocialFiltering.ObjectId id)
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

    }












}
