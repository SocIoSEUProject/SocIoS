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

namespace DotNetNuke.Modules.Socios_Scenario1.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_Scenario1
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

            //List<Socios_Scenario1Info> colSocios_Scenario1s = GetSocios_Scenario1s(ModuleID);
            //if (colSocios_Scenario1s.Count != 0)
            //{
            //    strXML += "<Socios_Scenario1s>";

            //    foreach (Socios_Scenario1Info objSocios_Scenario1 in colSocios_Scenario1s)
            //    {
            //        strXML += "<Socios_Scenario1>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_Scenario1.Content) + "</content>";
            //        strXML += "</Socios_Scenario1>";
            //    }
            //    strXML += "</Socios_Scenario1s>";
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
            //XmlNode xmlSocios_Scenario1s = DotNetNuke.Common.Globals.GetContent(Content, "Socios_Scenario1s");
            //foreach (XmlNode xmlSocios_Scenario1 in xmlSocios_Scenario1s.SelectNodes("Socios_Scenario1"))
            //{
            //    Socios_Scenario1Info objSocios_Scenario1 = new Socios_Scenario1Info();
            //    objSocios_Scenario1.ModuleId = ModuleID;
            //    objSocios_Scenario1.Content = xmlSocios_Scenario1.SelectSingleNode("content").InnerText;
            //    objSocios_Scenario1.CreatedByUser = UserID;
            //    AddSocios_Scenario1(objSocios_Scenario1);
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

            //List<Socios_Scenario1Info> colSocios_Scenario1s = GetSocios_Scenario1s(ModInfo.ModuleID);

            //foreach (Socios_Scenario1Info objSocios_Scenario1 in colSocios_Scenario1s)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_Scenario1.Content, objSocios_Scenario1.CreatedByUser, objSocios_Scenario1.CreatedDate, ModInfo.ModuleID, objSocios_Scenario1.ItemId.ToString(), objSocios_Scenario1.Content, "ItemId=" + objSocios_Scenario1.ItemId.ToString());
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
