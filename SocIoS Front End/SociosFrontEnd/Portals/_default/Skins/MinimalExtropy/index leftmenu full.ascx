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

    <div id="s_wrap_main">
		<div id="s_wrap_sub">
	        <div class="template_style">
	        <div class="cpanel_left">
	            <div class="cpanel_right">
	                <div runat="server" id="ControlPanel" ></div>
	            </div>
	        </div>
	            <div class="top_space">
	                <div class="lang_pad">
	                    <dnn:LANGUAGE runat="server" id="dnnLANGUAGE"  showMenu="False" showLinks="True" />
	                </div>
	            </div>
	            <div class="logo_top">
	                <div class="logo_top_left">
	                    <div class="logo_top_right">
	                        <div class="logo_top_bg">
	                        </div>
	                    </div>
	                </div>
	                <div class="logo_left">
	                    <div class="logo_right">
	                        <div class="logo_pad">
	                            <dnn:LOGO runat="server" id="dnnLOGO"  />
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="menu_left">
	                <div class="menu_right">
	                    <div class="menu_bg">
	                        <div class="search_style">
	                            <div class="search_bg">
	                                <dnn:SEARCH runat="server" id="dnnSEARCH"  CssClass="ServerSkinWidget" UseDropDownList="true" Submit="<img src=&quot;images/search.gif&quot; border=&quot;0&quot; alt=&quot;Search&quot; /&gt;" />
	                            </div>
	                        </div>
	                        <div class="menu_style">
	                            <dnn:NAV runat="server" id="dnnNAV"  ProviderName="DNNMenuNavigationProvider" IndicateChildren="false" ControlOrientation="Horizontal" CSSControl="mainMenu" />
	                        </div>
	                        <div class="clear_float">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="bread_left">
	                <div class="bread_right">
	                    <div class="bread_bg">
	                        <div id="bread_style">
	                            <dnn:TEXT runat="server" id="dnnTEXT"  CssClass="breadcrumb_text" Text="You are here >" ResourceKey="Breadcrumb" />&nbsp;<span>
								<dnn:BREADCRUMB runat="server" id="dnnBREADCRUMB"  CssClass="Breadcrumb" RootLevel="0" Separator="&nbsp;>&nbsp;" />
	                            </span>
	                        </div>
	                        <div id="login_style" class="user">
	                            <dnn:USER runat="server" id="dnnUSER"  CssClass="user" />
	                            &nbsp;&nbsp;|&nbsp;&nbsp;<dnn:LOGIN runat="server" id="dnnLOGIN"  CssClass="user" />
	                        </div>
	                        <div class="clear_float">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="center_bg">
	                <div class="left_bg">
	                    <div class="right_bg">
	                        <div class="lm_content_pad">
	                            <div class="lm_content_width">
	                                <div runat="server" id="TopPane"  class="TopPane" ></div>
	                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
	                                    <tr>
	                                        <td valign="top" class="LeftPane">
	                                        <dnn:LEFTMENU runat="server" id="dnnLEFTMENU"  Width="165px" ShowOnlyCurrent="RootItem" MaxLevel="2" EnableEmbeddedSkins="false" Skin="MinimalExtropy" />
											<div id="LeftPane" runat="server"></div>
	                                        </td>
	                                        <td valign="top" id="ContentPane" class="ContentPane" runat="server">
	                                        </td>
	                                        <td valign="top" id="RightPane" class="RightPane" runat="server">
	                                        </td>
	                                    </tr>
	                                </table>
	                                <div runat="server" id="BottomPane"  class="BottomPane" ></div>
	                            </div>
								<div class="linkscontainer">
									<dnn:LINKS runat="server" id="dnnLINKS"  CssClass="links" Level="Root" Separator="&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;" />
								</div>							
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="bot_left">
	                <div class="bot_right">
	                    <div class="bot_bg">
	                    </div>
	                </div>
	            </div>
	            <div class="bot_pad">
	                <div id="terms_style" class="footer">
	                    <dnn:PRIVACY runat="server" id="dnnPRIVACY"  CssClass="footer" />
	                    &nbsp;&nbsp;|&nbsp;&nbsp;<dnn:TERMS runat="server" id="dnnTERMS"  CssClass="footer" />
	                </div>
	                <div id="copy_style" class="footer">
	                    <dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT"  CssClass="footer" />
	                </div>
	                <div class="clear_float">
	                </div>
	            </div>
	        </div>
		</div>
    </div>
    <dnn:STYLES runat="server" id="StylesIE6"  Name="IE6Minus" StyleSheet="css/ie6skin.css" Condition="LT IE 7" UseSkinPath="true" />

