<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.ViewEasyDNNGalleryUserUpload, App_Web_userupload.ascx.af09375b" autoeventwireup="true" debug="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register Src="../../controls/LabelControl.ascx" TagName="label" TagPrefix="dnn" %>
<link href="<%=ModulePath%>UserUpload.css" rel="stylesheet" type="text/css" />
<script src="<%=ModulePath%>js/swfobject.js" type="text/javascript"></script>
<script src="<%=ModulePath%>js/jquery.jgrowl.js" type="text/javascript"></script>
<script src="<%=ModulePath%>js/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
<link href="<%=ModulePath%>css/uploadify.css" rel="stylesheet" type="text/css" />
<link href="<%=ModulePath%>css/jquery.jgrowl.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style7
    { 
        width: 388px;
    }
    
    .tablecolumnleft
    {
    	width:150px;
    	
    	}
    	
        .tablecolumnleft2
    {
    	width:150px;
    	
    	}	
    .style10
    {
        width: 345px;
    }
    .style11
    {
        width: 167px;
    }
    .style12
    {
        width: 167px;
        height: 30px;
    }
    .style13
    {
        height: 30px;
    }
    </style>

<script type="text/javascript">
  
//        jQuery.noConflict();
        var theString1 ="<%=ModuleId%>";
        var theString2 ="<%=UserId%>";        
        var theString = "A";
        <%=ViewState["jQuery"]%>(document).ready(function() {        
        <%=ViewState["jQuery"]%>('#<%=GalfileInput.ClientID%>').uploadify({
        'uploader': '<%=ModulePath%>js/uploadify.swf',
        'script': '<%=ModulePath%>UploadImages.ashx',
        'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
        'cancelImg': '<%=ModulePath%>images/cancel.png',
        //'folder': '<%#PortalSettings.HomeDirectoryMapPath%>',      
        //  'auto': true,
        'multi': true,
        'fileDesc': 'Image Files',
        'fileExt': '*.jpg;*.png;*.gif;*.bmp;*.jpeg',
        'queueSizeLimit': 100,        
        'buttonText': '<%=ViewState["SelectImages"]%>',
        
        'onAllComplete': function(event, queueID, fileObj, response, data) {
      <%=ViewState["jQuery"]%>(document).ready(function() { 
         document.getElementById( '<%=btnSaveMultiImageUpload.ClientID%>' ).click();
         });
       },
     
       	'onError': function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.status == 404) {
				alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
				msg = 'Could not find upload script.';
			} else if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});			
			<%=ViewState["jQuery"]%>("#<%=GalfileInput.ClientID%>" + queueID).fadeOut(250, function() { <%=ViewState["jQuery"]%>("#<%=GalfileInput.ClientID%>" + queueID).remove()});
			return false;
		},
			'onComplete': function (a, b ,c, d, e) {
			
			var size = Math.round(c.size/1024);
			
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
				theme: 	'success',
				header: 'Upload Complete',
				life:	3000,
				sticky: false
			});
			
			}
     });     
   });  
</script>

<script type="text/javascript">
  
        //jQuery.noConflict();
        var theString1 ="<%=ModuleId%>";
        var theString2 ="<%=UserId%>";        
        var theString = "A";
        <%=ViewState["jQuery"]%>(document).ready(function() {
        
        <%=ViewState["jQuery"]%>('#<%=MultiAudioFileInput.ClientID%>').uploadify({
        'uploader': '<%=ModulePath%>js/uploadify.swf',
        'script': '<%=ModulePath%>UploadAudio.ashx',
        'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
        'cancelImg': '<%=ModulePath%>images/cancel.png', 
        //'folder': '<%#PortalSettings.HomeDirectoryMapPath%>',      
        //  'auto': true,
        'multi': true,
        'fileDesc': 'Video Files',
        'fileExt': '*.mp3',
        'queueSizeLimit': 100,
        //'sizeLimit': 40000000,
        'buttonText': '<%=ViewState["SelectImages"]%>',
        
        'onAllComplete': function(event, queueID, fileObj, response, data) {
      
         document.getElementById( '<%=btnSaveMultiAudioUpload.ClientID%>' ).click();
       },
     
       	'onError': function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.status == 404) {
				alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
				msg = 'Could not find upload script.';
			} else if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});			
			<%=ViewState["jQuery"]%>("#<%=MultiAudioFileInput.ClientID%>" + queueID).fadeOut(250, function() { <%=ViewState["jQuery"]%>("#<%=MultiAudioFileInput.ClientID%>" + queueID).remove()});
			return false;
		},
			'onComplete': function (a, b ,c, d, e) {
			
			var size = Math.round(c.size/1024);
			
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
				theme: 	'success',
				header: 'Upload Complete',
				life:	3000,
				sticky: false
			});
			
			}
     });     
   });  
</script>

<script type="text/javascript">
  
       // jQuery.noConflict();
        var theString1 ="<%=ModuleId%>";
        var theString2 ="<%=UserId%>";        
        var theString = "A";
        <%=ViewState["jQuery"]%>(document).ready(function() {
        
        <%=ViewState["jQuery"]%>('#<%=MultiVideoFileInput.ClientID%>').uploadify({
        'uploader': '<%=ModulePath%>js/uploadify.swf',
        'script': '<%=ModulePath%>UploadVideos.ashx',
        'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
        'cancelImg': '<%=ModulePath%>images/cancel.png', 
        //'folder': '<%#PortalSettings.HomeDirectoryMapPath%>',      
        //  'auto': true,
        'multi': true,
        'fileDesc': 'Video Files',
        'fileExt': '*.mov;*.mp4;*.flv;*.swf;*.3gp',
        'queueSizeLimit': 100,
        //'sizeLimit': 40000000,
        'buttonText': '<%=ViewState["SelectVideos"]%>',
        
        'onAllComplete': function(event, queueID, fileObj, response, data) {
      
         document.getElementById( '<%=btnSaveMultiVideoUpload.ClientID%>' ).click();
       },
     
       	'onError': function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.status == 404) {
				alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
				msg = 'Could not find upload script.';
			} else if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});			
			<%=ViewState["jQuery"]%>("#<%=MultiVideoFileInput.ClientID%>" + queueID).fadeOut(250, function() { <%=ViewState["jQuery"]%>("#<%=MultiVideoFileInput.ClientID%>" + queueID).remove()});
			return false;
		},
			'onComplete': function (a, b ,c, d, e) {
			
			var size = Math.round(c.size/1024);
			
			<%=ViewState["jQuery"]%>.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
				theme: 	'success',
				header: 'Upload Complete',
				life:	3000,
				sticky: false
			});
			
			}
     });     
   });  
</script>

