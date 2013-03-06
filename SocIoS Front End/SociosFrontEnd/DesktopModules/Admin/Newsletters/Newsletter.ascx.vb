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
Imports System.Threading
'Imports System.Web.Mail

Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Security.Roles
Imports DotNetNuke.Services.FileSystem
Imports DotNetNuke.Entities.Host

Namespace DotNetNuke.Modules.Admin.Newsletters

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Newsletter PortalModuleBase is used to manage a Newsletters
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	2004-09-13	Updated to reflect design changes for Help, 508 support and localisation
    '''     [lpointer]  2006-02-03  Added 'From' email address support.
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class Newsletter
        Inherits DotNetNuke.Entities.Modules.PortalModuleBase

        ''' <summary>
        ''' helper function for ManageDirectoryBase
        ''' <history>
        ''' [vmasanas] 2007-09-07 added
        ''' [sleupold] 2008-02-10 support for local links added
        ''' </history>
        ''' </summary>
        Function FormatUrls(ByVal m As Match) As String
            Dim match As String = m.Value
            Dim url As String = m.Groups("url").Value
            Dim result As String = match

            If url.StartsWith("/") Then ' server absolute path
                Return result.Replace(url, AddHTTP(HttpContext.Current.Request.Url.Host) & url)
            ElseIf url.Contains("://") Then ' absolute path
                Return result 'return unchanged
            Else
                Return result.Replace(url, AddHTTP(HttpContext.Current.Request.Url.Host) & ApplicationPath & "/" & url)
            End If
        End Function


        ''' <summary>
        ''' convert links to absolute
        ''' </summary>
        ''' <param name="source">html text with relative links</param>
        ''' <returns>HTML text with adjusted links</returns>
        ''' <history>
        ''' 	[vmasanas]	2007-09-07  added
        '''     [sleupold]  2008-02-10 support for brackground properties added
        ''' </history>
        Function ManageDirectoryBase(ByVal source As String) As String
            Dim pattern As String = "<(a|link|img|script|object|table|td|body).[^>]*(href|src|action|background)=(\""|'|)(?<url>(.[^\""']*))(\""|'|)[^>]*>"
            Return Regex.Replace(source, pattern, AddressOf FormatUrls)
        End Function



        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Page_Load runs when the control is loaded
        ''' </summary>
        ''' <history>
        ''' 	[cnurse]	2004-09-10	Updated to reflect design changes for Help, 508 support and localisation
        '''     [sleupold]  2007-10-07  Relay address and Language adoption added
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                If Not Page.IsPostBack Then
                    txtFrom.Text = UserInfo.Email
                End If
                plLanguages.Visible = (DotNetNuke.Services.Localization.Localization.GetLocales(PortalId).Count > 1)
                pnlRelayAddress.Visible = (cboSendMethod.SelectedValue = "RELAY")
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub


        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdSend_Click runs when the cmdSend Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	2004-09-10	Updated to reflect design changes for Help, 508 support and localisation
        '''     [sleupold]	2007-08-15	added support for tokens and SendTokenizedBulkEmail
        '''     [sleupold]  2007-09-09   moved Roles to SendTokenizedBulkEmail
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSend.Click
            Dim strResult As String = ""
            Dim msgResult As DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType
            Dim intMailsSent As Integer = -1
            Dim isValid As Boolean = True

            Try
                If txtSubject.Text = "" Or teMessage.Text = "" Then
                    ' no subject or message
                    strResult = Services.Localization.Localization.GetString("MessageValidation", Me.LocalResourceFile)
                    msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning
                    isValid = False
                Else
                    ' load all user emails based on roles selected
                    Dim objRoleNames As New System.Collections.Generic.List(Of String)
                    For Each strRoleName As String In dgSelectedRoles.SelectedRoleNames
                        objRoleNames.Add(strRoleName)
                    Next

                    ' load emails specified in email distribution list
                    Dim objUsers As New System.Collections.Generic.List(Of UserInfo)
                    If txtEmail.Text <> "" Then
                        Dim arrEmail As Array = Split(txtEmail.Text, ";")
                        For Each strEmail As String In arrEmail
                            Dim objUser As New UserInfo
                            objUser.UserID = Null.NullInteger
                            objUser.Email = strEmail
                            objUser.DisplayName = strEmail
                            objUsers.Add(objUser)
                        Next
                    End If

                    If objUsers.Count = 0 AndAlso objRoleNames.Count = 0 Then
                        strResult = String.Format(Services.Localization.Localization.GetString("NoMessagesSent", Me.LocalResourceFile), intMailsSent)
                        msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning
                        isValid = False
                    Else
                        ' create object
                        Dim objSendBulkEMail As New Services.Mail.SendTokenizedBulkEmail(objRoleNames, objUsers, False, txtSubject.Text, teMessage.Text)

                        Select Case teMessage.Mode
                            Case "RICH"
                                objSendBulkEMail.BodyFormat = Services.Mail.MailFormat.Html
                            Case Else
                                objSendBulkEMail.BodyFormat = Services.Mail.MailFormat.Text
                        End Select

                        If objSendBulkEMail.SuppressTokenReplace <> Not chkReplaceTokens.Checked Then objSendBulkEMail.SuppressTokenReplace = Not chkReplaceTokens.Checked

                        Select Case cboPriority.SelectedItem.Value
                            Case "1"
                                objSendBulkEMail.Priority = DotNetNuke.Services.Mail.MailPriority.High
                            Case "2"
                                objSendBulkEMail.Priority = DotNetNuke.Services.Mail.MailPriority.Normal
                            Case "3"
                                objSendBulkEMail.Priority = DotNetNuke.Services.Mail.MailPriority.Low
                            Case Else
                                isValid = False
                        End Select

                        If txtFrom.Text <> String.Empty AndAlso objSendBulkEMail.SendingUser.Email <> txtFrom.Text Then
                            Dim myUser As UserInfo = objSendBulkEMail.SendingUser
                            If myUser Is Nothing Then myUser = New UserInfo
                            myUser.Email = txtFrom.Text
                            objSendBulkEMail.SendingUser = myUser
                        End If

                        If txtReplyTo.Text <> String.Empty AndAlso objSendBulkEMail.ReplyTo.Email <> txtReplyTo.Text Then
                            Dim myUser As UserInfo = New UserInfo
                            myUser.Email = txtReplyTo.Text
                            objSendBulkEMail.ReplyTo = myUser
                        End If

                        If selLanguage.Visible AndAlso selLanguage.SelectedLanguages IsNot Nothing Then
                            objSendBulkEMail.LanguageFilter = selLanguage.SelectedLanguages
                        End If

                        If ctlAttachment.Url.StartsWith("FileID=") Then
                            Dim fileId As Integer = Integer.Parse(ctlAttachment.Url.Substring(7))
                            Dim objFileController As New FileController
                            Dim objFileInfo As FileInfo = objFileController.GetFileById(fileId, PortalId)
                            'TODO: support secure storage locations for attachments! [sleupold 06/15/2007]
                            objSendBulkEMail.AddAttachment(PortalSettings.HomeDirectoryMapPath & objFileInfo.Folder & objFileInfo.FileName)
                        End If

                        Select Case cboSendMethod.SelectedItem.Value
                            Case "TO"
                                objSendBulkEMail.AddressMethod = Services.Mail.SendTokenizedBulkEmail.AddressMethods.Send_TO
                            Case "BCC"
                                objSendBulkEMail.AddressMethod = Services.Mail.SendTokenizedBulkEmail.AddressMethods.Send_BCC
                            Case "RELAY"
                                objSendBulkEMail.AddressMethod = Services.Mail.SendTokenizedBulkEmail.AddressMethods.Send_Relay
                                If String.IsNullOrEmpty(txtRelayAddress.Text) Then
                                    strResult = String.Format(Services.Localization.Localization.GetString("MessagesSentCount", Me.LocalResourceFile), intMailsSent)
                                    msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning
                                    isValid = False
                                Else
                                    objSendBulkEMail.RelayEmailAddress = txtRelayAddress.Text
                                End If
                        End Select

                        If Not chkReplaceTokens.Checked Then objSendBulkEMail.SuppressTokenReplace = True

                        objSendBulkEMail.RemoveDuplicates = True

                        ' send mail
                        If Not isValid Then
                            'skip send
                        ElseIf optSendAction.SelectedItem.Value = "S" Then
                            intMailsSent = objSendBulkEMail.SendMails()
                            If intMailsSent > 0 Then
                                strResult = String.Format(Services.Localization.Localization.GetString("MessagesSentCount", Me.LocalResourceFile), intMailsSent)
                                msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess
                            Else
                                strResult = Services.Localization.Localization.GetString("NoMessagesSent", Me.LocalResourceFile)
                                msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning
                            End If
                        Else    ' ansynchronous uses threading
                            'First send off a test message
                            Dim strMessage As String = DotNetNuke.Services.Mail.Mail.SendMail(Host.HostEmail, Host.HostEmail, _
                                "", "", DotNetNuke.Services.Mail.MailPriority.Normal, _
                                Services.Localization.Localization.GetSystemMessage(PortalSettings, "EMAIL_SMTP_TEST_SUBJECT"), _
                                DotNetNuke.Services.Mail.MailFormat.Text, _
                                System.Text.Encoding.UTF8, "", "", Host.SMTPServer, Host.SMTPAuthentication, _
                                 Host.SMTPUsername, Host.SMTPPassword, Host.EnableSMTPSSL)
                            If String.IsNullOrEmpty(strMessage) Then
                                Dim objThread As New Thread(AddressOf objSendBulkEMail.Send)
                                objThread.Start()
                                strResult = Services.Localization.Localization.GetString("MessageSent", Me.LocalResourceFile)
                                msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess
                            Else
                                strResult = Services.Localization.Localization.GetString("NoMessagesSent", Me.LocalResourceFile)
                                msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning
                            End If
                        End If
                    End If
                End If
                ' completed
                UI.Skins.Skin.AddModuleMessage(Me, strResult, msgResult)

                DirectCast(Page, DotNetNuke.Framework.CDefault).ScrollToControl(Page.Form)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' <summary>
        ''' Display a preview of the message to be sent out
        ''' </summary>
        ''' <param name="sender">ignored</param>
        ''' <param name="e">ignores</param>
        ''' <history>
        ''' 	[vmasanas]	2007-09-07  added
        ''' </history>
        Protected Sub cmdPreview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdPreview.Click
            Dim strResult As String = ""
            Dim msgResult As DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType

            Try
                If txtSubject.Text = "" Or teMessage.Text = "" Then
                    ' no subject or message
                    strResult = Services.Localization.Localization.GetString("MessageValidation", Me.LocalResourceFile)
                    msgResult = DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning

                    UI.Skins.Skin.AddModuleMessage(Me, strResult, msgResult)
                    DirectCast(Page, DotNetNuke.Framework.CDefault).ScrollToControl(Page.Form)
                    Return
                End If

                ' convert links to absolute
                Dim strBody As String = teMessage.Text
                Dim pattern As String = "<(a|link|img|script|object).[^>]*(href|src|action)=(\""|'|)(?<url>(.[^\""']*))(\""|'|)[^>]*>"
                strBody = Regex.Replace(strBody, pattern, AddressOf FormatUrls)

                If chkReplaceTokens.Checked Then
                    Dim objTR As New DotNetNuke.Services.Tokens.TokenReplace
                    If cboSendMethod.SelectedItem.Value = "TO" Then
                        objTR.User = UserInfo
                        objTR.AccessingUser = UserInfo
                        objTR.DebugMessages = True
                    End If

                    lblPreviewSubject.Text = objTR.ReplaceEnvironmentTokens(txtSubject.Text)
                    lblPreviewBody.Text = objTR.ReplaceEnvironmentTokens(strBody)
                Else
                    lblPreviewSubject.Text = txtSubject.Text
                    lblPreviewBody.Text = strBody
                End If

                pnlPreview.Visible = True
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub
    End Class

End Namespace
