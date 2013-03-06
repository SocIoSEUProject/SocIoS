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

namespace DotNetNuke.Modules.Socios_MediaSearch.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_MediaSearch
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

            //List<Socios_MediaSearchInfo> colSocios_MediaSearchs = GetSocios_MediaSearchs(ModuleID);
            //if (colSocios_MediaSearchs.Count != 0)
            //{
            //    strXML += "<Socios_MediaSearchs>";

            //    foreach (Socios_MediaSearchInfo objSocios_MediaSearch in colSocios_MediaSearchs)
            //    {
            //        strXML += "<Socios_MediaSearch>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_MediaSearch.Content) + "</content>";
            //        strXML += "</Socios_MediaSearch>";
            //    }
            //    strXML += "</Socios_MediaSearchs>";
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
            //XmlNode xmlSocios_MediaSearchs = DotNetNuke.Common.Globals.GetContent(Content, "Socios_MediaSearchs");
            //foreach (XmlNode xmlSocios_MediaSearch in xmlSocios_MediaSearchs.SelectNodes("Socios_MediaSearch"))
            //{
            //    Socios_MediaSearchInfo objSocios_MediaSearch = new Socios_MediaSearchInfo();
            //    objSocios_MediaSearch.ModuleId = ModuleID;
            //    objSocios_MediaSearch.Content = xmlSocios_MediaSearch.SelectSingleNode("content").InnerText;
            //    objSocios_MediaSearch.CreatedByUser = UserID;
            //    AddSocios_MediaSearch(objSocios_MediaSearch);
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

            //List<Socios_MediaSearchInfo> colSocios_MediaSearchs = GetSocios_MediaSearchs(ModInfo.ModuleID);

            //foreach (Socios_MediaSearchInfo objSocios_MediaSearch in colSocios_MediaSearchs)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_MediaSearch.Content, objSocios_MediaSearch.CreatedByUser, objSocios_MediaSearch.CreatedDate, ModInfo.ModuleID, objSocios_MediaSearch.ItemId.ToString(), objSocios_MediaSearch.Content, "ItemId=" + objSocios_MediaSearch.ItemId.ToString());
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
