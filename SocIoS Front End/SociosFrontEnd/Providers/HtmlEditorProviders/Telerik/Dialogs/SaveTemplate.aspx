<%@ Page Language="vb" AutoEventWireup="false" Inherits="DotNetNuke.HtmlEditor.TelerikEditorProvider.Dialogs.SaveTemplate" CodeBehind="SaveTemplate.aspx.vb" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title><%=GetString("lblDialogTitle.Text") %></title>
    <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
    <style type="text/css" id="StylePlaceholder" runat="server"></style>
    <asp:placeholder id="CSS" runat="server" />
    <base target="_self" />
</head>
<body>
<script type="text/javascript">
function getRadWindow()
{
	if (window.radWindow)
		return window.radWindow;
	if (window.frameElement && window.frameElement.radWindow)
		return window.frameElement.radWindow;
	return null;
}

function initDialog()
{
	var htmlText = getRadWindow().ClientParameters;
	var textInput = document.getElementById("<%=htmlText2.ClientID %>");
	if (textInput && htmlText)
		textInput.value = htmlText;
}

if (window.attachEvent)
    window.attachEvent("onload", initDialog);
else if (window.addEventListener)
    window.addEventListener("load", initDialog, false);
</script>
<style>
.FolderListComboItem { white-space:nowrap; }
</style>
    <form id="form2" runat="server">
    <div style="text-align:center">
		<div id="msgSuccess" runat="server" visible="false" style="padding:10px;"></div>
		<div id="msgError" runat="server" visible="false" style="padding:10px;"></div>
		<asp:Button id="cmdClose" runat="server" Visible="false" Text="Close" OnClientClick="getRadWindow().close(); return false;" />
    </div>
    <asp:TextBox id="htmlText2" runat="server" TextMode="MultiLine" style="display:none" />
    <asp:HiddenField id="htmlText" runat="server" value="" />
    <div id="divInputArea" runat="server" style="padding:10px;" class="Normal">
		<div><asp:Label id="lblFolders" runat="server" Text="Folder" /></div>
		<div><telerik:RadComboBox ID="FolderList" runat="server" Width="100%" DropDownCssClass="FolderListComboItem" /></div>
		<div style="margin-top:15px"><asp:Label id="lblFileName" runat="server" Text="File name" /></div>
		<div><asp:TextBox id="FileName" runat="server" MaxLength="25" Width="250px" />.htmtemplate</div>
		<div style="margin-top:15px"><asp:Checkbox id="Overwrite" runat="server" Checked="true" /><asp:Label id="lblOverwrite" AssociatedControlID="Overwrite" runat="server" Text="Overwrite if file exists?" /></div>
		<div style="margin-top:25px"><asp:Button id="cmdSave" runat="server" Text="Save" OnClick="Save_OnClick" />
			&nbsp;&nbsp;
			<asp:Button id="cmdCancel" runat="server" Text="Cancel" OnClientClick="getRadWindow().close(); return false;" />
		</div>
	</div>
    </form>
</body>
</html>
