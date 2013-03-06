<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fckimagegallery.aspx.vb" Inherits="DotNetNuke.HtmlEditor.FckHtmlEditorProvider.fckimagegallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head" runat="server">
    <title>FCKeditor Image Gallery</title>
    <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />
    <style type="text/css" id="StylePlaceholder" runat="server"></style>
    <asp:placeholder id="CSS" runat="server" />
    <base target="_self" />
</head>
<body id="Body" runat="server">
    <noscript></noscript>
		<script type="text/javascript" language="javascript">
	        function OpenFile( fileUrl ){
	            if (!window.top.opener) {
		            window.returnValue = fileUrl;
		            window.close();	}
	            else {
		            window.top.opener.SetUrl( fileUrl ) ;
		            window.top.close() ;
		            window.top.opener.focus() ;}
            }

            function OpenFlashFile( fileUrl, width, height ){
	            if (!window.top.opener) {
		            window.returnValue = fileUrl;
		            window.close();	}
	            else {
		            window.top.opener.SetUrl( fileUrl ,width, height) ;
		            window.top.close() ;
		            window.top.opener.focus() ;}
            }
		</script>
    <form id="Form" runat="server" enctype="multipart/form-data">
        <asp:PlaceHolder id="phContent" runat="server"></asp:PlaceHolder>
		<input id="ScrollTop" runat="server" name="ScrollTop" type="hidden"/>
		<input id="__dnnVariable" runat="server" name="__dnnVariable" type="hidden"/>
    </form>
</body>
</html>
