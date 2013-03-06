<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>     
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>     
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>     
<%@ Register TagPrefix="dnn" TagName="DROPDOWNACTIONS" Src="~/admin/Containers/dropdownactions.ascx"  %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/admin/Containers/visibility.ascx" %>

<script runat="server">

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        ReplaceHelpIcon(Me)
        SetStyleRecursive(Me)
    End Sub
    
    Private Sub SetStyleRecursive(ByVal ctl As Control)
        If TypeOf (ctl) Is WebControl Then
            If TypeOf (ctl) Is TextBox Then
                If Not (CType(ctl, TextBox).Width.IsEmpty) Then
                    CType(ctl, TextBox).Style("width") = "95%"
                End If
            End If
            
            If TypeOf (ctl) Is Button Then
                CType(ctl, Button).CssClass = "art-button"
            End If
        End If
        
        For Each childCtl As Control In ctl.Controls
            SetStyleRecursive(childCtl)
        Next
    End Sub

    Private Sub ReplaceHelpIcon(ByVal ctl As Control)
        
        Dim helpImg As Control = ctl.FindControl("imgHelp")
        If Not IsNothing(helpImg) Then
            If TypeOf (helpImg) Is System.Web.UI.WebControls.Image Then
                CType(helpImg, System.Web.UI.WebControls.Image).ImageUrl = System.IO.Path.Combine(Regex.Replace(Me.SkinPath, "[Cc]ontainers", "Skins"), "images/helpArticle.png")
            End If
        End If
        For Each child As Control In ctl.Controls
            ReplaceHelpIcon(child)
        Next
    End Sub
    
</script>


<div class="art-post">
    <div class="art-post-body">
<div class="art-post-inner art-article">
<h2 class="art-postheader">
<dnn:TITLE id="dnnTitle" runat="server" />

</h2>
              
          <div align="right">
                  <dnn:ACTIONS ID="dnnACTIONS" runat="server" />
                  <dnn:ACTIONBUTTON runat="server" ID="dnnADDCONTENT" CommandName="AddContent.Action"
                      DisplayIcon="True" DisplayLink="True" />
                  <dnn:ACTIONBUTTON runat="server" ID="dnnEDITCONTENT" CommandName="EditContent.Action"
                      DisplayIcon="True" DisplayLink="True" />
              </div>
              <div class="art-postcontent">
    <!-- article-content -->
<div id="ContentPane" runat="server"></div>
    <!-- /article-content -->
</div>
<div class="cleared"></div>
                
              <div align="right">
                  <dnn:ACTIONBUTTON runat="server" id="dnnPRINTACTION" CommandName="PrintModule.Action" DisplayIcon="True" DisplayLink="False" />
                  <dnn:ACTIONBUTTON runat="server" ID="dnnMODULESETTINGS" CommandName="ModuleSettings.Action"
                      DisplayIcon="True" DisplayLink="True" />
              </div>
                
</div>

		<div class="cleared"></div>
    </div>
</div>

