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
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;
using System.Collections;
using System.Diagnostics;
using System.Web.UI.WebControls;
using DotNetNuke.Modules.Socios_MediaSearch.SociosTranslationService;


namespace DotNetNuke.Modules.Socios_MediaSearch
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_MediaSearch class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_MediaSearchModuleBase, IActionable
    {
        ArrayList mediaItemsArr = new ArrayList();
        DataTable dt = new DataTable();


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

        }

        DataSet GetMediaItemsPagedDataSet(ArrayList mediaItems, DataTable dt, int page)
        {
            Btn_NextPage.CommandArgument = (page + 1).ToString();
            int PAGE_SIZE = 9;
            int firstIndex = (PAGE_SIZE * page - PAGE_SIZE) + 1;
            int lastIndex = firstIndex + (PAGE_SIZE - 1);
            //Guid guid = Guid.NewGuid();
            for (int i = firstIndex; i <= lastIndex; i++)
            {
                if (i < mediaItems.Count - 1)
                {
                    MediaItem mi = (MediaItem)mediaItems[i];
                    DataRow dr = dt.NewRow();
                    dr["id"] = mi.id;
                    dr["title"] = mi.title;
                    //dr["owner_name"] = mi..owner_name;
                    //dr["date_uploaded"] = mi..date_uploaded;
                   // dr["date_created"] = mi.date_created;
                    dr["lat"] = mi.location.latitude;
                    dr["lon"] = mi.location.longitude;
                    dr["videoID"] = mi.id.id;
                    dr["description"] = mi.description;
                    //dr["license"] = mi.license;
                    //dr["category"] = mi.category;
                    dr["url"] = mi.url;
                    dr["type"] = mi.type;
                    //dr["owner_id"] = mi.owner_id; 10/11/2011 following manias call
                    // should be added by nikos to xsd
                    dr["tags"] = mi.tags;
                    //dr["views"] = mi..views;
                    //dr["height"] = mi.height;
                    //dr["width"] = m
                    dr["rating"] = mi.rating;
                    //dr["thumbnail_url"] = mi.thumbnail_url;
                    dr["sns_id"] = mi.id.source;
                    dt.Rows.Add(dr);
                }
                else
                {
                    lastIndex = i;
                    break;
                }
            }
            Ltrl_SearchResultsPageInfo.Text = "Displaying results " + firstIndex + " - " + lastIndex + " of " + (mediaItems.Count - 1);
            Ltrl_SearchResultsPageInfo.Text += "\nFirstIndex =" + firstIndex + " |\n " + " lastIndex = " + lastIndex + " |\n " + "mediaItems.Count - 1=" + (mediaItems.Count - 1);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            return ds;
        }



        string ReplaceFirst(string text, string search, string replace)
        {
            int pos = text.IndexOf(search);
            if (pos < 0)
            {
                return text;
            }
            return text.Substring(0, pos) + replace + text.Substring(pos + search.Length);
        }


        string HttpGet(string uri)
        {
            Stream stream;
            StreamReader reader;
            String response = null;
            WebClient webClient = new WebClient();
            webClient.Credentials = new NetworkCredential("guestiris", "irisguest", "atc");
            if (Chkbx_UseProxy.Checked)
            {
                webClient.Proxy = new WebProxy("10.1.1.51", 8080);
            }
            else
            {
                webClient.Proxy = WebRequest.DefaultWebProxy;

            }
            //    ShowroomUtilsWS.Url = ShowroomURL;

            //    if (PServerURL != string.Empty) pserver.Url = PServerURL; // if not empty use it else use default URL
            //    pserver.Credentials = new NetworkCredential(user, pass, domain);
            //    pserver.Proxy = new WebProxy(proxy, int.Parse(port));

            using (webClient)
            {
                // Check our auth details
                try
                {
                    // open and read from the supplied URI
                    stream = webClient.OpenRead(uri);
                    reader = new StreamReader(stream);
                    response = reader.ReadToEnd();
                }
                catch (WebException ex)
                {

                    return "httpError:" + ex.Message;
                    if (ex.Response is HttpWebResponse)
                    {
                        // Add you own error handling as required

                        switch (((HttpWebResponse)ex.Response).StatusCode)
                        {
                            case HttpStatusCode.NotFound:
                            case HttpStatusCode.Unauthorized:
                                response = null;
                                break;

                            default:
                                throw ex;
                        }

                    }
                }
            }

            return response;
        }

        //public class MediaItem
        //{
        //    //public MediaItem() { objects = new List<SubObject>(); }
        //    public string id { get; set; }
        //    public string title { get; set; }
        //    public string owner_name { get; set; }
        //    public string date_uploaded { get; set; }
        //    public string date_created { get; set; }
        //    public string lat { get; set; }
        //    public string lon { get; set; }
        //    public string videoID { get; set; }
        //    public string description { get; set; }
        //    public string license { get; set; }
        //    public string category { get; set; }
        //    public string url { get; set; }
        //    public string type { get; set; }
        //    public string owner_id { get; set; }
        //    public string tags { get; set; }
        //    public string views { get; set; }
        //    public string height { get; set; }
        //    public string width { get; set; }
        //    public string rating { get; set; }
        //    public string thumbnail_url { get; set; }
        //    public string sns_id { get; set; }
        //    public string query_id { get; set; }
        //    //public NameTypePair fieldAliases { get; set; }
        //    //public PositionType positionType { get; set; }
        //    //public Ref reference { get; set; }
        //}

        public class MediaItems
        {

            public List<MediaItem> objects { get; set; }
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

        protected void Btn_NextPage_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            ArrayList test1 = (ArrayList)Session["mediaItemsArr"];
            int page = (int)Session["searchPage"];
            lstvw_MediaItems.DataSource = GetMediaItemsPagedDataSet((ArrayList)Session["mediaItemsArr"], ((DataTable)Session["dt"]).Clone(), page + 1);
            lstvw_MediaItems.DataBind();
            Session["searchPage"] = ++page;
        }

        protected void Btn_PreviousPage_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            ArrayList test1 = (ArrayList)Session["mediaItemsArr"];
            int page = (int)Session["searchPage"];
            if (page > 1)
            {
                lstvw_MediaItems.DataSource = GetMediaItemsPagedDataSet((ArrayList)Session["mediaItemsArr"], ((DataTable)Session["dt"]).Clone(), page - 1);
                lstvw_MediaItems.DataBind();
            }
            Session["searchPage"] = --page;
        }

        protected void Btn_SearchMedia_Click(object sender, EventArgs e)
        {
            SearchMedia("search");
        }

        protected void SearchMedia(string mode)
        {
            try
            {
                Stopwatch sw = new Stopwatch();
                sw.Start();
                //string response = HttpGet("http://epart.atc.gr:8080/SociosYtWeb/resources/media?query=egypt+war+revolution");

                //Ltrl_HttpGet.Text += HttpGet("http://epart.atc.gr:8080/SociosYtWeb/resources/media?query=egypt+war+revolution");

                // create reader & open file

                string parameters = "";
                string dummyResponse = "";
                if (mode == "search")
                {
                    // read a line of text

                    string query = Txt_SearchQuery.Text;
                    string owner = Txt_SearchOwner.Text;
                    string license = Txt_SearchLicense.Text;
                    string latitude = Txt_SearchLatitude.Text;
                    string longitude = Txt_SearchLongitude.Text;



                    // Processing query parameter
                    string[] words = query.Split(' ');
                    string keywords = "";
                    foreach (string word in words)
                    {
                        keywords = keywords.Replace("#", " ");
                        keywords += word + "#";
                    }
                    keywords = keywords.Replace("#", " ");
                    parameters = "keywords=" + Server.UrlEncode(keywords);


                    // Processing other parameters
                    if (owner != string.Empty)
                        parameters += "&owner=" + owner;

                    if (license != string.Empty)
                        parameters += "&license=" + license;

                    if (latitude != string.Empty && longitude != string.Empty)
                        parameters += "&lat=" + latitude + "&lon=" + longitude;



                    if (Chkbx_UseLocal.Checked)
                    {
                        TextReader tr = new StreamReader(Server.MapPath("~/DesktopModules/Socios_MediaSearch/dummy3.json"));
                        dummyResponse = tr.ReadToEnd();
                        tr.Close();
                    }
                    else
                    {
                        dummyResponse = HttpGet("http://147.102.19.114:8080/SocIoSController/resources/Search?" + parameters);
                        Ltrl_ServiceURL.Text = "http://147.102.19.114:8080/SocIoSController/resources/Search?" + parameters;

                    }
                    int mediaItemCounter = 0;
                    //tr.Close();
                }
                else if (mode == "filter")
                {

                    string title = Txt_Title.Text;
                    string owner_name = Txt_Owner_name.Text;
                    string date_uploaded = Txt_Date_uploaded.Text;
                    string date_created = Txt_Date_created.Text;
                    string lat = Txt_Lat.Text;
                    string lon = Txt_Lon.Text;
                    string item_id = Txt_Item_id.Text;
                    string description = Txt_Description.Text;
                    string license = Txt_License.Text;
                    string category = Txt_Category.Text;
                    string url = Txt_Url.Text;
                    string type = Txt_Type.Text;
                    string owner_id = Txt_Owner_id.Text;
                    string tags = Txt_Tags.Text;
                    string views = Txt_Views.Text;
                    string height = Txt_Height.Text;
                    string width = Txt_Width.Text;
                    string rating = Txt_Rating.Text;
                    string thumbnail_url = Txt_Thumbnail_url.Text;
                    parameters += "query_id=" + Txt_Query_ID.Text;
                    parameters += (title == string.Empty) ? "" : "&title=" + Server.UrlEncode(title);
                    parameters += (owner_name == string.Empty) ? "" : "&owner_name=" + Server.UrlEncode(owner_name);
                    parameters += (date_uploaded == string.Empty) ? "" : "&date_uploaded=" + Server.UrlEncode(date_uploaded);
                    parameters += (date_created == string.Empty) ? "" : "&date_created=" + Server.UrlEncode(date_created);
                    parameters += (item_id == string.Empty) ? "" : "&item_id=" + Server.UrlEncode(item_id);
                    parameters += (description == string.Empty) ? "" : "&description=" + Server.UrlEncode(description);
                    parameters += (license == string.Empty) ? "" : "&license=" + Server.UrlEncode(license);
                    parameters += (category == string.Empty) ? "" : "&category=" + Server.UrlEncode(category);
                    parameters += (url == string.Empty) ? "" : "&url=" + Server.UrlEncode(url);
                    parameters += (type == string.Empty) ? "" : "&type=" + Server.UrlEncode(type);
                    parameters += (owner_id == string.Empty) ? "" : "&owner_id=" + Server.UrlEncode(owner_id);
                    parameters += (tags == string.Empty) ? "" : "&tags=" + Server.UrlEncode(tags);
                    parameters += (views == string.Empty) ? "" : "&views=" + Server.UrlEncode(views);
                    parameters += (height == string.Empty) ? "" : "&height=" + Server.UrlEncode(height);
                    parameters += (width == string.Empty) ? "" : "&width=" + Server.UrlEncode(width);
                    parameters += (rating == string.Empty) ? "" : "&rating=" + Server.UrlEncode(rating);
                    parameters += (thumbnail_url == string.Empty) ? "" : "&thumbnail_url=" + Server.UrlEncode(thumbnail_url);
                    parameters += (RdbtnLst_FilterSNS.SelectedItem.Value == "all") ? "" : "&sns_id=" + Server.UrlEncode(RdbtnLst_FilterSNS.SelectedItem.Value);




                    

                    dummyResponse = HttpGet("http://147.102.19.114:8080/SocIoSController/resources/Filter?" + parameters);
                    Ltrl_ServiceURL.Text = "http://147.102.19.114:8080/SocIoSController/resources/Filter?" + parameters;
                }














                //}



                //TextBox1.Text = DateTime.Now.ToLongDateString();
                // Ltrl_HttpGet.Text = response;

                if (Chkbx_Deserialize.Checked)
                {

                    JavaScriptSerializer ser = new JavaScriptSerializer();
                    //MediaItems items = ser.Deserialize<MediaItems>(dummyResponse);


                    //Dictionary<string, Dictionary<string, Dictionary<string, object>>> desDic = ser.Deserialize<Dictionary<string, Dictionary<string, Dictionary<string, object>>>>(dummyResponse);
                    Dictionary<string, Dictionary<string, MediaItem>> desDic = ser.Deserialize<Dictionary<string, Dictionary<string, MediaItem>>>(dummyResponse);
                    Dictionary<string, MediaItem> mediaItems = desDic["MediaItems"];
                    mediaItemsArr = new ArrayList();
                    foreach (KeyValuePair<string, MediaItem> item in mediaItems)
                    {
                       // item.Value.id = Guid.NewGuid().ToString();
                        mediaItemsArr.Add(item.Value);

                    }
                    if (mediaItemsArr.Count > 0)
                    {
                        //Txt_Query_ID.Text = ((MediaItem)mediaItemsArr[0]).query_id;
                    }
                    Session["mediaItemsArr"] = mediaItemsArr;
                    // Ltrl_TotalResults.Text = "Total results: " + mediaItems.Count;

                    dt.Columns.Clear();
                    dt.Columns.Add("id");
                    dt.Columns.Add("title");
                    dt.Columns.Add("owner_name");
                    dt.Columns.Add("date_uploaded");
                    dt.Columns.Add("date_created");
                    dt.Columns.Add("lat");
                    dt.Columns.Add("lon");
                    dt.Columns.Add("videoID");
                    dt.Columns.Add("description");
                    dt.Columns.Add("license");
                    dt.Columns.Add("category");
                    dt.Columns.Add("url");
                    dt.Columns.Add("type");
                    dt.Columns.Add("owner_id");
                    dt.Columns.Add("tags");
                    dt.Columns.Add("views");
                    dt.Columns.Add("height");
                    dt.Columns.Add("width");
                    dt.Columns.Add("rating");
                    dt.Columns.Add("thumbnail_url");
                    dt.Columns.Add("sns_id");


                    //dt.Columns 
                    // DataRow dr = new DataRow();

                    Session["dt"] = dt;
                    lstvw_MediaItems.DataSource = GetMediaItemsPagedDataSet(mediaItemsArr, (DataTable)Session["dt"], 1);
                    lstvw_MediaItems.DataBind();
                    //desDic.
                    //Dictionary<string, object> mediaItems = ser.Deserialize<Dictionary<string, object>>();desDic["mediaitems"]
                    Session["searchPage"] = 1;
                    Ltrl_SearchResultsInfo1.Text = mediaItemsArr.Count + " results (" + TimeSpan.FromMilliseconds(sw.ElapsedMilliseconds).TotalSeconds + " seconds)<br/>";
                    ;
                    //Ltrl_SearchResultsPageInfo.Text = "Displaying results 1 - 9 of " + mediaItemsArr.Count;

                }
                else
                {
                    Ltrl_SearchResultsPageInfo.Text = dummyResponse;
                }
                //Ltrl_HttpGet.Text = "got here";
            }
            catch (Exception exc) //Module failed to load
            {
                //Exceptions.ProcessModuleLoadException(this, exc);
                Exceptions.ProcessModuleLoadException(exc.Message, this, exc);
                //TextBox1.Text = exc.Message;
            }
        }

        protected void Btn_FilterMedia_Click(object sender, EventArgs e)
        {
            SearchMedia("filter");
        }

        protected void lstvw_MediaItems_ItemCommand(object sender, System.Web.UI.WebControls.ListViewCommandEventArgs e)
        {
            if (e.CommandName == "TranslateMediaItem")
            {
                Label lbl_description = (Label)  e.Item.FindControl("lbl_description");
                Label lbl_Info = (Label)e.Item.FindControl("lbl_Info");
                Panel pnl_Info = (Panel)e.Item.FindControl("pnl_Info");
                
                string itemDescription = lbl_description.Text;
                //lbl_description.Text = "";
                TranslateService svc = new TranslateService();
                SociosTranslationService.MediaItem mediaItem = new SociosTranslationService.MediaItem();

                DropDownList ddl_translateFrom = (DropDownList)e.Item.FindControl("ddl_translateFrom");
                DropDownList ddl_translateTo = (DropDownList)e.Item.FindControl("ddl_translateTo");
                string detectedLanguage = "";
                string fromLanguage = "";
                string fromLanguageName = ddl_translateFrom.SelectedItem.Text;;
                string toLanguage = ddl_translateTo.SelectedValue;
                string toLanguageName = ddl_translateTo.SelectedItem.Text;
               
                if (ddl_translateFrom.SelectedValue == "detect")
                {
                    detectedLanguage = svc.detect(null, itemDescription);
                  string[] detectedLanguageDetails =  detectedLanguage.Split('\n');
                  detectedLanguage = detectedLanguageDetails[1];
                    fromLanguageName = detectedLanguageDetails[2];
                    lbl_Info.Text = "Language detected as <b>" + fromLanguageName + "</b><br/><br/>";
                }
                else
                {
                    fromLanguage = ddl_translateFrom.SelectedValue;
                }


                mediaItem.description = itemDescription;
                mediaItem = svc.translateMediaItem(
                    null, 
                  mediaItem, 
                    fromLanguage, toLanguage);
                lbl_description.Text = mediaItem.description;
                pnl_Info.Visible = true;
                
                lbl_Info.Text += "Successfully translated from <b>" + fromLanguageName + "</b> to <b>" + toLanguageName+"</b>";

            }

            else if (e.CommandName == "ViewMediaItemDetails")
            {
                ArrayList mediaItems = (ArrayList)Session["mediaItemsArr"];
                ArrayList singleMediaItemDetails = new ArrayList();
                foreach (MediaItem mediaItem in mediaItems)
                {
                    if(mediaItem.id.id == e.CommandArgument.ToString())
                    {
                        singleMediaItemDetails.Add(mediaItem);
                    }
                   
                }
                lstvw_MediaItemDetails.DataSource = singleMediaItemDetails;
                lstvw_MediaItemDetails.DataBind();
            }
        }



    }

}



/*
 * 
 * // Use if each mediaItem has the same title (mediaItem) and not mediaItem1 mediaItem2 etc
                // while (dummyResponse.Contains("\"mediaItem\":{"))
                // {
                //     dummyResponse = ReplaceFirst(dummyResponse, "\"mediaItem\":{", "\"mediaItem" + mediaItemCounter++ + "\":{");
                // }

                //dummyResponse = dummyResponse.Replace("\"mediaItem\":{", "\"mediaItem" + mediaItemCounter + DateTime.Now.Millisecond + "\":{");
                //Ltrl_HttpGet.Text = dummyResponse;
                // close the stream
 * 
 
 
 */