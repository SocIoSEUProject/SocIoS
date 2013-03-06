<%@ Control Language="vb" AutoEventWireup="false" CodeFile="ArtMenuSO.ascx.vb" Inherits="ArtMenuSkinObject.ArtMenuSO" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/user.ascx" %>


	<asp:literal id="litMenuHtml" runat="server" />
	<dnn:LOGIN ID="dnnLogin" runat="server" />
	<asp:Literal ID="litMenuTokensSeparator" Visible="False" runat="server" />
	<dnn:USER ID="dnnUser" runat="server" />
	<asp:literal id="litMenuHtmlTail" runat="server" />