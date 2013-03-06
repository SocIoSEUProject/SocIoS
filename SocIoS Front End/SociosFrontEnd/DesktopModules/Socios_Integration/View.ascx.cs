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
using System.Web;
using System.IO;
using System.Xml.Serialization;
using System.Xml.Linq;
using DotNetNuke.Modules.Socios_MediaSearch;


namespace DotNetNuke.Modules.Socios_Integration
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSocios_Integration class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_IntegrationModuleBase, IActionable
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

        protected void Button1_Click(object sender, EventArgs e)
        {

            AssignPrice(new MediaItem());


            //string xml = "<flexi_price><api_action>assign_price</api_action><system>socios</system><user><user_id>paul</user_id><lang>en</lang><real_name>Paul Brigden</real_name></user><action_params><item_id>12345</item_id><item_name>The apple</item_name><owner_id>paul</owner_id></action_params></flexi_price>";
            string xml = "<flexi_price><system>the_lab</system><api_action>assign_price</api_action><user>                <user_id>illy__98</user_id>                <lang>en</lang>                <real_name>Illy lavie</real_name>            </user>            <action_params>                <item_id>8998</item_id>                <item_name>product 16</item_name>                <owner_id>illy__98</owner_id>            </action_params>            </flexi_price>";
            string url = "http://flexiprice.eu/api.php?token=" + Post("assign_price", xml);
            // lbl_Response.Text = Post("assign_price", xml);
            hprlnk_flexipriceGetTransactions.NavigateUrl = url;// "http://flexiprice.eu/api.php?token=" + Post("assign_price", xml);
            hprlnk_flexipriceGetTransactions.Text = url;
            // lbl_Response.Text = Post("assign_price", xml);
            GetTransactionsUrl();
        }

        public void AssignPrice(MediaItem item)
        {
            string apiAction = "assign_price";
            string system = "socios";
            string userId = UserId.ToString();
            string realName = UserInfo.DisplayName;
            string itemId = item.id.id;
            string itemName = item.title;
            string ownerId = "1"; // item.owner_id

            string.Format(@"
            <flexi_price>
                <api_action>{0}</api_action>
                <system>{1}</system>
                <user>
                    <user_id>{2}</user_id>
                    <lang>en</lang>
                    <real_name>{3}</real_name>
                </user>
                <action_params>
                    <item_id>{4}</item_id>
                    <item_name>{5}</item_name>
                    <owner_id>{6}</owner_id>
                </action_params>
            </flexi_price>"
                , apiAction, system, userId, realName, itemId, itemName, ownerId);

           

            //string xml = "<flexi_price><api_action>assign_price</api_action><system>socios</system><user><user_id>paul</user_id><lang>en</lang><real_name>Paul Brigden</real_name></user><action_params><item_id>12345</item_id><item_name>The apple</item_name><owner_id>paul</owner_id></action_params></flexi_price>";

        }

        public void GetTransactionsUrl()
        {
            string xml = "<flexi_price><system>the_lab</system><api_action>get_transactions</api_action>    <user>     <user_id>almog__98</user_id>   <lang>en</lang>   <real_name>almog lavie</real_name></user></flexi_price>";
              //string xml = "<flexi_price><system>the_lab</system><api_action>assign_price</api_action><user>                <user_id>illy__98</user_id>                <lang>en</lang>                <real_name>Illy lavie</real_name>            </user>            <action_params>                <item_id>8998</item_id>                <item_name>product 16</item_name>                <owner_id>illy__98</owner_id>            </action_params>            </flexi_price>";
            string url = "http://flexiprice.eu/api.php?token=" + Post("get_transactions", xml);
            // lbl_Response.Text = Post("assign_price", xml);
            hprlnk_flexipriceGetTransactions.NavigateUrl = url;// "http://flexiprice.eu/api.php?token=" + Post("assign_price", xml);
            hprlnk_flexipriceGetTransactions.Text = url;
        }


        public static string Post(string uri, string xml)
        {
            string baseURI = "http://Flexiprice.info/";

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(baseURI + uri);

            req.Method = "POST";
            req.ContentType = "application/xml; charset=utf-8";
            req.Timeout = 30000;
            req.AllowWriteStreamBuffering = true;
            Encoding enc = new UTF8Encoding(false);

            using (System.IO.StreamWriter sw = new System.IO.StreamWriter(req.GetRequestStream(), enc))
            {
                //string data = "<flexi_price><api_action>assign_price</api_action><system>socios</system><user><user_id>paul</user_id><lang>en</lang><real_name>Paul Brigden</real_name></user><action_params><item_id>12345</item_id><item_name>The apple</item_name><owner_id>paul</owner_id></action_params></flexi_price>";

                byte[] buffer = Encoding.UTF8.GetBytes(xml);
                Stream reqst = req.GetRequestStream();
                reqst.Write(buffer, 0, buffer.Length);
                reqst.Flush();
                reqst.Close();
            }

            HttpWebResponse resp = (HttpWebResponse)req.GetResponse();

            // Retrieve response stream and wrap in StreamReader
            string strResp = string.Empty;
            using (Stream respStream = resp.GetResponseStream())
            {
                StreamReader rdr = new StreamReader(respStream);
                strResp = rdr.ReadToEnd();
                rdr.Close();
            }

            XElement xDoc = XElement.Parse(strResp);
            XNamespace ns = xDoc.Name.Namespace;

            // XName name = new XName();

            //var node = from compileItem in xDoc.Elements(ns+"Value")
            //           select compileItem.Value;


            //return node.First().ToString();
            return strResp;

        }


    }

}
