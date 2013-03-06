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
using DotNetOpenAuth.ApplicationBlock;
using DotNetOpenAuth.OAuth;


using System.Net;
using DotNetOpenAuth.OAuth2;
using DotNetOpenAuth.ApplicationBlock.Facebook;
using System.Text;
using System.IO;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using DotNetOpenAuth.Messaging;
using DotNetOpenAuth.OAuth.ChannelElements;
using System.Security.Cryptography;
using MySpaceID.SDK.MySpace;
using MySpaceID_OAuth.Core;
using System.Collections.Specialized;


namespace DotNetNuke.Modules.Socios_OAuthTokenManager
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_OAuthTokenManager class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_OAuthTokenManagerModuleBase, IActionable
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
                if (this.YouTubeTokenManager != null && ((string)Session["YouTubeAccessToken"]) != "")
                {
                    // this.MultiView1.ActiveViewIndex = 1;
                    if (Session["CurrentOAuthProcessed"] != null)
                    {

                        if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "youtube")
                        {
                            var google = new WebConsumer(GoogleConsumer.ServiceDescription, this.YouTubeTokenManager);

                            //  Is Google calling back with authorization?
                            var accessTokenResponse = google.ProcessUserAuthorization();
                            if (accessTokenResponse != null)
                            {
                                string oAuthOutput = "";
                                this.YouTubeAccessToken = accessTokenResponse.AccessToken;
                                foreach(var data in accessTokenResponse.ExtraData)
                                {
                                    oAuthOutput += data.Key + ":" + data.Value;
                                }
                                oAuthOutput += this.YouTubeAccessToken;
                                //oAuthOutput += "";
                                Session["YouTubeAccessToken"] = oAuthOutput;
                                
                                Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");


                            }
                            else if (this.YouTubeAccessToken == null)
                            {
                                // If we don't yet have access, immediately request it.
                                GoogleConsumer.RequestAuthorization(google, GoogleConsumer.Applications.YouTube);
                            }
                        }
                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "googlepluscontacts")
                        {
                            var google = new WebConsumer(GoogleConsumer.ServiceDescription, this.GooglePlusContactsTokenManager);

                            //  Is Google calling back with authorization?
                            var accessTokenResponse = google.ProcessUserAuthorization();
                            if (accessTokenResponse != null)
                            {
                                string oAuthOutput = "";
                                this.GooglePlusContactsAccessToken = accessTokenResponse.AccessToken;
           
                                foreach (var data in accessTokenResponse.ExtraData)
                                {
                                    oAuthOutput += data.Key + ":" + data.Value;
                                }
                                oAuthOutput += this.GooglePlusContactsAccessToken;
                                //oAuthOutput += "";
                                Session["GooglePlusContactsAccessToken"] = oAuthOutput;

                                foreach (var quer in Request.QueryString)
                                {
                                    Session["GooglePlusContactsAccessToken"] += quer.ToString();
                                }

                                Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");


                            }
                            else if (this.GooglePlusContactsAccessToken == null)
                            {
                                // If we don't yet have access, immediately request it.
                                GoogleConsumer.RequestAuthorization(google, GoogleConsumer.Applications.Contacts);
                            }
                        }
                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "twitter")
                        {
                            if (this.TwitterTokenManager != null)
                            {
                                //this.MultiView1.ActiveViewIndex = 1;
                                if (this.TwitterAccessToken != null)
                                {
                                    Session["TwitterAccessToken"] = this.TwitterAccessToken;
                                    Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");
                                }

                                var twitter = new WebConsumer(TwitterConsumer.ServiceDescription, this.TwitterTokenManager);

                                // Is Twitter calling back with authorization?
                                var accessTokenResponse = twitter.ProcessUserAuthorization();
                                if (accessTokenResponse != null)
                                {
                                    this.TwitterAccessToken = accessTokenResponse.AccessToken;
                                    Session["TwitterAccessToken"] = this.TwitterAccessToken;

                                    Session["TwitterAccessTokenSecret"] = this.TwitterTokenManager.GetTokenSecret(this.TwitterAccessToken);



                                    Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");
                                }
                                else if (this.TwitterAccessToken == null)
                                {
                                    // If we don't yet have access, immediately request it.
                                    twitter.Channel.Send(twitter.PrepareRequestUserAuthorization());
                                }

                            }
                        }
                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "facebook")
                        {

                            IAuthorizationState authorization = client.ProcessUserAuthorization();
                            HashSet<string> scope = new HashSet<string>();
                            scope.Add("email");
                            scope.Add("read_stream");
                            //client.
                            //client.RequestUserAuthorization(scope);
                            if (authorization == null)
                            {
                                // Kick off authorization request
                                client.RequestUserAuthorization(scope);
                            }
                            else if (authorization.AccessToken != null)
                            {
                                Session["FacebookAccessToken"] = authorization.AccessToken;


                                if (UserInfo.IsInRole("Candidates"))
                                {
                                    Response.Redirect("http://www.facebook.com/dialog/oauth/?scope=email,user_birthday,offline_access,user_photos,user_videos&client_id=184169651646301&redirect_uri=http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx&response_type=token");
                                }
                                else
                                {
                                    Response.Redirect("http://www.facebook.com/dialog/oauth/?scope=email,user_birthday,offline_access&client_id=184169651646301&redirect_uri=http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx&response_type=token");
                            }
                                
                                
                                Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");
                            }
                            else
                            {
                                //var request = WebRequest.Create("https://graph.facebook.com/me?access_token=" + Uri.EscapeDataString(authorization.AccessToken));
                                //using (var response = request.GetResponse())
                                //{
                                //    using (var responseStream = response.GetResponseStream())
                                //    {
                                //        var graph = FacebookGraph.Deserialize(responseStream);
                                //        //this.nameLabel.Text = HttpUtility.HtmlEncode(graph.Name);
                                //    }
                                //}
                            }
                        }
                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "dailymotion")
                        {

                            if (Request.QueryString["code"] != null)
                            {
                                string code = Request.QueryString["code"].ToString();
                                lbl_output.Text += Request.QueryString["code"].ToString();
                                lbl_output.Text += "<br/>";
                                // Example


                                string url = "https://api.dailymotion.com/oauth/token";
                                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                                string proxy = null;

                                string data = String.Format("grant_type={0}&client_id={1}&client_secret={2}&redirect_uri={3}&code={4}", "authorization_code", HttpUtility.UrlEncode(DailymotionTokenManager.ConsumerKey), HttpUtility.UrlEncode(DailymotionTokenManager.ConsumerSecret), HttpUtility.UrlEncode("http://frontend.sociosproject.eu/OAuthTokenManager.aspx"), HttpUtility.UrlEncode(code));
                                lbl_output.Text += data;
                                byte[] buffer = Encoding.UTF8.GetBytes(data);


                                req.Method = "POST";
                                req.ContentType = "application/x-www-form-urlencoded";
                                req.ContentLength = buffer.Length;
                                req.Proxy = new WebProxy(proxy, true); // ignore for local addresses
                                req.CookieContainer = new CookieContainer(); // enable cookies

                                Stream reqst = req.GetRequestStream(); // add form data to request stream
                                reqst.Write(buffer, 0, buffer.Length);
                                reqst.Flush();
                                reqst.Close();

                                HttpWebResponse res = (HttpWebResponse)req.GetResponse();

                                Stream resst = res.GetResponseStream();
                                StreamReader sr = new StreamReader(resst);
                                string response = sr.ReadToEnd();
                                lbl_output.Text += "<br/>";
                                lbl_output.Text += response;

                                //response = response.Replace("{", "").Replace("}", "");
                                Dictionary<string, string> values = JsonConvert.DeserializeObject<Dictionary<string, string>>(response);
                                lbl_output.Text += "<b>Access token:</b> " + values["access_token"];
                                lbl_output.Text += "<b>Expires in</b>" + values["expires_in"];
                                lbl_output.Text += "<b>Refresh Token</b>" + values["refresh_token"];

                                if (values["access_token"] != null)
                                {
                                    Session["DailymotionAccessToken"] = values["access_token"];








                                    Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");
                                }
                            }
                            else
                            {
                                string redirectUrl = "https://api.dailymotion.com/oauth/authorize?" +
                                    "response_type=code&" +
                                    "client_id=" + DailymotionTokenManager.ConsumerKey + "&" +
                                    "redirect_uri=http://frontend.sociosproject.eu/OAuthTokenManager.aspx";
                                Response.Redirect(redirectUrl);
                            }

                        }

                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "myspace")
                        {
                                var requestTokenKey = Session["requesttokenkey"].ToString();
                                var requestTokenSecret = Session["requesttokensecret"].ToString();
                                var verifier = Request.QueryString["oauth_verifier"];
                                MySpace offSiteMySpace = new MySpace(Constants.ConsumerKey, Constants.ConsumerSecret, requestTokenKey, requestTokenSecret, true, verifier);
                               //Session["MySpaceAccessToken"] +=  offSiteMySpace.GetCurrentUser().ToString();
                                Session["MySpaceAccessToken"] = offSiteMySpace.OAuthTokenKey;
                                Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");

}
                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "instagram")
                        {
                            lbl_output.Text += "Processing instagram...";
                            try
                            {

                                /* 
                                    client_id: your client id
                                    client_secret: your client secret
                                    grant_type: authorization_code is currently the only supported value
                                    redirect_uri: the redirect_uri you used in the authorization request. Note: this has to be the same value as in the authorization request.
                                    code: the exact code you received during the authorization step.
                                */
                                if (Request.QueryString["code"] != null)
                                {
                                    string code = Request.QueryString["code"];



                                    NameValueCollection parameters = new NameValueCollection();
                                    parameters.Add("client_id", InstagramTokenManager.ConsumerKey);
                                    parameters.Add("client_secret", InstagramTokenManager.ConsumerSecret);
                                    parameters.Add("grant_type", "authorization_code");
                                    parameters.Add("redirect_uri", "http://frontend.sociosproject.eu/OAuthTokenManager.aspx");
                                    parameters.Add("code", code);

                                    WebClient client = new WebClient();
                                    client.Proxy = WebRequest.DefaultWebProxy;
                                    var result = client.UploadValues("https://api.instagram.com/oauth/access_token", parameters);

                                    var response = System.Text.Encoding.Default.GetString(result);
                                    lbl_output.Text += response.ToString();













                                    //string url = "https://api.instagram.com/oauth/access_token";
                                    //HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                                    //string proxy = null;

                                    //string data = String.Format("grant_type={0}&client_id={1}&client_secret={2}&redirect_uri={3}&code={4}", "authorization_code", HttpUtility.UrlEncode(InstagramTokenManager.ConsumerKey), HttpUtility.UrlEncode(InstagramTokenManager.ConsumerSecret), HttpUtility.UrlEncode("http://frontend.sociosproject.eu/OAuthTokenManager.aspx"), HttpUtility.UrlEncode(code));
                                    //lbl_output.Text += data;
                                    //byte[] buffer = Encoding.UTF8.GetBytes(data);


                                    //req.Method = "POST";
                                    //req.ContentType = "application/x-www-form-urlencoded";
                                    //req.ContentLength = buffer.Length;
                                    //req.Proxy = new WebProxy(proxy, true); // ignore for local addresses
                                    //req.CookieContainer = new CookieContainer(); // enable cookies

                                    //Stream reqst = req.GetRequestStream(); // add form data to request stream
                                    //reqst.Write(buffer, 0, buffer.Length);
                                    //reqst.Flush();
                                    //reqst.Close();

                                    //HttpWebResponse res = (HttpWebResponse)req.GetResponse();
                                    //lbl_output.Text += "Headers" + res.Headers.ToString();
                                    //Stream resst = res.GetResponseStream();
                                    //StreamReader sr = new StreamReader(resst);
                                    //string response = sr.ReadToEnd();
                                    //lbl_output.Text += "<br/>";
                                    //lbl_output.Text += response;

                                    ////response = response.Replace("{", "").Replace("}", "");
                                    InstagramAuthInfo values = JsonConvert.DeserializeObject<InstagramAuthInfo>(response);
                                    ////lbl_output.Text += "<b>Access token:</b> " + values["access_token"];
                                    ////lbl_output.Text += "<b>Expires in</b>" + values["expires_in"];
                                    ////lbl_output.Text += "<b>Refresh Token</b>" + values["refresh_token"];
                                    //lbl_output.Text += values.ToString();
                                    if (values.access_token != null)
                                    {
                                        Session["InstagramAccessToken"] = values.access_token;

                                        Session["InstagramOAuthUsername"] = values.user.full_name;
                                        Session["InstagramOAuthUserId"] = values.user.id;


                                        Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");
                                    }
                                }
                                else
                                {
                                    string redirectUrl = "https://api.instagram.com/oauth/authorize/?" +
                                        "response_type=code&" +
                                        "client_id=" + InstagramTokenManager.ConsumerKey + "&" +
                                        "redirect_uri=http://frontend.sociosproject.eu/OAuthTokenManager.aspx";
                                    Response.Redirect(redirectUrl);
                                }
                            }
                            catch (WebException ex)
                            {
                                lbl_output.Text += "ERROR: " + ex.StackTrace;
                                lbl_output.Text += "ERROR: " + ex.Message;
                             
                               //lbl_output.Text += ex.Response.ToString();
                                var res = (HttpWebResponse)ex.Response;
                                Stream resst = res.GetResponseStream();
                                StreamReader sr = new StreamReader(resst);
                                string response = sr.ReadToEnd();
                                lbl_output.Text += response;
                            }
                            
                            catch (Exception ex)
                            {
                                lbl_output.Text += "ERROR: " + ex.StackTrace;
                                lbl_output.Text += "ERROR: " + ex.Message;
                            }
                            

                            /*var requestTokenKey = Session["requesttokenkey"].ToString();
                            var requestTokenSecret = Session["requesttokensecret"].ToString();
                            var verifier = Request.QueryString["oauth_verifier"];
                            MySpace offSiteMySpace = new MySpace(Constants.ConsumerKey, Constants.ConsumerSecret, requestTokenKey, requestTokenSecret, true, verifier);
                            //Session["MySpaceAccessToken"] +=  offSiteMySpace.GetCurrentUser().ToString();
                            Session["MySpaceAccessToken"] = offSiteMySpace.OAuthTokenKey;
                            Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");*/

                        }

                        else if (!IsPostBack && ((string)Session["CurrentOAuthProcessed"]) == "flickr")
                        {
                            try
                            {
                                if (Request.QueryString["oauth_verifier"] == null)
                                {
                                    OAuthBase oAuth = new OAuthBase();
                                    OAuthBase2 oAuth2 = new OAuthBase2();
                                    string timestamp = oAuth.GenerateTimeStamp();
                                    string nonce = oAuth.GenerateNonce();
                                    // string data1 = String.Format("oauth_callback={0}&oauth_consumer_key={1}&oauth_nonce={2}&oauth_signature_method={3}&oauth_timestamp={4}&oauth_version={5}", HttpUtility.UrlEncode("frontend.sociosproject.eu/OAuthTokenManager.aspx"), "14ff18bc9d73b8630cd0a4f9e8bd4d54", "89601180", HttpUtility.UrlEncode("HMAC-SHA1"), DateTime.Now.Ticks, HttpUtility.UrlEncode("1.0"));
                                    string output1 = "";
                                    string output2 = "";
                                    Uri uri = new Uri("http://www.flickr.com/services/oauth/request_token");
                                    // 14ff18bc9d73b8630cd0a4f9e8bd4d54 API_KEY OLD
                                    // 4b722d955c1aa9a7 // API_SECRET OLD
                                    string signature = oAuth2.GenerateSignature(uri, "http://frontend.sociosproject.eu/OAuthTokenManager.aspx", "14ff18bc9d73b8630cd0a4f9e8bd4d54", "4b722d955c1aa9a7", null, null, "GET", timestamp, null, nonce, OAuthBase2.SignatureTypes.HMACSHA1, out output1, out output2);
                                    string parameters = String.Format("oauth_callback={0}&oauth_consumer_key={1}&oauth_nonce={2}&oauth_signature={6}&oauth_signature_method={3}&oauth_timestamp={4}&oauth_version={5}", OAuthBase2.UrlEncode("http://frontend.sociosproject.eu/OAuthTokenManager.aspx"), "14ff18bc9d73b8630cd0a4f9e8bd4d54", nonce, OAuthBase2.UrlEncode("HMAC-SHA1"), timestamp, OAuthBase2.UrlEncode("1.0"), OAuthBase2.UrlEncode(signature));
                                    string url = "http://www.flickr.com/services/oauth/request_token?";
                                    url += parameters;
                                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                                    string proxy = null;

                                    HttpWebResponse res = (HttpWebResponse)req.GetResponse();

                                    Stream resst = res.GetResponseStream();
                                    StreamReader sr = new StreamReader(resst);
                                    string response = sr.ReadToEnd();
                                    lbl_output.Text += "<br/>";
                                    lbl_output.Text += response;

                                    string[] responseArguments = response.Split('&');
                                    Dictionary<string, string> args = new Dictionary<string, string>();
                                    foreach (string arg in responseArguments)
                                    {
                                        string[] argArr = arg.Split('=');
                                        args.Add(argArr[0], argArr[1]);
                                    }
                                    string deleteme = "";
                                    string requestToken = args["oauth_token"];
                                    string requestTokenSecret = args["oauth_token_secret"];

                                    Session["flickrRequestToken"] = requestToken;
                                    Session["flickrRequestTokenSecret"] = requestTokenSecret;
                                    Response.Redirect("http://www.flickr.com/services/oauth/authorize?oauth_token=" + requestToken);
                                }
                                else
                                {
                                    string requestToken = Session["flickrRequestToken"].ToString();
                                    string tokenSecret = Session["flickrRequestTokenSecret"].ToString();
                                    string verifier = Request.QueryString["oauth_verifier"];
                                    OAuthBase oAuth = new OAuthBase();
                                    OAuthBase2 oAuth2 = new OAuthBase2();
                                    string timestamp = oAuth2.GenerateTimeStamp();
                                    string nonce = oAuth2.GenerateNonce();
                                    // string data1 = String.Format("oauth_callback={0}&oauth_consumer_key={1}&oauth_nonce={2}&oauth_signature_method={3}&oauth_timestamp={4}&oauth_version={5}", HttpUtility.UrlEncode("frontend.sociosproject.eu/OAuthTokenManager.aspx"), "14ff18bc9d73b8630cd0a4f9e8bd4d54", "89601180", HttpUtility.UrlEncode("HMAC-SHA1"), DateTime.Now.Ticks, HttpUtility.UrlEncode("1.0"));
                                    string output1 = "";
                                    string output2 = "";
                                    Uri uri = new Uri("http://www.flickr.com/services/oauth/access_token");

                                    string signature = oAuth2.GenerateSignature(uri, null, "14ff18bc9d73b8630cd0a4f9e8bd4d54", "4b722d955c1aa9a7", requestToken, tokenSecret, "GET", timestamp, verifier, nonce, OAuthBase2.SignatureTypes.HMACSHA1, out output1, out output2);


                                    // ok, vevaia einai kalo na 3ereis to swma sou, ti sou aresei kai ti oxi


                                    //string deelte = "GET&http%3A%2F%2Fwww.flickr.com%2Fservices%2Foauth%2Faccess_token&oauth_consumer_key%3D14ff18bc9d73b8630cd0a4f9e8bd4d54%26oauth_nonce%3D4432523%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1311948839%26oauth_token%3D72157627183812925-ed97f854a004508b%26oauth_verifier%3Dc1251383856ae3ce%26oauth_version%3D1.0";
                                    string parameters = String.Format("oauth_nonce={0}&oauth_timestamp={1}&oauth_verifier={2}&oauth_consumer_key={3}&oauth_signature_method={4}&oauth_version={5}&oauth_token={6}&oauth_signature={7}", nonce, timestamp, verifier, "14ff18bc9d73b8630cd0a4f9e8bd4d54", OAuthBase2.UrlEncode("HMAC-SHA1"), OAuthBase2.UrlEncode("1.0"), OAuthBase2.UrlEncode(requestToken), OAuthBase2.UrlEncode(signature));

                                    string url = "http://www.flickr.com/services/oauth/access_token?";
                                    url += parameters;
                                    Session["testurl"] = url;
                                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                                    string proxy = null;

                                    HttpWebResponse res = (HttpWebResponse)req.GetResponse();

                                    Stream resst = res.GetResponseStream();
                                    StreamReader sr = new StreamReader(resst);
                                    string response = sr.ReadToEnd();
                                    lbl_output.Text += "<br/>";
                                    lbl_output.Text += response;

                                    /*
                                     fullname=
oauth_token=72157627308196706-84fc054fc590caa5
oauth_token_secret=1509047ae292ea24
user_nsid=65639314%40N07
username=Socios%20Front%20End
                                     
                                     */


                                    string[] responseArguments = response.Split('&');
                                    Dictionary<string, string> args = new Dictionary<string, string>();
                                    Session["FlickrAccessToken"] = "";
                                    foreach (string arg in responseArguments)
                                    {
                                        string[] argArr = arg.Split('=');
                                        args.Add(argArr[0], argArr[1]);

                                        //Session["FlickrAccessToken"] += argArr[0] + "=" + argArr[1] + "<br/>";
                                    }
                                    Session["FlickrOAuthUsername"] = HttpUtility.UrlDecode(args["username"]);
                                    Session["FlickrOAuthUserId"] = HttpUtility.UrlDecode(args["user_nsid"]);
                                   Session["FlickrAccessToken"] = args["oauth_token"];
                                   Response.Redirect("LinkingYourSocialNetworkAccounts.aspx");

                                }
                            }
                            catch (Exception ex)
                            {



                                lbl_output.Text += "<br/><br/>" + Session["testurl"];


                            }


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

        private string YouTubeAccessToken
        {
            get { return (string)Session["YouTubeAccessToken"]; }
            set { Session["YouTubeAccessToken"] = value; }
        }

        private string GooglePlusContactsAccessToken
        {
            get { return (string)Session["GooglePlusContactsAccessToken"]; }
            set { Session["GooglePlusContactsAccessToken"] = value; }
        }

        private string TwitterAccessToken
        {
            get { return (string)Session["TwitterAccessToken"]; }
            set { Session["TwitterAccessToken"] = value; }
        }

        private static readonly FacebookClient client = new FacebookClient
        {
            ClientIdentifier = "184169651646301", //ConfigurationManager.AppSettings["facebookAppID"],
            ClientSecret = "26b8d0690427d57041a525a5e2a50328",//ConfigurationManager.AppSettings["facebookAppSecret"],
        };

        private InMemoryTokenManager YouTubeTokenManager
        {
            get
            {
                var tokenManager = (InMemoryTokenManager)Application["YouTubeTokenManager"];
                if (tokenManager == null)
                {
                    string consumerKey = "frontend.sociosproject.eu";// ConfigurationManager.AppSettings["googleConsumerKey"];
                    string consumerSecret = "-4eI-pex0h1n31ACIIHdg5Ez";// ConfigurationManager.AppSettings["googleConsumerSecret"];
                    if (!string.IsNullOrEmpty(consumerKey))
                    {
                        tokenManager = new InMemoryTokenManager(consumerKey, consumerSecret);
                        Application["YouTubeTokenManager"] = tokenManager;
                    }
                }

                return tokenManager;
            }
        }

        private InMemoryTokenManager GooglePlusContactsTokenManager
        {
            get
            {
                var tokenManager = (InMemoryTokenManager)Application["GooglePlusContactsTokenManager"];
                if (tokenManager == null)
                {
                    string consumerKey = "frontend.sociosproject.eu";// ConfigurationManager.AppSettings["googleConsumerKey"];
                    string consumerSecret = "-4eI-pex0h1n31ACIIHdg5Ez";// ConfigurationManager.AppSettings["googleConsumerSecret"];
                    if (!string.IsNullOrEmpty(consumerKey))
                    {
                        tokenManager = new InMemoryTokenManager(consumerKey, consumerSecret);
                        Application["GooglePlusContactsTokenManager"] = tokenManager;
                    }
                }

                return tokenManager;
            }
        }

        private InMemoryTokenManager TwitterTokenManager
        {
            get
            {
                var tokenManager = (InMemoryTokenManager)Application["TwitterTokenManager"];
                if (tokenManager == null)
                {
                    string consumerKey = "dKzWF4UspzgVXl31dNhw";// ConfigurationManager.AppSettings["googleConsumerKey"];
                    string consumerSecret = "rftX05xlV7CcnBqhCPgk9AhgeHeBpdDUObgqgTSbOBE";// ConfigurationManager.AppSettings["googleConsumerSecret"];
                    if (!string.IsNullOrEmpty(consumerKey))
                    {
                        tokenManager = new InMemoryTokenManager(consumerKey, consumerSecret);
                        Application["TwitterTokenManager"] = tokenManager;
                    }
                }

                return tokenManager;
            }
        }

        private InMemoryTokenManager DailymotionTokenManager
        {
            get
            {
                var tokenManager = (InMemoryTokenManager)Application["DailyTokenManager"];
                if (tokenManager == null)
                {
                    string consumerKey = "41fd874e918a34b00b42";// ConfigurationManager.AppSettings["googleConsumerKey"];
                    string consumerSecret = "8e8258f23a1bb38429a148fb80d3dbf820a63ae7";// ConfigurationManager.AppSettings["googleConsumerSecret"];
                    if (!string.IsNullOrEmpty(consumerKey))
                    {
                        tokenManager = new InMemoryTokenManager(consumerKey, consumerSecret);
                        Application["DailyTokenManager"] = tokenManager;
                    }
                }

                return tokenManager;
            }
        }

        private InMemoryTokenManager InstagramTokenManager
        {
            get
            {
                var tokenManager = (InMemoryTokenManager)Application["InstagramTokenManager"];
                if (tokenManager == null)
                {
                    string consumerKey = "ba133862ab6e461a8cc49a3e26da47ac";// ConfigurationManager.AppSettings["googleConsumerKey"];
                    string consumerSecret = "09097e16faf6426399d9c3cbf902edd2";// ConfigurationManager.AppSettings["googleConsumerSecret"];
                    if (!string.IsNullOrEmpty(consumerKey))
                    {
                        tokenManager = new InMemoryTokenManager(consumerKey, consumerSecret);
                        Application["InstagramTokenManager"] = tokenManager;
                    }
                }

                return tokenManager;
            }
        }



        // FlickR Extras

        private string Encrypt(string message)
        {
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();

            byte[] keyByte = encoding.GetBytes("653e7a6ecc1d528c516cc8f92cf98611&");
            // flickr api key

            HMACMD5 hmacmd5 = new HMACMD5(keyByte);
            HMACSHA1 hmacsha1 = new HMACSHA1(keyByte);
            HMACSHA256 hmacsha256 = new HMACSHA256(keyByte);
            HMACSHA384 hmacsha384 = new HMACSHA384(keyByte);
            HMACSHA512 hmacsha512 = new HMACSHA512(keyByte);

            byte[] messageBytes = encoding.GetBytes(message);

            byte[] hashmessage = hmacmd5.ComputeHash(messageBytes);

            string hmac1 = ByteToString(hashmessage);

            hashmessage = hmacsha1.ComputeHash(messageBytes);

            string hmac2 = ByteToString(hashmessage);

            hashmessage = hmacsha256.ComputeHash(messageBytes);

            string hmac3 = ByteToString(hashmessage);

            hashmessage = hmacsha384.ComputeHash(messageBytes);

            string hmac4 = ByteToString(hashmessage);

            hashmessage = hmacsha512.ComputeHash(messageBytes);

            string hmac5 = ByteToString(hashmessage);

            return hmac2;
        }
        public static string ByteToString(byte[] buff)
        {
            string sbinary = "";

            for (int i = 0; i < buff.Length; i++)
            {
                sbinary += buff[i].ToString("X2"); // hex format
            }
            return (sbinary);
        }

    }

    public class InstagramAuthInfo
    {
        public string access_token { get; set; }
        public User user { get; set; }

    }

    public class User
{
    public string id { get; set; }
    public string username { get; set; }
        public string full_name { get; set; }
        public string profile_picture { get; set; }
}
    /*
     {
    "access_token": "fb2e77d.47a0479900504cb3ab4a1f626d174d2d",
    "user": {
        "id": "1574083",
        "username": "snoopdogg",
        "full_name": "Snoop Dogg",
        "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg"
    }
}
     */

}
