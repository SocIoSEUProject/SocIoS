'
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2010
' by DotNetNuke Corporation
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'
Imports System.Reflection
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Entities.Modules.Actions
Imports DotNetNuke.Services.Scheduling
Imports DotNetNuke.UI.Utilities
Imports DotNetNuke.Entities.Host
Imports System.Collections.Generic

Namespace DotNetNuke.Modules.Admin.Scheduler

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The EditSchedule PortalModuleBase is used to edit the scheduled items.
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
    '''                       and localisation
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class EditSchedule

        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

#Region "Private Methods"

        Private Sub BindData()
            Dim objScheduleItem As ScheduleItem

            If Not Request.QueryString("ScheduleID") Is Nothing Then
                ViewState("ScheduleID") = Request.QueryString("ScheduleID")
                objScheduleItem = SchedulingProvider.Instance.GetSchedule(Convert.ToInt32(Request.QueryString("ScheduleID")))

                txtFriendlyName.Text = objScheduleItem.FriendlyName
                txtType.Enabled = False
                txtType.Text = objScheduleItem.TypeFullName
                chkEnabled.Checked = objScheduleItem.Enabled
                If objScheduleItem.TimeLapse = Null.NullInteger Then
                    txtTimeLapse.Text = ""
                Else
                    txtTimeLapse.Text = Convert.ToString(objScheduleItem.TimeLapse)
                End If

                If Not ddlTimeLapseMeasurement.Items.FindByValue(objScheduleItem.TimeLapseMeasurement) Is Nothing Then
                    ddlTimeLapseMeasurement.Items.FindByValue(objScheduleItem.TimeLapseMeasurement).Selected = True
                End If
                If objScheduleItem.RetryTimeLapse = Null.NullInteger Then
                    txtRetryTimeLapse.Text = ""
                Else
                    txtRetryTimeLapse.Text = Convert.ToString(objScheduleItem.RetryTimeLapse)
                End If
                If Not ddlRetryTimeLapseMeasurement.Items.FindByValue(objScheduleItem.RetryTimeLapseMeasurement) Is Nothing Then
                    ddlRetryTimeLapseMeasurement.Items.FindByValue(objScheduleItem.RetryTimeLapseMeasurement).Selected = True
                End If
                If Not ddlRetainHistoryNum.Items.FindByValue(Convert.ToString(objScheduleItem.RetainHistoryNum)) Is Nothing Then
                    ddlRetainHistoryNum.Items.FindByValue(Convert.ToString(objScheduleItem.RetainHistoryNum)).Selected = True
                Else
                    ddlRetainHistoryNum.Items.Add(objScheduleItem.RetainHistoryNum.ToString)
                    ddlRetainHistoryNum.Items.FindByValue(Convert.ToString(objScheduleItem.RetainHistoryNum)).Selected = True
                End If
                If Not ddlAttachToEvent.Items.FindByValue(objScheduleItem.AttachToEvent) Is Nothing Then
                    ddlAttachToEvent.Items.FindByValue(objScheduleItem.AttachToEvent).Selected = True
                End If
                chkCatchUpEnabled.Checked = objScheduleItem.CatchUpEnabled
                txtObjectDependencies.Text = objScheduleItem.ObjectDependencies
                BindServers(objScheduleItem.Servers)
            Else
                cmdDelete.Visible = False
                cmdRun.Visible = False
                txtType.Enabled = True
            End If
        End Sub

        Private Sub BindServers(ByVal selectedServers As String)
            Dim servers As List(Of ServerInfo) = ServerController.GetServers()

            For Each webServer As ServerInfo In servers
                If webServer.Enabled Then
                    Dim serverName As String = ServerController.GetServerName(webServer)
                    Dim serverItem As ListItem = New ListItem(serverName, serverName)
                    If String.IsNullOrEmpty(selectedServers) Then
                        serverItem.Selected = True
                    Else
                        serverItem.Selected = Null.NullBoolean
                        For Each selectedServer As String In selectedServers.Split(",")
                            If selectedServer = serverName Then
                                serverItem.Selected = True
                                Exit For
                            End If
                        Next
                    End If
                    lstServers.Items.Add(serverItem)
                End If
            Next
        End Sub

        Private Function CreateScheduleItem() As ScheduleItem
            Dim objScheduleItem As New ScheduleItem
            objScheduleItem.TypeFullName = txtType.Text
            objScheduleItem.FriendlyName = txtFriendlyName.Text
            If txtTimeLapse.Text = "" Or txtTimeLapse.Text = "0" Or txtTimeLapse.Text = "-1" Then
                objScheduleItem.TimeLapse = Null.NullInteger
            Else
                objScheduleItem.TimeLapse = Convert.ToInt32(txtTimeLapse.Text)
            End If

            objScheduleItem.TimeLapseMeasurement = ddlTimeLapseMeasurement.SelectedItem.Value

            If txtRetryTimeLapse.Text = "" Or txtRetryTimeLapse.Text = "0" Or txtRetryTimeLapse.Text = "-1" Then
                objScheduleItem.RetryTimeLapse = Null.NullInteger
            Else
                objScheduleItem.RetryTimeLapse = Convert.ToInt32(txtRetryTimeLapse.Text)
            End If

            objScheduleItem.RetryTimeLapseMeasurement = ddlRetryTimeLapseMeasurement.SelectedItem.Value
            objScheduleItem.RetainHistoryNum = Convert.ToInt32(ddlRetainHistoryNum.SelectedItem.Value)
            objScheduleItem.AttachToEvent = ddlAttachToEvent.SelectedItem.Value
            objScheduleItem.CatchUpEnabled = chkCatchUpEnabled.Checked
            objScheduleItem.Enabled = chkEnabled.Checked
            objScheduleItem.ObjectDependencies = txtObjectDependencies.Text

            ' if servers are specified, the concatenated string needs to be prefixed and suffixed by commas ( ie. ",SERVER1,SERVER2," )
            Dim servers As String = Null.NullString
            Dim bAllSelected As Boolean = True
            For Each item As ListItem In lstServers.Items
                If item.Selected Then
                    servers += "," + item.Value
                Else
                    bAllSelected = Null.NullBoolean
                End If
            Next
            If bAllSelected Then
                servers = Null.NullString
            End If
            If Not String.IsNullOrEmpty(servers) Then
                objScheduleItem.Servers = servers & ","
            End If
            Return objScheduleItem
        End Function

        Private Sub UpdateScheduleItem(ByVal objScheduleItem As ScheduleItem)
            If Not ViewState("ScheduleID") Is Nothing Then
                objScheduleItem.ScheduleID = Convert.ToInt32(ViewState("ScheduleID"))
                SchedulingProvider.Instance.UpdateSchedule(objScheduleItem)
            Else
                SchedulingProvider.Instance.AddSchedule(objScheduleItem)
            End If
        End Sub

#End Region

#Region "Event Handlers"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Page_Load runs when the control is loaded.
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                If Not Page.IsPostBack Then
                    ClientAPI.AddButtonConfirm(cmdDelete, Services.Localization.Localization.GetString("DeleteItem"))
                    BindData()
                End If

                cmdRun.Enabled = chkEnabled.Checked

            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
            Response.Redirect(NavigateURL(), True)
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdDelete_Click runs when the Delete Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDelete.Click
            Dim objScheduleItem As New ScheduleItem
            objScheduleItem.ScheduleID = Convert.ToInt32(ViewState("ScheduleID"))
            SchedulingProvider.Instance.DeleteSchedule(objScheduleItem)
            Dim strMessage As String
            strMessage = Services.Localization.Localization.GetString("DeleteSuccess", Me.LocalResourceFile)
            UI.Skins.Skin.AddModuleMessage(Me, strMessage, UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess)
            pnlScheduleItem.Visible = False
        End Sub

        Protected Sub cmdRun_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdRun.Click
            Dim strMessage As String
            Dim objScheduleItem As ScheduleItem = CreateScheduleItem()

            UpdateScheduleItem(objScheduleItem)

            SchedulingProvider.Instance.RunScheduleItemNow(objScheduleItem)

            strMessage = Services.Localization.Localization.GetString("RunNow", Me.LocalResourceFile)
            UI.Skins.Skin.AddModuleMessage(Me, strMessage, UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess)
            If SchedulingProvider.SchedulerMode = SchedulerMode.TIMER_METHOD Then
                SchedulingProvider.Instance.ReStart("Change made to schedule.")
            End If
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdUpdate_Click runs when the Update Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdUpdate.Click
            Dim strMessage As String

            UpdateScheduleItem(CreateScheduleItem())

            strMessage = Services.Localization.Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            UI.Skins.Skin.AddModuleMessage(Me, strMessage, UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess)
            If SchedulingProvider.SchedulerMode = SchedulerMode.TIMER_METHOD Then
                SchedulingProvider.Instance.ReStart("Change made to schedule.")
            End If

            Response.Redirect(NavigateURL(), True)
        End Sub

#End Region

#Region "Optional Interfaces"

        Public ReadOnly Property ModuleActions() As ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New ModuleActionCollection
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.ContentOptions, LocalResourceFile), ModuleActionType.AddContent, "", "icon_scheduler_16px.gif", EditUrl("", "", "Status"), False, SecurityAccessLevel.Host, True, False)
                If Not Request.QueryString("ScheduleID") Is Nothing Then
                    Dim ScheduleID As Integer = Convert.ToInt32(Request.QueryString("ScheduleID"))
                    Actions.Add(GetNextActionID, Services.Localization.Localization.GetString("ScheduleHistory.Action", LocalResourceFile), ModuleActionType.AddContent, "", "icon_profile_16px.gif", EditUrl("ScheduleID", ScheduleID.ToString, "History"), False, SecurityAccessLevel.Host, True, False)
                End If
                Return Actions
            End Get

        End Property
#End Region

    End Class

End Namespace
