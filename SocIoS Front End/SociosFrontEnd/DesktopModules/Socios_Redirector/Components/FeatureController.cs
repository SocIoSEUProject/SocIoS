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

namespace DotNetNuke.Modules.Socios_Redirector.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_Redirector
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

            //List<Socios_RedirectorInfo> colSocios_Redirectors = GetSocios_Redirectors(ModuleID);
            //if (colSocios_Redirectors.Count != 0)
            //{
            //    strXML += "<Socios_Redirectors>";

            //    foreach (Socios_RedirectorInfo objSocios_Redirector in colSocios_Redirectors)
            //    {
            //        strXML += "<Socios_Redirector>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_Redirector.Content) + "</content>";
            //        strXML += "</Socios_Redirector>";
            //    }
            //    strXML += "</Socios_Redirectors>";
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
            //XmlNode xmlSocios_Redirectors = DotNetNuke.Common.Globals.GetContent(Content, "Socios_Redirectors");
            //foreach (XmlNode xmlSocios_Redirector in xmlSocios_Redirectors.SelectNodes("Socios_Redirector"))
            //{
            //    Socios_RedirectorInfo objSocios_Redirector = new Socios_RedirectorInfo();
            //    objSocios_Redirector.ModuleId = ModuleID;
            //    objSocios_Redirector.Content = xmlSocios_Redirector.SelectSingleNode("content").InnerText;
            //    objSocios_Redirector.CreatedByUser = UserID;
            //    AddSocios_Redirector(objSocios_Redirector);
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

            //List<Socios_RedirectorInfo> colSocios_Redirectors = GetSocios_Redirectors(ModInfo.ModuleID);

            //foreach (Socios_RedirectorInfo objSocios_Redirector in colSocios_Redirectors)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_Redirector.Content, objSocios_Redirector.CreatedByUser, objSocios_Redirector.CreatedDate, ModInfo.ModuleID, objSocios_Redirector.ItemId.ToString(), objSocios_Redirector.Content, "ItemId=" + objSocios_Redirector.ItemId.ToString());
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
