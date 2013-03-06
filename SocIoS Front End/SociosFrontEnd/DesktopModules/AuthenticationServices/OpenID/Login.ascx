<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="DotNetNuke.Authentication.OpenID.Login, DotNetNuke.Authentication.OpenID" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register Assembly="DotNetOpenId" Namespace="DotNetOpenId" TagPrefix="openid" %>
<table cellspacing="0" cellpadding="3" border="0" summary="SignIn Design Table" width="160">
    <tr id="trHelp" runat="server">
        <td><asp:Label ID="lblHelp" runat="Server" cssClass="normal" resourcekey="Help" /></td>
    </tr>
	<tr>
		<td class="SubHead"><dnn:label id="plOpenID" controlname="txtUsername" runat="server" text="UserName:" /></td>
	</tr>
	<tr>
		<td>
		    <input name="openid_identifier" value="<%=this.LastUsedId%>" Class="NormalTextBox" style="background: url(http://openid.net/login-bg.gif) no-repeat;   background-color: #fff;   background-position: 0 50%;   color: #000;   padding-left: 18px;" />
		</td>
	</tr>
    <tr>
	    <td><asp:button id="cmdLogin" resourcekey="cmdLogin" cssclass="StandardButton" text="Login" runat="server" /></td>
    </tr>
    <tr id="trExample" runat="server" >
	    <td align="left"><asp:Label ID="lblExample" runat="Server" cssClass="NormalBold" resourcekey="Example" /></td>
    </tr>
    <tr id="trRegister" runat="server" >
	    <td><dnn:CommandButton id="cmdRegister" ImageUrl="~/images/register.gif" resourcekey="cmdRegister" cssclass="CommandButton" text="Login" runat="server" /></td>
    </tr>
</table>