<div id="UserUpload">
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td align="center">
				<div id="EDGAdminContent">
					<asp:Panel ID="pnlMediaUpload" runat="server" resourcekey="pnlMediaUploadResource1">
						<asp:Panel ID="pnlUserUpload" runat="server" resourcekey="pnlUserUploadResource1">
							&nbsp; &nbsp;
							<table cellpadding="0" cellspacing="0" style="height: 40px; width: 685px;">
								<tr>
									<td align="center">
										<div style="float: left; padding-right: 5px;">
											<asp:Button ID="lbImageUpload" runat="server" OnClick="lbImageUpload_Click" Visible="False"
												CssClass="btnimages" Text="Images" resourcekey="lbImageUploadResource1" />
										</div>
										<div style="float: left; padding-right: 5px;">
											<asp:Button ID="btnVideoFiles" runat="server" OnClick="btnVideoFiles_Click" Visible="False"
												CssClass="btnvideo" Text="Video files" resourcekey="lbUserUploadVideo" />
										</div>
										<div style="float: left; padding-right: 5px;">
											<asp:Button ID="lbVideoUpload" runat="server" OnClick="lbVideoUpload_Click" Visible="False"
												CssClass="btnvideo" Text="Embed video" resourcekey="lbVideoUploadResource1" />
										</div>
										<div style="float: left;">
											<asp:Button ID="lbAudioUpload" runat="server" OnClick="lbAudioUpload_Click" Visible="False"
												CssClass="btnaudio" Text="Audio" resourcekey="lbAudioUploadResource1" />
										</div>
									</td>
								</tr>
							</table>
							<asp:Panel ID="pnlImageUpload" runat="server" Visible="False" resourcekey="pnlImageUploadResource1">
								<div class="imagesuploadbox">
									<div class="uploadimagesboxbgrd">
										<div class="addimagestitlebgrd">
											<asp:Panel ID="pnlImageUploadSelection" runat="server" resourcekey="pnlImageUploadSelectionResource1"
												HorizontalAlign="Center" Width="100%" Height="100px">
												<table align="center">
													<tr>
														<td>
															<asp:LinkButton ID="lbMultiImageUpload" runat="server" OnClick="lbMultiImageUpload_Click"
																resourcekey="lbMultiImageUploadResource1" CssClass="btnmulti">Multi image upload</asp:LinkButton>&nbsp;<asp:LinkButton
																	ID="lbSingleImageUpload" runat="server" OnClick="lbSingleImageUpload_Click" resourcekey="lbSingleImageUploadResource1"
																	CssClass="btnsingle">Single Image</asp:LinkButton>
														</td>
													</tr>
												</table>
											</asp:Panel>
										</div>
										<asp:Panel ID="pnlSingleImageUpload" runat="server" Visible="False" resourcekey="pnlSingleImageUploadResource1">
											<table cellpadding="2" cellspacing="2" style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" align="center" colspan="2">
														<asp:Label ID="lblSingleImageUpload" runat="server" CssClass="subtitleregion" resourcekey="lblSingleImageUploadResource1"
															Text="Single image upload"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblSingleImageUploadTitle" runat="server" HelpKey="lblSingleImageUploadTitle.HelpText"
															HelpText="Enter the image title:" Text="Image title:" ResourceKey="lblSingleImageUploadTitle" />
													</td>
													<td>
														<div id="SIUTitleTextBox" runat="server">
															<asp:TextBox ID="tbImageTitle" runat="server" MaxLength="250" ValidationGroup="Validationg1"
																Width="300px" resourcekey="tbImageTitleResource1" CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														<div id="DivUseFilenameCB" runat="server">
															<asp:CheckBox ID="cbSingleImageUploadFilenameAsTitle" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbIUFilenameAsTitle_CheckedChanged" Text="Use filename as title"
																resourcekey="cbSingleImageUploadFilenameAsTitleResource1" />
														</div>
														<div id="SIUTitleFeomFilename" runat="server" style="display: none">
															<asp:Panel ID="pnlIUFilenameasTitle" runat="server" resourcekey="pnlIUFilenameasTitleResource1">
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbSingleImageUploadRemoveExtenzion" runat="server" Text="Remove extension"
																	resourcekey="cbSingleImageUploadRemoveExtenzionResource1" />
																<br />
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbSingleImageUploadTitleReplaceUnderscore" runat="server" Text="Set this to replace &quot;_&quot; with blank space in title"
																	resourcekey="cbSingleImageUploadTitleReplaceUnderscoreResource1" />
																<br />
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbSinbleImageUploadTitleReplaceMinus" runat="server" Text="Set this to replace &quot;-&quot; with blank space in title"
																	resourcekey="cbSinbleImageUploadTitleReplaceMinusResource1" />
																<asp:RadioButtonList ID="rblSingleImageUploadFilenameTitleOptions" runat="server"
																	resourcekey="rblSingleImageUploadFilenameTitleOptionsResource1">
																	<asp:ListItem Text="Set this to change title to uppercase" Value="AllUppercase" resourcekey="ListItemResource1"></asp:ListItem>
																	<asp:ListItem Text="Set this to change title to lowercase" Value="AllLowercase" resourcekey="ListItemResource2"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase" resourcekey="ListItemResource3"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase" resourcekey="ListItemResource4"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														<div id="DivUseExifMetada" runat="server">
															<asp:CheckBox ID="cbSingleImageUploadTitleUseMetadata" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbSingleImageUploadTitleUseMetadata_CheckedChanged" Text="Use Exif metadata as title"
																resourcekey="cbSingleImageUploadTitleUseMetadataResource1" />
														</div>
														<div id="DivSIUseExifMetadata" runat="server" style="display: none">
															<asp:CheckBoxList ID="cblSingleImageUploadTitleUseMetadataOptions" runat="server"
																resourcekey="cblSingleImageUploadTitleUseMetadataOptionsResource1">
																<asp:ListItem Text="Artist" resourcekey="ListItemResource5"></asp:ListItem>
																<asp:ListItem Text="Copyright" resourcekey="ListItemResource6"></asp:ListItem>
																<asp:ListItem Text="Image description" Value="ImageDescription" resourcekey="ListItemResource7"></asp:ListItem>
																<asp:ListItem Text="Make" resourcekey="ListItemResource8"></asp:ListItem>
																<asp:ListItem Text="Model" resourcekey="ListItemResource9"></asp:ListItem>
																<asp:ListItem Text="Subject location" Value="SubjectLocation" resourcekey="ListItemResource10"></asp:ListItem>
															</asp:CheckBoxList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" rowspan="2" valign="top">
														<dnn:label ID="lblSingleImageUploadDescription" runat="server" HelpKey="lblSingleImageUploadDescription.HelpText"
															HelpText="Enter the image description." Text="Description:" ResourceKey="lblSingleImageUploadDescription" />
														&nbsp;
													</td>
													<td>
														<div id="DivSIDescriptionTextBox" runat="server">
															<asp:TextBox ID="tbImageDescription" runat="server" Height="150px" MaxLength="4000"
																TextMode="MultiLine" Width="300px" resourcekey="tbImageDescriptionResource1"
																CssClass="boxmultiline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div id="DivSIUseMetadataDescription" runat="server">
															<asp:CheckBox ID="cbSingleImageUploadseExifMetadataDescription" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbSingleImageUploadseExifMetadataDescription_CheckedChanged"
																Text="Use Exif metadata as description" resourcekey="cbSingleImageUploadseExifMetadataDescriptionResource1" />
														</div>
														<div id="DivSIUseExifMetadataDescriptionOptions" runat="server" style="display: none">
															<asp:CheckBoxList ID="cbSingleImageUploadseExifMetadataDescriptionOptions" runat="server"
																resourcekey="cbSingleImageUploadseExifMetadataDescriptionOptionsResource1">
																<asp:ListItem Text="Artist" resourcekey="ListItemResource11"></asp:ListItem>
																<asp:ListItem Text="Copyright" resourcekey="ListItemResource12"></asp:ListItem>
																<asp:ListItem Text="Image description" Value="ImageDescription" resourcekey="ListItemResource13"></asp:ListItem>
																<asp:ListItem Text="Make" resourcekey="ListItemResource14"></asp:ListItem>
																<asp:ListItem Text="Model" resourcekey="ListItemResource15"></asp:ListItem>
																<asp:ListItem Text="Subject location" Value="SubjectLocation" resourcekey="ListItemResource16"></asp:ListItem>
															</asp:CheckBoxList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblSingleUmageUploadUrl" runat="server" HelpKey="lblSingleUmageUploadUrl.HelpText"
															HelpText="Enter url for media link:" ResourceKey="lblSingleUmageUploadUrl" Text="Enter url:" />
													</td>
													<td>
														<asp:TextBox ID="tbSIImageUrl" runat="server" Width="300px" resourcekey="tbSIImageUrlResource1"
															CssClass="boxline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblSingleImageUploadSelectFile" runat="server" HelpKey="lblSingleImageUploadSelectFile.HelpText"
															HelpText="Select image file to upload:" Text="Image file to upload:" />
													</td>
													<td class="style7">
														<asp:FileUpload ID="fuImageUpload" runat="server" Height="25px" resourcekey="fuImageUploadResource1"
															BorderStyle="None" CssClass="boxline" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<asp:Label ID="Label2" runat="server" Text="Image Format:" Visible="False" resourcekey="Label2Resource1"></asp:Label>
													</td>
													<td class="style7">
														<asp:Label ID="lblFileName" runat="server" Visible="False" resourcekey="lblFileNameResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td class="style7">
														&nbsp;
														<asp:Label ID="lblMessage" runat="server" resourcekey="lblMessageResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td class="style7">
														<asp:LinkButton ID="btnSingleImageUpload" runat="server" OnClick="btnUploadImage_Click"
															Text="Upload image file" ValidationGroup="vgImageUpload" CausesValidation="False"
															resourcekey="btnSingleImageUploadResource1" CssClass="btnUpload" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td class="style7">
														&nbsp;
														<asp:Label ID="lblSelectedCat2" runat="server" Visible="False" resourcekey="lblSelectedCat2Resource1"></asp:Label>
														<asp:Label ID="lblSelectedDataKey2" runat="server" Visible="False" resourcekey="lblSelectedDataKey2Resource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td class="style7">
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
										<asp:Panel ID="pnlMultiImageUpload" runat="server" Visible="False" resourcekey="pnlMultiImageUploadResource1">
											<table cellpadding="2" cellspacing="2" style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" align="center" colspan="2">
														<asp:Label ID="lblMultimageUpload0" runat="server" CssClass="subtitleregion" resourcekey="lblMultiImageUploadResource1"
															Text="Multi image upload"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<asp:Label ID="lblMultiImageMessage" runat="server" resourcekey="lblMultiImageMessageResource1"></asp:Label>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblMultiImageUploadTitle" runat="server" HelpKey="lblSingleImageUploadTitle.HelpText"
															HelpText="Enter the image title:" Text="Image title:" ResourceKey="lblSingleImageUploadTitle" />
													</td>
													<td>
														<div id="MIUTitleTextBox" runat="server">
															<asp:TextBox ID="tbMultiImageTitle" runat="server" MaxLength="250" ValidationGroup="Validationg1"
																Width="300px" resourcekey="tbMultiImageTitleResource1" CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
													</td>
													<td>
														<div id="MultiDivUseFilenameCB" runat="server">
															<asp:CheckBox ID="cbMultiImageUploadFilenameAsTitle" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbMultiImageUploadFilenameAsTitle_CheckedChanged" Text="Use filename as title"
																resourcekey="cbMultiImageUploadFilenameAsTitleResource1" />
														</div>
														<div id="MIUTitleFeomFilename" runat="server" style="display: none">
															<asp:Panel ID="pnlMIUFilenameasTitle" runat="server" resourcekey="pnlMIUFilenameasTitleResource1">
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbMultiImageUploadRemoveExtenzion" runat="server" Text="Remove extension"
																	resourcekey="cbMultiImageUploadRemoveExtenzionResource1" />
																<br />
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbMultiImageUploadTitleReplaceUnderscore" runat="server" Text="Set this to replace &quot;_&quot; with blank space in title"
																	resourcekey="cbMultiImageUploadTitleReplaceUnderscoreResource1" />
																<br />
																&nbsp;&nbsp;
																<asp:CheckBox ID="cbMultiImageUploadTitleReplaceMinus" runat="server" Text="Set this to replace &quot;-&quot; with blank space in title"
																	resourcekey="cbMultiImageUploadTitleReplaceMinusResource1" />
																<asp:RadioButtonList ID="rblMultiImageUploadFilenameTitleOptions0" runat="server"
																	resourcekey="rblMultiImageUploadFilenameTitleOptions0Resource1">
																	<asp:ListItem Text="Set this to change title to uppercase" Value="AllUppercase" resourcekey="ListItemResource17"></asp:ListItem>
																	<asp:ListItem Text="Set this to change title to lowercase" Value="AllLowercase" resourcekey="ListItemResource18"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase" resourcekey="ListItemResource19"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase" resourcekey="ListItemResource20"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														<div id="MultiDivUseExifMetada" runat="server">
															<asp:CheckBox ID="cbMultiImageUploadTitleUseMetadata" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbMultiImageUploadTitleUseMetadata_CheckedChanged" Text="Use Exif metadata as title"
																resourcekey="cbMultiImageUploadTitleUseMetadataResource1" />
														</div>
														<div id="MultiDivSIUseExifMetadata" runat="server" style="display: none">
															<asp:CheckBoxList ID="cblMultiImageUploadTitleUseMetadataOptions" runat="server"
																resourcekey="cblMultiImageUploadTitleUseMetadataOptionsResource1">
																<asp:ListItem Text="Artist" resourcekey="ListItemResource21"></asp:ListItem>
																<asp:ListItem Text="Copyright" resourcekey="ListItemResource22"></asp:ListItem>
																<asp:ListItem Text="Image description" Value="ImageDescription" resourcekey="ListItemResource23"></asp:ListItem>
																<asp:ListItem Text="Make" resourcekey="ListItemResource24"></asp:ListItem>
																<asp:ListItem Text="Model" resourcekey="ListItemResource25"></asp:ListItem>
																<asp:ListItem Text="Subject location" Value="SubjectLocation" resourcekey="ListItemResource26"></asp:ListItem>
															</asp:CheckBoxList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" rowspan="2" valign="top">
														<dnn:label ID="lblMultiImageUploadDescription" runat="server" HelpKey="lblSingleImageUploadDescription.HelpText"
															HelpText="Enter the image description." Text="Description:" ResourceKey="lblMultiImageUploadDescription" />
														&nbsp;
													</td>
													<td>
														<div id="DivMIDescriptionTextBox" runat="server">
															<asp:TextBox ID="tbMultiImageDescription" runat="server" Height="150px" MaxLength="4000"
																TextMode="MultiLine" Width="300px" resourcekey="tbMultiImageDescriptionResource1"
																CssClass="boxmultiline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div id="DivMIUseMetadataDescription" runat="server">
															<asp:CheckBox ID="cbMultiImageUploadseExifMetadataDescription" runat="server" AutoPostBack="True"
																OnCheckedChanged="cbMultiImageUploadseExifMetadataDescription_CheckedChanged"
																Text="Use Exif metadata as description" resourcekey="cbMultiImageUploadseExifMetadataDescriptionResource1" />
														</div>
														<div id="DivMIUseExifMetadataDescriptionOptions" runat="server" style="display: none">
															<asp:CheckBoxList ID="cbMultiImageUploadseExifMetadataDescriptionOptions" runat="server"
																resourcekey="cbMultiImageUploadseExifMetadataDescriptionOptionsResource1">
																<asp:ListItem Text="Artist" resourcekey="ListItemResource27"></asp:ListItem>
																<asp:ListItem Text="Copyright" resourcekey="ListItemResource28"></asp:ListItem>
																<asp:ListItem Text="Image description" Value="ImageDescription" resourcekey="ListItemResource29"></asp:ListItem>
																<asp:ListItem Text="Make" resourcekey="ListItemResource30"></asp:ListItem>
																<asp:ListItem Text="Model" resourcekey="ListItemResource31"></asp:ListItem>
																<asp:ListItem Text="Subject location" Value="SubjectLocation" resourcekey="ListItemResource32"></asp:ListItem>
															</asp:CheckBoxList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblMultiUmageUploadUrl" runat="server" HelpKey="lblUmageUploadUrl.HelpText"
															HelpText="Enter url for media link:" Text="Enter url:" ResourceKey="lblUmageUploadUrl" />
													</td>
													<td>
														<asp:TextBox ID="tbMIImageUrl" runat="server" Width="300px" resourcekey="tbMIImageUrlResource1"
															CssClass="boxline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														&nbsp;</td>
													<td>
														<asp:Label ID="lblMultiImageUploadMessage" runat="server"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<asp:Label ID="Label6" runat="server" Text="Image Format:" Visible="False" resourcekey="Label6Resource1"></asp:Label>
													</td>
													<td class="style7">
														<asp:Label ID="lblFileName0" runat="server" Visible="False" resourcekey="lblFileName0Resource1"></asp:Label>
														<asp:Label ID="lblPathtoSave" runat="server" Visible="False" resourcekey="lblPathtoSaveResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" colspan="2">
														<table align="center" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
																		<asp:FileUpload ID="GalfileInput" runat="server" resourcekey="GalfileInputResource1"
																			CssClass="boxline" />
																	</div>
																	<div style="display: block; float: left; margin-left: 15px;">
																		<a class="btnUpload" href="javascript:<%=ViewState["jQuery"]%>('#<%=GalfileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});<%=ViewState["jQuery"]%>('#<%=GalfileInput.ClientID%>').uploadifyUpload();">
																			<%=ViewState["startUpload"]%></a> <a class="clearqueue" href="javascript:<%=ViewState["jQuery"]%>('#<%=GalfileInput.ClientID%>').uploadifyClearQueue();">
																				<%=ViewState["ClearQueue"]%>
																			</a>
																	</div>
																	<br />
																	<div style="display: none; line-height: 0pt;">
																		<asp:Button ID="btnSaveMultiImageUpload" runat="server" OnClick="MultiImageUpload"
																			Text="Save" resourcekey="btnSaveMultiImageUploadResource1" />
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft" colspan="2">
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
									</div>
								</div>
							</asp:Panel>
							<asp:Panel ID="pnlVideoUpload" runat="server" Visible="False" resourcekey="pnlVideoUploadResource1">
								<div class="videouploadbox">
									<div class="uploadvideoboxbgrd">
										<asp:Panel ID="pnlFlashEmbeedFlasf" runat="server" resourcekey="pnlFlashEmbeedFlasfResource1">
											<div class="addvideotitlebgrd">
												<table style="padding-top: 30px;" align="center">
													<tr>
														<td align="center">
															<dnn:label ID="lblEmbedVideoTitle" runat="server" CssClass="subtitleregion" HelpKey="lblEmbedVideoTitle.HelpText"
																HelpText="Embed video from various video sites." Text="Embed Video" ResourceKey="lblEmbedVideoTitle.Text" />
														</td>
													</tr>
													<tr>
														<td align="center">
															<asp:RadioButtonList ID="rblEmbedVideoSourceSelect" runat="server" AutoPostBack="True"
																CssClass="subtitleregion" Height="29px" RepeatDirection="Horizontal" Width="415px"
																resourcekey="rblEmbedVideoSourceSelectResource1">
																<asp:ListItem Text="YouTube" resourcekey="ListItemResource33"></asp:ListItem>
																<asp:ListItem Text="Vimeo" resourcekey="ListItemResource34"></asp:ListItem>
																<asp:ListItem Text="Dailymotion" resourcekey="ListItemResource35"></asp:ListItem>
																<asp:ListItem Text="Metacafe" resourcekey="ListItemResource36"></asp:ListItem>
															</asp:RadioButtonList>
															<asp:RequiredFieldValidator ID="rfvEmbedVideoSourceSelect" runat="server" ControlToValidate="rblEmbedVideoSourceSelect"
																ErrorMessage="Please select." ValidationGroup="EmbedVideo" resourcekey="rfvEmbedVideoSourceSelectResource1.ErrorMessage"></asp:RequiredFieldValidator>
														</td>
													</tr>
												</table>
											</div>
											<br />
											<table style="width: 550px; text-align: left;">
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblEmbedVideoCode" runat="server" ControlName="tbFlashEmbedUrl" HelpKey="lblEmbedVideoCode.HelpText"
															HelpText="Enter video embed code:" Text="Embed code:" ResourceKey="lblEmbedVideoCode" />
														<asp:RequiredFieldValidator ID="rfvEmbedVideoCode" runat="server" ControlToValidate="tbFlashEmbedUrl"
															ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
															ValidationGroup="EmbedVideo"></asp:RequiredFieldValidator>
													</td>
													<td>
														<asp:TextBox ID="tbFlashEmbedUrl" runat="server" Height="150px" MaxLength="2500"
															TextMode="MultiLine" ValidationGroup="EmbedVideo" Width="300px" resourcekey="tbFlashEmbedUrlResource1"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblEembedVideoUrl" runat="server" ControlName="tbEmbedShortUrl" HelpKey="lblEembedVideoUrl.HelpText"
															HelpText="Enter video url:" Text="Video url:" ResourceKey="lblEembedVideoUrl" />
														<asp:RequiredFieldValidator ID="rfvEmbedVideoURL" runat="server" ControlToValidate="tbEmbedShortUrl"
															ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoURLResource1.ErrorMessage"
															ValidationGroup="EmbedVideo"></asp:RequiredFieldValidator>
													</td>
													<td>
														<asp:TextBox ID="tbEmbedShortUrl" runat="server" ValidationGroup="EmbedVideo" Width="300px"
															resourcekey="tbEmbedShortUrlResource1" CssClass="boxline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblEmbedVideoEnterTitle" runat="server" ControlName="tbFlashEmbedTitle"
															HelpKey="lblEmbedVideoEnterTitle.HelpText" HelpText="Enter video title." Text="Video title:" />
														<asp:RequiredFieldValidator ID="rfvEmbedVideoTitle" runat="server" ControlToValidate="tbFlashEmbedTitle"
															ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoTitleResource1.ErrorMessage"
															ValidationGroup="EmbedVideo"></asp:RequiredFieldValidator>
													</td>
													<td>
														<asp:TextBox ID="tbFlashEmbedTitle" runat="server" ValidationGroup="EmbedVideo" Width="300px"
															resourcekey="tbFlashEmbedTitleResource1" CssClass="boxline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblEmbedVideoDescription" runat="server" ControlName="tbFlashEmbedDescription"
															HelpKey="lblEmbedVideoDescription.HelpText" HelpText="Enter video description:"
															Text="Description:" ResourceKey="lblEmbedVideoDescription" />
													</td>
													<td>
														<asp:TextBox ID="tbFlashEmbedDescription" runat="server" Height="150px" MaxLength="4000"
															TextMode="MultiLine" Width="300px" resourcekey="tbFlashEmbedDescriptionResource1"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<asp:RadioButtonList ID="rblEmbedVideoThumbnail" runat="server" OnSelectedIndexChanged="rblEmbedVideoThumbnail_SelectedIndexChanged"
															Width="176px" Visible="False" resourcekey="rblEmbedVideoThumbnailResource1">
															<asp:ListItem Selected="True" Text="Auto create thumbnail" Value="Autocreate" resourcekey="ListItemResource37"></asp:ListItem>
															<asp:ListItem Text="Upload thumbnail" Value="Upload" resourcekey="ListItemResource38"></asp:ListItem>
															<asp:ListItem Text="Use standard image" Value="standard" resourcekey="ListItemResource39"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
													<td>
														<div id="divEVEFileUpload" runat="server" style="display: none">
															<asp:FileUpload ID="fuEmbedAddThumb" runat="server" Width="300px" resourcekey="fuEmbedAddThumbResource1" />
															<br />
														</div>
														<div id="divEVESelectThumb" runat="server" style="display: none">
															<asp:DropDownList ID="ddlVUEVSelectThumbnail" runat="server" CausesValidation="True"
																OnLoad="ddlVUEVSelectThumbnail_Load" resourcekey="ddlVUEVSelectThumbnailResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:Label ID="lblEVUploadMessage" runat="server" resourcekey="lblEVUploadMessageResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="btnAddEmbedVideo" runat="server" OnClick="btnAddEmbedFlash_Click"
															Text="Add" ValidationGroup="EmbedVideo" resourcekey="btnAddEmbedVideoResource1"
															CssClass="btnUpload" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
									</div>
								</div>
							</asp:Panel>
							<asp:Panel ID="pnlAudioUpload" runat="server" Visible="False" resourcekey="pnlAudioUploadResource1">
								<div class="audiouploadbox">
									<div class="uploadaudioboxbgrd">
										<div class="addaudiotitlebgrd">
											<asp:Panel ID="pnlAudioUploadSelection" runat="server" resourcekey="pnlAudioUploadSelectionResource1"
												HorizontalAlign="Center" Width="100%" Height="100px">
												<table align="center">
													<tr>
														<td>
															<asp:LinkButton ID="lbMultiAudioUpload" runat="server" CssClass="btnmulti" OnClick="lbMultiAudioUpload_Click1"
																resourcekey="lbMultiAudioUploadResource1">Multi audio upload</asp:LinkButton>&nbsp;
															<asp:LinkButton ID="lbSingleAudioUpload" runat="server" OnClick="lbSingleAudioUpload_Click"
																resourcekey="lbSingleAudioUploadResource1" CssClass="btnsingle">Single audio upload</asp:LinkButton>
															&nbsp;
															<asp:LinkButton ID="lbAmazonAudioUpload" runat="server" OnClick="lbAmazonAudioUpload_Click"
																CssClass="btnsingle">Amazon S3</asp:LinkButton>
														</td>
													</tr>
												</table>
											</asp:Panel>
										</div>
										<asp:Panel ID="pnlAmazonS3AudioUpload" runat="server" Visible="False">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td align="center" colspan="2">
														<asp:Label ID="lblAmazonS3Title0" runat="server" CssClass="subtitleregion" Text="Amazon S3"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style10" colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonUploadAudioURL" runat="server" HelpText="Aamazon S3 audio URL link."
															Text="Aamazon S3 audio URL link:" HelpKey="lblAmazonUploadAudioURL.HelpText"
															ResourceKey="lblAmazonUploadAudioURL.Text" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonAudioURL" runat="server" Font-Size="11px" ValidationGroup="vgAmazonAudioUpload"
															CssClass="boxline" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="rfvAmazonAudioURL" runat="server" ControlToValidate="tbAmazonAudioURL"
															ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
															ValidationGroup="vgAmazonAudioUpload"></asp:RequiredFieldValidator>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonUploadAudioTitle" runat="server" HelpText="Enter the title of audio file:"
															Text="Audio title:" HelpKey="lblAmazonUploadAudioTitle.HelpText" ResourceKey="lblAmazonUploadAudioTitle.Text" />
													</td>
													<td>
														<div id="divAmazonAudioTitle" runat="server">
															<asp:TextBox ID="tbAmazonAudioTitle" runat="server" CssClass="boxline" Width="300px"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbAmazonAudioUploadFilenameAsTitle" runat="server" AutoPostBack="True"
															OnCheckedChanged="cbAmazonAudioUploadFilenameAsTitle_CheckedChanged" resourcekey="cbVideoUploadFilenameAsTitleResource1"
															Text="Use filename as title" />
														<div id="divAmazonAudioFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlVUFilenameasTitle1" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
																<asp:CheckBox ID="cbAmazonAudioUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
																	Text="Remove extension" />
																<br />
																<asp:CheckBox ID="cbAmazonAudioUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
																	Text="Set this to replace &quot;_&quot; with blank space in title" />
																<br />
																<asp:CheckBox ID="cbAmazonAudioUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
																	Text="Set this to replace &quot;-&quot; with blank space in title" />
																<asp:RadioButtonList ID="rblAmazonAudioUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
																	<asp:ListItem resourcekey="ListItemResource79" Text="Set this to change title to uppercase"
																		Value="AllUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource80" Text="Set this to change title to lowercase"
																		Value="AllLowercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource81" Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource82" Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonAudioUploadDescription" runat="server" ControlName="tbFlashDescription"
															HelpText="Enter the audio description:" Text="Description:" HelpKey="lblAmazonAudioUploadDescription.HelpText"
															ResourceKey="lblAmazonAudioUploadDescription.Text" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonAudioDescription" runat="server" Height="150px" MaxLength="4000"
															resourcekey="tbFlashDescriptionResource1" TextMode="MultiLine" Width="300px"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="style231">
														<dnn:label ID="lblAmazonAudioUploadThumbnail" runat="server" HelpText="Upload the thumbnail for audio file or use standard image:"
															Text="Thumbnail:" HelpKey="lblAmazonAudioUploadThumbnail.HelpText" ResourceKey="lblAmazonAudioUploadThumbnail.Text" />
													</td>
													<td class="style232">
														<asp:RadioButtonList ID="rblAmazonAudioThumbnailSelect" runat="server" AutoPostBack="True"
															OnLoad="rblFlashThumbnail_Load" OnSelectedIndexChanged="rblVideoThumbnailSelect_SelectedIndexChanged"
															RepeatDirection="Horizontal" resourcekey="rblVideoThumbnailSelectResource1">
															<asp:ListItem resourcekey="ListItemResource83" Selected="True" Text="Use standard image"
																Value="standard"></asp:ListItem>
															<asp:ListItem resourcekey="ListItemResource84" Text="Upload" Value="Upload"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<div id="divAmazonAudioStandardImage" runat="server">
															<asp:Label ID="lblAmazonAudioUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
																Text="Select standard thumbnail:"></asp:Label>
															&nbsp;<asp:DropDownList ID="ddlAmazobAudioThumbSelect" runat="server" OnLoad="ddlAmazobAudioThumbSelect_Load"
																resourcekey="ddlVUThumbSelectResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style22">
														&nbsp;
													</td>
													<td class="style23">
														<div id="divAmazonAudioUploadThumb" runat="server" style="display: none">
															<asp:Label ID="lblAudioUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
																Text="Select thumbnail to upload:"></asp:Label>
															&nbsp;
															<asp:FileUpload ID="fuAmazonAudioThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
																Width="322px" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:Label ID="lblAmazonAudioUploadMessage" runat="server"></asp:Label>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="btnAmazonUploadAudio" runat="server" CausesValidation="False"
															CssClass="btnUpload" OnClick="btnAmazonUploadAudio_Click" resourcekey="btnUploadAudioResource1"
															Text="Add audio" ValidationGroup="vgAmazonAudioUpload" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
										<asp:Panel ID="pnlSingleAudioUpload" runat="server" Visible="False" resourcekey="pnlSingleAudioUploadResource1">
											<table style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td align="center" colspan="2">
														<asp:Label ID="lblAudioUploadFile" runat="server" CssClass="subtitleregion" Text="Upload audio file"
															resourcekey="lblAudioUploadFileResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style14" colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAudioUploadEnterTitle" runat="server" ControlName="tbAudioTitle"
															HelpKey="lblAudioUploadEnterTitle.HelpText" HelpText="Enter the audio file title:"
															Text="Title:" ResourceKey="lblAudioUploadEnterTitle" />
													</td>
													<td>
														<div id="divAUTitleTextBox" runat="server">
															<asp:TextBox ID="tbAudioTitle" runat="server" Width="300px" resourcekey="tbAudioTitleResource1"
																CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbAudioUploadFilenameAsTitle" runat="server" AutoPostBack="True"
															OnCheckedChanged="cbAudioUploadFilenameAsTitle_CheckedChanged" Text="Use filename as title"
															resourcekey="cbAudioUploadFilenameAsTitleResource1" />
														<div id="divAUFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlAUFilenameasTitle" runat="server" resourcekey="pnlAUFilenameasTitleResource1">
																<asp:CheckBox ID="cbAudioUploadRemoveExtenzion" runat="server" Text="Remove extension"
																	resourcekey="cbAudioUploadRemoveExtenzionResource1" />
																<br />
																<asp:CheckBox ID="cbAudioUploadTitleReplaceUnderscore" runat="server" Text="Set this to replace &quot;_&quot; with blank space in title"
																	resourcekey="cbAudioUploadTitleReplaceUnderscoreResource1" />
																<br />
																<asp:CheckBox ID="cbAudioUploadTitleReplaceMinus" runat="server" Text="Set this to replace &quot;-&quot; with blank space in title"
																	resourcekey="cbAudioUploadTitleReplaceMinusResource1" />
																<asp:RadioButtonList ID="rblAudioUploadTitleOptions" runat="server" resourcekey="rblAudioUploadTitleOptionsResource1">
																	<asp:ListItem Text="Set this to change title to uppercase" Value="AllUppercase" resourcekey="ListItemResource40"></asp:ListItem>
																	<asp:ListItem Text="Set this to change title to lowercase" Value="AllLowercase" resourcekey="ListItemResource41"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase" resourcekey="ListItemResource42"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase" resourcekey="ListItemResource43"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAudioUploadDescription" runat="server" ControlName="tbAudioDescription"
															HelpKey="lblAudioUploadDescription.HelpText" HelpText="Enter the audio file description:"
															Text="Description:" ResourceKey="lblAudioUploadDescription" />
													</td>
													<td>
														<asp:TextBox ID="tbAudioDescription" runat="server" Height="100px" MaxLength="4000"
															TextMode="MultiLine" Width="300px" resourcekey="tbAudioDescriptionResource1"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAudioUploadThumbnailSelect" runat="server" HelpKey="lblAudioUploadThumbnailSelect.HelpText"
															HelpText="Upload the thumbnail for video file or use standard image:" Text="Thumbnail:"
															ResourceKey="lblAudioUploadThumbnailSelect" />
													</td>
													<td>
														<asp:RadioButtonList ID="rblAudioUploadSelectThumbSource" runat="server" AutoPostBack="True"
															OnSelectedIndexChanged="rblAudioUploadSelectThumbSource_SelectedIndexChanged"
															RepeatDirection="Horizontal" resourcekey="rblAudioUploadSelectThumbSourceResource1">
															<asp:ListItem Selected="True" Text="Use standard image" Value="standard" resourcekey="ListItemResource44"></asp:ListItem>
															<asp:ListItem Text="Upload" Value="upload" resourcekey="ListItemResource45"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<div id="divAUSelectStantard" runat="server">
															<asp:DropDownList ID="ddlAUSelectSTandThumb" runat="server" OnLoad="ddlAUSelectSTandThumb_Load"
																resourcekey="ddlAUSelectSTandThumbResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<div id="divAUUploadThumb" runat="server" style="display: none">
															<asp:FileUpload ID="fuAudioUpload" runat="server" resourcekey="fuAudioUploadResource1"
																CssClass="boxline" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAudioUploadSelectFile" runat="server" HelpKey="lblAudioUploadSelectFile.HelpText"
															HelpText="Select audio file to upload:" Text="Select file:" ResourceKey="lblAudioUploadSelectFile" />
													</td>
													<td>
														<asp:FileUpload ID="fuAudio" runat="server" Width="300px" resourcekey="fuAudioResource1"
															CssClass="boxline" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:Label ID="lblAudioMessage" runat="server" resourcekey="lblAudioMessageResource1"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="btnUploadAudio" runat="server" OnClick="btnUploadAudio_Click"
															Text="Upload" CausesValidation="False" resourcekey="btnUploadAudioResource1"
															CssClass="btnUpload" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
										<asp:Panel ID="pnlMultiAudioUpload" runat="server" Visible="False" resourcekey="pnlMultiAudioUploadResource1">
											<table style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td colspan="2" align="center">
														<asp:Label ID="lblMultiAudioUploadFile" runat="server" CssClass="subtitleregion"
															Text="Upload multiple audio file" resourcekey="lblMultiAudioUploadFile"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style14">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft">
														<dnn:label ID="lblMultiAudioUploadEnterTitle" runat="server" ControlName="tbAudioTitle"
															HelpKey="lblAudioUploadEnterTitle.HelpText" HelpText="Enter the audio file title:"
															Text="Title:" ResourceKey="lblMultiAudioUploadEnterTitle" />
													</td>
													<td>
														<div id="divMultiAUTitleTextBox" runat="server">
															<asp:TextBox ID="tbMultiAudioTitle" runat="server" Width="300px" resourcekey="tbMultiAudioTitleResource1"
																CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style14">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbMultiAudioUploadFilenameAsTitle" runat="server" Text="Use filename as title"
															AutoPostBack="True" OnCheckedChanged="cbMultiAudioUploadFilenameAsTitle_CheckedChanged"
															resourcekey="cbMultiAudioUploadFilenameAsTitleResource1" />
														<div id="divMultiAUFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlAUFilenameasTitle0" runat="server" resourcekey="pnlAUFilenameasTitle0Resource1">
																<asp:CheckBox ID="cbMultiAudioUploadRemoveExtenzion" runat="server" Text="Remove extension"
																	resourcekey="cbMultiAudioUploadRemoveExtenzionResource1" />
																<br />
																<asp:CheckBox ID="cbMultiAudioUploadTitleReplaceUnderscore" runat="server" Text="Set this to replace &quot;_&quot; with blank space in title"
																	resourcekey="cbMultiAudioUploadTitleReplaceUnderscoreResource1" />
																<br />
																<asp:CheckBox ID="cbMultiAudioUploadTitleReplaceMinus" runat="server" Text="Set this to replace &quot;-&quot; with blank space in title"
																	resourcekey="cbMultiAudioUploadTitleReplaceMinusResource1" />
																<asp:RadioButtonList ID="rblMultiAudioUploadTitleOptions" runat="server" resourcekey="rblMultiAudioUploadTitleOptionsResource1">
																	<asp:ListItem Text="Set this to change title to uppercase" Value="AllUppercase" resourcekey="ListItemResource46"></asp:ListItem>
																	<asp:ListItem Text="Set this to change title to lowercase" Value="AllLowercase" resourcekey="ListItemResource47"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase" resourcekey="ListItemResource48"></asp:ListItem>
																	<asp:ListItem Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase" resourcekey="ListItemResource49"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style14">
														<dnn:label ID="lblMultiAudioUploadDescription" runat="server" ControlName="tbAudioDescription"
															HelpKey="lblAudioUploadDescription.HelpText" HelpText="Enter the audio file description:"
															Text="Description:" />
													</td>
													<td>
														<asp:TextBox ID="tbMultiAudioDescription" runat="server" Height="100px" MaxLength="4000"
															TextMode="MultiLine" Width="300px" resourcekey="tbMultiAudioDescriptionResource1"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="style14">
														<dnn:label ID="lblMultiAudioUploadThumbnailSelect" runat="server" HelpKey="lblAudioUploadThumbnailSelect.HelpText"
															HelpText="Upload the thumbnail for video file or use standard image:" Text="Thumbnail:" />
													</td>
													<td>
														<asp:RadioButtonList ID="rblMultiAudioUploadSelectThumbSource" runat="server" RepeatDirection="Horizontal"
															AutoPostBack="True" OnSelectedIndexChanged="rblMultiAudioUploadSelectThumbSource_SelectedIndexChanged"
															resourcekey="rblMultiAudioUploadSelectThumbSourceResource1">
															<asp:ListItem Selected="True" Text="Use standard image" Value="standard" resourcekey="ListItemResource50"></asp:ListItem>
															<asp:ListItem Text="Upload" Value="upload" resourcekey="ListItemResource51"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="style14">
														&nbsp;
													</td>
													<td>
														<div id="divMultiAUSelectStantard" runat="server">
															<asp:DropDownList ID="ddlMultiAUSelectSTandThumb" runat="server" OnLoad="ddlMultiAUSelectSTandThumb_Load"
																resourcekey="ddlMultiAUSelectSTandThumbResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style14">
														&nbsp;
													</td>
													<td>
														<div id="divMultiAUUploadThumb" runat="server" style="display: none">
															<asp:FileUpload ID="fuMultiAudioUpload" runat="server" resourcekey="fuMultiAudioUploadResource1" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="style14">
														&nbsp;
													</td>
													<td>
														<asp:Label ID="lblMultiAudioMessage" runat="server" Visible="False"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style14" colspan="2">
														<table align="center" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
																		<asp:FileUpload ID="MultiAudioFileInput" runat="server" EnableTheming="True" resourcekey="MultiAudioFileInputResource1" />
																	</div>
																	<div style="display: block; float: left; margin-left: 15px;">
																		<a class="btnUpload" href="javascript:<%=ViewState["jQuery"]%>('#<%=MultiAudioFileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});<%=ViewState["jQuery"]%>('#<%=MultiAudioFileInput.ClientID%>').uploadifyUpload();">
																			<%=ViewState["startUpload"]%></a> <a class="clearqueue" href="javascript:<%=ViewState["jQuery"]%>('#<%=MultiAudioFileInput.ClientID%>').uploadifyClearQueue();">
																				<%=ViewState["ClearQueue"]%></a>
																	</div>
																	<br />
																	<div style="display: none; line-height: 0pt;">
																		<asp:Button ID="btnSaveMultiAudioUpload" runat="server" OnClick="MultiAudioUpload"
																			Text="Save" resourcekey="btnSaveMultiAudioUploadResource1" />
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td class="style14" colspan="2">
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
									</div>
								</div>
							</asp:Panel>
							<asp:Panel ID="pnlVideoFiles" runat="server" Visible="False">
								<div class="videouploadbox">
									<div class="uploadvideoboxbgrd">
										<asp:Panel ID="pnlVideoUploadSelection" runat="server" Height="100px" HorizontalAlign="Center"
											resourcekey="pnlAudioUploadSelectionResource1" Width="100%">
											<div class="addvideotitlebgrd">
												<table align="center">
													<tr>
														<td style="width: 120px;">
														</td>
														<td>
															<asp:LinkButton ID="lbMultiVideoUpload" runat="server" CssClass="btnmulti" OnClick="lbMultiVideoUpload_Click"
																Width="100px" resourcekey="lbUserUploadMultiVideoUpload">Multi video upload</asp:LinkButton>
															&nbsp;
															<asp:LinkButton ID="lbSingleVideoUpload" runat="server" CssClass="btnsingle" OnClick="lbSingleVideoUpload_Click"
																Width="100px" resourcekey="lbUserUploadSingleVideoUpload">Single video upload</asp:LinkButton>
															&nbsp;<asp:LinkButton ID="lbAmazonS3VideoUpload" runat="server" CssClass="btnsingle"
																OnClick="lbAmazonS3VideoUpload_Click" resourcekey="lbUserUploadAmazonS3">Amazon S3</asp:LinkButton>
														</td>
													</tr>
												</table>
											</div>
										</asp:Panel>
										<asp:Panel ID="pnlAmazonS3VideoAupload" runat="server" Visible="False">
											<table style="width: 550px; text-align: left;">
												<tr>
													<td align="center" colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td align="center" colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td align="center" colspan="2">
														<asp:Label ID="lblAmazonS3Title" runat="server" CssClass="subtitleregion" resourcekey="lblAmazonS3Title"
															Text="Amazon S3"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style10" colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonUploadVideoURL" runat="server" HelpKey="lblAmazonUploadVideoURL.HelpText"
															HelpText="Aamazon S3 video URL link." ResourceKey="lblAmazonUploadVideoURL" Text="Aamazon S3 video URL link:" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonVideoURL" runat="server" ValidationGroup="vgAmazonVideoUpload"
															Width="350px" CssClass="boxline" Font-Size="11px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="rfvAmazonVideoURL" runat="server" ControlToValidate="tbAmazonVideoURL"
															ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
															ValidationGroup="vgAmazonVideoUpload"></asp:RequiredFieldValidator>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonUploadVideoTitle" runat="server" HelpKey="lblAmazonUploadVideoTitle.HelpText"
															HelpText="Enter the title of video file:" ResourceKey="lblAmazonUploadVideoTitle"
															Text="Video title:" />
													</td>
													<td>
														<div id="divAmazonVideoTitle" runat="server">
															<asp:TextBox ID="tbAmazonVideoTitle" runat="server" resourcekey="tbFlashTitleResource1"
																Width="300px" CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbAmazonUploadFilenameAsTitle" runat="server" OnCheckedChanged="cbAmazonUploadFilenameAsTitle_CheckedChanged"
															resourcekey="cbAmazonVideoUploadFilenameAsTitleResource1" Text="Use filename as title"
															AutoPostBack="True" />
														<div id="divAmazonFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlVUFilenameasTitle0" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
																<asp:CheckBox ID="cbAmazonVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbAmazonVideoUploadTitleRemoveExtenzionResource1"
																	Text="Remove extension" />
																<br />
																<asp:CheckBox ID="cbAmazonVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbAmazonVideoUploadTitleReplaceUnderscoreResource1"
																	Text="Set this to replace &quot;_&quot; with blank space in title" />
																<br />
																<asp:CheckBox ID="cbAmazonVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbAmazonVideoUploadTitleReplaceMinusResource1"
																	Text="Set this to replace &quot;-&quot; with blank space in title" />
																<asp:RadioButtonList ID="rblAmazonVideoUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
																	<asp:ListItem resourcekey="AmazonListItemResource79" Text="Set this to change title to uppercase"
																		Value="AllUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="AmazonListItemResource80" Text="Set this to change title to lowercase"
																		Value="AllLowercase"></asp:ListItem>
																	<asp:ListItem resourcekey="AmazonListItemResource81" Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="AmazonListItemResource82" Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonVideoUploadDescription" runat="server" HelpKey="lblAmazonVideoUploadDescription.HelpText"
															HelpText="Enter the video description:" ResourceKey="lblAmazonVideoUploadDescription"
															Text="Description:" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonVideoDescription" runat="server" Height="150px" MaxLength="4000"
															resourcekey="tbFlashDescriptionResource1" TextMode="MultiLine" Width="300px"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonUploadWidth" runat="server" ControlName="tbFlashWidth" HelpKey="lblAmazonVideoUploadWidth.HelpText"
															HelpText="Enter the video width to be used displaying video:" ResourceKey="lblAmazonVideoUploadWidth"
															Text="Video width:" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonVideoWidth" runat="server" resourcekey="tbFlashWidthResource1"
															ValidationGroup="vgAmazonVideoUpload" Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvAmazonVideoUploadWidth" runat="server" ControlToValidate="tbAmazonVideoWidth"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgAmazonVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblAmazonVideoUploadHeight" runat="server" ControlName="tbFlashHeight"
															HelpKey="lblAmazonVideoUploadHeight.HelpText" HelpText="Enter the video height to be used when displaying video:"
															ResourceKey="lblAmazonVideoUploadHeight" Text="Video height:" />
													</td>
													<td>
														<asp:TextBox ID="tbAmazonVideoHeight" runat="server" resourcekey="tbFlashHeightResource1"
															ValidationGroup="vgAmazonVideoUpload" Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvAmazonVideoUploadHeight" runat="server" ControlToValidate="tbAmazonVideoHeight"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgAmazonVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="style231">
														<dnn:label ID="lblAmazonVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
															HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
															Text="Thumbnail:" />
													</td>
													<td class="style232">
														<asp:RadioButtonList ID="rblAmazonVideoThumbnailSelect" runat="server" OnLoad="rblFlashThumbnail_Load"
															OnSelectedIndexChanged="rblAmazonVideoThumbnailSelect_SelectedIndexChanged" RepeatDirection="Horizontal"
															resourcekey="rblVideoThumbnailSelectResource1" AutoPostBack="True">
															<asp:ListItem resourcekey="AmazonListItemResource83" Selected="True" Text="Use standard image"
																Value="standard"></asp:ListItem>
															<asp:ListItem resourcekey="AmazonListItemResource84" Text="Upload" Value="Upload"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<div id="divAmazonStandardImage" runat="server">
															<asp:Label ID="lblAmazonVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
																Text="Select standard thumbnail:"></asp:Label>
															&nbsp;<asp:DropDownList ID="ddlAmazobVideoThumbSelect" runat="server" OnLoad="ddlAmazobVideoThumbSelect_Load"
																resourcekey="ddlVUThumbSelectResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style22">
														&nbsp;
													</td>
													<td class="style23">
														<div id="divAmazonUploadThumb" runat="server" style="display: none">
															<asp:Label ID="lblVideoUploadSelectThumbnailToUpload0" runat="server" resourcekey="lblAmazonVideoUploadSelectThumbnailToUploadResource1"
																Text="Select thumbnail to upload:"></asp:Label>
															&nbsp;
															<asp:FileUpload ID="fuAmazonThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
																Width="322px" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:Label ID="lblAmazonUploadMessage" runat="server"></asp:Label>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="btnAmazonVideoUpload" runat="server" OnClick="btnAmazonVideoUpload_Click"
															resourcekey="btnAmazonVideoUpload" Text="Upload" ValidationGroup="vgAmazonVideoUpload"
															CssClass="btnUpload" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
										<br />
										<asp:Panel ID="pnlSingleVideoUpload" runat="server" Visible="False">
											<table style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td align="center" colspan="2">
														<asp:Label ID="lblSingleVideoUploadTitle" resourcekey="lblSingleVideoUploadTitle"
															runat="server" Text="Single video upload" CssClass="subtitleregion"></asp:Label>
														<br />
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style11">
														<dnn:label ID="lblVideoUploadVideoTitle" runat="server" HelpKey="lblVideoUploadVideoTitle.HelpText"
															HelpText="Enter the title of video file:" ResourceKey="lblVideoUploadVideoTitle"
															Text="Video title:" />
													</td>
													<td>
														<div id="divVideoTitle" runat="server">
															<asp:TextBox ID="tbFlashTitle" runat="server" resourcekey="tbFlashTitleResource1"
																Width="300px" CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbVideoUploadFilenameAsTitle" runat="server" AutoPostBack="True"
															OnCheckedChanged="cbvUFilenameAsTitle_CheckedChanged" resourcekey="cbVideoUploadFilenameAsTitleResource1"
															Text="Use filename as title" />
														<div id="divVUFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlVUFilenameasTitle" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
																<asp:CheckBox ID="cbVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
																	Text="Remove extension" />
																<br />
																<asp:CheckBox ID="cbVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
																	Text="Set this to replace &quot;_&quot; with blank space in title" />
																<br />
																<asp:CheckBox ID="cbVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
																	Text="Set this to replace &quot;-&quot; with blank space in title" />
																<asp:RadioButtonList ID="rblVideoUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
																	<asp:ListItem resourcekey="ListItemResource79" Text="Set this to change title to uppercase"
																		Value="AllUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource80" Text="Set this to change title to lowercase"
																		Value="AllLowercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource81" Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource82" Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style11">
														<dnn:label ID="lblVideoUploadDescription" runat="server" ControlName="tbFlashDescription"
															HelpKey="lblVideoUploadDescription.HelpText" HelpText="Enter the video description:"
															ResourceKey="lblVideoUploadDescription" Text="Description:" />
													</td>
													<td>
														<asp:TextBox ID="tbFlashDescription" runat="server" Height="150px" MaxLength="4000"
															resourcekey="tbFlashDescriptionResource1" TextMode="MultiLine" Width="300px"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="style11">
														<dnn:label ID="lblVideoUploadWidth" runat="server" ControlName="tbFlashWidth" HelpKey="lblVideoUploadWidth.HelpText"
															HelpText="Enter the video width to be used displaying video:" ResourceKey="lblVideoUploadWidth"
															Text="Video width:" />
													</td>
													<td>
														<asp:TextBox ID="tbFlashWidth" runat="server" resourcekey="tbFlashWidthResource1"
															ValidationGroup="vgVideoUpload" Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvVideoUploadWidth" runat="server" ControlToValidate="tbFlashWidth"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="style11">
														<dnn:label ID="lblVideoUploadHeight" runat="server" ControlName="tbFlashHeight" HelpKey="lblVideoUploadHeight.HelpText"
															HelpText="Enter the video height to be used when displaying video:" ResourceKey="lblVideoUploadHeight"
															Text="Video height:" />
													</td>
													<td>
														<asp:TextBox ID="tbFlashHeight" runat="server" resourcekey="tbFlashHeightResource1"
															Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvVideoUploadheight" runat="server" ControlToValidate="tbFlashHeight"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="style11">
														<dnn:label ID="lblVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
															HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
															Text="Thumbnail:" />
													</td>
													<td class="style232">
														<asp:RadioButtonList ID="rblVideoThumbnailSelect" runat="server" AutoPostBack="True"
															OnLoad="rblFlashThumbnail_Load" OnSelectedIndexChanged="rblVideoThumbnailSelect_SelectedIndexChanged"
															RepeatDirection="Horizontal" resourcekey="rblVideoThumbnailSelectResource1">
															<asp:ListItem resourcekey="ListItemResource83" Selected="True" Text="Use standard image"
																Value="standard"></asp:ListItem>
															<asp:ListItem resourcekey="ListItemResource84" Text="Upload" Value="Upload"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														<div id="divVUStandardImage" runat="server">
															<asp:Label ID="lblVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
																Text="Select standard thumbnail:"></asp:Label>
															&nbsp;<asp:DropDownList ID="ddlVUThumbSelect" runat="server" OnLoad="dllVUThumbSelect_Load"
																resourcekey="ddlVUThumbSelectResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td class="style23">
														<div id="divVUUploadThumb" runat="server" style="display: none">
															<asp:Label ID="lblVideoUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
																Text="Select thumbnail to upload:"></asp:Label>
															&nbsp;
															<asp:FileUpload ID="fuFlashThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
																Width="322px" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="style12">
														<dnn:label ID="lblVideoUploadFileSelect" runat="server" HelpKey="lblVideoUploadFileSelect.HelpText"
															HelpText="Select the file to upload:" ResourceKey="lblVideoUploadFileSelect"
															Text="Please select the file to upload:" />
														&nbsp;
													</td>
													<td class="style13">
														<asp:FileUpload ID="fuFlash" runat="server" resourcekey="fuFlashResource1" Width="300px" />
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style12">
														&nbsp;
													</td>
													<td class="style13">
														<asp:Label ID="lblVideoMessage" runat="server"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="btnVideoUpload" runat="server" OnClick="btnVideoUpload_Click"
															resourcekey="btnVideoUploadResource1" Text="Upload" ValidationGroup="vgVideoUpload"
															CssClass="btnUpload" />
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style11">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
											</table>
										</asp:Panel>
										<asp:Panel ID="pnlMultiVideoUpload" runat="server">
											<table style="width: 550px; text-align: left;">
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td colspan="2" align="center">
														<asp:Label ID="lblMultiVideoUploadTitle" resourcekey="lblMultiVideoUploadTitle" runat="server"
															Text="Multi video upload" CssClass="subtitleregion"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblMultiVideoUploadVideoTitle" runat="server" HelpKey="lblVideoUploadVideoTitle.HelpText"
															HelpText="Enter the title of video file:" ResourceKey="lblVideoUploadVideoTitle"
															Text="Video title:" />
													</td>
													<td>
														<div id="divMultiVideoTitle" runat="server">
															<asp:TextBox ID="tbMultiFlashTitle" runat="server" resourcekey="tbFlashTitleResource1"
																Width="300px" CssClass="boxline"></asp:TextBox>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<asp:CheckBox ID="cbMultiVideoUploadFilenameAsTitle" runat="server" OnCheckedChanged="cbMultiVideoUploadFilenameAsTitle_CheckedChanged"
															resourcekey="cbVideoUploadFilenameAsTitleResource1" Text="Use filename as title"
															AutoPostBack="True" />
														<div id="divMultiVUFilenameAsTitle" runat="server" style="display: none">
															<asp:Panel ID="pnlMultiVUFilenameasTitle" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
																<asp:CheckBox ID="cbMultiVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
																	Text="Remove extension" />
																<br />
																<asp:CheckBox ID="cbMultiVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
																	Text="Set this to replace &quot;_&quot; with blank space in title" />
																<br />
																<asp:CheckBox ID="cbMultiVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
																	Text="Set this to replace &quot;-&quot; with blank space in title" />
																<asp:RadioButtonList ID="rblMulitVideoUploadTitleOptionsList" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
																	<asp:ListItem resourcekey="ListItemResource79" Text="Set this to change title to uppercase"
																		Value="AllUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource80" Text="Set this to change title to lowercase"
																		Value="AllLowercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource81" Text="Set this to change first letter of every 
                                        word in title to uppercase" Value="AllFirstUppercase"></asp:ListItem>
																	<asp:ListItem resourcekey="ListItemResource82" Text="Set this to change first letter of title to 
                                        uppercase" Value="FirstUppercase"></asp:ListItem>
																</asp:RadioButtonList>
															</asp:Panel>
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblMultiVideoUploadDescription" runat="server" ControlName="tbFlashDescription"
															HelpKey="lblVideoUploadDescription.HelpText" HelpText="Enter the video description:"
															ResourceKey="lblVideoUploadDescription" Text="Description:" />
													</td>
													<td>
														<asp:TextBox ID="tbMultiFlashDescription" runat="server" Height="150px" MaxLength="4000"
															resourcekey="tbFlashDescriptionResource1" TextMode="MultiLine" Width="300px"
															CssClass="boxmultiline"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblMultiVideoUploadWidth" runat="server" ControlName="tbFlashWidth"
															HelpKey="lblVideoUploadWidth.HelpText" HelpText="Enter the video width to be used displaying video:"
															ResourceKey="lblVideoUploadWidth" Text="Video width:" />
													</td>
													<td>
														<asp:TextBox ID="tbMultiFlashWidth" runat="server" resourcekey="tbFlashWidthResource1"
															ValidationGroup="vgVideoUpload" Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvMultiVideoUploadWidth" runat="server" ControlToValidate="tbMultiFlashWidth"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:label ID="lblMultiVideoUploadHeight" runat="server" ControlName="tbFlashHeight"
															HelpKey="lblVideoUploadHeight.HelpText" HelpText="Enter the video height to be used when displaying video:"
															ResourceKey="lblVideoUploadHeight" Text="Video height:" />
													</td>
													<td>
														<asp:TextBox ID="tbMultiFlashHeight" runat="server" resourcekey="tbFlashHeightResource1"
															Width="50px" CssClass="boxline"></asp:TextBox>
														<asp:CompareValidator ID="cvMultiVideoUploadheight" runat="server" ControlToValidate="tbMultiFlashHeight"
															ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
															Type="Integer" ValidationGroup="vgVideoUpload"></asp:CompareValidator>
													</td>
												</tr>
												<tr>
													<td class="style231">
														<dnn:label ID="lblMultiVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
															HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
															Text="Thumbnail:" />
													</td>
													<td class="style232">
														<asp:RadioButtonList ID="rblMultiVideoThumbnailSelect" runat="server" OnLoad="rblFlashThumbnail_Load"
															OnSelectedIndexChanged="rblMultiVideoThumbnailSelect_SelectedIndexChanged" RepeatDirection="Horizontal"
															resourcekey="rblVideoThumbnailSelectResource1" AutoPostBack="True">
															<asp:ListItem resourcekey="ListItemResource83" Selected="True" Text="Use standard image"
																Value="standard"></asp:ListItem>
															<asp:ListItem resourcekey="ListItemResource84" Text="Upload" Value="Upload"></asp:ListItem>
														</asp:RadioButtonList>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														<div id="divMultiVUStandardImage" runat="server">
															<asp:Label ID="lblMultiVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
																Text="Select standard thumbnail:"></asp:Label>
															&nbsp;<asp:DropDownList ID="ddlMultiVUThumbSelect" runat="server" OnLoad="ddlMultiVUThumbSelect_Load"
																resourcekey="ddlVUThumbSelectResource1">
															</asp:DropDownList>
														</div>
													</td>
												</tr>
												<tr>
													<td class="style22">
														&nbsp;
													</td>
													<td class="style23">
														<div id="divMultiVUUploadThumb" runat="server" style="display: none">
															<asp:Label ID="lblMultiVideoUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
																Text="Select thumbnail to upload:"></asp:Label>
															&nbsp;
															<asp:FileUpload ID="fuMultiFlashThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
																Width="322px" />
														</div>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														&nbsp;
													</td>
													<td>
														&nbsp;
														<asp:Label ID="lblMultiVideoUploadMessage" runat="server"></asp:Label>
													</td>
												</tr>
											</table>
											<br />
											<table align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
															<asp:FileUpload ID="MultiVideoFileInput" runat="server" EnableTheming="True" />
														</div>
														<div style="display: block; float: left; margin-left: 15px;">
															<a class="btnUpload" href="javascript:<%=ViewState["jQuery"]%>('#<%=MultiVideoFileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});<%=ViewState["jQuery"]%>('#<%=MultiVideoFileInput.ClientID%>').uploadifyUpload();">
																<%=ViewState["startUpload"]%></a> <a href="javascript:<%=ViewState["jQuery"]%>('#<%=MultiVideoFileInput.ClientID%>').uploadifyClearQueue();">
																	<%=ViewState["ClearQueue"]%></a>
														</div>
														<div style="display: none; line-height: 0pt;">
															<asp:Button ID="btnSaveMultiVideoUpload" runat="server" OnClick="MultiVideoUpload"
																Text="Save" />
														</div>
													</td>
												</tr>
											</table>
											<br />
											<br />
										</asp:Panel>
									</div>
								</div>
							</asp:Panel>
							<br />
							<br />
							<div style="text-align: right">
								<asp:LinkButton ID="btnCloseUpload2" runat="server" OnClick="btnCloseUpload_Click"
									Text="Close Upload" CssClass="btnclose23" resourcekey="btnCloseUpload2Resource1" /></div>
						</asp:Panel>
					</asp:Panel>
				</div>
			</td>
		</tr>
	</table>
</div>
