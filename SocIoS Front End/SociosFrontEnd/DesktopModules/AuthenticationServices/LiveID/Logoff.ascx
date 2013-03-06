<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Logoff.ascx.cs" Inherits="DotNetNuke.Authentication.LiveID.Logoff, DotNetNuke.Authentication.LiveID" %>
<table cellspacing="0" cellpadding="3" border="0" summary="SignIn Design Table" width="160">
    <tr>
        <td><asp:Label ID="lblHelp" runat="Server" cssClass="Normal" resourcekey="Help" /></td>
    </tr>
    <tr>
        <td><asp:CheckBox ID="chkLiveID" runat="Server" CssClass="NormalTextBox" resourcekey="LiveID" Checked="true" /></td>
    </tr>
    <tr>
	    <td align="center"><asp:button id="cmdLogoff" resourcekey="cmdLogoff" cssclass="StandardButton" text="Logoff" runat="server" /></td>
    </tr>
</table>