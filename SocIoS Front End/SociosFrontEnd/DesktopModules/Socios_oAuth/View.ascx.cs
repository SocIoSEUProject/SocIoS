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
using System.Net;
using System.Text;
using System.IO;
using System.Diagnostics;
using DotNetOpenAuth.OAuth;
using DotNetOpenAuth.ApplicationBlock;
using System.Data.SqlClient;
using DotNetNuke.Common.Utilities;
using SociosServices;
using MySpaceID.SDK.Context;
using MySpaceID_OAuth.Core;
using MySpaceID.SDK.MySpace;
using System.Collections.Generic;
using System.Web;


namespace DotNetNuke.Modules.Socios_oAuth
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_oAuth class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_oAuthModuleBase, IActionable
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
        //private SqlConnection CN = new SqlConnection(Config.GetConnectionString("SiteSqlServer"));
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

        enum OAuthServiceProviders { YouTube = 1, Twitter = 2, Facebook = 3, DailyMotion = 4 };

        string CONSUMER_KEY = "dKzWF4UspzgVXl31dNhw";
        string CONSUMER_SECRET = "rftX05xlV7CcnBqhCPgk9AhgeHeBpdDUObgqgTSbOBE";
        public Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo> accessInfoDictionary = new Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>();

        bool forceRefreshAccessTokens = false;
        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// -----------------------------------------------------------------------------
        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                //TokenServiceClient tokenClient = new TokenServiceClient();
                //users
                //tokenClient.

                //tokenClient.GetUsernameFromAccessToken(accessToken, "", SociosServices.UserService.socialNetwork.DAILYMOTION);
                if (UserInfo.IsInRole("Journalists"))
                {
                    lblOAuthInfoCandidates.Visible = false;
                    lblOAuthInfoJournalists.Visible = true;
                    rowYoutube.Visible = true;
                    rowTwitter.Visible = true;
                    rowMySpace.Visible = true;
                    rowInstagram.Visible = true;
                    rowGoogleP.Visible = true;
                }
                else if (UserInfo.IsInRole("Candidates"))
                {

                    lblOAuthInfoCandidates.Visible = true;
                    lblOAuthInfoJournalists.Visible = false;
                    rowYoutube.Visible = false;
                    rowTwitter.Visible = false;
                    rowMySpace.Visible = false;
                    rowInstagram.Visible = false;
                    rowGoogleP.Visible = false;
                }

                if (Request.QueryString["source"] != null && Request.QueryString["token"] != null)
                {
                    string source = Request.QueryString["source"];
                    string token = Request.QueryString["token"];
                    SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
                    if (source == "youtube")
                    {
                        SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(token, "", SociosServices.UserService.socialNetwork.YOUTUBE);

                        //string username = ""; 
                        //if(user.username != null)
                        //    username = user.username; 

                        //if (user.userId != null)
                        //    username = user.userId; 

                        tokenClient.SetUserAccessToken(UserInfo.UserID, 4, token, "", "null", "null");

                        Session["UserAccessTokensCache"] = null; // To trigger RefreshAccessTokensFromDB later
                    }
                    else if (source == "flickr")
                    {
                        SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(token, "", SociosServices.UserService.socialNetwork.FLICKR);
                        string username = user.username;
                        string userIden = user.userId;
                        tokenClient.SetUserAccessToken(UserInfo.UserID, 1, token, "", username, userIden);
                        lbl_FlickrAccessToken.Text = user.username + user.userId;
                        Session["UserAccessTokensCache"] = null;
                    }
                }
                if (Session["UserAccessTokensCacheUserId"] == null)
                {
                    Session["UserAccessTokensCacheUserId"] = -2; // Just a userId that would never occur
                }

                if (Session["UserAccessTokensCache"] == null || forceRefreshAccessTokens || (int)Session["UserAccessTokensCacheUserId"] != UserId)
                {

                    // SociosServices.UserService.userInfo user2 = tokenClient.GetUsernameFromAccessToken("YmJBRgsbBB1YEVodHlFBEE0XHgkVE00", "", SociosServices.UserService.socialNetwork.DAILYMOTION);
                    // lbl_DailymotionAccessToken.Text = user2.userId + " " + user2.username;
                    RefreshAccessTokensFromDB();


                }
                else
                {
                    accessInfoDictionary = (Dictionary<SociosServices.SociosUtil.UtilSocialNetwork, SociosServices.TokenService.accessInfo>)Session["UserAccessTokensCache"];
                }
                RenderAccessTokens();
















                // Session["FacebookAccessToken"] = "testaccess";
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void RenderAccessTokens()
        {
            // If at least one candidate social network has been authenticated then we guide the user back to the media selection page.
            bool atLeastOneCandidateSnAuthenticated = false;

            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            if (Session["YouTubeAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE))
            {
                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE))
                {
                    lbl_YouTubeAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].username + " " + accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].accessToken;
                }
                else
                {
                    string youtubeAccessToken = Session["YouTubeAccessToken"].ToString();
                    lbl_YouTubeAccessToken.Text = youtubeAccessToken;
                    tokenClient.SetUserAccessToken(UserInfo.UserID, 4, youtubeAccessToken, "", "null", "null");
                    forceRefreshAccessTokens = true;
                }
                pnl_YouTubeSuccess.Visible = true;
                div_youtube_status.Attributes["class"] = "youtube_active";
                lnkbtn_YouTube.Visible = false;
                lnkbtn_YouTubeDeauthorize.Visible = true;
            }

            if (Session["GooglePlusContactsAccessToken"] != null)
            {
                //if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE))
                if (false)
                {
                    lbl_YouTubeAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].username + " " + accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.YOUTUBE].accessToken;
                }
                else
                {
                    string googlePlusContactsAccessToken = Session["GooglePlusContactsAccessToken"].ToString();
                    lbl_GooglePlusContactsAccessToken.Text = googlePlusContactsAccessToken;
                    //tokenClient.SetUserAccessToken(UserInfo.UserID, 4, youtubeAccessToken, "", "null", "null");
                    //forceRefreshAccessTokens = true;
                }
                pnl_GooglePlusContactsSuccess.Visible = true;
                div_googlep_status.Attributes["class"] = "googlep_active";
                lnkbtn_GooglePlusContacts.Visible = false;

            }


            if (Session["TwitterAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.TWITTER))
            {


                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.TWITTER))
                {
                    SociosUtil.Log("Twitter access token found in Session or Database");
                    lblTwitterUsername.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.TWITTER].username;
                }
                else
                {
                    SociosUtil.Log("Twitter access token found in Session");
                    string twitterAccessToken = Session["TwitterAccessToken"].ToString();
                    SociosUtil.Log("Twitter access token: " + twitterAccessToken);
                    string twitterAccessTokenSecret = Session["TwitterAccessTokenSecret"].ToString();
                    SociosUtil.Log("Twitter access token secret: " + twitterAccessTokenSecret);
                    string toSaveToDatabase = CONSUMER_KEY + "@" + CONSUMER_SECRET + "@" + twitterAccessToken + "@" + twitterAccessTokenSecret;
                    SociosUtil.Log("Twitter token to send to database: " + toSaveToDatabase);

                    SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(twitterAccessToken, twitterAccessTokenSecret, SociosServices.UserService.socialNetwork.TWITTER);
                    if (user != null)
                    {
                        SociosUtil.Log("Twitter user details taken from twitter access token: ");
                        SociosUtil.Log("    UserId: " + user.userId);
                        SociosUtil.Log("    Username: " + user.username);
                        lblTwitterUsername.Text = user.username;
                        SociosUtil.Log("Sending user details to database...");
                        tokenClient.SetUserAccessToken(UserInfo.UserID, 3, toSaveToDatabase, twitterAccessTokenSecret, user.username, user.userId);
                        SociosUtil.Log("Data sent.");
                        pnl_TwitterSuccess.Visible = true;
                        div_twitter_status.Attributes["class"] = "twitter_active";

                        lnkbtn_Twitter.Visible = false;
                        lnkbtn_TwitterDeauthorize.Visible = true;
                    }
                    else
                    {
                        SociosUtil.Log("tokenClient.GetUsernameFromAccessToken for twitter user failed");
                    }
                    forceRefreshAccessTokens = true;
                    Session["CurrentOAuthProcessed"] = null;

                }


                if (Session["CurrentOAuthProcessed"] == "twitter")
                {
                    SociosUtil.Log("Twitter access token found in Session");
                    string twitterAccessToken = Session["TwitterAccessToken"].ToString();
                    SociosUtil.Log("Twitter access token: " + twitterAccessToken);
                    string twitterAccessTokenSecret = Session["TwitterAccessTokenSecret"].ToString();
                    SociosUtil.Log("Twitter access token secret: " + twitterAccessTokenSecret);
                    string toSaveToDatabase = CONSUMER_KEY + "@" + CONSUMER_SECRET + "@" + twitterAccessToken + "@" + twitterAccessTokenSecret;
                    SociosUtil.Log("Twitter token to send to database: " + toSaveToDatabase);

                    SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(twitterAccessToken, twitterAccessTokenSecret, SociosServices.UserService.socialNetwork.TWITTER);
                    SociosUtil.Log("Twitter user details taken from twitter access token: ");
                    SociosUtil.Log("    UserId: " + user.userId);
                    SociosUtil.Log("    Username: " + user.username);
                    lblTwitterUsername.Text = user.username;
                    SociosUtil.Log("Sending user details to database...");
                    tokenClient.SetUserAccessToken(UserInfo.UserID, 3, toSaveToDatabase, twitterAccessTokenSecret, user.username, user.userId);
                    SociosUtil.Log("Data sent.");
                    forceRefreshAccessTokens = true;
                    Session["CurrentOAuthProcessed"] = null;
                }




            }

            if (Session["FacebookAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK) || Session["CurrentOAuthProcessed"] == "facebook")
            {

                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK))
                {
                    lbl_FacebookAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.FACEBOOK].username;
                }
                else if (Session["FacebookAccessToken"] != null)
                {
                    string facebookAccessToken = Session["FacebookAccessToken"].ToString();
                    SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(facebookAccessToken, "", SociosServices.UserService.socialNetwork.FACEBOOK);
                    tokenClient.SetUserAccessToken(UserInfo.UserID, 2, facebookAccessToken, "", user.username, user.userId);
                    lbl_FacebookAccessToken.Text = user.username;
                    forceRefreshAccessTokens = true;
                    Session["CurrentOAuthProcessed"] = null;
                }

                if (Session["CurrentOAuthProcessed"] == "facebook" && Session["FacebookAccessToken"] != null)
                {
                    string facebookAccessToken = Session["FacebookAccessToken"].ToString();
                    //  tokenClient.SetUserAccessToken(99, 2, Session["FacebookAccessToken"].ToString());
                    SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(facebookAccessToken, "", SociosServices.UserService.socialNetwork.FACEBOOK);
                    tokenClient.SetUserAccessToken(UserInfo.UserID, 2, facebookAccessToken, "", user.username, user.userId);
                    lbl_FacebookAccessToken.Text = user.username;
                    forceRefreshAccessTokens = true;
                    Session["CurrentOAuthProcessed"] = null;
                }







                pnl_FacebookSuccess.Visible = true;
                div_facebook_status.Attributes["class"] = "facebook_active";

                lnkbtn_Facebook.Visible = false;
                lnkbtn_FacebookDeauthorize.Visible = true;
                atLeastOneCandidateSnAuthenticated = true;
            }
            if (Session["DailymotionAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION))
            {

                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION))
                {
                    lbl_DailymotionAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.DAILYMOTION].username;
                }
                else
                {
                    string accessToken = Session["DailymotionAccessToken"].ToString();
                    SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(accessToken, "", SociosServices.UserService.socialNetwork.DAILYMOTION);
                    tokenClient.SetUserAccessToken(UserInfo.UserID, 6, accessToken, "", user.username, user.userId);
                    lbl_DailymotionAccessToken.Text = user.username;
                    forceRefreshAccessTokens = true;
                }
                pnl_DailymotionSuccess.Visible = true;
                div_dailymotion_status.Attributes["class"] = "dailymotion_active";
                lnkbtn_Dailymotion.Visible = false;
                lnkbtn_DailymotionDeauthorize.Visible = true;
                atLeastOneCandidateSnAuthenticated = true;


            }
            if (Session["InstagramAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM))
            {

                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM))
                {
                    lbl_InstagramUsername.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM].username;
                }
                else
                {
                    string accessToken = Session["InstagramAccessToken"].ToString();
                    // SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(accessToken, "", SociosServices.UserService.socialNetwork.INSTAGRAM);

                    string username = Session["InstagramOAuthUsername"].ToString();
                    string snsUserId = Session["InstagramOAuthUserId"].ToString();

                    tokenClient.SetUserAccessToken(UserInfo.UserID, 8, accessToken, "", username, snsUserId);
                    lbl_InstagramUsername.Text = username;
                    forceRefreshAccessTokens = true;
                }
                pnl_InstagramSuccess.Visible = true;
                div_instagram_status.Attributes["class"] = "instagram_active";
                lnkbtn_Instagram.Visible = false;
                lnkbtn_InstagramDeauthorize.Visible = true;


            }
            if (Session["MySpaceAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE))
            {

                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE))
                {
                    lbl_MyspaceAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE].username + " " + accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.MYSPACE].accessToken;
                    lbl_MyspaceAccessToken.ToolTip = lbl_MyspaceAccessToken.Text;
                    if (lbl_MyspaceAccessToken.Text.Length > 50)
                    {
                        lbl_MyspaceAccessToken.Text = lbl_MyspaceAccessToken.Text.Substring(0, 48);
                    }////////////////////////////////
                    /////////////////
                    /////////////////
                    //lnkbtn_DailymotionDeauthorize.Visible = true;
                    //lnkbtn_Dailymotion.Visible = false;
                }
                else
                {
                    string mySpaceAccessToken = Session["MySpaceAccessToken"].ToString();
                    //SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(mySpaceAccessToken, "", SociosServices.UserService.socialNetwork.MYSPACE);
                    //tokenClient.SetUserAccessToken(UserInfo.UserID, 5, mySpaceAccessToken, "", user.username, user.userId);

                    //TODO
                    //SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(accessToken, "", SociosServices.UserService.socialNetwork.DAILYMOTION);


                    tokenClient.SetUserAccessToken(UserInfo.UserID, 5, mySpaceAccessToken, "", "", "");

                    lbl_MyspaceAccessToken.Text = Session["MySpaceAccessToken"].ToString();
                    forceRefreshAccessTokens = true;
                }
                //var requestTokenKey = Session["requesttokenkey"].ToString();
                // var requestTokenSecret = Session["requesttokensecret"].ToString();
                //var verifier = Request.QueryString["oauth_verifier"];
                //MySpace offSiteMySpace = new MySpace(Constants.ConsumerKey, Constants.ConsumerSecret, requestTokenKey, requestTokenSecret, true, verifier);

                // lbl_DailymotionAccessToken.Text = offSiteMySpace.OAuthTokenKey; ;

                pnl_MySpaceSuccess.Visible = true;
                div_myspace_status.Attributes["class"] = "myspace_active";

                lnkbtn_Myspace.Visible = false;
                lnkbtn_MyspaceDeauthorize.Visible = true;

            }
            if (Session["FlickrAccessToken"] != null || accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FLICKR))
            {
                if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.FLICKR))
                {
                    lbl_FlickrAccessToken.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.FLICKR].username;
                }
                else
                {
                    //string flickrAccessToken = Session["FlickrAccessToken"].ToString();
                    //string flickrUsername = Session["FlickrOAuthUsername"].ToString();
                    //string flickrUserId = Session["FlickrOAuthUserId"].ToString();
                    ////SociosServices.UserService.userInfo user = tokenClient.GetUsernameFromAccessToken(flickrAccessToken, "", SociosServices.UserService.socialNetwork.FLICKR);
                    //tokenClient.SetUserAccessToken(UserInfo.UserID, 1, flickrAccessToken, "", flickrUsername, flickrUserId);
                    //lbl_FlickrAccessToken.Text = flickrUsername;
                    //forceRefreshAccessTokens = true;
                }
                pnl_FlickrSuccess.Visible = true;
                div_flickr_status.Attributes["class"] = "flickr_active";


                lnkbtn_Flickr.Visible = false;
                lnkbtn_FlickrDeauthorize.Visible = true;
                atLeastOneCandidateSnAuthenticated = true;
            }
            if (accessInfoDictionary.ContainsKey(SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM))
            {
                //lbl_InstagramUsername.Text = accessInfoDictionary[SociosServices.SociosUtil.UtilSocialNetwork.INSTAGRAM].username;
                lnkbtn_Instagram.Visible = false;
                lnkbtn_InstagramDeauthorize.Visible = true;
                div_instagram_status.Attributes["class"] = "instagram_active";
                pnl_InstagramSuccess.Visible = true;

            }

            if (atLeastOneCandidateSnAuthenticated && UserInfo.IsInRole("Candidates"))
                pnlCandidateGoToMediaSearch.Visible = true;
            else
                pnlCandidateGoToMediaSearch.Visible = false;
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
                Session["UserAccessTokensCacheUserId"] = UserId;
                forceRefreshAccessTokens = false;
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

        protected void lnkbtn_YouTube_Click(object sender, EventArgs e)
        {
            //Session["CurrentOAuthProcessed"] = "youtube";
            //Response.Redirect("OAuthTokenManager.aspx");
            Response.Redirect("http://epart.atc.gr:8080/YouTubeAdaptor/auth");

        }

        protected void lnkbtn_GooglePlusContacts_Click(object sender, EventArgs e)
        {
            Session["CurrentOAuthProcessed"] = "googlepluscontacts";
            Response.Redirect("OAuthTokenManager.aspx");
            //Response.Redirect("http://epart.atc.gr:8080/YouTubeAdaptor/auth");

        }

        protected void lnkbtn_Twitter_Click(object sender, EventArgs e)
        {
            Session["CurrentOAuthProcessed"] = "twitter";
            Response.Redirect("OAuthTokenManager.aspx");
        }

        protected void lnkbtn_Instagram_Click(object sender, EventArgs e)
        {
            //Session["CurrentOAuthProcessed"] = "twitter";
            //Response.Redirect("OAuthTokenManager.aspx");

            Session["CurrentOAuthProcessed"] = "instagram";
            Response.Redirect("OAuthTokenManager.aspx");
            // string redirectUri =  HttpUtility.UrlEncode("http://frontend.sociosproject.eu/OAuthTokenManager.aspx");
            //Response.Redirect("https://api.instagram.com/oauth/authorize/?client_id=ba133862ab6e461a8cc49a3e26da47ac&redirect_uri=" + redirectUri + "&response_type=code");

            //pnl_InstagramAuthenticate.Visible = true;
        }//dokimase to kai pes mou :p



        protected void lnkbtn_Facebook_Click(object sender, EventArgs e)
        {
            Session["CurrentOAuthProcessed"] = "facebook";
            Response.Redirect("OAuthTokenManager.aspx");
        }


        protected void lnkbtn_Dailymotion_Click(object sender, EventArgs e)
        {
            Session["CurrentOAuthProcessed"] = "dailymotion";
            Response.Redirect("OAuthTokenManager.aspx");
        }

        protected void lnkbtn_Myspace_Click(object sender, EventArgs e)
        {
            GetRequestToken();


            //Response.Redirect("OAuthTokenManager.aspx");
        }

        protected void lnkbtn_Flickr_Click(object sender, EventArgs e)
        {
            //Session["CurrentOAuthProcessed"] = "flickr";
            //Response.Redirect("OAuthTokenManager.aspx");
            Response.Redirect("http://epart.atc.gr:8080/FlickrOAuth/GetFrob");
        }

        private void GetRequestToken()
        {
            try
            {
                var context = new OffsiteContext(Constants.ConsumerKey, Constants.ConsumerSecret);
                //Get a Request Token
                Session["CurrentOAuthProcessed"] = "myspace";
                var callbackUrl = "http://frontend.sociosproject.eu/OAuthTokenManager.aspx";
                var requestToken = context.GetRequestToken(callbackUrl);
                Session["requesttokenkey"] = requestToken.TokenKey;
                Session["requesttokensecret"] = requestToken.TokenSecret;

                //Get the MySpace authentication page for the user to go to in order to authorize the Request Token.
                var authenticationUrl = context.GetAuthorizationUrl(requestToken, callbackUrl);

                Response.Redirect(authenticationUrl);
                //lbl_MyspaceAccessToken.Text = authenticationUrl;
            }
            catch (Exception ex)
            {
                string message = ex.Message;
            }
        }

        protected void lnkbtn_RefreshTokens_Click(object sender, EventArgs e)
        {
            RefreshAccessTokensFromDB();
            RenderAccessTokens();
        }
        //1 FLickr   * 2 Facebook    * 3 Twitter    * 4 Youtube    * 5 Opensocial    * 6 Dailymotion
        protected void Deauthorize_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            tokenClient.DeleteAccessInfo(UserId, Convert.ToInt32(e.CommandArgument.ToString()));
            Session["UserAccessTokensCache"] = null;
            Session["UserAccessTokensCacheArray"] = null;
            Session["CurrentOAuthProcessed"] = null;

            Session["FlickrAccessToken"] = null;
            Session["MySpaceAccessToken"] = null;
            Session["DailymotionAccessToken"] = null;
            Session["FacebookAccessToken"] = null;
            Session["TwitterAccessToken"] = null;
            Session["GooglePlusContactsAccessToken"] = null;
            Session["YouTubeAccessToken"] = null;
            Session["InstagramAccessToken"] = null;
            RefreshAccessTokensFromDB();
            RenderAccessTokens();
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(63));
        }

        protected void btn_InstagramConfirmUsername_Click(object sender, EventArgs e)
        {
            //string instagramUsername = txt_Instagram.Text;
            //if (instagramUsername.Length > 100)
            //    instagramUsername = instagramUsername.Substring(0, 90);
            //SociosServices.TokenServiceClient tokenClient2 = new TokenServiceClient();
            //string instagramUserId = tokenClient2.GetInstagramUserIdFromUsername(instagramUsername);
            //if (instagramUserId != null)
            //{
            //    txt_Instagram.Text = instagramUserId;
            //    //lbl_InstagramUsername.Text = instagramUsername;
            //    pnl_InstagramSuccess.Visible = true;
            //    pnl_InstagramAuthenticate.Visible = false;
            //    div_instagram_status.Attributes["class"] = "instagram_active";
            //    SociosServices.TokenServiceClient tokenClient = new TokenServiceClient();
            //    tokenClient.SetUserAccessToken(UserId, 8, "-", "-", instagramUsername, instagramUserId);
            //    lnkbtn_InstagramDeauthorize.Visible = true;
            //    lnkbtn_Instagram.Visible = false;
            //}
        }

    }

}
