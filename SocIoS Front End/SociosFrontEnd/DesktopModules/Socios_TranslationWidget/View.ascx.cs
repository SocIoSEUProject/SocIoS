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
