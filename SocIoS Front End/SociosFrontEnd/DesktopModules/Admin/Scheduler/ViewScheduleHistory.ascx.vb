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
    ''' The ViewScheduleHistory PortalModuleBase is used to view the schedule History
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
    '''                       and localisation
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class ViewScheduleHistory
        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

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
                    Dim ScheduleID As Integer
                    If Not Request.QueryString("ScheduleID") Is Nothing Then
                        'get history for specific scheduleid
                        ScheduleID = Convert.ToInt32(Request.QueryString("ScheduleID"))
                    Else
                        'get history for all schedules
                        ScheduleID = -1
                    End If
                    Dim arrSchedule As ArrayList = SchedulingProvider.Instance.GetScheduleHistory(ScheduleID)
                    arrSchedule.Sort(New ScheduleHistorySortStartDate)

                    'Localize Grid
                    Services.Localization.Localization.LocalizeDataGrid(dgScheduleHistory, Me.LocalResourceFile)

                    dgScheduleHistory.DataSource = arrSchedule
                    dgScheduleHistory.DataBind()
                End If


            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try

        End Sub

        Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
            Response.Redirect(NavigateURL(), True)
        End Sub

#End Region

#Region "Optional Interfaces"
        Public ReadOnly Property ModuleActions() As ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New ModuleActionCollection
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.AddContent, LocalResourceFile), ModuleActionType.AddContent, "", "add.gif", EditUrl(), False, SecurityAccessLevel.Host, True, False)
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.ContentOptions, LocalResourceFile), ModuleActionType.AddContent, "", "icon_scheduler_16px.gif", EditUrl("", "", "Status"), False, SecurityAccessLevel.Host, True, False)
                Return Actions
            End Get
        End Property
#End Region

#Region "Protected Methods"
        Protected Function GetNotesText(ByVal Notes As String) As String
            If Notes <> "" Then
                Notes = "<textarea rows=""5"" cols=""65"">" + Notes + "</textarea>"
                Return Notes
            Else
                Return ""
            End If

        End Function
#End Region

    End Class

End Namespace
