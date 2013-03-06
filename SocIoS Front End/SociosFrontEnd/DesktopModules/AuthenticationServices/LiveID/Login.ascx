<%@ Control Language="C#" AutoEventWireup="true" Codebehind="LogIn.ascx.cs" Inherits="DotNetNuke.Authentication.LiveID.Login, DotNetNuke.Authentication.LiveID" %>
<table id="tblLogin" runat="Server" cellspacing="0" cellpadding="3" border="0" summary="SignIn Design Table" width="160">
    <tr id="trHelp" runat="server">
        <td><asp:Label ID="lblHelp" runat="Server" cssClass="Normal" resourcekey="Help" /></td>
    </tr>
    <tr>
	    <td><asp:button id="cmdLogin" resourcekey="cmdLogin" cssclass="StandardButton" text="Login" runat="server" /></td>
    </tr>
</table>
<asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="Normal">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/red-error.gif" ImageAlign="Left"  /><asp:Label ID="lblMessage" runat="Server" resourcekey="OpenIDError"/>
    <br />
</asp:Panel>
