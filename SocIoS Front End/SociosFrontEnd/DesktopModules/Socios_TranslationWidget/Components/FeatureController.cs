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

namespace DotNetNuke.Modules.Socios_TranslationWidget.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_TranslationWidget
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

            //List<Socios_TranslationWidgetInfo> colSocios_TranslationWidgets = GetSocios_TranslationWidgets(ModuleID);
            //if (colSocios_TranslationWidgets.Count != 0)
            //{
            //    strXML += "<Socios_TranslationWidgets>";

            //    foreach (Socios_TranslationWidgetInfo objSocios_TranslationWidget in colSocios_TranslationWidgets)
            //    {
            //        strXML += "<Socios_TranslationWidget>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_TranslationWidget.Content) + "</content>";
            //        strXML += "</Socios_TranslationWidget>";
            //    }
            //    strXML += "</Socios_TranslationWidgets>";
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
            //XmlNode xmlSocios_TranslationWidgets = DotNetNuke.Common.Globals.GetContent(Content, "Socios_TranslationWidgets");
            //foreach (XmlNode xmlSocios_TranslationWidget in xmlSocios_TranslationWidgets.SelectNodes("Socios_TranslationWidget"))
            //{
            //    Socios_TranslationWidgetInfo objSocios_TranslationWidget = new Socios_TranslationWidgetInfo();
            //    objSocios_TranslationWidget.ModuleId = ModuleID;
            //    objSocios_TranslationWidget.Content = xmlSocios_TranslationWidget.SelectSingleNode("content").InnerText;
            //    objSocios_TranslationWidget.CreatedByUser = UserID;
            //    AddSocios_TranslationWidget(objSocios_TranslationWidget);
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

            //List<Socios_TranslationWidgetInfo> colSocios_TranslationWidgets = GetSocios_TranslationWidgets(ModInfo.ModuleID);

            //foreach (Socios_TranslationWidgetInfo objSocios_TranslationWidget in colSocios_TranslationWidgets)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_TranslationWidget.Content, objSocios_TranslationWidget.CreatedByUser, objSocios_TranslationWidget.CreatedDate, ModInfo.ModuleID, objSocios_TranslationWidget.ItemId.ToString(), objSocios_TranslationWidget.Content, "ItemId=" + objSocios_TranslationWidget.ItemId.ToString());
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
