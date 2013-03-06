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

namespace DotNetNuke.Modules.Socios_RoleChecker.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_RoleChecker
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

            //List<Socios_RoleCheckerInfo> colSocios_RoleCheckers = GetSocios_RoleCheckers(ModuleID);
            //if (colSocios_RoleCheckers.Count != 0)
            //{
            //    strXML += "<Socios_RoleCheckers>";

            //    foreach (Socios_RoleCheckerInfo objSocios_RoleChecker in colSocios_RoleCheckers)
            //    {
            //        strXML += "<Socios_RoleChecker>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_RoleChecker.Content) + "</content>";
            //        strXML += "</Socios_RoleChecker>";
            //    }
            //    strXML += "</Socios_RoleCheckers>";
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
            //XmlNode xmlSocios_RoleCheckers = DotNetNuke.Common.Globals.GetContent(Content, "Socios_RoleCheckers");
            //foreach (XmlNode xmlSocios_RoleChecker in xmlSocios_RoleCheckers.SelectNodes("Socios_RoleChecker"))
            //{
            //    Socios_RoleCheckerInfo objSocios_RoleChecker = new Socios_RoleCheckerInfo();
            //    objSocios_RoleChecker.ModuleId = ModuleID;
            //    objSocios_RoleChecker.Content = xmlSocios_RoleChecker.SelectSingleNode("content").InnerText;
            //    objSocios_RoleChecker.CreatedByUser = UserID;
            //    AddSocios_RoleChecker(objSocios_RoleChecker);
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

            //List<Socios_RoleCheckerInfo> colSocios_RoleCheckers = GetSocios_RoleCheckers(ModInfo.ModuleID);

            //foreach (Socios_RoleCheckerInfo objSocios_RoleChecker in colSocios_RoleCheckers)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_RoleChecker.Content, objSocios_RoleChecker.CreatedByUser, objSocios_RoleChecker.CreatedDate, ModInfo.ModuleID, objSocios_RoleChecker.ItemId.ToString(), objSocios_RoleChecker.Content, "ItemId=" + objSocios_RoleChecker.ItemId.ToString());
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
