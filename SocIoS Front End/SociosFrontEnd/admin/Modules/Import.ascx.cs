#region Copyright
// 
// DotNetNuke� - http://www.dotnetnuke.com
// Copyright (c) 2002-2012
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
#endregion
#region Usings

using System;
using System.Collections;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml;

using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Users;
using DotNetNuke.Framework;
using DotNetNuke.Security;
using DotNetNuke.Security.Permissions;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Skins.Controls;

#endregion

namespace DotNetNuke.Modules.Admin.Modules
{
    public partial class Import : PortalModuleBase
    {

        #region Private Members

        private new int ModuleId = -1;
        private ModuleInfo _module;

        private ModuleInfo Module
        {
            get
            {
                return _module ?? (_module = new ModuleController().GetModule(ModuleId, TabId, false));
            }
        }

        #endregion

        #region Private Methods

        private string ImportModule(int ModuleId, string FileName, string Folder)
        {
            var strMessage = "";
            if (Module != null)
            {
                if (FileName.IndexOf("." + Globals.CleanName(Module.DesktopModule.ModuleName) + ".") != -1 || FileName.IndexOf("." + Globals.CleanName(Module.DesktopModule.FriendlyName) + ".") != -1)
                {
                    if (!String.IsNullOrEmpty(Module.DesktopModule.BusinessControllerClass) && Module.DesktopModule.IsPortable)
                    {
                        try
                        {
                            var objObject = Reflection.CreateObject(Module.DesktopModule.BusinessControllerClass, Module.DesktopModule.BusinessControllerClass);
                            if (objObject is IPortable)
                            {
                                var objStreamReader = File.OpenText(PortalSettings.HomeDirectoryMapPath + Folder + FileName);
                                var content = objStreamReader.ReadToEnd();
                                objStreamReader.Close();
                                var xmlDoc = new XmlDocument();
                                try
                                {
                                    xmlDoc.LoadXml(content);
                                }
                                catch
                                {
                                    strMessage = Localization.GetString("NotValidXml", LocalResourceFile);
                                }
                                if (String.IsNullOrEmpty(strMessage))
                                {
                                    var strType = xmlDoc.DocumentElement.GetAttribute("type");
                                    if (strType == Globals.CleanName(Module.DesktopModule.ModuleName) || strType == Globals.CleanName(Module.DesktopModule.FriendlyName))
                                    {
                                        var strVersion = xmlDoc.DocumentElement.GetAttribute("version");
                                        ((IPortable)objObject).ImportModule(ModuleId, xmlDoc.DocumentElement.InnerXml, strVersion, UserInfo.UserID);
                                        Response.Redirect(Globals.NavigateURL(), true);
                                    }
                                    else
                                    {
                                        strMessage = Localization.GetString("NotCorrectType", LocalResourceFile);
                                    }
                                }
                            }
                            else
                            {
                                strMessage = Localization.GetString("ImportNotSupported", LocalResourceFile);
                            }
                        }
                        catch
                        {
                            strMessage = Localization.GetString("Error", LocalResourceFile);
                        }
                    }
                    else
                    {
                        strMessage = Localization.GetString("ImportNotSupported", LocalResourceFile);
                    }
                }
                else
                {
                    strMessage = Localization.GetString("NotCorrectType", LocalResourceFile);
                }
            }
            return strMessage;
        }

        #endregion

        #region Event Handlers

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Request.QueryString["moduleid"] != null)
            {
                Int32.TryParse(Request.QueryString["moduleid"], out ModuleId);
            }

			//Verify that the current user has access to edit this module
            if (!ModulePermissionController.HasModuleAccess(SecurityAccessLevel.Edit, "IMPORT", Module))
            {
                Response.Redirect(Globals.AccessDeniedURL(), true);
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            cboFolders.SelectedIndexChanged += OnFoldersIndexChanged;
            cmdImport.Click += OnImportClick;

            try
            {
                if (!Page.IsPostBack)
                {
                    cmdCancel.NavigateUrl = Globals.NavigateURL();
                    cboFolders.Items.Insert(0, new ListItem("<" + Localization.GetString("None_Specified") + ">", "-"));
                    var user = UserController.GetCurrentUserInfo();
                    var folders = FolderManager.Instance.GetFileSystemFolders(user, "BROWSE, ADD");
                    foreach (FolderInfo folder in folders)
                    {
                        var folderItem = new ListItem {Text = folder.FolderPath == Null.NullString ? Localization.GetString("Root", LocalResourceFile) : folder.DisplayPath, Value = folder.FolderPath};
                        cboFolders.Items.Add(folderItem);
                    }
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void OnFoldersIndexChanged(object sender, EventArgs e)
        {
            cboFiles.Items.Clear();
            if (cboFolders.SelectedIndex == 0)
            {
                return;
            }
            if (Module == null)
            {
                return;
            }
            var arrFiles = Globals.GetFileList(PortalId, "xml", false, cboFolders.SelectedItem.Value);
            foreach (FileItem objFile in arrFiles)
            {
                if (objFile.Text.IndexOf("content." + Globals.CleanName(Module.DesktopModule.ModuleName) + ".") != -1)
                {
                    cboFiles.Items.Add(new ListItem(objFile.Text.Replace("content." + Globals.CleanName(Module.DesktopModule.ModuleName) + ".", ""), objFile.Text));
                }
				
                //legacy support for files which used the FriendlyName
                if (Globals.CleanName(Module.DesktopModule.ModuleName) == Globals.CleanName(Module.DesktopModule.FriendlyName))
                {
                    continue;
                }
                if (objFile.Text.IndexOf("content." + Globals.CleanName(Module.DesktopModule.FriendlyName) + ".") != -1)
                {
                    cboFiles.Items.Add(new ListItem(objFile.Text.Replace("content." + Globals.CleanName(Module.DesktopModule.FriendlyName) + ".", ""), objFile.Text));
                }
            }
        }

        protected void OnImportClick(object sender, EventArgs e)
        {
            try
            {
                if (cboFiles.SelectedItem != null)
                {
                    if (Module != null)
                    {
                        var strMessage = ImportModule(ModuleId, cboFiles.SelectedItem.Value, cboFolders.SelectedItem.Value);
                        if (String.IsNullOrEmpty(strMessage))
                        {
                            Response.Redirect(Globals.NavigateURL(), true);
                        }
                        else
                        {
                            UI.Skins.Skin.AddModuleMessage(this, strMessage, ModuleMessage.ModuleMessageType.RedError);
                        }
                    }
                }
                else
                {
                    UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Validation", LocalResourceFile), ModuleMessage.ModuleMessageType.RedError);
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

    }
}