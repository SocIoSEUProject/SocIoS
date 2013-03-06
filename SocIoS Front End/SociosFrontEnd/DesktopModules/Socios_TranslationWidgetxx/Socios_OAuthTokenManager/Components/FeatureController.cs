/*
' Copyright (c) 2010 DotNetNuke Corporation
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System.Collections.Generic;
//using System.Xml;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search;

namespace DotNetNuke.Modules.Socios_OAuthTokenManager.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_OAuthTokenManager
    /// </summary>
    /// -----------------------------------------------------------------------------
    public class FeatureController : IPortable, ISearchable, IUpgradeable
    {

        #region Public Methods



        #endregion

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// ExportModule implements the IPortable ExportModule Interface
        /// </summary>
        /// <param name="ModuleID">The Id of the module to be exported</param>
        /// -----------------------------------------------------------------------------
        public string ExportModule(int ModuleID)
        {
            //string strXML = "";

            //List<Socios_OAuthTokenManagerInfo> colSocios_OAuthTokenManagers = GetSocios_OAuthTokenManagers(ModuleID);
            //if (colSocios_OAuthTokenManagers.Count != 0)
            //{
            //    strXML += "<Socios_OAuthTokenManagers>";

            //    foreach (Socios_OAuthTokenManagerInfo objSocios_OAuthTokenManager in colSocios_OAuthTokenManagers)
            //    {
            //        strXML += "<Socios_OAuthTokenManager>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_OAuthTokenManager.Content) + "</content>";
            //        strXML += "</Socios_OAuthTokenManager>";
            //    }
            //    strXML += "</Socios_OAuthTokenManagers>";
            //}

            //return strXML;

            throw new System.NotImplementedException("The method or operation is not implemented.");
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// ImportModule implements the IPortable ImportModule Interface
        /// </summary>
        /// <param name="ModuleID">The Id of the module to be imported</param>
        /// <param name="Content">The content to be imported</param>
        /// <param name="Version">The version of the module to be imported</param>
        /// <param name="UserId">The Id of the user performing the import</param>
        /// -----------------------------------------------------------------------------
        public void ImportModule(int ModuleID, string Content, string Version, int UserID)
        {
            //XmlNode xmlSocios_OAuthTokenManagers = DotNetNuke.Common.Globals.GetContent(Content, "Socios_OAuthTokenManagers");
            //foreach (XmlNode xmlSocios_OAuthTokenManager in xmlSocios_OAuthTokenManagers.SelectNodes("Socios_OAuthTokenManager"))
            //{
            //    Socios_OAuthTokenManagerInfo objSocios_OAuthTokenManager = new Socios_OAuthTokenManagerInfo();
            //    objSocios_OAuthTokenManager.ModuleId = ModuleID;
            //    objSocios_OAuthTokenManager.Content = xmlSocios_OAuthTokenManager.SelectSingleNode("content").InnerText;
            //    objSocios_OAuthTokenManager.CreatedByUser = UserID;
            //    AddSocios_OAuthTokenManager(objSocios_OAuthTokenManager);
            //}

            throw new System.NotImplementedException("The method or operation is not implemented.");
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// GetSearchItems implements the ISearchable Interface
        /// </summary>
        /// <param name="ModInfo">The ModuleInfo for the module to be Indexed</param>
        /// -----------------------------------------------------------------------------
        public DotNetNuke.Services.Search.SearchItemInfoCollection GetSearchItems(DotNetNuke.Entities.Modules.ModuleInfo ModInfo)
        {
            //SearchItemInfoCollection SearchItemCollection = new SearchItemInfoCollection();

            //List<Socios_OAuthTokenManagerInfo> colSocios_OAuthTokenManagers = GetSocios_OAuthTokenManagers(ModInfo.ModuleID);

            //foreach (Socios_OAuthTokenManagerInfo objSocios_OAuthTokenManager in colSocios_OAuthTokenManagers)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_OAuthTokenManager.Content, objSocios_OAuthTokenManager.CreatedByUser, objSocios_OAuthTokenManager.CreatedDate, ModInfo.ModuleID, objSocios_OAuthTokenManager.ItemId.ToString(), objSocios_OAuthTokenManager.Content, "ItemId=" + objSocios_OAuthTokenManager.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            //}

            //return SearchItemCollection;

            throw new System.NotImplementedException("The method or operation is not implemented.");
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpgradeModule implements the IUpgradeable Interface
        /// </summary>
        /// <param name="Version">The current version of the module</param>
        /// -----------------------------------------------------------------------------
        public string UpgradeModule(string Version)
        {
            throw new System.NotImplementedException("The method or operation is not implemented.");
        }

        #endregion

    }

}
