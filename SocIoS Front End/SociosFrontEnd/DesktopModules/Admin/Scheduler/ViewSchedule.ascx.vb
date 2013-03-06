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
    ''' The ViewSchedule PortalModuleBase is used to manage the scheduled items.
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
    '''                       and localisation
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class ViewSchedule
        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

#Region "Controls"


#End Region

#Region "Protected Methods"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' GetTimeLapse formats the time lapse as a string
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	9/28/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Protected Function GetTimeLapse(ByVal TimeLapse As Integer, ByVal TimeLapseMeasurement As String) As String
            If TimeLapse <> Null.NullInteger Then
                Dim str As String = Null.NullString
                Dim strPrefix As String = Services.Localization.Localization.GetString("TimeLapsePrefix", Me.LocalResourceFile)
                Dim strSec As String = Services.Localization.Localization.GetString("Second", Me.LocalResourceFile)
                Dim strMn As String = Services.Localization.Localization.GetString("Minute", Me.LocalResourceFile)
                Dim strHour As String = Services.Localization.Localization.GetString("Hour", Me.LocalResourceFile)
                Dim strDay As String = Services.Localization.Localization.GetString("Day", Me.LocalResourceFile)
                Dim strSecs As String = Services.Localization.Localization.GetString("Seconds")
                Dim strMns As String = Services.Localization.Localization.GetString("Minutes")
                Dim strHours As String = Services.Localization.Localization.GetString("Hours")
                Dim strDays As String = Services.Localization.Localization.GetString("Days")

                Select Case TimeLapseMeasurement
                    Case "s"
                        str = strPrefix + " " + TimeLapse.ToString + " " + IIf(TimeLapse > 1, strSecs, strSec).ToString()
                    Case "m"
                        str = strPrefix + " " + TimeLapse.ToString + " " + IIf(TimeLapse > 1, strMns, strMn).ToString()
                    Case "h"
                        str = strPrefix + " " + TimeLapse.ToString + " " + IIf(TimeLapse > 1, strHours, strHour).ToString()
                    Case "d"
                        str = strPrefix + " " + TimeLapse.ToString + " " + IIf(TimeLapse > 1, strDays, strDay).ToString()
                End Select

                Return str.ToString
            Else
                Return Services.Localization.Localization.GetString("n/a", Me.LocalResourceFile)
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
                If Not Page.IsPostBack Then
                    Dim arrSchedule As ArrayList = SchedulingProvider.Instance.GetSchedule()

                    'Lcalize Grid
                    Services.Localization.Localization.LocalizeDataGrid(dgSchedule, Me.LocalResourceFile)

                    dgSchedule.DataSource = arrSchedule
                    dgSchedule.DataBind()
                End If


            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try

        End Sub

#End Region

#Region "Optional Interfaces"
        Public ReadOnly Property ModuleActions() As ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New ModuleActionCollection
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.AddContent, LocalResourceFile), ModuleActionType.AddContent, "", "add.gif", EditUrl(), False, SecurityAccessLevel.Host, True, False)
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString(ModuleActionType.ContentOptions, LocalResourceFile), ModuleActionType.AddContent, "", "icon_scheduler_16px.gif", EditUrl("", "", "Status"), False, SecurityAccessLevel.Host, True, False)
                Actions.Add(GetNextActionID, Services.Localization.Localization.GetString("ScheduleHistory.Action", LocalResourceFile), ModuleActionType.AddContent, "", "icon_profile_16px.gif", EditUrl("", "", "History"), False, SecurityAccessLevel.Host, True, False)
                Return Actions
            End Get
        End Property
#End Region

    End Class

End Namespace
