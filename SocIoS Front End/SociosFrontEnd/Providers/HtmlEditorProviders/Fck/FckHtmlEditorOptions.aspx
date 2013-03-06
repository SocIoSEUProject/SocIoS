<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FckHtmlEditorOptions.aspx.vb" Inherits="DotNetNuke.HtmlEditor.FckHtmlEditorProvider.FckHtmlEditorOptions" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Common.Controls" Assembly="DotNetNuke" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title>FCKeditor Options</title>
    <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
    <style type="text/css" id="StylePlaceholder" runat="server"></style>
    <asp:placeholder id="CSS" runat="server" />
    <base target="_self" />
</head>
<body id="Body" runat="server" >
    <noscript></noscript>       
	<form id="Form" runat="server" enctype="multipart/form-data">
        <asp:PlaceHolder id="phControls" runat="server"></asp:PlaceHolder>
		<input id="ScrollTop" runat="server" name="ScrollTop" type="hidden"/>
		<input id="__dnnVariable" runat="server" name="__dnnVariable" type="hidden"/>
    </form>
</body>
</html>
