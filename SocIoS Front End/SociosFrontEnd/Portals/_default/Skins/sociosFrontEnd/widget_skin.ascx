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
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.ClientScript.RegisterClientScriptInclude("jquery.cycle.js", Me.TemplateSourceDirectory & "/jquery.cycle.js")
    End Sub
</script>

<script type="text/javascript">

    $(document).ready(function() {
//$('.slideshow').cycle();
});
</script>

<div id="wrapper">
<div id="logo">
<!--
<img  src="<%=SkinPath %>images/lock.png" alt=""><dnn:LOGIN runat="server" ID="login"/> | 
<dnn:USER runat="server" ID="user"/>
-->
</div>
	
	
	<div class="clear"></div>
	<div class="main">
		<div class="left">
			<div class="first">
			
				<div id="ContentPane"  runat="server"></div>
				
			</div>
			<div class="second">
				
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<!--<div class="footer">
		<div class="footerlft">
			<a href="#">Contact us |</a>
			<a href="#"> Terms and Conditions |</a>
			<a href="#"> Legal disclaimer |</a>
			<a href="#"> FAQ</a>
			</br>
			<p>&copy 2011 OurSpace Project, Website created by Athens Technology Center</p>
		</div>
		<div class="footercntr">
			<p>This project is co-fundedby the EC under the ICT Policy Support Programme.This portal reflects the view only of the Cosnortium, and the Commision can not be held responsible for any use which may be made of the information contained herein.</p>
		</div>
		<div class="footerrght">
			
		</div>
		
	</div>-->
	</div>
<dnn:STYLES runat="server" ID="style" Name="style" StyleSheet="style.css" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="style2" Name="style2" StyleSheet="style_fb.css" UseSkinPath="true" />