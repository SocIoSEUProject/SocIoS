Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DotNetNuke
Imports DotNetNuke.Common.Globals
Imports DotNetNuke.Services.Exceptions.Exceptions
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Entities.Tabs
Imports DotNetNuke.Security
Imports System.Text
Imports System.Collections.Generic

Namespace ArtMenuSkinObject

    Partial Public Class ArtMenuSO
        Inherits DotNetNuke.UI.Skins.SkinObjectBase

        Private Enum MenuOrientation
            Horizontal
            Vertical
        End Enum

        Private _showHiddenTabs As Boolean = False
        Private _showDeletedTabs As Boolean = False
        Private _showAdminTabs As Boolean = True
        Private _showLoginTab As Boolean = True
        Private _showUserTab As Boolean = True

        Private _maxLevel As Integer = -1

        Private _orientation As MenuOrientation = MenuOrientation.Horizontal
        Private _caption As String

        Public Property ShowHiddenTabs() As String
            Get
                Return _showHiddenTabs.ToString()
            End Get
            Set(ByVal value As String)
                If Not (String.IsNullOrEmpty(value)) Then
                    _showHiddenTabs = Boolean.Parse(value)
                End If
            End Set
        End Property

        Public Property ShowDeletedTabs() As String
            Get
                Return _showDeletedTabs.ToString()
            End Get
            Set(ByVal value As String)
                If Not (String.IsNullOrEmpty(value)) Then
                    _showDeletedTabs = Boolean.Parse(value)
                End If
            End Set
        End Property

        Public Property ShowAdminTabs() As Boolean
            Get
                Return _showAdminTabs.ToString()
            End Get
            Set(ByVal value As Boolean)
                If Not (String.IsNullOrEmpty(value)) Then
                    _showAdminTabs = Boolean.Parse(value)
                End If
            End Set
        End Property

        Public Property ShowLoginTab() As Boolean
            Get
                Return _showLoginTab.ToString()
            End Get
            Set(ByVal value As Boolean)
                If Not (String.IsNullOrEmpty(value)) Then
                    _showLoginTab = Boolean.Parse(value)
                End If
            End Set
        End Property

        Public Property ShowUserTab() As Boolean
            Get
                Return _showUserTab.ToString()
            End Get
            Set(ByVal value As Boolean)
                If Not (String.IsNullOrEmpty(value)) Then
                    _showUserTab = Boolean.Parse(value)
                End If
            End Set
        End Property

        Public Property MaxLevel() As Integer
            Get
                Return _maxLevel
            End Get
            Set(ByVal value As Integer)
                _maxLevel = value
            End Set
        End Property


        Public Property Orientation() As String
            Get
                Return _orientation.ToString
            End Get
            Set(ByVal value As String)
                _orientation = [Enum].Parse(_orientation.GetType(), value, True)
            End Set
        End Property

        Public Property Caption() As String
            Get
                Return _caption
            End Get
            Set(ByVal value As String)
                If Not (String.IsNullOrEmpty(value)) Then
                    _caption = value
                End If
            End Set
        End Property

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                If Not (Page.IsPostBack) Then
                    Me.litMenuHtml.Text = GetMenuHtml()

                    If Me.ShowLoginTab Or Me.ShowUserTab Then
                        Me.litMenuHtmlTail.Text = "</li>"
                    End If

                    If Me.ShowLoginTab And Me.ShowUserTab Then
                        Me.litMenuTokensSeparator.Visible = True
                        Me.litMenuTokensSeparator.Text = "</li><li>"
                    End If

                    Me.litMenuHtmlTail.Text &= "</ul></div></div>"

                    If _orientation = MenuOrientation.Vertical Then
                        Me.litMenuHtmlTail.Text &= GetVMenuBlock()("VMenuBlockContentEnd")
                        Me.litMenuHtmlTail.Text &= GetVMenuBlock()("VMenuBlockEnd")
                    End If

                End If
            Catch ex As Exception
                ProcessModuleLoadException(Me, ex)
            End Try
        End Sub

        Private Sub Page_PreRender(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.PreRender

            Try
                If Not Me.ShowLoginTab Then
                    Me.dnnLogin.Visible = False
                Else
                    Dim cmdLogin As LinkButton = CType(Me.dnnLogin.FindControl("cmdLogin"), LinkButton)
                    cmdLogin.Text = String.Format("<span class=""l""></span><span class=""r""></span><span class=""t"">{0}</span>", cmdLogin.Text)
                    cmdLogin.ControlStyle.Reset()
                End If
                If Not Me.ShowUserTab Then
                    Me.dnnUser.Visible = False
                Else
                    Dim cmdRegister As LinkButton = CType(Me.dnnUser.FindControl("cmdRegister"), LinkButton)
                    cmdRegister.Text = String.Format("<span class=""l""></span><span class=""r""></span><span class=""t"">{0}</span>", cmdRegister.Text)
                    cmdRegister.ControlStyle.Reset()
                End If

                If TypeOf (Me.Parent) Is HtmlGenericControl Then
                    If CType(Me.Parent, HtmlGenericControl).Attributes("class") = "DNNEmptyPane" Then
                        CType(Me.Parent, HtmlGenericControl).Attributes.Remove("class")
                    End If
                End If

            Catch ex As Exception
                ProcessModuleLoadException(Me, ex)
            End Try

        End Sub

        Private Function GetMenuHtml() As String
            Try
                Dim menuHtml As New StringBuilder()

                If _orientation = MenuOrientation.Horizontal Then
                    menuHtml.AppendLine("<div class=""art-nav""><div class=""l""></div><div class=""r""></div><div class=""art-nav-center""><ul class=""art-menu"">")
                Else
                    Dim parts As Dictionary(Of String, String) = GetVMenuBlock()

                    menuHtml.Append(parts("VMenuBlockBegin"))

                    If parts("VMenuBlockHeaderBegin") <> "" And parts("VMenuBlockHeaderEnd") <> "" Then
                        menuHtml.Append(parts("VMenuBlockHeaderBegin"))
                        menuHtml.Append(_caption)
                        menuHtml.Append(parts("VMenuBlockHeaderEnd"))
                    End If

                    menuHtml.Append(parts("VMenuBlockContentBegin"))
                    menuHtml.Append("<div class=""art-vmenu""><div class=""art-vmenu-body""><ul class=""art-vmenu"">")
                End If

                Dim objPortalTabs As ArrayList


                If Me._showAdminTabs Then
                    If Not PortalSettings.DesktopTabs Is Nothing Then
                        For Each objTab As TabInfo In PortalSettings.DesktopTabs
                            If objTab.ParentId < 1 And IsShownItem(objTab) Then
                                menuHtml.Append(Me.RenderMenuItem(objTab.TabID))
                            End If
                        Next
                    End If
                Else
                    objPortalTabs = GetPortalTabs(PortalSettings.DesktopTabs, False, Me._showHiddenTabs, Me._showDeletedTabs, False)
                    If Not objPortalTabs Is Nothing Then
                        For Each objTab As TabInfo In objPortalTabs
                            If objTab.ParentId < 1 And Not objTab.IsDeleted Then
                                menuHtml.Append(Me.RenderMenuItem(objTab.TabID))
                            End If
                        Next
                    End If
                End If

                If Me.ShowLoginTab Or Me.ShowUserTab Then
                    menuHtml.Append("<li>")
                End If

                Return menuHtml.ToString

            Catch ex As Exception
                ProcessModuleLoadException(Me, ex)
            End Try

        End Function

        Private Function IsShownItem(ByVal item As TabInfo) As Boolean

            If _maxLevel <> -1 And item.Level > _maxLevel Then Return False

            If Not (item.IsDeleted) And item.IsVisible Then
                Return True
            ElseIf (item.IsDeleted And Not (Me._showDeletedTabs)) Or (Not (item.IsVisible) And Not (Me._showHiddenTabs)) Then
                Return False
            Else
                Return True
            End If

        End Function

        Private Function RenderMenuItem(ByVal itemId As Integer) As String

            Try
                Dim itemHtml As New StringBuilder
                Dim tabController As TabController = New TabController
                Dim tabInfo As TabInfo = tabController.GetTab(itemId, PortalSettings.PortalId, False)

                If Not (PortalSecurity.IsInRoles(tabInfo.AuthorizedRoles)) Then Return String.Empty

                itemHtml.Append("<li><a href=""")
                If tabInfo.DisableLink Then
                    itemHtml.Append("#")
                Else
                    itemHtml.Append(tabInfo.FullUrl)
                End If
                itemHtml.Append("""")
                If tabInfo.TabID = PortalSettings.ActiveTab.TabID Or (HasActiveChild(itemId) And tabInfo.Level = 0) Then
                    itemHtml.Append(" class="" active""")
                End If

                If tabInfo.ParentId < 1 Then
                    itemHtml.Append("><span class=""l""></span><span class=""r""></span><span class=""t"">")
                    itemHtml.Append(tabInfo.LocalizedTabName)
                    itemHtml.Append("</span></a>")
                    itemHtml.Append(RenderChildItems(itemId))
                Else
                    itemHtml.Append(">")
                    itemHtml.Append(tabInfo.LocalizedTabName)
                    itemHtml.Append("</a>")
                    itemHtml.Append(RenderChildItems(itemId))
                End If

                itemHtml.Append("</li>")

                Return itemHtml.ToString

            Catch ex As Exception
                ProcessModuleLoadException(Me, ex)
            End Try

        End Function


        Private Function RenderChildItems(ByVal itemId As Integer) As String

            Dim childItemsHtml As New Text.StringBuilder
            Dim tabController As TabController = New TabController
            Dim tabInfo As TabInfo = tabController.GetTab(itemId, PortalSettings.PortalId, True)

            If tabController.GetTabsByParentId(itemId).Count = 0 Then Return String.Empty

            childItemsHtml.Append("<ul>")
            For Each childTab As TabInfo In tabController.GetTabsByParentId(itemId)
                If IsShownItem(childTab) Then
                    childItemsHtml.Append(RenderMenuItem(childTab.TabID))
                End If
            Next
            childItemsHtml.Append("</ul>")

            If childItemsHtml.Length = 9 Then Return String.Empty

            Return childItemsHtml.ToString()
        End Function

        Private Function HasActiveChild(ByVal itemId As Integer) As Boolean

            Dim tabController As TabController = New TabController
            Dim tabInfo As TabInfo = tabController.GetTab(itemId, PortalSettings.PortalId, True)

            If tabController.GetTabsByParentId(itemId).Count = 0 Then Return False

            For Each childTab As TabInfo In tabController.GetTabsByParentId(itemId)
                If childTab.TabID = PortalSettings.ActiveTab.TabID Or HasActiveChild(childTab.TabID) Then
                    Return True
                End If
            Next

            Return False

        End Function

        Private Function GetVMenuBlock() As Dictionary(Of String, String)

            Dim parts As Dictionary(Of String, String) = New Dictionary(Of String, String)

            parts.Add("VMenuBlockBegin", "")
            parts.Add("VMenuBlockEnd", "")
            parts.Add("VMenuBlockHeaderBegin", "")
            parts.Add("VMenuBlockHeaderEnd", "")
            parts.Add("VMenuBlockContentBegin", "")
            parts.Add("VMenuBlockContentEnd", "")

            Return parts

        End Function

    End Class

End Namespace
