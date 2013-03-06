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
using System.Net;
using System.IO;
using System.Web.Script.Serialization;


namespace DotNetNuke.Modules.Socios_MediaSearch
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_MediaSearch class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_MediaSearchModuleBase, IActionable
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
                Ltrl_HttpGet.Text += HttpGet("http://epart.atc.gr:8080/SociosYtWeb/resources/media?query=egypt+war+revolution");
                
                TextBox1.Text = DateTime.Now.ToLongDateString();
                JavaScriptSerializer ser = new JavaScriptSerializer();
                ser.Deserialize

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        string HttpGet(string uri)
      {
          Stream stream;
          StreamReader reader;
          String response = null;
          WebClient webClient = new WebClient();
          webClient.Credentials = new NetworkCredential("guestiris", "irisguest", "atc");
          webClient.Proxy = new WebProxy("10.1.1.51", 8080);

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


                  if (ex.Response is HttpWebResponse)
                  {
                      // Add you own error handling as required
                      Ltrl_HttpGet.Text += ex.Message;
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

        public class MediaItem
        {
            //public MediaItem() { objects = new List<SubObject>(); }
            public string displayFieldName { get; set; }
            public NameTypePair fieldAliases { get; set; }
            public PositionType positionType { get; set; }
            public Ref reference { get; set; }
            public List<SubObject> objects { get; set; }
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

    }

}
