<%@ Control language="vb" CodeBehind="~/admin/Skins/skin.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/breadcrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ARTMENU" Src="~/DesktopModules/ArtMenuSO/ArtMenuSO.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/admin/Skins/copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/admin/Skins/terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/admin/Skins/privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/admin/Skins/Text.ascx" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.ClientScript.RegisterClientScriptInclude("script.js", Me.TemplateSourceDirectory & "/script.js")
		Me.Page.ClientScript.RegisterClientScriptInclude("jquery-ui-1.8.17.custom.min.js", Me.TemplateSourceDirectory & "/js/jquery-ui-1.8.17.custom.min.js")
		
    End Sub
    
    Private Function CollapseSidebars() As String
        Dim sb1 As Control = Me.FindControl("sidebar1")
        Dim sb2 As Control = Me.FindControl("sidebar2")
        
        If Not IsNothing(sb1) And Not IsNothing(sb2) Then
            If sb1.Controls.Count > 0 And sb2.Controls.Count = 0 Then
                Return "-sidebar2"
            ElseIf sb1.Controls.Count = 0 And sb2.Controls.Count > 0 Then
                Return "-sidebar1"
            ElseIf sb1.Controls.Count = 0 And sb2.Controls.Count = 0 Then
                Return "-wide"
            End If
        ElseIf Not IsNothing(sb1) And IsNothing(sb2) Then
            If sb1.Controls.Count = 0 Then
                Return "-wide"
            End If
        ElseIf IsNothing(sb2) And Not IsNothing(sb2) Then
            If sb2.Controls.Count = 0 Then
                Return "-wide"
            End If
        End If
        Return String.Empty
    End Function
</script>

<div id="art-page-background-glare">
    <div id="art-page-background-glare-image"></div>
</div>
<div id="art-main">
<div class="art-sheet">
    <div class="art-sheet-tl"></div>
    <div class="art-sheet-tr"></div>
    <div class="art-sheet-bl"></div>
    <div class="art-sheet-br"></div>
    <div class="art-sheet-tc"></div>
    <div class="art-sheet-bc"></div>
    <div class="art-sheet-cl"></div>
    <div class="art-sheet-cr"></div>
    <div class="art-sheet-cc"></div>
    <div class="art-sheet-body">
        <div id="ControlPanel" runat="server"></div>
        <div class="art-header">
    <div class="art-header-jpeg"></div>
<div class="art-logo">
 <h1 id="name-text" class="art-logo-name"><a href="<%= DotNetNuke.Common.Globals.NavigateURL(Me.PortalSettings.HomeTabId) %>"></a></h1>
 <div id="slogan-text" class="art-logo-text"></div>
</div>

</div>
<dnn:ARTMENU ID="ArtMenu1" ShowHiddenTabs="False" ShowAdminTabs="True" ShowDeletedTabs="False" ShowLoginTab="True" ShowUserTab="True" runat="server" /><div id="TopPane" visible="false" runat="server"></div>
      <table class="position" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr valign="top">
          <td width="33%" id="Top1" runat="server"></td>
          <td width="33%" id="Top2" runat="server"></td>
          <td id="Top3" runat="server"></td>
        </tr>
      </table><div class="art-content-layout">
    <div class="art-content-layout-row">
<div class="art-layout-cell art-content<%= CollapseSidebars() %>">
<div id="Banner1" visible="false" runat="server"></div>
<table class="position" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr valign="top">
          <td width="50%" id="User1" runat="server"></td>
          <td id="User2" runat="server"></td>
        </tr>
      </table>
<div id="Banner2" visible="false" runat="server"></div>
<div id="ContentPane" runat="server"></div>
<div id="Banner3" visible="false" runat="server"></div>
<table class="position" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr valign="top">
          <td width="50%" id="User3" runat="server"></td>
          <td id="User4" runat="server"></td>
        </tr>
      </table>
<div id="Banner4" visible="false" runat="server"></div>
</div>
<div class="art-layout-cell art-sidebar1">
<div id="sidebar1" visible="true" runat="server"></div>
</div>

    </div>
</div>
<div class="cleared"></div>
<table class="position" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr valign="top">
          <td width="33%" id="Bottom1" runat="server"></td>
          <td width="33%" id="Bottom2" runat="server"></td>
          <td id="Bottom3" runat="server"></td>
        </tr>
      </table>
      <div id="BottomPane" visible="false" runat="server"></div><div class="art-footer">
    <div class="art-footer-t"></div>
    <div class="art-footer-l"></div>
    <div class="art-footer-b"></div>
    <div class="art-footer-r"></div>
    <div class="art-footer-body">
        <div class="art-footer-text">
<p><dnn:TERMS runat="server" ID="dnnTerms" />
    | <dnn:PRIVACY ID="dnnPrivacy" runat="server" /><br />
    <dnn:COPYRIGHT runat="server" id="dnnCopyright" /></p>

        </div>
		<div class="cleared"></div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
<div class="cleared"></div>
<p class="art-page-footer"></p>

</div>


<dnn:STYLES runat="server" ID="style" Name="style" StyleSheet="style.css" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="styleUI" Name="jqueryui" StyleSheet="css/cupertino/jquery-ui-1.8.17.custom.css" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="styleIE6" Name="styleIE6" Condition="IE 6" StyleSheet="style.ie6.css" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="styleIE7" Name="styleIE7" Condition="IE 7" StyleSheet="style.ie7.css" UseSkinPath="true" />

