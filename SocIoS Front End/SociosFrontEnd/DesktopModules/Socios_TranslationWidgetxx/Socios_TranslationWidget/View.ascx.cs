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
using System.Globalization;


namespace DotNetNuke.Modules.Socios_TranslationWidget
{

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewOurspace_TranslationWidget class displays the content
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : Socios_TranslationWidgetModuleBase, IActionable
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
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "script1", (this.TemplateSourceDirectory + "/js/module.js?v=1"));
            string language = CultureInfo.CurrentUICulture.Name;
               // if(language == "en-GB")
               // translateLanguage.SelectedIndex = 0;
               // else if(language == "de-DE")
               //     translateLanguage.SelectedIndex = 1;
               // else if (language == "cs-CZ")
                //    translateLanguage.SelectedIndex = 2;
               // else if (language == "el-GR")
                //    translateLanguage.SelectedIndex = 3;
            
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

    }

}
