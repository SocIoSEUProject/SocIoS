<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fcklinkgallery.aspx.vb" Inherits="DotNetNuke.HtmlEditor.FckHtmlEditorProvider.fcklinkgallery" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head" runat="server">
    <title>FCKeditor Link Gallery</title>
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
    </script>
    <form id="Form" runat="server" enctype="multipart/form-data">
        
		<input id="ScrollTop" runat="server" name="ScrollTop" type="hidden"/>
		<input id="__dnnVariable" runat="server" name="__dnnVariable" type="hidden"/>
		<table id="Table2" class="FCKLinkGalleryContainer">
				<tr>
					<td class="FCKLinkGalleryTitleContainer">
						<asp:Label id="lblTitle" cssclass="Head" runat="server">Link Gallery</asp:Label></td>
				</tr>
				<tr>
					<td class="FCKLinkGalleryLinksContainer">
						<table id="Table1" class="FCKLinkGalleryLinksTable">
							<tr>
								<td class="SubHead" style="width:75">
									<asp:label id="plURL" runat="server" Text="URL:"></asp:label></td>
								<td class="Normal">
									<portal:url id="ctlURL" runat="server" width="250" shownewwindow="True"></portal:url></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:LinkButton id="cmdSelect" resourcekey="cmdSelect" cssclass="CommandButton" runat="server">Select created link</asp:LinkButton></td>
				</tr>
			</table>
    </form>
</body>
</html>
