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

Imports System.Xml
Imports System.Configuration
Imports System.Net
Imports System.IO
Imports DotNetNuke.Services.Scheduling
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Entities.Modules.Actions

Namespace DotNetNuke.Modules.Admin.Scheduler

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The ViewScheduleStatus PortalModuleBase is used to view the schedule Status
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
    '''                       and localisation
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class ViewScheduleStatus

        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

#Region "Controls"


#End Region

#Region "Private Members"

        Private Status As ScheduleStatus

#End Region

#Region "Private Methods"

        Private Sub BindData()

            lblFreeThreads.Text = SchedulingProvider.Instance.GetFreeThreadCount.ToString
            lblActiveThreads.Text = SchedulingProvider.Instance.GetActiveThreadCount.ToString
            lblMaxThreads.Text = SchedulingProvider.Instance.GetMaxThreadCount.ToString

            Dim arrScheduleQueue As Collection = SchedulingProvider.Instance.GetScheduleQueue
            If arrScheduleQueue.Count = 0 Then
                pnlScheduleQueue.Visible = False
            Else
                'Localize Grid
                Services.Localization.Localization.LocalizeDataGrid(dgScheduleQueue, Me.LocalResourceFile)

                dgScheduleQueue.DataSource = arrScheduleQueue
                dgScheduleQueue.DataBind()
            End If

            Dim arrScheduleProcessing As Collection = SchedulingProvider.Instance.GetScheduleProcessing
            If arrScheduleProcessing.Count = 0 Then
                pnlScheduleProcessing.Visible = False
            Else
                'Localize Grid
                Services.Localization.Localization.LocalizeDataGrid(dgScheduleProcessing, Me.LocalResourceFile)

                dgScheduleProcessing.DataSource = arrScheduleProcessing
                dgScheduleProcessing.DataBind()
            End If
            If arrScheduleProcessing.Count = 0 And arrScheduleQueue.Count = 0 Then
                Dim strMessage As String = Services.Localization.Localization.GetString("NoTasks", Me.LocalResourceFile)
                UI.Skins.Skin.AddModuleMessage(Me, strMessage, UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning)
            End If

        End Sub

        Private Sub BindStatus()
            Status = SchedulingProvider.Instance.GetScheduleStatus
            lblStatus.Text = Status.ToString()

            placeCommands.Visible = (SchedulingProvider.SchedulerMode = SchedulerMode.TIMER_METHOD)

            If Status = ScheduleStatus.STOPPED And SchedulingProvider.SchedulerMode <> SchedulerMode.DISABLED Then
                cmdStart.Enabled = True
                cmdStop.Enabled = False
            ElseIf Status = ScheduleStatus.WAITING_FOR_REQUEST Or SchedulingProvider.SchedulerMode = SchedulerMode.DISABLED Then
                cmdStart.Enabled = False
                cmdStop.Enabled = False
            Else
                cmdStart.Enabled = False
                cmdStop.Enabled = True
            End If

        End Sub

#End Region

#Region "Protected Methods"

        Protected Function GetOverdueText(ByVal OverdueBy As Double) As String
            If OverdueBy > 0 Then
                Return OverdueBy.ToString
            Else
                Return ""
            End If
        End Function

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
                If SchedulingProvider.Enabled = True Then
                    If Not Page.IsPostBack Then
                        BindData()
                        BindStatus()
                    End If
                Else
                    UI.Skins.Skin.AddModuleMessage(Me, Services.Localization.Localization.GetString("DisabledMessage", Me.LocalResourceFile), UI.Skins.Controls.ModuleMessage.ModuleMessageType.RedError)
                    lblStatus.Text = Services.Localization.Localization.GetString("Disabled", Me.LocalResourceFile)
                    cmdStart.Enabled = False
                    cmdStop.Enabled = False
                    lblFreeThreads.Text = "0"
                    lblActiveThreads.Text = "0"
                    lblMaxThreads.Text = "0"
                    pnlScheduleQueue.Visible = False
                    pnlScheduleProcessing.Visible = False
                End If
            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try

        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdStart_Click runs when the Start Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdStart.Click
            Services.Scheduling.SchedulingProvider.Instance.StartAndWaitForResponse()
            BindData()
            BindStatus()
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdStop_Click runs when the Stop Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdStop.Click
            SchedulingProvider.Instance.Halt(Services.Localization.Localization.GetString("ManuallyStopped", Me.LocalResourceFile))
            BindData()
            BindStatus()
        End Sub

        Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
            Response.Redirect(NavigateURL(), True)
        End Sub

#End Region

#Region "Optional Interfaces"
        Public ReadOnly Property ModuleActions() As ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New ModuleActionCollection
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.AddContent, LocalResourceFile), ModuleActionType.AddContent, "", "add.gif", EditUrl(), False, SecurityAccessLevel.Admin, True, False)
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString("ScheduleHistory.Action", LocalResourceFile), ModuleActionType.AddContent, "", "icon_profile_16px.gif", EditUrl("", "", "History"), False, SecurityAccessLevel.Host, True, False)
                Return Actions
            End Get
        End Property
#End Region

    End Class

End Namespace
