' 
'' DotNetNuke® - http://www.dotnetnuke.com 
'' Copyright (c) 2002-2010 
'' by DotNetNuke Corporation 
'' 
'' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
'' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
'' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
'' to permit persons to whom the Software is furnished to do so, subject to the following conditions: 
'' 
'' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
'' of the Software. 
'' 
'' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
'' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
'' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
'' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
'' DEALINGS IN THE SOFTWARE. 
' 


Imports System
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Modules.Dashboard.Components.Database
Imports DotNetNuke.UI.Skins
Imports DotNetNuke.UI.Skins.Controls

Namespace DotNetNuke.Modules.Dashboard.Controls
    Partial Public Class Database
        Inherits PortalModuleBase

        Protected ReadOnly Property NoBackups() As String
            Get
                Return Localization.GetString("NoBackups", Me.LocalResourceFile)
            End Get
        End Property

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Dim database As DbInfo = DatabaseController.GetDbInfo()

            ctlDbInfo.DataSource = database
            ctlDbInfo.DataBind()

            Localization.LocalizeGridView(grdBackups, Me.LocalResourceFile)
            Try
                grdBackups.DataSource = database.Backups
                grdBackups.DataBind()
            Catch ex As Exception
                grdBackups.Visible = False
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(Me.Parent, Localization.GetString("Backup.Error.Text", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning)
            End Try

            Localization.LocalizeGridView(grdFiles, Me.LocalResourceFile)
            grdFiles.DataSource = database.Files
            grdFiles.DataBind()

        End Sub
    End Class
End Namespace
