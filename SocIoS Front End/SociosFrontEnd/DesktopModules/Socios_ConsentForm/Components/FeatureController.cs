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

namespace DotNetNuke.Modules.Socios_ConsentForm.Components
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Controller class for Socios_ConsentForm
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

            //List<Socios_ConsentFormInfo> colSocios_ConsentForms = GetSocios_ConsentForms(ModuleID);
            //if (colSocios_ConsentForms.Count != 0)
            //{
            //    strXML += "<Socios_ConsentForms>";

            //    foreach (Socios_ConsentFormInfo objSocios_ConsentForm in colSocios_ConsentForms)
            //    {
            //        strXML += "<Socios_ConsentForm>";
            //        strXML += "<content>" + DotNetNuke.Common.Utilities.XmlUtils.XMLEncode(objSocios_ConsentForm.Content) + "</content>";
            //        strXML += "</Socios_ConsentForm>";
            //    }
            //    strXML += "</Socios_ConsentForms>";
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
            //XmlNode xmlSocios_ConsentForms = DotNetNuke.Common.Globals.GetContent(Content, "Socios_ConsentForms");
            //foreach (XmlNode xmlSocios_ConsentForm in xmlSocios_ConsentForms.SelectNodes("Socios_ConsentForm"))
            //{
            //    Socios_ConsentFormInfo objSocios_ConsentForm = new Socios_ConsentFormInfo();
            //    objSocios_ConsentForm.ModuleId = ModuleID;
            //    objSocios_ConsentForm.Content = xmlSocios_ConsentForm.SelectSingleNode("content").InnerText;
            //    objSocios_ConsentForm.CreatedByUser = UserID;
            //    AddSocios_ConsentForm(objSocios_ConsentForm);
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

            //List<Socios_ConsentFormInfo> colSocios_ConsentForms = GetSocios_ConsentForms(ModInfo.ModuleID);

            //foreach (Socios_ConsentFormInfo objSocios_ConsentForm in colSocios_ConsentForms)
            //{
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objSocios_ConsentForm.Content, objSocios_ConsentForm.CreatedByUser, objSocios_ConsentForm.CreatedDate, ModInfo.ModuleID, objSocios_ConsentForm.ItemId.ToString(), objSocios_ConsentForm.Content, "ItemId=" + objSocios_ConsentForm.ItemId.ToString());
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
