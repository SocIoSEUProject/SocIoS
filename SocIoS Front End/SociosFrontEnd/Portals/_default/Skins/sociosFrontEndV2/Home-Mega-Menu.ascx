<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LEFTMENU" Src="~/Admin/Skins/LeftMenu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:STYLES runat="server" ID="StylesIE7" Name="IE7Minus" StyleSheet="ie7skin.css" Condition="LT IE 8" UseSkinPath="true"/>



<div id="DNN6" class="Home">
		<div id="Background"></div>
    <div id="Header">
        <div id="ContentBG">
            <div id="ControlPanelWrapper">
                <dnn:CONTROLPANEL runat="server" id="cp"  IsDockable="True" />
		    </div>
			<div class="cleared"></div>
			<div id="LoginWrapper"><dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" />&nbsp;&nbsp;&nbsp;<dnn:USER ID="dnnUser" runat="server" />
			
			<a href="http://frontend.sociosproject.eu/roleSelector.aspx">
			<% If DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Journalists") Then%>
			<b>(Journalist)</b>
			<% End If %>
			<% If DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Players") Then%>
			<b>(Player)</b>
			<% End If %>
			<% If DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Candidates") Then%>
			<b>(Candidate/Producer)</b>
			<% End If %>
			<%   If Not(Request.IsAuthenticated) Then %>
			
			<% Else If  Not(DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Candidates")) And Not(DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Journalists")) And Not(DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo().IsInRole("Players")) Then%>
			<b>(Role not yet selected)</b>
			<% End If %>
			</a>
	
			
			
			
			
			</div>
			
			<div class="SearchWrapper"><a href="#" id="HeaderLink"></a> 
			
			</div>
		    <div class="cleared"></div>
			<div class="Content">
                <div id="Nav">
				    <dnn:MENU MenuStyle="DNNMega" runat="server"></dnn:MENU>
			    </div>
               
		    </div>
        </div>
	</div>
    <div id="Content">
	<div id="welcomeLogo"></div>
        <div id="Panes">
		    <!--<div id="LogoRow">
			    <dnn:LOGO id="dnnLogo" runat="server" />
                <div class="LogoRowRight">
                    <div id="Login">
					<dnn:LANGUAGE runat="server" id="dnnLANGUAGE"  showMenu="False" showLinks="True" />
					</div>
			        <div id="SocialMediaPane" runat="server"></div>
                </div>
		    </div>-->
            <div id="ContentPane" runat="server"></div>
            <div id="LeftPane" runat="server"></div>
		    <div id="RightPane" runat="server"></div>
		    <div id="BottomPane" runat="server"></div>
        </div>
    </div>
	<div id="Footer">
        <div class="Content">
            <div id="Footer_LeftPane" runat="server"></div>
            <div id="Footer_RightPane" runat="server"></div>
            <div id="Footer_BottomPane" runat="server"></div>
			<div id="FooterContentWrapper">
			<a id="SevenLink" href="#"></a>
			<a id="EuLink" href="#"></a>
			<div id="FundingDesc">
			This project is co-funded by the EC under the FP7 Programme. This website reflects the views only of the Consortium, 
and the Commission cannot be held responsible for any use which may be made of the information contained herein.
			</div>
			
			<a id="LiIcon" href="http://www.linkedin.com/groups?mostPopular=&gid=3669024"></a>
			<a id="TwIcon" href="http://twitter.com/eusocios"></a>
			
			<a id="YtIcon" href="http://www.youtube.com/user/EuSocIoS"></a>
			<a id="FbIcon" href="http://www.facebook.com/pages/SocIos/168885546470445"></a>
			
			<!--
			<a id="FrIcon" href="http://www.flickr.com/"></a>
			<a id="RsIcon" href="#"></a>
			<a id="GoIcon" href="#"></a>
			
			-->
			
		
			
			
			
			
			
			<div class="cleared"></div>
			</div>
			
			<div class="cleared"></div>
			
             </div>
			 
    </div>
</div>

<dnn:DnnJsInclude runat="server" FilePath="jquery.cycle.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="DNNMega/jquery.dnnmega.debug.js" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="DNNMega/dnnmega.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="Slider/css/global.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js" />
<dnn:STYLES runat="server" ID="styleUI" Name="jqueryui" StyleSheet="css/cupertino/jquery-ui-1.8.17.custom.css" UseSkinPath="true" />
<dnn:DnnJsInclude runat="server" FilePath="Slider/slides.min.jquery.js"  PathNameAlias="SkinPath"/>