<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.Upload, App_Web_upload.ascx.af09375b" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<style type="text/css">
	.tablecolumnleft2
	{
	}
	.tablecolumnleft
	{
	}
	.style1
	{
		width: 100%;
		height: 104px;
	}
	.style2
	{
	}
	.style3
	{
		width: 147px;
	}
	.style4
	{
		width: 165px;
	}
	.style6
	{
		width: 146px;
	}
	.style7
	{
		width: 388px;
	}
	.style9
	{
		width: 189px;
	}
	.style10
	{
		width: 345px;
	}
	.style11
	{
		width: 206px;
	}
	.style12
	{
		width: 149px;
		height: 23px;
	}
	.style13
	{
		height: 23px;
	}
	.style14
	{
	}
	.style16
	{
		width: 236px;
	}
	.style17
	{
		width: 237px;
	}
	.style18
	{
		width: 250px;
	}
	.style19
	{
		width: 33px;
	}
	.style20
	{
		width: 167px;
	}
</style>
<script type="text/javascript">
function SelectAllMedia()
{
	<%=ViewState["jQuery"]%>('#<%=gvGalleryImages.ClientID%> span.EGMediaSelect > input').each(function (){
		this.checked=true;
	});
}

function DeSelectAllMedia()
{
	<%=ViewState["jQuery"]%>('#<%=gvGalleryImages.ClientID%> span.EGMediaSelect > input').each(function (){
		this.checked=false;
	});
}
<!--
 
function ProvjeriRBL3(rbl3,div3,div4)
{
var rdolist2 = document.getElementById(rbl3);
var myitems2 = rdolist2.getElementsByTagName('input');
var elementRef8 = document.getElementById(div3);
var elementRef9 = document.getElementById(div4);
if (myitems2[0].checked)
{
	elementRef8.style.display ='none';
	elementRef9.style.display ='none';
}
if (myitems2[1].checked)
{
	elementRef8.style.display ='block';
	elementRef9.style.display ='none';
}
if (myitems2[2].checked)
{
	elementRef8.style.display ='none';
	elementRef9.style.display ='block';
}
}

function ProvjeriRBL3Met2(rbl3,div3,div4)
{
var rdolist2 = document.getElementById(rbl3);
var myitems2 = rdolist2.getElementsByTagName('input');
var elementRef8 = document.getElementById(div3);
var elementRef9 = document.getElementById(div4);
if (myitems2[2].checked)
{
	elementRef8.style.display ='none';
	elementRef9.style.display ='none';
}
if (myitems2[0].checked)
{
	elementRef8.style.display ='block';
	elementRef9.style.display ='none';
}
if (myitems2[1].checked)
{
	elementRef8.style.display ='none';
	elementRef9.style.display ='block';
}
}

function Sakrij(sto)
{
 var elementRef = document.getElementById(sto);
 elementRef.style.display = (elementRef.style.display == 'none') ? 'block' : 'none'; 
}
function SakrijDva(sto,sto2)
{
 var elementRef2 = document.getElementById(sto);
 var elementRef3 = document.getElementById(sto2);
 elementRef2.style.display = (elementRef2.style.display == 'none') ? 'block' : 'none'; 
 elementRef3.style.display = (elementRef3.style.display == 'none') ? 'block' : 'none'; 
}

function SakrijTri(sto,sto2,sto3)
{
 var elementRef2 = document.getElementById(sto);
 var elementRef3 = document.getElementById(sto2);
 var elementRef4 = document.getElementById(sto3);
 elementRef2.style.display = (elementRef2.style.display == 'none') ? 'block' : 'none'; 
 elementRef3.style.display = (elementRef3.style.display == 'none') ? 'block' : 'none'; 
 elementRef4.style.display = (elementRef4.style.display == 'none') ? 'block' : 'none'; 
}

function ProvjeriRBL(rbl,div1,div2)
{
var rdolist = document.getElementById(rbl);
var myitems = rdolist.getElementsByTagName('input');
var elementRef6 = document.getElementById(div1);
var elementRef7 = document.getElementById(div2);
if (myitems[0].checked)
{
	elementRef6.style.display ='block';
	elementRef7.style.display ='none';
}
else
{
	elementRef6.style.display ='none';
	elementRef7.style.display ='block';
}
}


 -->
</script>
<script type="text/javascript">
 
	if ('<%=ViewState["jQuery"]%>'=='jQuery')
	{
		jQuery.noConflict();
	}
	var theString1 ="<%=ModuleId%>";
	var theString2 ="<%=UserId%>";
	var theString = "A";
	<%=ViewState["jQuery"]%>(document).ready(function($) {
	if (<%=gms.EnableCommunityMode.ToString().ToLower()%>)
			{
		$('#<%=lbSocialSecurityGroups.ClientID %>').dropdownchecklist({
			forceMultiple: true,
			minWidth: 180,
			width: 180,
			emptyText: '<span class="empty">None</span>'
		});
		$('#<%=lbGallerySocialSecurityGroups.ClientID %>').dropdownchecklist({
			forceMultiple: true,
			minWidth: 180,
			width: 180,
			emptyText: '<span class="empty">None</span>'
		});
		}
		$('#<%=GalfileInput.ClientID%>').uploadify({
		'uploader': '<%=ModulePath%>js/uploadify.swf',
		'script': '<%=ModulePath%>UploadImages.ashx?tabid=<%=TabId%>',
		'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
		'cancelImg': '<%=ModulePath%>images/cancel.png',
		'multi': true,
		'fileDesc': 'Image Files',
		'fileExt': '*.jpg;*.png;*.gif;*.bmp;*.jpeg',
		'queueSizeLimit': 100,
		'buttonText': '<%=ViewState["SelectImages"]%>',		
		'onAllComplete': function(event, queueID, fileObj, response, data) {
			document.getElementById( '<%=btnSaveMultiImageUpload.ClientID%>' ).click();
		},	 
		'onError': function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.status == 404) {
				alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
				msg = 'Could not find upload script.';
			}
			else if
			 (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			$.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
				});
			<%=ViewState["jQuery"]%>("#<%=GalfileInput.ClientID%>" + queueID).fadeOut(250, function() { <%=ViewState["jQuery"]%>("#<%=GalfileInput.ClientID%>" + queueID).remove()});
			return false;
			},
		'onComplete': function (a, b ,c, d, e) {
			var size = Math.round(c.size/1024);
			$.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
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
var theString1 ="<%=ModuleId%>";
var theString2 ="<%=UserId%>";
var theString = "A";
<%=ViewState["jQuery"]%>(document).ready(function($) {
	$('#<%=MultiVideoFileInput.ClientID%>').uploadify({
		'uploader': '<%=ModulePath%>js/uploadify.swf',
		'script': '<%=ModulePath%>UploadVideos.ashx?tabid=<%=TabId%>',
		'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
		'cancelImg': '<%=ModulePath%>images/cancel.png', 
		'multi': true,
		'fileDesc': 'Video Files',
		'fileExt': '*.mov;*.mp4;*.flv;*.swf;*.3gp',
		'queueSizeLimit': 100,
		'buttonText': '<%=ViewState["SelectVideos"]%>',
		'onAllComplete': function(event, queueID, fileObj, response, data) {
		 document.getElementById( '<%=btnSaveMultiVideoUpload.ClientID%>' ).click();
	 },
	'onError': function (event, queueID ,fileObj, errorObj) {
		var msg;
		if (errorObj.status == 404) {
			alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
			msg = 'Could not find upload script.';
			} 
			else if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			$.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});
			$("#<%=MultiVideoFileInput.ClientID%>" + queueID).fadeOut(250, function() { <%=ViewState["jQuery"]%>("#<%=MultiVideoFileInput.ClientID%>" + queueID).remove()});
			return false;
		},
	'onComplete': function (a, b ,c, d, e) {
	var size = Math.round(c.size/1024);
	$.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
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
	var theString1 ="<%=ModuleId%>";
	var theString2 ="<%=UserId%>";
	var theString = "A";
		<%=ViewState["jQuery"]%>(document).ready(function($) {
		$('#<%=MultiAudioFileInput.ClientID%>').uploadify({
			'uploader': '<%=ModulePath%>js/uploadify.swf',
			'script': '<%=ModulePath%>UploadAudio.ashx?tabid=<%=TabId%>',
			'scriptData': { 'id':theString1, 'foo':theString,'id2':theString2},
			'cancelImg': '<%=ModulePath%>images/cancel.png', 
			'multi': true,
			'fileDesc': 'Video Files',
			'fileExt': '*.mp3',
			'queueSizeLimit': 100,
			'buttonText': '<%=ViewState["SelectAudio"]%>',
			'onAllComplete': function(event, queueID, fileObj, response, data) {
				document.getElementById( '<%=btnSaveMultiAudioUpload.ClientID%>' ).click();
			},
			'onError': function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.status == 404) {
				alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
				msg = 'Could not find upload script.';
				}
			else if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.status;
			else if (errorObj.type ==="File Size")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.text;
			$.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});			
			$("#<%=MultiAudioFileInput.ClientID%>" + queueID).fadeOut(250, function() { $("#<%=MultiAudioFileInput.ClientID%>" + queueID).remove()});
			return false;
		},
			'onComplete': function (a, b ,c, d, e) {
				var size = Math.round(c.size/1024);
			$.jGrowl('<p></p>'+c.name+' - '+size+'KB', {
				theme: 	'success',
				header: 'Upload Complete',
				life:	3000,
				sticky: false
			});
			}
		});
	});
</script>
<div id="mainUpload" runat="server">
	<div id="divUpload">
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">
					<div id="EDGAdminContent">
						<p style="width: 800px">
							<asp:label id="lblPortalID" runat="server" visible="False" resourcekey="lblPortalIDResource1">
							</asp:label>
							<asp:objectdatasource id="odsCategories" typename="DataAcess" runat="server" selectmethod="GetCategoriesByUser"
								updatemethod="UpdateCategory" deletemethod="DeleteCategory">
								<deleteparameters>
									<asp:Parameter Name="CategoryID" Type="Int32" />
								</deleteparameters>
								<updateparameters>
									<asp:Parameter Name="CategoryID" Type="Int32" />
									<asp:Parameter Name="CategoryName" Type="String" />
									<asp:Parameter Name="CategoryDescription" Type="String" />
									<asp:Parameter Name="Position" Type="Int32" />
								</updateparameters>
								<selectparameters>
									<asp:ControlParameter ControlID="lblPortalID" Name="PortalID" PropertyName="Text"
										Type="Int32" />
									<asp:Parameter Name="UserID" Type="Int32" />
									<asp:Parameter Name="byUser" Type="Boolean" />
								</selectparameters>
							</asp:objectdatasource>
							<asp:objectdatasource id="odsMoveGalleries" typename="DataAcess" runat="server" selectmethod="GetGaleries"
								deletemethod="DeleteGallery" updatemethod="UpdateGalley">
								<deleteparameters>
									<asp:Parameter Name="GalleryID" Type="Int32" />
								</deleteparameters>
								<updateparameters>
									<asp:Parameter Name="GalleryID" Type="Int32" />
									<asp:Parameter Name="GalleryName" Type="String" />
									<asp:Parameter Name="Position" Type="Int32" />
								</updateparameters>
								<selectparameters>
									<asp:ControlParameter ControlID="ddlMoveCategory" Name="CategoryID" PropertyName="SelectedValue"
										Type="Int32" />
								</selectparameters>
							</asp:objectdatasource>
							<asp:objectdatasource id="odsGalleries" typename="DataAcess" runat="server" selectmethod="GetGaleriesByUserID"
								deletemethod="DeleteGallery" updatemethod="UpdateGalley">
								<deleteparameters>
									<asp:Parameter Name="GalleryID" Type="Int32" />
								</deleteparameters>
								<updateparameters>
									<asp:Parameter Name="GalleryID" Type="Int32" />
									<asp:Parameter Name="GalleryName" Type="String" />
									<asp:Parameter Name="GalleryDescription" Type="String" />
									<asp:Parameter Name="Position" Type="Int32" />
								</updateparameters>
								<selectparameters>
									<asp:Parameter Name="CategoryID" Type="Int32" />
									<asp:Parameter Name="UserID" Type="Int32" />
									<asp:Parameter Name="byUser" Type="Boolean" />
								</selectparameters>
							</asp:objectdatasource>
							<asp:objectdatasource id="odsTopGalleris" typename="DataAcess" runat="server" selectmethod="GetTop5GaleriesByUserID"
								oldvaluesparameterformatstring="original_{0}">
								<selectparameters>
									<asp:Parameter Name="PortalID" Type="Int32" />
									<asp:ControlParameter ControlID="ddlNumLastGals" Name="NumberOfGals2" PropertyName="SelectedValue"
										Type="Int32" />
									<asp:Parameter Name="UserID" Type="Int32" />
									<asp:Parameter Name="byUserID" Type="Boolean" />
								</selectparameters>
							</asp:objectdatasource>
							<asp:hiddenfield id="hfGalleriesByUserID" runat="server" />
							<asp:objectdatasource id="odsCommunityCategories" typename="DataAcess" runat="server"
								selectmethod="GetCommunityModeCategories" onselecting="odsCommunityCategories_Selecting">
								<selectparameters>
									<asp:Parameter Name="PortalID" Type="Int32" />
								</selectparameters>
							</asp:objectdatasource>
							<asp:hiddenfield id="hfCategoriesByUserID" runat="server" />
							<%--<asp:Panel ID="pnlDemoVersion" runat="server" Border="0" 
						resourcekey="pnlLastModGalsResource1" Width="850px">
							<div align="right" style="padding-bottom: 10px;">
							</div>
							<div class="lastmodbox">
								<div class="lastmodtitle">
									<asp:Label ID="lblDemoVersion" runat="server" CssClass="lastaddedtitle" 
										Text="This is &lt;b&gt;Demo version&lt;/b&gt;"></asp:Label>
								</div>
								<table>
									<tr>
										<td>
											<asp:Label ID="lblDemoMessage" runat="server" Font-Bold="True" 
												Text="You can create only one category and two galleries. You can upload up to 5 media files into each gallery."></asp:Label>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td colspan="2">
											&nbsp;</td>
									</tr>
								</table>
							</div>
					</asp:Panel>--%>
							<asp:panel id="pnlLastModGals" runat="server" border="0" width="850px" resourcekey="pnlLastModGalsResource1">
								<div align="right" style="padding-bottom: 10px;">
									<asp:button id="btnSaveClose" resourcekey="btnSaveClose" runat="server" onclick="btnCloseMM_Click"
										text="Save & Close" style="margin-right: 5px;" cssclass="btnsaveclose" />
									<asp:button id="btnClose" runat="server" onclick="btnCloseMM_Click" text="Close"
										resourcekey="btnCloseResource1" cssclass="btnclose" /></div>
								<div class="lastmodbox">
									<div class="lastmodtitle">
										<asp:label id="lblLastModifiedGalleriesTitle" resourcekey="lblLastModifiedGalleriesTitle"
											runat="server" text="&lt;b&gt;Last&lt;/b&gt; added/modified galleries" cssclass="lastaddedtitle">
										</asp:label>
									</div>
									<table>
										<tr>
											<td>
												<dnn:Label ID="lblNumberOfLastModifiedGalleriesPerPage" runat="server" ResourceKey="lblNumberOfLastModifiedGalleriesPerPage"
													ControlName="ddlNumOfCatSelect" HelpText="Select the number of galleris to display on one page:"
													Text="Select the number of galleries per page:" CssClass="labeltext" HelpKey="lblNumberOfLastModifiedGalleriesPerPage.HelpText" />
											</td>
											<td>
												<asp:dropdownlist id="ddlNumLastGals" runat="server" autopostback="True" onselectedindexchanged="ddlNumLastGals_SelectedIndexChanged"
													cssclass="ddlpageitems" resourcekey="ddlNumLastGalsResource1">
													<asp:listitem text="5" resourcekey="ListItemResource1">
													</asp:listitem>
													<asp:listitem text="10" resourcekey="ListItemResource2">
													</asp:listitem>
													<asp:listitem text="15" resourcekey="ListItemResource3">
													</asp:listitem>
													<asp:listitem text="20" resourcekey="ListItemResource4">
													</asp:listitem>
													<asp:listitem text="30" resourcekey="ListItemResource5">
													</asp:listitem>
												</asp:dropdownlist>
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<asp:datalist id="dlLastModified" runat="server" datasourceid="odsTopGalleris" repeatcolumns="2"
													datakeyfield="GalleryID" onitemcommand="dlLastModified_ItemCommand" cellpadding="2"
													cellspacing="2" horizontalalign="Left" resourcekey="dlLastModifiedResource1">
													<itemstyle horizontalalign="Left" />
													<itemtemplate>
														<asp:LinkButton ID="LinkButton9" runat="server" CommandArgument="<%# ((DataListItem)Container).ItemIndex %>"
															CommandName="Open" CssClass="lastmodgallery" resourcekey="LinkButton9Resource1"><%#Eval("GalleryName")%></asp:LinkButton>
														<asp:Label ID="Label5" runat="server" Text='<%# Eval("DateLastModified","({0})") %>'
															CssClass="labeltext" resourcekey="Label5Resource1"></asp:Label>
													</itemtemplate>
												</asp:datalist>
											</td>
										</tr>
									</table>
								</div>
							</asp:panel>
							<asp:panel id="pnlCategories" runat="server" bordercolor="#EFEFEF" width="850px"
								horizontalalign="Center" resourcekey="pnlCategoriesResource1">
								<div class="headercat">
									<div class="bordercattop">
									</div>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td>
															&nbsp;<table cellpadding="0" cellspacing="0" class="style1">
																<tr>
																	<td align="right" class="style2">
																		<img alt="Manage Category" src="<%=ModulePath%>images/categorythumb.png" style="width: 88px;
																			height: 90px" />
																	</td>
																	<td align="left">
																		<asp:label id="lblManageCategoriesTitle" resourcekey="lblManageCategoriesTitle" runat="server"
																			cssclass="Categorytitle" text="Manage &lt;/br&gt; categories"></asp:label>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td style="padding-left: 80px;">
															<div>
																<asp:label id="lblNumOfCats" runat="server" text="Number of categories:" cssclass="textnumbercategory"
																	resourcekey="lblNumOfCatsResource1"></asp:label>
																<asp:label id="lblCategoriesNumber" runat="server" cssclass="textnumbercategory"
																	resourcekey="lblCategoriesNumberResource1"></asp:label></div>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table align="center" cellpadding="0" cellspacing="0" class="addcategorybox">
													<tr>
														<td bgcolor="#E2F0F7">
															<div class="boxaddcategorytop" align="left">
																<asp:label id="lblAddNewCategory" resourcekey="lblAddNewCategory" runat="server"
																	cssclass="AddNewCategory" text="Add NEW Category"></asp:label>
															</div>
															<table cellpadding="0" cellspacing="0" align="center" width="280px" style="margin-top: 5px;
																margin-bottom: 5px;">
																<tr>
																	<td>
																		<dnn:Label ID="lblEnterNewCategoryName" runat="server" ControlName="tbCatName" HelpText="Enter the name for the new category:"
																			Text="Category name:" ResourceKey="lblEnterNewCategoryName" CssClass="tooltip"
																			HelpKey="lblEnterNewCategoryName.HelpText" />
																	</td>
																	<td rowspan="4">
																		<asp:button id="btnAddcat" runat="server" cssclass="addcategorybutton" onclick="btnAddcat_Click"
																			validationgroup="vgAddcategory" tooltip="Add Category" resourcekey="btnAddcatResource1" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<asp:textbox id="tbCatName" runat="server" cssclass="box1" resourcekey="tbCatNameResource1">
																		</asp:textbox>
																		<div>
																			<asp:requiredfieldvalidator id="rfvNewCategoryName" runat="server" controltovalidate="tbCatName"
																				display="Dynamic" errormessage="Category name is required." validationgroup="vgAddcategory"
																				cssclass="requestfield" resourcekey="rfvNewCategoryNameResource1.ErrorMessage">
																			</asp:requiredfieldvalidator></div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblEnterNewCategoryDescription" runat="server" ControlName="tbCatDesc"
																			HelpText="Enter the description for the new category:" Text="Description:" ResourceKey="lblEnterNewCategoryDescription"
																			CssClass="tooltip" HelpKey="lblEnterNewCategoryDescription.HelpText" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<asp:textbox id="tbCatDesc" runat="server" cssclass="box1" resourcekey="tbCatDescResource1">
																		</asp:textbox>
																	</td>
																</tr>
															</table>
															<div class="boxaddcategorybot">
															</div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<div class="bordercatbot">
									</div>
								</div>
								<div class="categorylistbox">
									<asp:label id="lblCategoriesStatusMessage" runat="server" resourcekey="lblCategoriesStatusMessageResource1">
									</asp:label>
									<asp:gridview id="gvCategories" runat="server" align="center" allowpaging="True"
										allowsorting="True" autogeneratecolumns="False" border="0" cellpadding="4" cssclass="categoryliststylebox"
										datakeynames="CategoryID" datasourceid="odsCategories" enableviewstate="False"
										forecolor="Black" gridlines="None" ondatabound="gvCategories_DataBound" onrowcommand="gvCategories_RowCommand"
										onrowcreated="gvCategories_RowCreated" onrowdeleted="gvCategories_RowDeleted"
										onrowupdated="gvCategories_RowUpdated" onselectedindexchanged="gvCategories_SelectedIndexChanged"
										showfooter="True" width="800px" onrowdeleting="gvCategories_RowDeleting" resourcekey="gvCategoriesResource1"
										onrowdatabound="gvCategories_RowDataBound">
										<alternatingrowstyle cssclass="categorygrid1" />
										<columns>
											<asp:TemplateField HeaderText="Actions" meta:resourcekey="Actions" ShowHeader="False">
												<EditItemTemplate>
													<asp:LinkButton ID="lbCategoriesUpdate" runat="server" CommandName="Update" CssClass="categorycontrollink"
														Text="Update" resourcekey="lbCategoriesUpdateResource1"></asp:LinkButton>
													&nbsp;<asp:LinkButton ID="lbCategoriesCancel" runat="server" CausesValidation="False"
														CommandName="Cancel" CssClass="categorycontrollinklight" Text="Cancel" resourcekey="lbCategoriesCancelResource1"></asp:LinkButton>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:LinkButton ID="lbCategoriesSelect" runat="server" CausesValidation="False" CommandName="Select"
														CssClass="categorycontrollink" Text="Open" resourcekey="lbCategoriesSelectResource1"></asp:LinkButton>
													&nbsp;
													<asp:LinkButton ID="lbCategoriesEdit" runat="server" CausesValidation="False" CommandName="Edit"
														CssClass="categorycontrollinklight" Text="Edit" resourcekey="lbCategoriesEditResource1"></asp:LinkButton>
													&nbsp;&nbsp;<asp:LinkButton ID="lbCategoriesDelete" runat="server" CommandName="Delete"
														CssClass="categorycontrollinklight" OnClientClick="return confirm('Are you sure you want to delete this category?');"
														Text="Delete" resourcekey="lbCategoriesDeleteResource1"></asp:LinkButton>
													<br />
													<asp:LinkButton ID="lbCategoryContentLocalization" runat="server" CausesValidation="False"
														CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="ContentLocalization"
														CssClass="contentcategorycontrollinklight" Text="Content Localization" resourcekey="lbMediaContentLocalization"
														Visible='<%#Convert.ToBoolean(ViewState["EnableLocalization"])%>'></asp:LinkButton>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" Width="180px" />
											</asp:TemplateField>
											<asp:BoundField DataField="CategoryID" HeaderText="ID" meta:resourcekey="ID" ReadOnly="True"
												SortExpression="CategoryID">
												<ControlStyle ForeColor="Black" />
												<ItemStyle HorizontalAlign="Center" />
											</asp:BoundField>
											<asp:TemplateField HeaderText="Name" meta:resourcekey="Name" SortExpression="CategoryName">
												<EditItemTemplate>
													<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CategoryName") %>' resourcekey="TextBox2Resource1"></asp:TextBox>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:LinkButton ID="lbCategoriesOpenCategoryName" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
														CommandName="Open" CssClass="categorycontrollinklight" Text='<%# Bind("CategoryName") %>'
														resourcekey="lbCategoriesOpenCategoryNameResource1"></asp:LinkButton>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
											<asp:BoundField DataField="CategoryDescription" HeaderText="Description" meta:resourcekey="Description">
												<ItemStyle HorizontalAlign="Center" />
											</asp:BoundField>
											<asp:TemplateField HeaderText="No. of Galleries" meta:resourcekey="NumberOfGalleries">
												<EditItemTemplate>
													<asp:Label ID="lblCategoryNumberItemsEdit" runat="server" Text='<%# Bind("CategoryID") %>'
														resourcekey="lblCategoryNumberItemsEditResource1"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblCategoryNumberItems" runat="server" Text='<%# Bind("CategoryID") %>'
														resourcekey="lblCategoryNumberItemsResource1"></asp:Label>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Position" meta:resourcekey="Position" SortExpression="Position">
												<EditItemTemplate>
													<asp:TextBox ID="tbCategoryPosition" runat="server" CssClass="boxposition" Text='<%# Bind("Position") %>'
														resourcekey="tbCategoryPositionResource1"></asp:TextBox>
												</EditItemTemplate>
												<FooterTemplate>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td>
																<asp:Button ID="btnCategorySavePosition" runat="server" CssClass="btnsavepositioncat"
																	OnClick="btnCatSavePosition_Click" Text="Save Positions" resourcekey="btnCategorySavePositionResource1" />
															</td>
															<td>
																<asp:ImageButton ID="btnRearrangeCategoryPositions" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/rearrangecat.png"
																	OnClick="btnGalPosRearange_Click" ToolTip="Rearrange category positions numbers."
																	resourcekey="btnRearrangeCategoryPositionsResource1" />
															</td>
														</tr>
													</table>
												</FooterTemplate>
												<ItemTemplate>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td style="padding-right: 10px;">
																<div>
																	<asp:TextBox ID="tbCategoryPosition" runat="server" CssClass="boxposition" Text='<%# Bind("Position") %>'
																		resourcekey="tbCategoryPositionResource2"></asp:TextBox>
																</div>
															</td>
															<td>
																<asp:ImageButton ID="imgCategoryUp" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
																	CommandName="Up" ImageUrl="~/images/action_up.gif" Text="Up" resourcekey="imgCategoryUpResource1" />
								</div>
								<div>
									<asp:imagebutton id="imgCategoryDown" runat="server" causesvalidation="False" commandargument="<%# ((GridViewRow) Container).RowIndex %>"
										commandname="Down" imageurl="~/images/action_down.gif" text="Down" resourcekey="imgCategoryDownResource1" />
								</div>
				</td>
			</tr>
		</table>
		</ItemTemplate>
		<footerstyle horizontalalign="Center" />
		<itemstyle horizontalalign="Center" />
		</asp:TemplateField> </Columns>
		<footerstyle cssclass="categorygrid1" />
		<headerstyle cssclass="categoryboxheaderbgrd" font-names="arial" font-size="14px"
			forecolor="White" verticalalign="Middle" />
		<pagerstyle backcolor="#E3E1E1" cssclass="pagecat" forecolor="#556C20" height="45px"
			horizontalalign="Center" />
		<rowstyle cssclass="categorygrid2" />
		<selectedrowstyle cssclass="categorygridselected" />
		</asp:GridView>
		<table cellpadding="2" cellspacing="2" align="center">
			<tr>
				<td>
					&nbsp;&nbsp;<dnn:Label ID="lblNumberofCatlSelect" runat="server" ControlName="ddlNumOfCatSelect"
						HelpText="Select the number of categories to display on one page:" Text="Categories per page:"
						ResourceKey="lblNumberofCatlSelect" CssClass="labeltext" HelpKey="lblNumberofCatlSelect.HelpText" />
				</td>
				<td>
					<asp:dropdownlist id="ddlNumOfCatSelect" runat="server" autopostback="True" onselectedindexchanged="ddlNumOfCatSelect_SelectedIndexChanged"
						cssclass="ddlpageitems" resourcekey="ddlNumOfCatSelectResource1">
						<asp:listitem text="10" resourcekey="ListItemResource6">
						</asp:listitem>
						<asp:listitem text="30" resourcekey="ListItemResource7">
						</asp:listitem>
						<asp:listitem text="50" resourcekey="ListItemResource8">
						</asp:listitem>
					</asp:dropdownlist>
				</td>
			</tr>
		</table>
		&nbsp;</div>
	</asp:Panel>
	<asp:panel id="pnlCategoryContentLocalization" runat="server" visible="False" bordercolor="#EFEFEF"
		borderstyle="none" width="850px">
		<div class="contentcategories">
			<table width="750px">
				<tr>
					<td class="style2" align="center" colspan="2">
						&nbsp;
						<asp:label id="lblCategoryContentLocalization" runat="server" cssclass="contenttitle"
							font-bold="True" resourcekey="lblCategoryContentLocalization" text="Content localization">
						</asp:label>
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style12" align="left">
						<asp:label id="lblContentLocalizationCategoryTitle" resourcekey="lblContentLocalizationCategoryTitle"
							runat="server" text="Category title:" font-bold="True"></asp:label>
					</td>
					<td class="style13" align="left">
						<asp:label id="lblContentLocalizationCategoryTitleOriginal" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						<asp:label id="lblContentLocalizationCategoryDescription" resourcekey="lblContentLocalizationCategoryDescription"
							runat="server" text="Category description:" font-bold="True"></asp:label>
					</td>
					<td align="left">
						<asp:label id="lblContentLocalizationCategoryDescriptionOriginal" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td align="left">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" class="style2">
						<asp:label id="lblDefPortalLang" runat="server" text="Default portal language:"></asp:label>
					</td>
					<td align="left">
						<asp:label id="lblDefaultPortalLangugage" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="left" class="style2">
						<asp:label id="lblCategoryLocalizationLocalizedLanguages" runat="server" resourcekey="lblCategoryLocalizationLocalizedLanguages"
							text="Localized languages:"></asp:label>
					</td>
					<td align="left">
						<asp:label id="lblCategoryLocalizationLocalizedLanguagesList" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td align="left">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" class="style2">
						<dnn:Label ID="lblCategoryLocalizationSelectLanguage" runat="server" HelpKey="lblCategoryLocalizationSelectLanguage.HelpText"
							HelpText="Select the languange you want to edit. There is no need to edit dafault language."
							ResourceKey="lblCategoryLocalizationSelectLanguage" Text="Select language:" />
					</td>
					<td align="left">
						<asp:dropdownlist id="ddlCategoryLocalizationSelectLanguage" runat="server" autopostback="True"
							onselectedindexchanged="ddlCategoryLocalizationSelectLanguage_SelectedIndexChanged">
							<asp:listitem value="0">Select language</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						<dnn:Label ID="lblCategoryLocalizationTitle" runat="server" HelpKey="lblCategoryLocalizationTitle.HelpText"
							HelpText="Title:" ResourceKey="lblCategoryLocalizationTitle" Text="Title:" />
					</td>
					<td align="left">
						<asp:textbox id="tbCategoryLocalizationTitle" runat="server" style="width: 250px">
						</asp:textbox>
						&nbsp;
						<asp:button id="btnCategoryLocalizationCopyDefault" runat="server" onclick="btnCategoryLocalizationCopyDefault_Click"
							resourcekey="btnCategoryLocalizationCopyDefault" text="Copy default values" />
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						<dnn:Label ID="lblCategoryLocalizationDescription" runat="server" HelpKey="lblCategoryLocalizationDescription.HelpText"
							HelpText="Description:" ResourceKey="lblCategoryLocalizationDescription" Text="Description:" />
					</td>
					<td align="left">
						<dnn:TextEditor ID="txtCategoryLocalizationDescription" runat="server" Height="300"
							Width="550" />
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style2" align="left">
						&nbsp;
					</td>
					<td>
						<asp:button id="btnCategoryLocalizationUpdate" resourcekey="btnCategoryLocalizationUpdate"
							runat="server" text="Update" onclick="btnCategoryLocalizationUpdate_Click" />
						&nbsp;
						<asp:button id="btnCategoryLocalizationClose" resourcekey="btnGalleryLocalizationClose"
							runat="server" text="Close" onclick="btnCategoryLocalizationClose_Click" style="height: 26px" />
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlGallery" runat="server" visible="False" bordercolor="#EFEFEF" width="850px"
		horizontalalign="Center" resourcekey="pnlGalleryResource1">
								<asp:panel id="pnlCommunityModeCats" runat="server" visible="False" cssclass="user_dashboard">
									<asp:repeater id="repCommunityModeCats" runat="server" onitemcommand="repCommunityModeCats_ItemCommand">
										<itemtemplate>
											<asp:LinkButton ID="lbCategory" runat="server" CssClass="my_gallery" CommandArgument='<%#Eval("CategoryID")%>' CommandName="OpenCategory"><%#Eval("CategoryName")%></asp:LinkButton>
										</itemtemplate>
									</asp:repeater>
								</asp:panel>
								<div class="headergal">
									<div class="bordergaltop">
									</div>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td>
															&nbsp;<table cellpadding="0" cellspacing="0" class="style1">
																<tr>
																	<td align="right" class="style3">
																		<img alt="Manage Gallery" src="<%=ModulePath%>images/gallerythumb.png" style="width: 111px;
																			height: 100px" />
																	</td>
																	<td align="left">
																		<asp:label id="lblManageGalleriesTitle" resourcekey="lblManageGalleriesTitle" runat="server"
																			cssclass="Gallerytitle" text="Manage &lt;/br&gt; Galleries"></asp:label>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td style="padding-left: 80px;">
															<div>
																<asp:label id="lblNumberOfGalleries" runat="server" text="Number of galleries:" cssclass="textnumbercategory"
																	resourcekey="lblNumberOfGalleriesResource1"></asp:label>
																<asp:label id="lblGalleriesNumber" runat="server" cssclass="textnumbercategory" resourcekey="lblGalleriesNumberResource1">
																</asp:label></div>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<asp:panel id="pnlAddGallery" runat="server" defaultbutton="btnAddGallery">
													<table align="center" cellpadding="0" cellspacing="0" class="addcategorybox">
														<tr>
															<td bgcolor="#e5eca9">
																<div class="boxaddgallerytop" align="left">
																	<asp:label id="lblAddNewGallery" resourcekey="lblAddNewGallery" runat="server" cssclass="AddNewGallery"
																		text="Add NEW Gallery"></asp:label>
																</div>
																<table cellpadding="0" cellspacing="0" align="center" width="280px" style="margin-top: 5px;
																	margin-bottom: 5px;">
																	<tr>
																		<td>
																			<dnn:Label ID="lblEnterNewGalleryName" runat="server" ControlName="tbAddGallery"
																				HelpText="Enter the name of new gallery." Text="Gallery name:" ResourceKey="lblEnterNewGalleryName"
																				CssClass="tooltip2" HelpKey="lblEnterNewGalleryName.HelpText" />
																		</td>
																		<td rowspan="4">
																			<asp:button id="btnAddGallery" runat="server" onclick="btnAddGallery_Click" validationgroup="vgAddGalley"
																				tooltip="Add Gallery" cssclass="addgallerybutton" resourcekey="btnAddGalleryResource1" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<asp:textbox id="tbAddGallery" runat="server" validationgroup="vgAddGalley" cssclass="box2"
																				resourcekey="tbAddGalleryResource1" defaultbutton="button_id" maxlength="500">
																			</asp:textbox>
																			<div>
																				<asp:requiredfieldvalidator id="rfvEnterNewGalleryName" runat="server" controltovalidate="tbAddGallery"
																					errormessage="Gallery name is required." validationgroup="vgAddGalley" display="Dynamic"
																					cssclass="requestfield" resourcekey="rfvEnterNewGalleryNameResource1.ErrorMessage">
																				</asp:requiredfieldvalidator>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<dnn:Label ID="lblEnterNewGalleryDescription" runat="server" ControlName="tbAddGallery"
																				HelpText="Enter the description of new gallery." Text="Gallery description:"
																				ResourceKey="lblEnterNewGalleryDescription" CssClass="tooltip2" HelpKey="lblEnterNewGalleryDescription.HelpText" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<asp:textbox id="tbAddGalleryDescription" runat="server" validationgroup="vgAddGalley"
																				cssclass="box2" resourcekey="tbAddGalleryDescriptionResource1" maxlength="2000">
																			</asp:textbox>
																		</td>
																	</tr>
																	<tr id="trGallerysharing" runat="server" visible="false">
																		<td>
																			<dnn:Label ID="lblJournalSharing" runat="server" ControlName="tbAddGallery" HelpText="Privacy settings:"
																				Text="Privacy settings:" CssClass="tooltip2" HelpKey="lblJournalSharing.HelpText"
																				ResourceKey="dnnUserGalleryPrivacy.Text" />
																			<asp:dropdownlist id="ddlPostToJournal" cssclass="ddlvisibility" runat="server" />
																			<div id="pnlSocialSecuritySelect" runat="server" visible="False" style="text-align:right;">
																				<dnn:Label ID="lblGallerySocialGroupsCreate" runat="server" CssClass="tooltip2" Text="Social groups:"
																					HelpText="Social groups:" style="text-align:right;" />
																				<asp:listbox id="lbSocialSecurityGroups" runat="server" selectionmode="Multiple"></asp:listbox>
																			</div>
																		</td>
																	</tr>
																</table>
																<div class="boxaddgallerybot">
																</div>
															</td>
														</tr>
													</table>
												</asp:panel>
											</td>
										</tr>
									</table>
									<div class="bordergalbot">
									</div>
								</div>
								<div class="gallerylistbox">
									<table id="tblSelCatInGalleries" runat="server" cellpadding="0" cellspacing="0" width="100%"
										style="padding-left: 27px;">
										<tr>
											<td align="left">
												<table cellpadding="0" cellspacing="0" class="selectcategory">
													<tr>
														<td>
															<div class="selcatleft">
															</div>
														</td>
														<td valign="middle">
															<asp:label id="lblSelectedCatategory" runat="server" text="Selected category:" cssclass="selectcategorytxt"
																resourcekey="lblSelectedCatategoryResource1"></asp:label>
															<asp:label id="lblSelectedCat2" runat="server" visible="False" resourcekey="lblSelectedCat2Resource1">
															</asp:label>
															<asp:label id="lblCatID" runat="server" visible="False" resourcekey="lblCatIDResource1">
															</asp:label>
															<asp:label id="lblSelCatName" runat="server" cssclass="selectcategorytxtbold" resourcekey="lblSelCatNameResource1">
															</asp:label>
														</td>
														<td>
															<div class="selcatright">
															</div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<br />
									<asp:label id="lblGalleryStatusMessage" runat="server" visible="False" resourcekey="lblGalleryStatusMessageResource1">
									</asp:label>
									<asp:gridview id="gvGalleries" runat="server" align="center" allowpaging="True" allowsorting="True"
										autogeneratecolumns="False" border="0" cellpadding="4" cssclass="galleryliststylebox"
										datakeynames="GalleryID" datasourceid="odsGalleries" forecolor="Black" gridlines="None"
										ondatabound="gvGalleries_DataBound" onrowcommand="gvGalleries_RowCommand" onrowcreated="gvGalleries_RowCreated"
										onrowdatabound="gvGalleries_RowDataBound" onrowdeleted="gvGalleries_RowDeleted"
										onrowupdated="gvGalleries_RowUpdated" onselectedindexchanged="gvGalleries_SelectedIndexChanged"
										showfooter="True" width="800px" resourcekey="gvGalleriesResource1" onrowdeleting="gvGalleryImages_RowDeleting">
										<alternatingrowstyle cssclass="gallerygrid1" />
										<columns>
											<asp:TemplateField HeaderText="Actions" InsertVisible="False" meta:resourcekey="Actions"
												ShowHeader="False">
												<EditItemTemplate>
													<asp:LinkButton ID="lbGalleriesUpdate" runat="server" CommandName="Update" CssClass="gallerycontrollink"
														Text="Update" resourcekey="lbGalleriesUpdateResource1"></asp:LinkButton>
													&nbsp;<asp:LinkButton ID="lbGalleriesCancel" runat="server" CausesValidation="False"
														CommandName="Cancel" CssClass="gallerycontrollinklight" Text="Cancel" resourcekey="lbGalleriesCancelResource1"></asp:LinkButton>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:LinkButton ID="lbGalleriesSelect" runat="server" CausesValidation="False" CommandName="Select"
														CssClass="gallerycontrollink" Text="Open" resourcekey="lbGalleriesSelectResource1"></asp:LinkButton>
													&nbsp;
													<asp:LinkButton ID="lbGalleriesEdit" runat="server" CausesValidation="False" CommandName="Edit"
														CssClass="gallerycontrollinklight" Text="Edit" resourcekey="lbGalleriesEditResource1"></asp:LinkButton>
													&nbsp;&nbsp;<asp:LinkButton ID="lbGalleriesDelete" runat="server" CommandName="Delete"
														CssClass="gallerycontrollinklight" OnClientClick="return confirm('Are you sure you want to delete this gallery?');"
														Text="Delete" resourcekey="lbGalleriesDeleteResource1"></asp:LinkButton>
													<br />
													<asp:LinkButton ID="lbGalleryContentLocalization" runat="server" CausesValidation="False"
														CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="ContentLocalization"
														CssClass="contentcontrollinklight" Text="Content Localization" resourcekey="lbGalleryContentLocalization"
														Visible='<%#Convert.ToBoolean(ViewState["EnableLocalization"])%>'></asp:LinkButton>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" Width="160px" />
											</asp:TemplateField>
											<asp:BoundField DataField="GalleryID" HeaderText="ID" meta:resourcekey="ID" ReadOnly="True"
												SortExpression="GalleryID">
												<ItemStyle HorizontalAlign="Center" />
											</asp:BoundField>
											<asp:TemplateField HeaderText="Name" meta:resourcekey="Name" SortExpression="GalleryName">
												<EditItemTemplate>
													<asp:TextBox ID="tbGalleriesEditName" runat="server" Text='<%# Bind("GalleryName") %>'
														resourcekey="tbGalleriesEditNameResource1"></asp:TextBox>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:LinkButton ID="lbGalleriesOpenGalleryName" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
														CommandName="Open" CssClass="gallerycontrollinklight" Text='<%# Bind("GalleryName") %>'
														resourcekey="lbGalleriesOpenGalleryNameResource1"></asp:LinkButton>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
											<asp:BoundField DataField="GalleryDescription" HeaderText="Description" meta:resourcekey="Description" />
											<asp:TemplateField HeaderText="No. of Items" meta:resourcekey="NumberOfItems">
												<EditItemTemplate>
													<asp:Label ID="lblGalleriesNumberofItemsEdit" runat="server" Text='<%# Bind("GalleryID") %>'
														resourcekey="lblGalleriesNumberofItemsEditResource1"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblGalleriesNumberofItems" runat="server" Text='<%# Bind("GalleryID") %>'
														resourcekey="lblGalleriesNumberofItemsResource1"></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:BoundField DataField="DateLastModified" HeaderText="Last Modified" meta:resourcekey="LastModified"
												ReadOnly="True" SortExpression="DateLastModified" />
											<asp:TemplateField HeaderText="Position" meta:resourcekey="Position" SortExpression="Position">
												<EditItemTemplate>
													<asp:TextBox ID="tbPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
														resourcekey="tbPositionResource1"></asp:TextBox>
												</EditItemTemplate>
												<FooterTemplate>
													<table>
														<tr>
															<td>
																<asp:Button ID="btnGallerySavePositions" runat="server" CssClass="btnsaveposition"
																	OnClick="btnGallerySavePositions_Click" Text="Save Positions" resourcekey="btnGallerySavePositionsResource1" />
															</td>
															<td>
																<asp:ImageButton ID="imgbtnrearrangegal" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/rearrangegal.png"
																	OnClick="btnCatPosRearange_Click" ToolTip="Rearrange gallery positions numbers in category."
																	resourcekey="imgbtnrearrangegalResource1" />
															</td>
														</tr>
													</table>
												</FooterTemplate>
												<ItemTemplate>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td style="padding-right: 10px;">
																<asp:TextBox ID="tbPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
																	resourcekey="tbPositionResource2"></asp:TextBox>
															</td>
															<td>
																<div>
																	<asp:ImageButton ID="ibtGalleriesUp" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
																		CommandName="Up" ImageUrl="~/images/action_up.gif" Text="Move" resourcekey="ibtGalleriesUpResource1" />
																</div>
																<div>
																	<asp:ImageButton ID="ibtGalleriesDown" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
																		CommandName="Down" ImageUrl="~/images/action_down.gif" Text="Move" resourcekey="ibtGalleriesDownResource1" />
																</div>
															</td>
														</tr>
													</table>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
										</columns>
										<footerstyle cssclass="gallerygrid1" />
										<headerstyle cssclass="galleryboxheaderbgrd" font-names="arial" font-size="14px"
											forecolor="#343E1C" verticalalign="Middle" />
										<pagerstyle backcolor="#E3E1E1" cssclass="pagegal" forecolor="#556C20" height="45px"
											horizontalalign="Center" />
										<rowstyle cssclass="gallerygrid2" />
										<selectedrowstyle cssclass="gallerygridselected" />
									</asp:gridview>
									<table cellpadding="2" cellspacing="2" align="center">
										<tr>
											<td>
												<asp:panel id="pnlGalleryViewOptions" runat="server">
													<dnn:Label ID="lblNumberofGalleriesPerPage" runat="server" ControlName="ddlNumOfGalSelect"
														HelpText="Select the number of galleries to to display on one page:" Text="Items per page:"
														ResourceKey="lblNumberofGalleriesPerPage" CssClass="labeltext" HelpKey="lblNumberofGalleriesPerPage.HelpText" />
												</asp:panel>
											</td>
											<td>
												<asp:dropdownlist id="ddlNumOfGalSelect" runat="server" autopostback="True" cssclass="ddlpageitems"
													onselectedindexchanged="ddlNumOfGalSelect_SelectedIndexChanged" resourcekey="ddlNumOfGalSelectResource1">
													<asp:listitem resourcekey="ListItemResource9" text="10">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource10" text="30">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource11" text="50">
													</asp:listitem>
												</asp:dropdownlist>
											</td>
										</tr>
									</table>
								</div>
								<asp:panel id="pnlGalleryContentLocalization" runat="server" visible="False">
									<div class="localizationlistbox">
										<table width="750px" align="center">
											<tr>
												<td class="style2" align="center" colspan="2">
													&nbsp;
													<asp:label id="lblGalleryContentLocalization" runat="server" cssclass="contenttitle"
														font-bold="True" resourcekey="lblGalleryContentLocalization" text="Content localization">
													</asp:label>
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													&nbsp;
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td align="left" class="style20">
													<asp:label id="lblContentLocalizationGalleryTitle" resourcekey="lblContentLocalizationGalleryTitle"
														runat="server" text="Gallery title:" font-bold="True"></asp:label>
												</td>
												<td align="left">
													<asp:label id="lblContentLocalizationGalleryTitleOriginal" runat="server"></asp:label>
												</td>
											</tr>
											<tr>
												<td align="left" class="style20">
													<asp:label id="lblContentLocalizationGalleryDescription" resourcekey="lblContentLocalizationGalleryDescription"
														runat="server" text="Gallery description:" font-bold="True"></asp:label>
												</td>
												<td align="left">
													<asp:label id="lblContentLocalizationGalleryDescriptionOriginal" runat="server"></asp:label>
												</td>
											</tr>
											<tr>
												<td align="left" class="style20">
													&nbsp;
												</td>
												<td align="left">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td align="left" class="style20">
													<asp:label id="lblDefPortalLangGal" runat="server" text="Default portal language:"></asp:label>
												</td>
												<td align="left">
													<asp:label id="lblDefaultPortalLangugageGal" runat="server"></asp:label>
												</td>
											</tr>
											<tr>
												<td align="left" class="style20">
													<asp:label id="lblGalleryLocalizationLocalizedLanguages" runat="server" resourcekey="lblGalleryLocalizationLocalizedLanguages"
														text="Localized languages:"></asp:label>
												</td>
												<td align="left">
													<asp:label id="lblGalleryLocalizationLocalizedLanguagesList" runat="server"></asp:label>
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													&nbsp;
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													<dnn:Label ID="lblGalleryLocalizationSelectLanguage" runat="server" HelpKey="lblContentLocalizationSelectLanguage.HelpText"
														ResourceKey="lblGalleryLocalizationSelectLanguage" HelpText="Select the languange you want to edit. There is no need to edit dafault language."
														Text="Select language:" />
												</td>
												<td align="left">
													<asp:dropdownlist id="ddlGalleryLocalizationSelectLanguage" runat="server" autopostback="True"
														onselectedindexchanged="ddlGalleryLocalizationSelectLanguage_SelectedIndexChanged">
														<asp:listitem value="0">Select language</asp:listitem>
													</asp:dropdownlist>
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													<dnn:Label ID="lblGalleryLocalizationTitle" runat="server" HelpKey="lblContentLocalizationTitle.HelpText"
														HelpText="Title:" ResourceKey="lblContentLocalizationTitle" Text="Title:" />
												</td>
												<td align="left">
													<asp:textbox id="tbGalleryLocalizationTitle" runat="server" style="width: 250px">
													</asp:textbox>
													&nbsp;
													<asp:button id="btnGalleryLocalizationCopyDefault" runat="server" onclick="btnGalleryLocalizationCopyDefault_Click"
														resourcekey="btnGalleryLocalizationCopyDefault" text="Copy default values" />
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													<dnn:Label ID="lblGalleryLocalizationDescription" runat="server" HelpKey="lblContentLocalizationDescription.HelpText"
														HelpText="Description:" ResourceKey="lblContentLocalizationDescription" Text="Description:" />
												</td>
												<td align="left">
													<dnn:TextEditor ID="txtGalleryLocalizationDescription" runat="server" Height="300"
														Width="550" />
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													&nbsp;
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td class="style20" align="left">
													&nbsp;
												</td>
												<td>
													<asp:button id="btnGalleryLocalizationUpdate" resourcekey="btnGalleryLocalizationUpdate"
														runat="server" text="Update" onclick="btnGalleryLocalizationUpdate_Click" />
													&nbsp;
													<asp:button id="btnGalleryLocalizationClose" resourcekey="btnGalleryLocalizationClose"
														runat="server" text="Close" onclick="btnGalleryLocalizationClose_Click" />
												</td>
											</tr>
										</table>
									</div>
								</asp:panel>
								&nbsp;
<div align="center" style="padding-top: 10px;">
	<asp:button id="btnSaveCloseDown" runat="server" onclick="btnCloseMM_Click" text="Save & Close"
		style="margin-right: 5px;" resourcekey="btnSaveClose.Text" cssclass="btnsaveclose" />
	<asp:button id="btnCloseDown" runat="server" onclick="btnCloseMM_Click" text="Close"
		resourcekey="btnCloseResource1.Text" cssclass="btnclose" /></div>
</div>
</asp:Panel>
<asp:panel id="btnCloseImageManage" runat="server" enabled="False" visible="False"
	border="0" width="800px" resourcekey="btnCloseImageManageResource1">
	<table cellpadding="2" cellspacing="2" width="800px">
		<tr>
			<td align="right">
				<asp:button id="btnclosemedia" runat="server" onclick="Button1_Click1" text="Close media manager"
					tooltip="Close Media Manager and return to Gallery Manager." resourcekey="btnclosemediaResource1"
					cssclass="btnclosemediamanager" />
			</td>
		</tr>
	</table>
	<asp:objectdatasource id="odsGalleryImages" typename="DataAcess" runat="server" selectmethod="GetImagesFromGallery"
		updatemethod="UpdateGalleryImage" deletemethod="DeleteImage">
		<deleteparameters>
								<asp:Parameter Name="PictureID" Type="Int32" />
							</deleteparameters>
		<selectparameters>
								<asp:ControlParameter ControlID="lblSelectedDataKey2" Name="GalleryID" PropertyName="Text"
									Type="Int32" />
							</selectparameters>
		<updateparameters>
								<asp:Parameter Name="PictureID" Type="Int32" />
								<asp:Parameter Name="Title" Type="String" />
								<asp:Parameter Name="Description" Type="String" />
								<asp:Parameter Name="ThumbUrl" Type="String" />
								<asp:Parameter Name="Position" Type="Int32" />
								<asp:Parameter Name="MediaType" Type="String" />
							</updateparameters>
	</asp:objectdatasource>
	<div class="headermedia">
		<div class="bordermedtop">
		</div>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td class="style4">
					<img alt="Manage Media" src="<%=ModulePath%>images/mediamanagerthumb.png" style="width: 124px;
						height: 103px" />
				</td>
				<td align="left">
					<asp:label id="lblMediaManagerTitle" resourcekey="lblMediaManagerTitle" runat="server"
						cssclass="MediaManagerTitle" text="&lt;b&gt;Media&lt;/b&gt; Manager"></asp:label>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<asp:label id="lblAddEditDelete" resourcekey="lblAddEditDelete" runat="server" cssclass="AddEditDelete"
									text="Add | Edit | Delete"></asp:label>
							</td>
							<td>
								<asp:label id="lblImagesVideoAudio" resourcekey="lblImagesVideoAudio" runat="server"
									cssclass="ImagesVideoAudio" text="Images | Video | Audio"></asp:label>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		&nbsp;<div class="bordermedbot">
		</div>
	</div>
	<div class="gallerylistbox">
		<table cellpadding="2" cellspacing="2" border="0" width="100%">
			<tr>
				<td align="left">
					<table id="showCatName" runat="server" cellpadding="0" cellspacing="0" class="selectcategory"
						style="margin-bottom: 7px;">
						<tr>
							<td>
								<div class="selcatleft">
								</div>
							</td>
							<td valign="middle">
								<asp:label id="lblSelectedCatName" runat="server" text="Selected category name:"
									cssclass="selectcategorytxt" resourcekey="lblSelectedCatNameResource1"></asp:label>
								<asp:label id="lblSelCatNameAtMediaManager" runat="server" cssclass="selectcategorytxtbold"
									resourcekey="lblSelCatNameAtMediaManagerResource1"></asp:label>
							</td>
							<td>
								<div class="selcatright">
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td rowspan="3" valign="middle">
					<table id="movecopyGal" cellpadding="0" cellspacing="0" class="boxmovecopy" align="right"
						runat="server">
						<tr>
							<td style="background-color: #cbe48c">
								<div class="boxmovecopytop" align="left">
									<asp:label id="lblMoveCopyTitle" resourcekey="lblMoveCopyTitle" runat="server" cssclass="MoveCopyTitle"
										text="Move or copy gallery to another category:"></asp:label>
								</div>
								<table cellpadding="0" cellspacing="0" style="height: 35px;" width="100%">
									<tr>
										<td align="center">
											<asp:dropdownlist id="ddlCategoryMove" runat="server" cssclass="inputboxmovecopy"
												datasourceid="odsCategories" datatextfield="CategoryName" datavaluefield="CategoryID"
												resourcekey="ddlCategoryMoveResource1">
											</asp:dropdownlist>
										</td>
										<td>
											<asp:button id="btnmove" runat="server" text="Move" onclick="btnMoveGallery_Click"
												resourcekey="btnmoveResource1" cssclass="btnmoveclose" />
											<asp:button id="btncopy" runat="server" text="Copy" onclick="btncopy_Click" resourcekey="btncopyResource1"
												cssclass="btnmoveclose" />
										</td>
									</tr>
								</table>
								<div class="boxmovecopybot">
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="left">
					<table cellpadding="0" cellspacing="0" class="selectgalegory" style="margin-left: 35px;">
						<tr>
							<td>
								<div class="selgalleft">
								</div>
							</td>
							<td valign="middle">
								<asp:label id="lblSelectedGalleryNameTitle" runat="server" text="Selected Gallery Name:"
									cssclass="selectcategorytxt" resourcekey="lblSelectedGalleryNameTitleResource1">
								</asp:label>
								<asp:label id="lblSelectedGalleryName" runat="server" cssclass="selectcategorytxtbold"
									resourcekey="lblSelectedGalleryNameResource1"></asp:label>
							</td>
							<td>
								<div class="selgalright">
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td align="right">
			<table>
				<tr id="trUserGalleryPrivacy" runat="server" visible="false">
					<td style="width: 60%">
						<dnn:Label ID="dnnUserGalleryPrivacy" runat="server" ControlName="tbAddGallery" HelpText="lblJournalSharing.HelpText"
							Text="Privacy settings:" CssClass="tooltip2" HelpKey="Privacy settings:" ResourceKey="dnnUserGalleryPrivacy" />
					</td>
					<td style="width: 40%">
						<asp:dropdownlist id="ddlPostToJournalSettings" cssclass="ddlvisibility" runat="server" style="margin-right:16px;"/>
					
					</td>
				</tr>
				<tr id="divGalleryGroups" runat="server" visible="False">
					<td style="width: 60%">
							<dnn:Label ID="lblGallerySocialSecurityGroups" runat="server" CssClass="tooltip2" Text="Social groups:"
								HelpText="Social groups:" />
					</td>
					<td style="width: 40%">
					<asp:listbox id="lbGallerySocialSecurityGroups" runat="server" selectionmode="Multiple">
							</asp:listbox>
					</td>
				 </tr>
				<tr id="trSaveGallerySharing" runat="server" visible="False">
					<td>
					</td>
					<td align="right">
						<asp:button id="btnSaveGallerySharing" resourcekey="btnSaveGallerySharing" runat="server" text="Save" cssclass="btnsaveposition" onclick="btnSaveGallerySharing_Click" style="margin-right:16px;"/>
					</td>
				</tr>
			</table>
			</td>
			</tr>


			<tr>
				<td align="center">
					<asp:label id="lblNumberOfMediaFiles" runat="server" text="Number of media files in gallery:"
						cssclass="labeltext2" resourcekey="lblNumberOfMediaFilesResource1"></asp:label>
					<asp:label id="lblImagesNumber" runat="server" cssclass="labeltext2" resourcekey="lblImagesNumberResource1">
					</asp:label>
					<br />
					<asp:label id="lblSelectedGalleryID" runat="server" text="Selected Gallery ID: "
						visible="False" resourcekey="lblSelectedGalleryIDResource1"></asp:label>
					<asp:label id="lblSelectedDataKey2" runat="server" visible="False" resourcekey="lblSelectedDataKey2Resource1">
					</asp:label>
				</td>
			</tr>
		</table>
		<br />
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<asp:label id="lblMedidaManagerMessage" runat="server" visible="False" resourcekey="lblMedidaManagerMessageResource1">
					</asp:label>
					<asp:gridview id="gvGalleryImages" runat="server" allowpaging="True" allowsorting="True"
						autogeneratecolumns="False" border="0" cellpadding="4" cssclass="galleryliststylebox"
						datakeynames="PictureID" datasourceid="odsGalleryImages" forecolor="Black" ondatabound="gvGalleryImages_DataBound"
						onprerender="gvGalleryImages_PreRender" onrowcancelingedit="gvGalleryImages_RowCancelingEdit"
						onrowcommand="gvGalleryImages_RowCommand" onrowcreated="gvGalleryImages_RowCreated"
						onrowdeleted="gvGalleryImages_RowDeleted" onrowediting="gvGalleryImages_RowEditing"
						onrowupdated="gvGalleryImages_RowUpdated" onselectedindexchanged="gvGalleryImages_SelectedIndexChanged"
						showfooter="True" width="800px" gridlines="Horizontal" resourcekey="gvGalleryImagesResource1"
						onrowdatabound="gvGalleryImages_RowDataBound" onrowdeleting="gvGalleryImages_RowDeleting1">
						<alternatingrowstyle cssclass="gallerygrid1" />
						<columns>
												<asp:TemplateField HeaderText="Action" meta:resourcekey="Action" ShowHeader="False">
													<EditItemTemplate>
														<asp:LinkButton ID="lbMediaUpdate" runat="server" CommandName="Update" CssClass="gallerycontrollink"
															Text="Update" resourcekey="lbMediaUpdateResource1"></asp:LinkButton>
														&nbsp;<asp:LinkButton ID="lbMediaCancel" runat="server" CausesValidation="False"
															CommandName="Cancel" CssClass="gallerycontrollink" Text="Cancel" resourcekey="lbMediaCancelResource1"></asp:LinkButton>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:LinkButton ID="lbMediaEdit" runat="server" CausesValidation="False" CommandName="Edit"
															CssClass="gallerycontrollinklight" Text="Quick Edit" resourcekey="lbMediaEditResource1"></asp:LinkButton>
														<asp:LinkButton ID="lbMediaSelect" runat="server" CausesValidation="False" CommandName="Select"
															CssClass="gallerycontrollink" Text="Open in editor" resourcekey="lbMediaSelectResource1"></asp:LinkButton>
														<asp:LinkButton ID="lbMediaDelete" runat="server" CommandName="Delete" CssClass="gallerycontrollinklight"
															OnClientClick="return confirm('Are you sure you want to delete this media?');"
															Text="Delete" resourcekey="lbMediaDeleteResource1"></asp:LinkButton>
														<asp:LinkButton ID="lbMediaMove" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
															CommandName="Move" CssClass="gallerycontrollinklight" Text="Move/Copy" resourcekey="lbMediaMoveResource1"></asp:LinkButton>
														<asp:LinkButton ID="lbMediaContentLocalization" runat="server" CausesValidation="False"
															CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="ContentLocalization"
															CssClass="gallerycontrollinklight" Text="Content Localization" resourcekey="lbMediaContentLocalization"
															Visible='<%#Convert.ToBoolean(ViewState["EnableLocalization"])%>'></asp:LinkButton>
														<asp:CheckBox ID="cbMediaSelected" CssClass="EGMediaSelect" resourcekey="cbSelected"
															runat="server" Text="Select" />
														<asp:HiddenField ID="hfMediaID" runat="server" Value='<%#Eval("PictureID")%>' />
													</ItemTemplate>
													<FooterTemplate>
														<asp:LinkButton ID="lbSelectAll" resourcekey="lbSelectAll" OnClientClick="SelectAllMedia(); return false;"
															runat="server" Text="Select all"></asp:LinkButton>
														<asp:LinkButton ID="lbDeselectAll" resourcekey="lbDeselectAll" OnClientClick="DeSelectAllMedia(); return false;"
															runat="server" Text="Deselect all"></asp:LinkButton>
														<asp:LinkButton ID="lbDeleteSelected" resourcekey="lbDeleteSelected" runat="server"
															Text="Delete Selected" CommandName="DeleteSelected"></asp:LinkButton>
													</FooterTemplate>
													<ControlStyle Width="70px" />
													<ItemStyle HorizontalAlign="Left" Width="70px" Wrap="True" />
												</asp:TemplateField>
												<asp:BoundField DataField="PictureID" HeaderText="ID" meta:resourcekey="ID" ReadOnly="True">
													<ItemStyle HorizontalAlign="Center" Width="20px" />
												</asp:BoundField>
												<asp:BoundField DataField="GalleryID" HeaderText="GalleryID" meta:resourcekey="GalleryID"
													ReadOnly="True" Visible="False" />
												<asp:TemplateField HeaderText="Title" meta:resourcekey="Title" SortExpression="Title">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>' resourcekey="TextBox3Resource1"></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:LinkButton ID="lbMediaTitleOpen" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
															CommandName="Open" CssClass="gallerycontrollinklight" Text='<%# Bind("Title") %>'
															resourcekey="lbMediaTitleOpenResource1"></asp:LinkButton>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Description" meta:resourcekey="Description">
													<EditItemTemplate>
														<asp:TextBox ID="tbMediaEditDescription" runat="server" Height="150px" Text='<%# Bind("Description") %>'
															TextMode="MultiLine" Width="120px" resourcekey="tbMediaEditDescriptionResource1"></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:Label ID="lblMediaDescription" runat="server" Text='<%# Bind("Description") %>'
															resourcekey="lblMediaDescriptionResource1"></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Thumbnail" meta:resourcekey="Thumbnail">
													<ItemTemplate>
														<asp:HyperLink ID="hlMediaThumbnailOpen" runat="server" NavigateUrl='<%# Eval("FileName") %>'
															Target="_blank" resourcekey="hlMediaThumbnailOpenResource1">
															<asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" BorderWidth="3px"
															Width='<%#GetWidth(Eval("Info"))%>' Height='<%#GetHeight(Eval("Info"))%>' CssClass="imagethumbbrd" ImageUrl='<%# GetThumbnailURL(Eval("ThumbUrl"),Eval("Info"),Eval("FileName")) %>' />
														</asp:HyperLink>
														<br />
														<asp:Label ID="lblMediaImageUrl" runat="server" Text='<%# Bind("ImageUrl") %>' resourcekey="lblMediaImageUrlResource1"></asp:Label>
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Position" meta:resourcekey="Position" SortExpression="Position">
													<EditItemTemplate>
														<asp:TextBox ID="tbMediaPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
															resourcekey="tbMediaPositionResource1"></asp:TextBox>
													</EditItemTemplate>
													<FooterTemplate>
														<table>
															<tr>
																<td>
																	<asp:Button ID="btnMediaSavePositions" runat="server" CssClass="btnsaveposition"
																		OnClick="btnSavePositions_Click" Text="Save Positions" ToolTip="Save Positions"
																		resourcekey="btnMediaSavePositionsResource1" />
																</td>
																<td>
																	<asp:ImageButton ID="imgbtnRearangeMediaPositions" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/rearrangegal.png"
																		OnClick="btnOrgPozicije_Click" ToolTip="Rearrange media positions numbers in gallery."
																		resourcekey="imgbtnRearangeMediaPositionsResource1" />
																</td>
															</tr>
														</table>
													</FooterTemplate>
													<ItemTemplate>
														<table cellpadding="0" cellspacing="0">
															<tr>
																<td style="padding-right: 10px;">
																	<asp:TextBox ID="tbMediaPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
																		resourcekey="tbMediaPositionResource2"></asp:TextBox>
																</td>
																<td>
																	<asp:ImageButton ID="imbMediaUp" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
																		CommandName="Up" Height="16px" ImageUrl="~/images/action_up.gif" Text="Up" resourcekey="imbMediaUpResource1" />
																	<br />
																	<asp:ImageButton ID="imbMediaDown" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
																		CommandName="Down" ImageUrl="~/images/action_down.gif" Text="Gore" resourcekey="imbMediaDownResource1" />
																</td>
															</tr>
														</table>
														<br />
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
												<asp:TemplateField ShowHeader="False" Visible="False" meta:resourcekey="TemplateFieldResource1">
													<ItemTemplate>
														<asp:ImageButton ID="imbMediaUp2" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
															CommandName="Up" ImageUrl="~/images/action_up.gif" Text="Up" resourcekey="imbMediaUp2Resource1" />
														<br />
														<asp:ImageButton ID="imbMediaDown2" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
															CommandName="Down" ImageUrl="~/images/action_down.gif" Text="Gore" resourcekey="imbMediaDown2Resource1" />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField DataField="MediaType" HeaderText="Type" meta:resourcekey="Type" ReadOnly="True"
													SortExpression="MediaType">
													<ControlStyle Width="50px" />
													<FooterStyle Width="50px" />
													<HeaderStyle Width="50px" />
													<ItemStyle HorizontalAlign="Center" Width="50px" />
												</asp:BoundField>
												<asp:TemplateField HeaderText="Approved" SortExpression="MediaApproved">
													<ItemTemplate>
														<%-- <asp:Label ID="lblApproved" runat="server" Text='<%# GetApproved(Eval("PictureID"))%>'></asp:Label>--%>
														<asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/accept.png"
															AlternateText="Approved" Visible='<%#Convert.ToBoolean(GetApproved(Eval("PictureID")))%>' />
														<asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/remove.png"
															AlternateText="Unapproved" Visible='<%#!Convert.ToBoolean(GetApproved(Eval("PictureID")))%>' /><br />
														<asp:LinkButton ID="lbApprove" CssClass="approvelink" runat="server" CommandName="Approve"
															CommandArgument='<%#Eval("PictureID")%>' Visible='<%#!Convert.ToBoolean(GetApproved(Eval("PictureID")))%>'
															Text="Approve" resourcekey="lbApprove" Font-Bold="False" CausesValidation="False"></asp:LinkButton>
														<asp:LinkButton ID="lbUnApprove" CssClass="approvelink2" runat="server" CommandName="Unapprove"
															CommandArgument='<%#Eval("PictureID")%>' Visible='<%#Convert.ToBoolean(GetApproved(Eval("PictureID")))%>'
															Text="Unapprove" resourcekey="lbUnApprove" CausesValidation="False" Font-Bold="False"></asp:LinkButton>
														<div style="margin-top: 10px;">
															<asp:Label ID="lblUploadedBy" runat="server" resourcekey="lblUploadedBy" Text="Uploaded by:"
																stye="font-size:10px;"></asp:Label><br />
															<asp:Label ID="lblUserName" runat="server" stye="font-size:10px;" Text='<%#GetUserName(Eval("UserID"))%>'></asp:Label></div>
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
											</columns>
						<footerstyle cssclass="gallerygrid1" />
						<headerstyle cssclass="galleryboxheaderbgrd" font-names="arial" font-size="14px"
							forecolor="#343E1C" verticalalign="Middle" />
						<pagerstyle backcolor="#E3E1E1" cssclass="pagegal" forecolor="#556C20" height="45px"
							horizontalalign="Center" />
						<rowstyle cssclass="gallerygrid2" />
						<selectedrowstyle cssclass="gallerygridselected" />
					</asp:gridview>
					<table cellpadding="2" cellspacing="2" align="center">
						<tr>
							<td>
								<dnn:Label ID="lblNumberOfMediaPerPage" runat="server" Text="Items per page:" HelpText="Select the number of items to display on one page."
									ResourceKey="lblNumberOfMediaPerPage" CssClass="labeltext" HelpKey="lblNumberOfMediaPerPage.HelpText"></dnn:Label>
							</td>
							<td>
								&nbsp;<asp:dropdownlist id="ddlImagesPerPage" runat="server" autopostback="True"
									onselectedindexchanged="ddlImagesPerPage_SelectedIndexChanged" cssclass="ddlpageitems"
									resourcekey="ddlImagesPerPageResource1">
									<asp:listitem text="10" resourcekey="ListItemResource12">
									</asp:listitem>
									<asp:listitem text="30" resourcekey="ListItemResource13">
									</asp:listitem>
									<asp:listitem text="50" resourcekey="ListItemResource14">
									</asp:listitem>
								</asp:dropdownlist>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<asp:panel id="pnlMoveMedia" runat="server" visible="False" onprerender="pnlMoveMedia_PreRender"
			resourcekey="pnlMoveMediaResource1">
			<div class="tblmovecopy">
				<table cellpadding="2" cellspacing="2">
					<tr>
						<a name="copymove"></a>
						<asp:label id="lblMoveORCopyMedia" runat="server" text="Move or copy selected media"
							cssclass="subtitleregion" resourcekey="lblMoveORCopyMediaResource1"></asp:label>
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							&nbsp;
						</td>
						<td align="left">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							<dnn:Label ID="lblMediaMoveID" ResourceKey="lblMediaMoveID" runat="server" HelpText="ID of the selected media."
								Text="ID:" HelpKey="lblMediaMoveID.HelpText" />
						</td>
						<td align="left">
							<asp:label id="lblMoveMediaID2" runat="server" text="ID"></asp:label>
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							<dnn:Label ID="lblMoveMediaTitle" ResourceKey="lblMoveMediaTitle" runat="server"
								Text="Title:" HelpText="Title of the selected media." HelpKey="lblMoveMediaTitle.HelpText"></dnn:Label>
						</td>
						<td align="left">
							<asp:label id="lblMoveMedoaTitle2" runat="server" text="Title"></asp:label>
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							<dnn:Label ID="lblMoveMediaSelectCategory" ResourceKey="lblMoveMediaSelectCategory"
								runat="server" Text="Select category:" HelpText="Select the category to move or copy image to:"
								HelpKey="lblMoveMediaSelectCategory.HelpText"></dnn:Label>
						</td>
						<td align="left">
							<asp:dropdownlist id="ddlMoveCategory" runat="server" autopostback="True" datasourceid="odsCategories"
								datatextfield="CategoryName" datavaluefield="CategoryID" resourcekey="ddlMoveCategoryResource1">
							</asp:dropdownlist>
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							<dnn:Label ID="lblMedijaMoveGallerySelect" ResourceKey="lblMedijaMoveGallerySelect"
								runat="server" Text="Select gallery:" HelpText="Select the gallery to move or copy image to:"
								HelpKey="lblMedijaMoveGallerySelect.HelpText"></dnn:Label>
						</td>
						<td align="left">
							<asp:dropdownlist id="ddlMMSelectGallery" runat="server" datasourceid="odsMoveGalleries"
								datatextfield="GalleryName" datavaluefield="GalleryID" resourcekey="ddlMMSelectGalleryResource1">
							</asp:dropdownlist>
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							&nbsp;
						</td>
						<td align="left">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right" class="tablecolumnleft2">
							&nbsp;
						</td>
						<td align="left">
							<asp:button id="btnMoveMediaCopy" runat="server" onclick="btnMMCopy_Click" text="Copy"
								width="90px" resourcekey="btnMoveMediaCopyResource1" />
							&nbsp;&nbsp;<asp:button id="btnMoveMediaMove" runat="server" onclick="btnMMMove_Click"
								text="Move" width="90px" resourcekey="btnMoveMediaMoveResource1" />
							&nbsp;
							<asp:button id="btnMoveMediaCancel" runat="server" onclick="btnMMMoveCancel_Click"
								text="Cancel" width="90px" resourcekey="btnMoveMediaCancelResource1" />
						</td>
					</tr>
				</table>
			</div>
		</asp:panel>
		<br />
		<asp:panel id="pnlMediaUpload" runat="server" width="800px" resourcekey="pnlMediaUploadResource1">
			<div class="headeruploadmedia">
				<div>
				</div>
				<div>
					<asp:label id="lblAddMedia2" resourcekey="lblAddMedia2" runat="server" text="Add Media"
						cssclass="Addmedia2"></asp:label>
					<asp:label id="lblAddImagesaudiovideo" resourcekey="lblAddImagesaudiovideo" runat="server"
						text="| Images | video | audio" cssclass="Addmedia3"></asp:label></div>
			</div>
			<asp:label id="lblUploadMediaStatus" runat="server" visible="False" resourcekey="lblUploadMediaStatusResource1">
			</asp:label>
			<table cellpadding="0" cellspacing="0" style="height: 40px;">
				<tr>
					<td align="center">
						<div style="float: left; padding-right: 5px;">
							<asp:button id="imgSelectImageUpload" runat="server" text="images" onclick="imgSelectImageUpload_Click"
								resourcekey="imgSelectImageUploadResource1" cssclass="btnimages" /></div>
						<div style="float: left; padding-right: 5px;">
							<asp:button id="imgSelectVidoeUpload" runat="server" text="video" onclick="imgSelectVidoeUpload_Click"
								resourcekey="imgSelectVidoeUploadResource1" cssclass="btnvideo" /></div>
						<div style="float: left;">
							<asp:button id="imgSelectAudioUpload" runat="server" text="audio" onclick="imgSelectAudioUpload_Click"
								resourcekey="imgSelectAudioUploadResource1" cssclass="btnaudio" /></div>
					</td>
				</tr>
			</table>
			<asp:panel id="pnlImageUploads" runat="server" width="800px" resourcekey="pnlImageUploadsResource1">
				<div class="imagesuploadbox">
					<div class="uploadimagesboxbgrd">
						<div class="addimagestitlebgrd">
							<table style="height: 120px;" cellpadding="0" cellspacing="0" class="style1">
								<tr>
									<td class="style9" valign="bottom" align="left">
										<asp:label id="lblAddImages" resourcekey="lblAddImages" runat="server" text="Add images"
											cssclass="AddDesc"></asp:label>
									</td>
									<td align="left">
										<table style="padding-top: 30px;">
											<tr>
												<td align="center">
													<dnn:Label ID="lblImageUploadsTitle" runat="server" CssClass="subtitleregion" HelpKey="lblImageUploadsTitle.HelpText"
														HelpText="Select if you wish to upload simg image file or a zip file with images."
														ResourceKey="lblImageUploadsTitle" Text="Image upload" />
												</td>
											</tr>
											<tr>
												<td align="center">
													<asp:radiobuttonlist id="rblImageUploadType" runat="server" autopostback="True" cssclass="subtitleregion"
														onselectedindexchanged="rblUpload_SelectedIndexChanged" repeatdirection="Horizontal"
														resourcekey="rblImageUploadTypeResource1">
														<asp:listitem resourcekey="ListItemResource15" text="Upload single image" value="single">
														</asp:listitem>
														<asp:listitem resourcekey="MultiImageUpload" value="multi">Multi image upload</asp:listitem>
														<asp:listitem resourcekey="ListItemResource16" text="Upload Zip file" value="zip">
														</asp:listitem>
														<asp:listitem resourcekey="ListItemResource17" text="Add images from server folder"
															value="imagefolder">
														</asp:listitem>
													</asp:radiobuttonlist>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
						<asp:panel id="pnlZipUpload" runat="server" visible="False" width="850px" resourcekey="pnlZipUploadResource1">
							<table cellpadding="2" cellspacing="2" style="width: 650px; text-align: left;">
								<tr>
									<td align="center" colspan="2">
										<div style="margin-top: 25px; margin-bottom: 15px;">
											<asp:label id="lblZipUploadTitle" runat="server" text="Zip file upload" cssclass="subtitleregion"
												resourcekey="lblZipUploadTitleResource1"></asp:label>
											<asp:radiobuttonlist id="rblZipUploadSource" runat="server" autopostback="True" onselectedindexchanged="rblTUSelect_SelectedIndexChanged"
												repeatdirection="Horizontal" cellpadding="2" cellspacing="2" cssclass="subtitleregion"
												resourcekey="rblZipUploadSourceResource1">
												<asp:listitem selected="True" value="upload" text="Upload Zip file" resourcekey="ListItemResource18">
												</asp:listitem>
												<asp:listitem value="server" text="Add zip from server folder" resourcekey="ListItemResource19">
												</asp:listitem>
											</asp:radiobuttonlist>
										</div>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<asp:panel id="pnlZUpload" runat="server" resourcekey="pnlZUploadResource1">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td class="style17">
														<dnn:Label ID="lblZipUploadFileSelect" ResourceKey="lblZipUploadFileSelect" runat="server"
															HelpText="Please select zip file to upload:" Text="Zip file to upload:" HelpKey="lblZipUploadFileSelect.HelpText" />
													</td>
													<td>
														<asp:fileupload id="fuZipUpload" runat="server" width="300px" resourcekey="fuZipUploadResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
										<asp:panel id="pnlZUAddFromServer" runat="server" visible="False" resourcekey="pnlZUAddFromServerResource1">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td colspan="2">
														<asp:label id="lblZipUploadFromServerFileSelect" runat="server" text="Select zip file:"
															cssclass="subtitleregion" resourcekey="lblZipUploadFromServerFileSelectResource1">
														</asp:label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblZipUploadSelectFolder" ResourceKey="lblZipUploadSelectFolder" runat="server"
															Text="Select folder:" HelpText="Select folder:" HelpKey="lblZipUploadSelectFolder.HelpText"></dnn:Label>
													</td>
													<td>
														<asp:dropdownlist id="ddlZUFolders" runat="server" appenddatabounditems="True" autopostback="True"
															onselectedindexchanged="ddlZUFolders_SelectedIndexChanged" resourcekey="ddlZUFoldersResource1">
															<asp:listitem value="\" text="Root" resourcekey="ListItemResource20">
															</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblZipUploadFolderSelectFile" ResourceKey="lblZipUploadFolderSelectFile"
															runat="server" Text="Select zip file to add:" HelpText="Select zip file to add:"></dnn:Label>
													</td>
													<td>
														<asp:dropdownlist id="ddlZUFiles" runat="server" resourcekey="ddlZUFilesResource1">
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblZipUploadMainGallFolder" ResourceKey="lblZipUploadMainGallFolder"
															runat="server" Text="Show main gallery folder:" HelpText="Add main EasyDNN gallery folder to folders list:"
															HelpKey="lblZipUploadMainGallFolder.HelpText"></dnn:Label>
													</td>
													<td>
														<asp:checkbox id="cbZUShowMainGalFolder" runat="server" autopostback="True" oncheckedchanged="cbZUShowMainGalFolder_CheckedChanged"
															resourcekey="cbZUShowMainGalFolderResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
								<tr>
									<td class="style16">
										<asp:label id="lblZipUploadMessage" runat="server" resourcekey="lblZipUploadMessageResource1">
										</asp:label>
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16" valign="top" rowspan="2">
										<dnn:Label ID="lblZipUploadDescription" ResourceKey="lblZipUploadDescription" runat="server"
											Text=" Description:" HelpText="Enter description for images from zip file." HelpKey="lblZipUploadDescription.HelpText"></dnn:Label>
										&nbsp;
									</td>
									<td>
										<div id="DivZipDescriptionTB" runat="server">
											<asp:textbox id="tbZipDescription" runat="server" height="150px" width="300px" resourcekey="tbZipDescriptionResource1"
												maxlength="4000">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivZipUseMetadataDescriptionCB" runat="server">
											<asp:checkbox id="cbZipUploadUseExifMetadataDescription" runat="server" text="Use Exif metadata as description"
												resourcekey="cbZipUploadUseExifMetadataDescriptionResource1" />
										</div>
										<div id="DivZipUseMetadataDescriptionOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cblZipUploadMetadataDescriptionOptions" runat="server" resourcekey="cblZipUploadMetadataDescriptionOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource21">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource22">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource23">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource24">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource25">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource26">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style16" valign="top">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16" valign="top">
										<dnn:Label ID="lblZipUploadMediaUrl" ResourceKey="lblZipUploadMediaUrl" runat="server"
											HelpText="Enter url for media link:" Text="Enter url:" HelpKey="lblZipUploadMediaUrl.HelpText" />
									</td>
									<td>
										<asp:textbox id="tbZipImageUrl" runat="server" width="300px" resourcekey="tbZipImageUrlResource1">
										</asp:textbox>
									</td>
								</tr>
								<tr>
									<td class="style16" valign="top">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16" rowspan="3" valign="top">
										<dnn:Label ID="lblZipUploadFilenameAsTitle" runat="server" HelpKey="lblZipUploadFilenameAsTitle.HelpText"
											HelpText="Use filename or metada of image from zip file to set title:" ResourceKey="lblZipUploadFilenameAsTitle"
											Text="Set title:" />
										&nbsp;
									</td>
									<td>
										<div id="ZIPTitleTextBox" runat="server">
											<asp:textbox id="tbZIPImageTitle" runat="server" maxlength="250" resourcekey="tbZIPImageTitleResource1"
												validationgroup="Validationg1" width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivZipUseFileNameCB" runat="server">
											<asp:checkbox id="cbZipUpladUseFilenameTitle" runat="server" causesvalidation="True"
												resourcekey="cbZipUpladUseFilenameTitleResource1" text="Use filename as title" />
										</div>
										<div id="divZUUseFilename" runat="server" style="display: none">
											<asp:checkbox id="cbZipUploadTitleRemoveExtenzion" runat="server" resourcekey="cbZipUploadTitleRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											<asp:checkbox id="cbZipUploadTitleReplaceUnderscore" runat="server" resourcekey="cbZipUploadTitleReplaceUnderscoreResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											<asp:checkbox id="cbZipUploadTitleReplaceMinus" runat="server" resourcekey="cbZipUploadTitleReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblZipUploadTitleOptions" runat="server" resourcekey="rblZipUploadTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource27" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource28" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource29" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource30" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivZipUseMetadataCB" runat="server">
											<asp:checkbox id="cbZipUploadUseExifMetadataTitle" runat="server" text="Use Exif metadata as title"
												resourcekey="cbZipUploadUseExifMetadataTitleResource1" />
										</div>
										<div id="DivZipUseMetadataOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cblZipUploadMetadataOptions" runat="server" resourcekey="cblZipUploadMetadataOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource31">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource32">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource33">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource34">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource35">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource36">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16">
										<dnn:Label ID="lblIZipUploadImageResize" ResourceKey="lblIZipUploadImageResize" runat="server"
											HelpText="Propotionaly resize uploaded images:" Text="Resize image:" HelpKey="lblIZipUploadImageResize.HelpText" />
									</td>
									<td>
										<asp:checkbox id="cbZipUploadImageResize" runat="server" resourcekey="cbZipUploadImageResizeResource1" />
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										<div id="divZUImageResize" runat="server" style="display: none">
											<asp:panel id="pnlZipUploadImageResize" runat="server" resourcekey="pnlZipUploadImageResizeResource1">
												<table>
													<tr>
														<td>
															<asp:label id="lblZipUploadResizeWidth" runat="server" text="Max width:" resourcekey="lblZipUploadResizeWidthResource1">
															</asp:label>
														</td>
														<td>
															<asp:textbox id="tbZipUploadImageResizeWidth" runat="server" width="50px" text="800"
																resourcekey="tbZipUploadImageResizeWidthResource1">
															</asp:textbox>
															&nbsp;<asp:comparevalidator id="cvZipUploadResizeWidth" runat="server" controltovalidate="tbZipUploadImageResizeWidth"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																type="Integer" validationgroup="vgZipUpload" resourcekey="cvZipUploadResizeWidthResource1.ErrorMessage"></asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvZipUploadResizeWidth" runat="server" controltovalidate="tbZipUploadImageResizeWidth"
																errormessage="This filed is required." validationgroup="vgZipUpload" resourcekey="rfvZipUploadResizeWidthResource1.ErrorMessage">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td class="style41">
															<asp:label id="lblZipUploadResizeHeight" runat="server" text="Max height:" resourcekey="lblZipUploadResizeHeightResource1">
															</asp:label>
														</td>
														<td>
															<asp:textbox id="tbZipUploadImageResizeHeight" runat="server" width="50px" text="600"
																resourcekey="tbZipUploadImageResizeHeightResource1">
															</asp:textbox>
															&nbsp;<asp:comparevalidator id="cvZipUploadResizeHeight" runat="server" controltovalidate="tbZipUploadImageResizeHeight"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																type="Integer" validationgroup="vgZipUpload" resourcekey="cvZipUploadResizeHeightResource1.ErrorMessage"></asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvZipUploadResizeHeight" runat="server" controltovalidate="tbZipUploadImageResizeHeight"
																errormessage="This filed is required." validationgroup="vgZipUpload" resourcekey="rfvZipUploadResizeHeightResource1.ErrorMessage">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td>
															<asp:checkbox id="cbZipOriginalAsDownload" runat="server" text="Use unresized image as download version." />
														</td>
														<td>
														</td>
													</tr>
												</table>
											</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										<asp:button id="btnUploadZipFile" runat="server" onclick="UploadZipButton_Click"
											text="Upload Zip file" validationgroup="vgZipUpload" width="140px" resourcekey="btnUploadZipFileResource1" />
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style16">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</asp:panel>
						<asp:panel id="pnlImageSettings" runat="server" width="850px" visible="False" resourcekey="pnlImageSettingsResource1">
							<div style="margin-top: 25px; margin-bottom: 15px;">
								<asp:label id="lblSingleImageTitle" runat="server" cssclass="subtitleregion" text="Single image upload"
									resourcekey="lblSingleImageTitleResource1"></asp:label><br />
								<asp:radiobuttonlist id="rblSingleImageUploadSelectSource" runat="server" repeatdirection="Horizontal"
									autopostback="True" onselectedindexchanged="rblSIUSelction_SelectedIndexChanged"
									cssclass="subtitleregion" resourcekey="rblSingleImageUploadSelectSourceResource1">
									<asp:listitem selected="True" text="Upload" resourcekey="ListItemResource37">
									</asp:listitem>
									<asp:listitem value="server" text="Add from server folder" resourcekey="ListItemResource38">
									</asp:listitem>
								</asp:radiobuttonlist>
							</div>
							<table cellpadding="2" cellspacing="2" style="width: 650px; text-align: left;">
								<tr>
									<td colspan="2">
										<asp:panel id="pnlSIUAddfromServer" runat="server" visible="False" resourcekey="pnlSIUAddfromServerResource1">
											<table width="100%">
												<tr>
													<td colspan="2">
														<asp:label id="lblSingleImageUploadServerTitle" runat="server" text="Add  images from server folder:"
															cssclass="subtitleregion" resourcekey="lblSingleImageUploadServerTitleResource1">
														</asp:label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblSingleImageUploadServerSelectFolder" ResourceKey="lblSingleImageUploadServerSelectFolder"
															runat="server" Text="Select folder:" HelpText="Select folder:" HelpKey="lblSingleImageUploadServerSelectFolder.HelpText"></dnn:Label>
													</td>
													<td>
														<asp:dropdownlist id="ddlSIUSelectfolder" runat="server" appenddatabounditems="True"
															autopostback="True" causesvalidation="True" onselectedindexchanged="ddlSIUSelectfolder_SelectedIndexChanged"
															resourcekey="ddlSIUSelectfolderResource1">
															<asp:listitem value="\" text="Root" resourcekey="ListItemResource39">
															</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblSingleImageUploadServerSelectFile" ResourceKey="lblSingleImageUploadServerSelectFile"
															runat="server" Text="Select image file to add:" HelpText="Select image file to add:"
															HelpKey="lblSingleImageUploadServerSelectFile.HelpText"></dnn:Label>
													</td>
													<td>
														<asp:dropdownlist id="ddlSIUSelectFile" runat="server" resourcekey="ddlSIUSelectFileResource1">
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblSingleImageUploadServerShowMainGalleryFolder" ResourceKey="lblSingleImageUploadServerShowMainGalleryFolder"
															runat="server" Text="Show main gallery folder:" HelpText="Add main EasyDNN gallery folder to folders list:"
															HelpKey="lblSingleImageUploadServerShowMainGalleryFolder.HelpText"></dnn:Label>
													</td>
													<td>
														<asp:checkbox id="cbSIUShowMinGalFOlder" runat="server" autopostback="True" oncheckedchanged="cbSIUShowMinGalFOlder_CheckedChanged"
															causesvalidation="True" resourcekey="cbSIUShowMinGalFOlderResource1" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblSingleImageUploadServerDeleteOriginal" ResourceKey="lblSingleImageUploadServerDeleteOriginal"
															runat="server" HelpText="File will be copied to gallery folder. Delete original file:"
															Text="Delete original file:" HelpKey="lblSingleImageUploadServerDeleteOriginal.HelpText" />
													</td>
													<td>
														<asp:checkbox id="cbSIUDeleteOriginalFile" runat="server" causesvalidation="True"
															resourcekey="cbSIUDeleteOriginalFileResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
										<asp:panel id="pnlSIUCOmp" runat="server" width="100%" resourcekey="pnlSIUCOmpResource1">
											<table width="100%">
												<tr>
													<td style="width: 249px">
														<dnn:Label ID="lblSingleImageUploadSelectFile" ResourceKey="lblSingleImageUploadSelectFile"
															runat="server" HelpText="Select image file to upload:" Text="Image file to upload:"
															HelpKey="lblSingleImageUploadSelectFile.HelpText" />
													</td>
													<td>
														<asp:fileupload id="fuImageUpload" runat="server" height="25px" width="300px" resourcekey="fuImageUploadResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<asp:label id="lblMessage" runat="server" resourcekey="lblMessageResource1"></asp:label>
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<dnn:Label ID="lblSingleImageUploadTitle" ResourceKey="lblSingleImageUploadTitle"
											runat="server" HelpText="Enter the image title:" Text="Image title:" HelpKey="lblSingleImageUploadTitle.HelpText" />
									</td>
									<td>
										<div id="SIUTitleTextBox" runat="server">
											<asp:textbox id="tbImageTitle" runat="server" validationgroup="Validationg1" width="300px"
												maxlength="250" resourcekey="tbImageTitleResource1">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td>
										<div id="DivUseFilenameCB" runat="server">
											<asp:checkbox id="cbSingleImageUploadFilenameAsTitle" runat="server" oncheckedchanged="cbIUFilenameAsTitle_CheckedChanged"
												text="Use filename as title" resourcekey="cbSingleImageUploadFilenameAsTitleResource1" />
										</div>
										<div id="SIUTitleFeomFilename" runat="server" style="display: none">
											<asp:panel id="pnlIUFilenameasTitle" runat="server" resourcekey="pnlIUFilenameasTitleResource1">
											&nbsp;&nbsp;
											<asp:checkbox id="cbSingleImageUploadRemoveExtenzion" runat="server" text="Remove extension"
												resourcekey="cbSingleImageUploadRemoveExtenzionResource1" />
											<br />
											&nbsp;&nbsp;
											<asp:checkbox id="cbSingleImageUploadTitleReplaceUnderscore" runat="server" text="Set this to replace &quot;_&quot; with blank space in title"
												resourcekey="cbSingleImageUploadTitleReplaceUnderscoreResource1" />
											<br />
											&nbsp;&nbsp;
											<asp:checkbox id="cbSinbleImageUploadTitleReplaceMinus" runat="server" text="Set this to replace &quot;-&quot; with blank space in title"
												resourcekey="cbSinbleImageUploadTitleReplaceMinusResource1" />
											<asp:radiobuttonlist id="rblSingleImageUploadFilenameTitleOptions" runat="server"
												resourcekey="rblSingleImageUploadFilenameTitleOptionsResource1">
												<asp:listitem value="AllUppercase" text="Set this to change title to uppercase" resourcekey="ListItemResource40">
												</asp:listitem>
												<asp:listitem value="AllLowercase" text="Set this to change title to lowercase" resourcekey="ListItemResource41">
												</asp:listitem>
												<asp:listitem value="AllFirstUppercase" text="Set this to change first letter of every 
										word in title to uppercase" resourcekey="ListItemResource42">
												</asp:listitem>
												<asp:listitem value="FirstUppercase" text="Set this to change first letter of title to 
										uppercase" resourcekey="ListItemResource43">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td>
										<div id="DivUseExifMetada" runat="server">
											<asp:checkbox id="cbSingleImageUploadTitleUseMetadata" runat="server" text="Use Exif metadata as title"
												resourcekey="cbSingleImageUploadTitleUseMetadataResource1" />
										</div>
										<div id="DivSIUseExifMetadata" runat="server" style="display: none">
											<asp:checkboxlist id="cblSingleImageUploadTitleUseMetadataOptions" runat="server"
												resourcekey="cblSingleImageUploadTitleUseMetadataOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource44">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource45">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource46">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource47">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource48">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource49">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft" valign="top">
										<dnn:Label ID="lblSingleImageUploadDescription" ResourceKey="lblSingleImageUploadDescription"
											runat="server" HelpText="Enter the image description." Text="Description:" HelpKey="lblSingleImageUploadDescription.HelpText" />
										&nbsp;
									</td>
									<td class="tablecolumnleft" valign="top">
										<div id="DivSIDescriptionTextBox" runat="server">
											<asp:textbox id="tbImageDescription" runat="server" height="150px" maxlength="4000"
												resourcekey="tbImageDescriptionResource1" textmode="MultiLine" width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft" valign="top">
										&nbsp;
									</td>
									<td>
										<div id="DivSIUseMetadataDescription" runat="server">
											<asp:checkbox id="cbSingleImageUploadseExifMetadataDescription" runat="server" text="Use Exif metadata as description"
												resourcekey="cbSingleImageUploadseExifMetadataDescriptionResource1" />
										</div>
										<div id="DivSIUseExifMetadataDescriptionOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cbSingleImageUploadseExifMetadataDescriptionOptions" runat="server"
												resourcekey="cbSingleImageUploadseExifMetadataDescriptionOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource50">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource51">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource52">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource53">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource54">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource55">
												</asp:listitem>
											</asp:checkboxlist>
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
										<dnn:Label ID="lblSingleUmageUploadUrl" ResourceKey="lblSingleUmageUploadUrl" runat="server"
											HelpText="Enter url for media link:" Text="Enter url:" HelpKey="lblSingleUmageUploadUrl.HelpText" />
									</td>
									<td>
										<asp:textbox id="tbSIImageUrl" runat="server" width="300px" resourcekey="tbSIImageUrlResource1">
										</asp:textbox>
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
								<tr id="trSiUploadImageResize" runat="server">
									<td class="tablecolumnleft">
										<dnn:Label ID="lblSingleImageUploadResize" ResourceKey="lblSingleImageUploadResize"
											runat="server" Text="Resize image:" HelpText="Proportionaly resize uploaded image:"
											HelpKey="lblSingleImageUploadResize.HelpText"></dnn:Label>
									</td>
									<td>
										<asp:checkbox id="cbImageUploadResize" runat="server" oncheckedchanged="cbImageUploadResize_CheckedChanged"
											resourcekey="cbImageUploadResizeResource1" />
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td>
										<div id="divSIUResize" runat="server" style="display: none">
											<asp:panel id="pnlImageUploadResize" runat="server" resourcekey="pnlImageUploadResizeResource1">
												<table>
													<tr>
														<td>
															<asp:label id="lblImageUploadResizeWidth" runat="server" text="Max width:" resourcekey="lblImageUploadResizeWidthResource1">
															</asp:label>
														</td>
														<td>
															<asp:textbox id="tbImageUploadResizeWidth" runat="server" width="50px" text="800"
																resourcekey="tbImageUploadResizeWidthResource1">
															</asp:textbox>
															<asp:comparevalidator id="cvImagerResize" runat="server" controltovalidate="tbImageUploadResizeWidth"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																type="Integer" validationgroup="vgImageUpload" resourcekey="cvImagerResizeResource1.ErrorMessage">
															</asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvImageUpload" runat="server" controltovalidate="tbImageUploadResizeWidth"
																errormessage="This filed is required." validationgroup="vgImageUpload" resourcekey="rfvImageUploadResource1.ErrorMessage">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td>
															<asp:label id="lblImageUploadResizeHeight" runat="server" text="Max height:" resourcekey="lblImageUploadResizeHeightResource1">
															</asp:label>
														</td>
														<td>
															<asp:textbox id="tbImageUploadResizeHeight" runat="server" width="50px" text="600"
																resourcekey="tbImageUploadResizeHeightResource1">
															</asp:textbox>
															<asp:comparevalidator id="cvImagerResizeHeight" runat="server" controltovalidate="tbImageUploadResizeHeight"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																type="Integer" validationgroup="vgImageUpload" resourcekey="cvImagerResizeHeightResource1.ErrorMessage">
															</asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvImageUploadHeight" runat="server" controltovalidate="tbImageUploadResizeHeight"
																errormessage="This filed is required." validationgroup="vgImageUpload" resourcekey="rfvImageUploadHeightResource1.ErrorMessage">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td>
															<asp:checkbox id="cbSIUOriginalAsDownload" runat="server" text="Use unresized image as download version." />
														</td>
														<td>
														</td>
													</tr>
												</table>
											</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<asp:label id="Label2" runat="server" text="Image Format:" visible="False" resourcekey="Label2Resource1">
										</asp:label>
									</td>
									<td class="style7">
										<asp:label id="lblFileName" runat="server" visible="False" resourcekey="lblFileNameResource1">
										</asp:label>
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
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td class="style7">
										<asp:button id="btnSingleImageUpload" runat="server" onclick="btnUploadImage_Click"
											text="Upload image file" validationgroup="vgImageUpload" width="140px" resourcekey="btnSingleImageUploadResource1" />
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
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td class="style7">
										&nbsp;
									</td>
								</tr>
							</table>
						</asp:panel>
						<asp:panel id="pnlMultiImageUpload" runat="server" resourcekey="pnlImageSettingsResource1"
							visible="False" width="850px">
							<div style="margin-top: 25px; margin-bottom: 15px;">
								<asp:label id="lblMultiImageTitle" resourcekey="lblMultiImageTitle" runat="server"
									cssclass="subtitleregion" text="Multi image upload"></asp:label>
								<br />
							</div>
							<table cellpadding="2" cellspacing="2" style="width: 650px; text-align: left;">
								<tr>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<asp:label id="lblMultiImageMessage" runat="server" resourcekey="lblMessageResource1">
										</asp:label>
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<dnn:Label ID="lblMultiImageUploadTitle" runat="server" HelpText="Enter the image title:"
											ResourceKey="lblSingleImageUploadTitle" HelpKey="lblSingleImageUploadTitle.HelpText"
											Text="Image title:" />
									</td>
									<td>
										<div id="MIUTitleTextBox" runat="server">
											<asp:textbox id="tbMultiImageTitle" runat="server" maxlength="250" resourcekey="tbImageTitleResource1"
												validationgroup="Validationg1" width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
									</td>
									<td>
										<div id="MultiDivUseFilenameCB" runat="server">
											<asp:checkbox id="cbMultiImageUploadFilenameAsTitle" runat="server" oncheckedchanged="cbIUFilenameAsTitle_CheckedChanged"
												resourcekey="cbSingleImageUploadFilenameAsTitleResource1" text="Use filename as title" />
										</div>
										<div id="MIUTitleFeomFilename" runat="server" style="display: none">
											<asp:panel id="pnlMIUFilenameasTitle" runat="server" resourcekey="pnlIUFilenameasTitleResource1">
											&nbsp;&nbsp;
											<asp:checkbox id="cbMultiImageUploadRemoveExtenzion" runat="server" resourcekey="cbSingleImageUploadRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											&nbsp;&nbsp;
											<asp:checkbox id="cbMultiImageUploadTitleReplaceUnderscore" runat="server" resourcekey="cbSingleImageUploadTitleReplaceUnderscoreResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											&nbsp;&nbsp;
											<asp:checkbox id="cbMultiImageUploadTitleReplaceMinus" runat="server" resourcekey="cbSinbleImageUploadTitleReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblMultiImageUploadFilenameTitleOptions0" runat="server"
												resourcekey="rblSingleImageUploadFilenameTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource40" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource41" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource42" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource43" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td>
										<div id="MultiDivUseExifMetada" runat="server">
											<asp:checkbox id="cbMultiImageUploadTitleUseMetadata" runat="server" resourcekey="cbSingleImageUploadTitleUseMetadataResource1"
												text="Use Exif metadata as title" />
										</div>
										<div id="MultiDivSIUseExifMetadata" runat="server" style="display: none">
											<asp:checkboxlist id="cblMultiImageUploadTitleUseMetadataOptions" runat="server"
												resourcekey="cblSingleImageUploadTitleUseMetadataOptionsResource1">
												<asp:listitem resourcekey="ListItemResource44" text="Artist">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource45" text="Copyright">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource46" text="Image description" value="ImageDescription">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource47" text="Make">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource48" text="Model">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource49" text="Subject location" value="SubjectLocation">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft" rowspan="2" valign="top">
										<dnn:Label ID="lblMultiImageUploadDescription" runat="server" HelpKey="lblSingleImageUploadDescription.HelpText"
											HelpText="Enter the image description." ResourceKey="lblSingleImageUploadDescription"
											Text="Description:" />
										&nbsp;
									</td>
									<td>
										<div id="DivMIDescriptionTextBox" runat="server">
											<asp:textbox id="tbMultiImageDescription" runat="server" height="150px" maxlength="4000"
												resourcekey="tbImageDescriptionResource1" textmode="MultiLine" width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivMIUseMetadataDescription" runat="server">
											<asp:checkbox id="cbMultiImageUploadseExifMetadataDescription" runat="server" resourcekey="cbSingleImageUploadseExifMetadataDescriptionResource1"
												text="Use Exif metadata as description" />
										</div>
										<div id="DivMIUseExifMetadataDescriptionOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cbMultiImageUploadseExifMetadataDescriptionOptions" runat="server"
												resourcekey="cbSingleImageUploadseExifMetadataDescriptionOptionsResource1">
												<asp:listitem resourcekey="ListItemResource50" text="Artist">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource51" text="Copyright">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource52" text="Image description" value="ImageDescription">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource53" text="Make">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource54" text="Model">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource55" text="Subject location" value="SubjectLocation">
												</asp:listitem>
											</asp:checkboxlist>
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
								<tr id="trMultiIUEnterUrl" runat="server">
									<td class="tablecolumnleft">
										<dnn:Label ID="lblMultiUmageUploadUrl" runat="server" HelpKey="lblUmageUploadUrl.HelpText"
											HelpText="Enter url for media link:" ResourceKey="lblSingleUmageUploadUrl" Text="Enter url:" />
									</td>
									<td>
										<asp:textbox id="tbMIImageUrl" runat="server" resourcekey="tbSIImageUrlResource1"
											width="300px">
										</asp:textbox>
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
								<tr id="trMultiImageUplaodResize" runat="server">
									<td class="tablecolumnleft">
										<dnn:Label ID="lblMultiImageUploadResize" runat="server" HelpKey="lblSingleImageUploadResize.HelpText"
											HelpText="Proportionaly resize uploaded image:" ResourceKey="lblSingleImageUploadResize"
											Text="Resize image:" />
									</td>
									<td>
										<asp:checkbox id="cbMultiUploadResize" runat="server" oncheckedchanged="cbImageUploadResize_CheckedChanged"
											resourcekey="cbImageUploadResizeResource1" />
									</td>
								</tr>
								<tr id="trMultiImageUplaodResize2" runat="server">
									<td class="tablecolumnleft">
										&nbsp;
									</td>
									<td>
										<div id="divMIUResize" runat="server" style="display: none">
											<asp:panel id="pnlMultiImageUploadResize" runat="server" resourcekey="pnlImageUploadResizeResource1">
												<table>
													<tr>
														<td>
															<asp:label id="lblMultiImageUploadResizeWidth" runat="server" resourcekey="lblImageUploadResizeWidthResource1"
																text="Max width:"></asp:label>
														</td>
														<td>
															<asp:textbox id="tbMultiImageUploadResizeWidth" runat="server" resourcekey="tbImageUploadResizeWidthResource1"
																text="800" width="50px">
															</asp:textbox>
															<asp:comparevalidator id="cvImagerResize0" runat="server" controltovalidate="tbMultiImageUploadResizeWidth"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																resourcekey="cvImagerResizeResource1.ErrorMessage" type="Integer" validationgroup="vgImageUpload">
															</asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvImageUpload0" runat="server" controltovalidate="tbMultiImageUploadResizeWidth"
																errormessage="This filed is required." resourcekey="rfvImageUploadResource1.ErrorMessage"
																validationgroup="vgImageUpload">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td>
															<asp:label id="lblMultiImageUploadResizeHeight" runat="server" resourcekey="lblImageUploadResizeHeightResource1"
																text="Max height:"></asp:label>
														</td>
														<td>
															<asp:textbox id="tbMultiImageUploadResizeHeight" runat="server" resourcekey="tbImageUploadResizeHeightResource1"
																text="600" width="50px">
															</asp:textbox>
															<asp:comparevalidator id="cvImagerResizeHeight0" runat="server" controltovalidate="tbMultiImageUploadResizeHeight"
																display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
																resourcekey="cvImagerResizeHeightResource1.ErrorMessage" type="Integer" validationgroup="vgImageUpload">
															</asp:comparevalidator>
															<asp:requiredfieldvalidator id="rfvImageUploadHeight0" runat="server" controltovalidate="tbMultiImageUploadResizeHeight"
																errormessage="This filed is required." resourcekey="rfvImageUploadHeightResource1.ErrorMessage"
																validationgroup="vgImageUpload">
															</asp:requiredfieldvalidator>
														</td>
													</tr>
													<tr>
														<td>
															<asp:checkbox id="cbMIUOriginalAsDownload" runat="server" text="Use unresized image as download version." />
														</td>
														<td>
														</td>
													</tr>
												</table>
											</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft">
										<asp:label id="Label6" runat="server" resourcekey="Label2Resource1" text="Image Format:"
											visible="False"></asp:label>
									</td>
									<td class="style7">
										<asp:label id="lblFileName0" runat="server" resourcekey="lblFileNameResource1" visible="False">
										</asp:label>
										<asp:label id="lblPathtoSave" runat="server" visible="False"></asp:label>
									</td>
								</tr>
								<tr id="trPostToJournal" runat="server" visible="false">
									<td class="tablecolumnleft">
										<dnn:Label ID="lblPostToJurnal" runat="server" Text="Post to Journal:" HelpText="Post to Journal:"
											EnableViewState="True" HelpKey="lblPostToJurnal.HelpText" ResourceKey="lblMAUPostToJournal.Text" />
									</td>
									<td class="style7">
										<asp:checkbox id="cbMUIPostToJournal" runat="server" />
									</td>
								</tr>
							</table>
							<br />
							<table cellpadding="0" cellspacing="0" align="center" class="multiuploadcontrol">
								<tr>
									<td>
										<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
											<asp:fileupload id="GalfileInput" runat="server" />
										</div>
										<div style="display: block; float: left; margin-left: 15px;">
											<a class="btnUpload" href="javascript:jQuery('#<%=GalfileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});jQuery('#<%=GalfileInput.ClientID%>').uploadifyUpload();">
												<%=ViewState["startUpload"]%></a> <a href="javascript:jQuery('#<%=GalfileInput.ClientID%>').uploadifyClearQueue();">
													<%=ViewState["ClearQueue"]%>
												</a>
										</div>
										<br />
										<div style="display: none; line-height: 0pt;">
											<asp:button id="btnSaveMultiImageUpload" runat="server" onclick="MultiImageUpload"
												text="Save" />
										</div>
									</td>
								</tr>
							</table>
							<br />
							<br />
						</asp:panel>
						<asp:panel id="pnaAddFolder" runat="server" visible="False" width="850px" resourcekey="pnaAddFolderResource1">
							<table style="width: 650px; text-align: left;">
								<tr>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<asp:label id="lblImageUpladoFromFolderTitle" runat="server" cssclass="subtitleregion"
											text="Add images from folder" resourcekey="lblImageUpladoFromFolderTitleResource1">
										</asp:label>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<asp:label id="lblAIFMessage" runat="server" resourcekey="lblAIFMessageResource1"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style18">
										<asp:label id="lblAddImagesFromFolderSelectFolder" runat="server" text="Select folder:"
											resourcekey="lblAddImagesFromFolderSelectFolderResource1"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlAddImageFolder" runat="server" style="margin-left: 0px"
											resourcekey="ddlAddImageFolderResource1" appenddatabounditems="True">
											<asp:listitem value="\" text="Root" resourcekey="ListItemResource56">
											</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style18">
										<dnn:Label ID="lblAddImagesFromFolderShowMainGallery" ResourceKey="lblAddImagesFromFolderShowMainGallery"
											runat="server" Text="Show main gallery folder:" HelpText="Add main EasyDNN gallery folder to folders list:"
											HelpKey="lblAddImagesFromFolderShowMainGallery.HelpText"></dnn:Label>
									</td>
									<td>
										<asp:checkbox id="chIUShowMainGalFolder" runat="server" autopostback="True" oncheckedchanged="chIUShowMainGalFolder_CheckedChanged"
											resourcekey="chIUShowMainGalFolderResource1" />
									</td>
								</tr>
								<tr>
									<td class="style18" rowspan="3" valign="top">
										<dnn:Label ID="lblAddImagesFromFolderTitleUse" ResourceKey="lblAddImagesFromFolderTitleUse"
											runat="server" HelpText="Use filename or exif metadata as title:" Text="Set title:"
											HelpKey="lblAddImagesFromFolderTitleUse.HelpText" />
									</td>
									<td>
										<div id="ServerFolderTitleTextBox" runat="server">
											<asp:textbox id="tbServerFolderTitleName" runat="server" maxlength="250" resourcekey="tbImageTitleResource1"
												validationgroup="Validationg1" width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivImageFolderUseFilenameCB" runat="server">
											<asp:checkbox id="cbAddImagesFromFolderTitleFilename" runat="server" oncheckedchanged="cbIUFilenameAsTitle_CheckedChanged"
												resourcekey="cbAddImagesFromFolderTitleFilenameResource1" text="Use filename as title" />
											<br />
										</div>
										<div id="divIAFUseFilename" runat="server" style="display: none">
											<asp:checkbox id="cbIUAFRemoveExtenzion" runat="server" resourcekey="cbIUAFRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											<asp:checkbox id="cbAFReplaceTitle" runat="server" resourcekey="cbAFReplaceTitleResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											<asp:checkbox id="cbAFReplaceMinus" runat="server" resourcekey="cbAFReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblImageFolderTitleOptions" runat="server" resourcekey="rblImageFolderTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource57" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource58" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource59" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource60" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivImageFolderMetadataCB" runat="server">
											<asp:checkbox id="cbAddImagesFromFolderTitleMetadata" runat="server" text="Use Exif metadata as title"
												resourcekey="cbAddImagesFromFolderTitleMetadataResource1" />
										</div>
										<div id="DivImageFolderTitleUseExifMetadataOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cblImageFolderMetadataOptions" runat="server" resourcekey="cblImageFolderMetadataOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource61">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource62">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource63">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource64">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource65">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource66">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style18" rowspan="2">
										&nbsp;
										<dnn:Label ID="lblAddImagesFromFolderDescription" ResourceKey="lblAddImagesFromFolderDescription"
											runat="server" HelpText="Enter or use exif metadata as description:" Text="Set description:" />
									</td>
									<td>
										<div id="DivImageFolderDescriptionTB" runat="server">
											<asp:textbox id="tbIUAFImageDescription" runat="server" height="150px" textmode="MultiLine"
												width="300px" resourcekey="tbIUAFImageDescriptionResource1" maxlength="4000">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="DivUmageFolderUseMetadataDescriptionCB" runat="server">
											<asp:checkbox id="cbAddImagesFromFolderDescriptionUseMetadata" runat="server" text="Use Exif metadata as description"
												resourcekey="cbAddImagesFromFolderDescriptionUseMetadataResource1" />
										</div>
										<div id="DivImageFolderuseMetadaDescriptionOptions" runat="server" style="display: none">
											<asp:checkboxlist id="cblAddImagesFromFolderDescriptionMetadataOptions" runat="server"
												resourcekey="cblAddImagesFromFolderDescriptionMetadataOptionsResource1">
												<asp:listitem text="Artist" resourcekey="ListItemResource67">
												</asp:listitem>
												<asp:listitem text="Copyright" resourcekey="ListItemResource68">
												</asp:listitem>
												<asp:listitem value="ImageDescription" text="Image description" resourcekey="ListItemResource69">
												</asp:listitem>
												<asp:listitem text="Make" resourcekey="ListItemResource70">
												</asp:listitem>
												<asp:listitem text="Model" resourcekey="ListItemResource71">
												</asp:listitem>
												<asp:listitem value="SubjectLocation" text="Subject location" resourcekey="ListItemResource72">
												</asp:listitem>
											</asp:checkboxlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style18">
										<dnn:Label ID="lblAddImagesFromFolderUrl" ResourceKey="lblAddImagesFromFolderUrl"
											runat="server" HelpText="Enter url for media link:" Text="Enter url:" HelpKey="lblAddImagesFromFolderUrl.HelpText" />
									</td>
									<td>
										<asp:textbox id="tbAFImagesUrl" runat="server" width="300px" resourcekey="tbAFImagesUrlResource1">
										</asp:textbox>
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr id="trResizeImage" runat="server">
									<td class="style18">
										<dnn:Label ID="lblAddImagesFromFolderResize" ResourceKey="lblAddImagesFromFolderResize"
											runat="server" HelpText="Proportionaly resize uploaded image:" Text="Resize image:"
											HelpKey="lblAddImagesFromFolderResize.HelpText" />
									</td>
									<td>
										<asp:checkbox id="cbAFImageUploadResize" runat="server" oncheckedchanged="cbImageUploadResize_CheckedChanged"
											resourcekey="cbAFImageUploadResizeResource1" />
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td rowspan="2">
										<div id="divAIFImagResize" runat="server" style="display: none">
											<table>
												<tr>
													<td>
														<asp:label id="lblAddImagesFromFolderResizeWidth" runat="server" text="Max width:"
															resourcekey="lblAddImagesFromFolderResizeWidthResource1"></asp:label>
													</td>
													<td>
														<asp:textbox id="tbAFImageUploadResizeWidth" runat="server" width="50px" text="800"
															validationgroup="vgAFImages" resourcekey="tbAFImageUploadResizeWidthResource1">
														</asp:textbox>
														<asp:comparevalidator id="cvAddImagesFromFolderResizeWidth" runat="server" controltovalidate="tbAFImageUploadResizeWidth"
															display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
															type="Integer" validationgroup="vgAFImages" resourcekey="cvAddImagesFromFolderResizeWidthResource1.ErrorMessage">
														</asp:comparevalidator>
														<asp:requiredfieldvalidator id="rfvAddImagesFromFolderResize" runat="server" controltovalidate="tbAFImageUploadResizeWidth"
															errormessage="This filed is required." validationgroup="vgAFImages" resourcekey="rfvAddImagesFromFolderResizeResource1.ErrorMessage">
														</asp:requiredfieldvalidator>
													</td>
												</tr>
												<tr>
													<td>
														<asp:label id="lblAddImagesFromFolderResizeHeight" runat="server" text="Max height:"
															resourcekey="lblAddImagesFromFolderResizeHeightResource1"></asp:label>
													</td>
													<td>
														<asp:textbox id="tbAFImageUploadResizeHeight" runat="server" width="50px" text="600"
															resourcekey="tbAFImageUploadResizeHeightResource1" validationgroup="vgAFImages">
														</asp:textbox>
														<asp:comparevalidator id="cvAddImagesFromFolderResizeHeight" runat="server" controltovalidate="tbAFImageUploadResizeHeight"
															display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
															type="Integer" validationgroup="vgAFImages" resourcekey="cvImagerResizeHeightResource1.ErrorMessage">
														</asp:comparevalidator>
														<asp:requiredfieldvalidator id="rfvAddImagesFromFolderHeight" runat="server" controltovalidate="tbAFImageUploadResizeHeight"
															errormessage="This filed is required." validationgroup="vgAFImages" resourcekey="rfvAddImagesFromFolderHeightResource1.ErrorMessage">
														</asp:requiredfieldvalidator>
													</td>
												</tr>
												<tr>
													<td>
														<asp:checkbox id="cbServerFolderOriginalAsDownload" runat="server" text="Use unresized image as download version." />
													</td>
													<td>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td>
										<asp:button id="btnAddImagesFromFolder" runat="server" onclick="btnAFImages_Click"
											text="Add images" validationgroup="vgAFImages" width="140px" resourcekey="btnAddImagesFromFolderResource1" />
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style18">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</asp:panel>
					</div>
				</div>
			</asp:panel>
		</asp:panel>
		<asp:panel id="pnlVideoUpload" runat="server" visible="False" resourcekey="pnlVideoUploadResource1">
			<div class="videouploadbox">
				<div class="uploadvideoboxbgrd">
					<div class="addvideotitlebgrd">
						<table style="height: 120px;" cellpadding="0" cellspacing="0" class="style1">
							<tr>
								<td align="left" class="style6" valign="bottom">
									<asp:label id="lblAddVideo" resourcekey="lblAddVideo" runat="server" cssclass="AddDesc"
										text="Add video"></asp:label>
								</td>
								<td>
									<table align="center" style="padding-top: 30px;">
										<tr>
											<td align="center">
												<dnn:Label ID="lblVideoUploadMainTitle" runat="server" CssClass="subtitleregion"
													HelpKey="lblVideoUploadMainTitle.HelpText" HelpText="Select to add video file or to add embed video from other video site."
													ResourceKey="lblVideoUploadMainTitle" Text="Add Video" />
											</td>
										</tr>
										<tr>
											<td align="center">
												<asp:radiobuttonlist id="rblVideoUploadTypeSelect" runat="server" autopostback="True"
													cssclass="subtitleregion" onselectedindexchanged="rblVideoUpload_SelectedIndexChanged"
													repeatdirection="Horizontal" resourcekey="rblVideoUploadTypeSelectResource1">
													<asp:listitem resourcekey="ListItemResource73" text="Upload Video" value="UploadFlash">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource74" text="Embed video" value="Embedvideo">
													</asp:listitem>
													<asp:listitem resourcekey="AmazonS3" value="amazons3">Amazon S3</asp:listitem>
												</asp:radiobuttonlist>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<asp:panel id="pnlAmazonS3VideoAupload" runat="server" visible="False">
						<table style="width: 650px; text-align: left;">
							<tr>
								<td align="center" colspan="2">
									<asp:label id="lblAmazonS3Title" resourcekey="liAmazonS3" runat="server" text="Amazon S3"
										cssclass="subtitleregion"></asp:label>
								</td>
							</tr>
							<tr>
								<td class="style10" colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonUploadVideoURL" runat="server" HelpText="Aamazon S3 video URL link."
										Text="Aamazon S3 video URL link:" HelpKey="lblAmazonUploadVideoURL.HelpText"
										ResourceKey="lblAmazonUploadVideoURL" />
								</td>
								<td>
									<asp:textbox id="tbAmazonVideoURL" runat="server" width="350px" validationgroup="vgAmazonVideoUpload"
										font-size="11px">
									</asp:textbox>
									<asp:requiredfieldvalidator id="rfvAmazonVideoURL" runat="server" controltovalidate="tbAmazonVideoURL"
										errormessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
										validationgroup="vgAmazonVideoUpload">
									</asp:requiredfieldvalidator>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonUploadVideoTitle" runat="server" HelpKey="lblAmazonUploadVideoTitle.HelpText"
										HelpText="Enter the title of video file:" ResourceKey="lblAmazonUploadVideoTitle"
										Text="Video title:" />
								</td>
								<td>
									<div id="divAmazonVideoTitle" runat="server">
										<asp:textbox id="tbAmazonVideoTitle" runat="server" resourcekey="tbFlashTitleResource1"
											width="300px">
										</asp:textbox>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:checkbox id="cbAmazonUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
										resourcekey="cbVideoUploadFilenameAsTitleResource1" text="Use filename as title" />
									<div id="divAmazonFilenameAsTitle" runat="server" style="display: none">
										<asp:panel id="pnlVUFilenameasTitle0" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
											<asp:checkbox id="cbAmazonVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											<asp:checkbox id="cbAmazonVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											<asp:checkbox id="cbAmazonVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblAmazonVideoUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource79" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource80" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource81" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource82" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonVideoUploadDescription" runat="server" ControlName="tbFlashDescription"
										HelpKey="lblVideoUploadDescription.HelpText" HelpText="Enter the video description:"
										ResourceKey="lblVideoUploadDescription" Text="Description:" />
								</td>
								<td>
									<asp:textbox id="tbAmazonVideoDescription" runat="server" height="150px" maxlength="4000"
										resourcekey="tbFlashDescriptionResource1" textmode="MultiLine" width="300px">
									</asp:textbox>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonUploadWidth" runat="server" ControlName="tbFlashWidth" HelpKey="lblVideoUploadWidth.HelpText"
										HelpText="Enter the video width to be used displaying video:" ResourceKey="lblVideoUploadWidth"
										Text="Video width:" />
								</td>
								<td>
									<asp:textbox id="tbAmazonVideoWidth" runat="server" resourcekey="tbFlashWidthResource1"
										validationgroup="vgAmazonVideoUpload" width="50px">
									</asp:textbox>
									<asp:comparevalidator id="cvAmazonVideoUploadWidth" runat="server" controltovalidate="tbAmazonVideoWidth"
										errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
										type="Integer" validationgroup="vgAmazonVideoUpload">
									</asp:comparevalidator>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonVideoUploadHeight" runat="server" ControlName="tbFlashHeight"
										HelpKey="lblVideoUploadHeight.HelpText" HelpText="Enter the video height to be used when displaying video:"
										ResourceKey="lblVideoUploadHeight" Text="Video height:" />
								</td>
								<td>
									<asp:textbox id="tbAmazonVideoHeight" runat="server" resourcekey="tbFlashHeightResource1"
										width="50px" validationgroup="vgAmazonVideoUpload">
									</asp:textbox>
									<asp:comparevalidator id="cvAmazonVideoUploadHeight" runat="server" controltovalidate="tbAmazonVideoHeight"
										errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
										type="Integer" validationgroup="vgAmazonVideoUpload">
									</asp:comparevalidator>
								</td>
							</tr>
							<tr>
								<td class="style231">
									<dnn:Label ID="lblAmazonVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
										HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
										Text="Thumbnail:" />
								</td>
								<td class="style232">
									<asp:radiobuttonlist id="rblAmazonVideoThumbnailSelect" runat="server" onload="rblFlashThumbnail_Load"
										onselectedindexchanged="rblVideoThumbnailSelect_SelectedIndexChanged" repeatdirection="Horizontal"
										resourcekey="rblVideoThumbnailSelectResource1">
										<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
											value="standard">
										</asp:listitem>
										<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
										</asp:listitem>
									</asp:radiobuttonlist>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<div id="divAmazonStandardImage" runat="server">
										<asp:label id="lblAmazonVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
											text="Select standard thumbnail:"></asp:label>
										&nbsp;<asp:dropdownlist id="ddlAmazobVideoThumbSelect" runat="server" onload="ddlAmazobVideoThumbSelect_Load"
											resourcekey="ddlVUThumbSelectResource1">
										</asp:dropdownlist>
									</div>
								</td>
							</tr>
							<tr>
								<td class="style22">
									&nbsp;
								</td>
								<td class="style23">
									<div id="divAmazonUploadThumb" runat="server" style="display: none">
										<asp:label id="lblVideoUploadSelectThumbnailToUpload0" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
											text="Select thumbnail to upload:"></asp:label>
										&nbsp;
										<asp:fileupload id="fuAmazonThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
											width="322px" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:label id="lblAmazonUploadMessage" runat="server"></asp:label>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:button id="btnAmazonVideoUpload" runat="server" onclick="btnAmazonVideoUpload_Click"
										oncommand="btnAmazonVideoUpload_Command" resourcekey="btnAmazonVideoUpload" style="height: 26px"
										text="Upload" validationgroup="vgAmazonVideoUpload" width="90px" />
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
					</asp:panel>
					<asp:panel id="pnlFlashUploadFlash" runat="server" visible="False" width="850px"
						resourcekey="pnlFlashUploadFlashResource1">
						<table style="width: 650px; text-align: left;">
							<tr>
								<td>
									<div align="center" style="margin-top: 25px; margin-bottom: 15px;">
										<asp:label id="lblVideoUploadTitle" runat="server" cssclass="subtitleregion" text="Video Upload"
											resourcekey="lblVideoUploadTitleResource1"></asp:label>
										<br />
										<asp:radiobuttonlist id="rblVideoUploadSelctSource" runat="server" autopostback="True"
											onselectedindexchanged="rblVUSelctSorce_SelectedIndexChanged" repeatdirection="Horizontal"
											causesvalidation="True" cssclass="subtitleregion" resourcekey="rblVideoUploadSelctSourceResource1">
											<asp:listitem selected="True" value="upload" text="Upload video" resourcekey="ListItemResource75">
											</asp:listitem>
											<asp:listitem resourcekey="MultiVideoUpload" value="multi">Multi video upload</asp:listitem>
											<asp:listitem value="server" text="Add single video from server folder" resourcekey="ListItemResource76">
											</asp:listitem>
											<asp:listitem value="folder" text="Add all videos from server folder" resourcekey="ListItemResource77">
											</asp:listitem>
										</asp:radiobuttonlist>
									</div>
								</td>
							</tr>
						</table>
						<asp:panel id="pnlSingleVideoUpload" runat="server">
							<table style="width: 650px; text-align: left;">
								<tr>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style10" colspan="2">
										&nbsp; &nbsp;<asp:label id="lblVideoMessage" runat="server" resourcekey="lblVideoMessageResource1"></asp:label>
										&nbsp;<asp:panel id="pnlUVUpload" runat="server" resourcekey="pnlUVUploadResource1">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblVideoUploadFileSelect" runat="server" HelpKey="lblVideoUploadFileSelect.HelpText"
															HelpText="Select the file to upload:" ResourceKey="lblVideoUploadFileSelect"
															Text="Please select the file to upload:" />
													</td>
													<td>
														<asp:fileupload id="fuFlash" runat="server" resourcekey="fuFlashResource1" width="300px" />
													</td>
												</tr>
											</table>
										</asp:panel>
										<br />
										<asp:panel id="pnlVUFromServer" runat="server" resourcekey="pnlVUFromServerResource1"
											visible="False">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td colspan="2">
														<asp:label id="lblVideoUploadAddFileFromServer" runat="server" cssclass="subtitleregion"
															resourcekey="lblVideoUploadAddFileFromServerResource1" text="Add video from folder:">
														</asp:label>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblVideoUploadFolderSelect" runat="server" HelpKey="lblVideoUploadFolderSelect.HelpText"
															HelpText="Select folder:" ResourceKey="lblVideoUploadFolderSelect" Text="Select folder:" />
													</td>
													<td>
														<asp:dropdownlist id="ddlVideoUploadFolders" runat="server" appenddatabounditems="True"
															autopostback="True" causesvalidation="True" onselectedindexchanged="ddlFolders_SelectedIndexChanged"
															resourcekey="ddlVideoUploadFoldersResource1">
															<asp:listitem resourcekey="ListItemResource78" text="Root" value="\">
															</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblVideoUploadFiles" runat="server" HelpKey="lblVideoUploadFiles.HelpText"
															HelpText="Select file:" ResourceKey="lblVideoUploadFiles" Text="Select file:" />
													</td>
													<td>
														<asp:dropdownlist id="ddlVUFiles" runat="server" datatextfield="Name" datavaluefield="Name"
															resourcekey="ddlVUFilesResource1">
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblVideoUploadShowMainGalleryFolder" runat="server" HelpKey="lblVideoUploadShowMainGalleryFolder.HelpText"
															HelpText="Add main EasyDNN gallery folder to folders list:" ResourceKey="lblVideoUploadShowMainGalleryFolder"
															Text="Show main gallery folder:" />
													</td>
													<td>
														<asp:checkbox id="cbVUShowMainGalFolder" runat="server" autopostback="True" oncheckedchanged="cbVUShowMainGalFolder_CheckedChanged"
															resourcekey="cbVUShowMainGalFolderResource1" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblVideoUploadDeleteOriginalFile" runat="server" HelpKey="lblVideoUploadDeleteOriginalFile.HelpText"
															HelpText="File will be copied to gallery folder. Delete original file:" ResourceKey="lblVideoUploadDeleteOriginalFile"
															Text="Delete original file:" />
													</td>
													<td>
														<asp:checkbox id="cbVUDeleteFile" runat="server" resourcekey="cbVUDeleteFileResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<asp:panel id="pnlAVF" runat="server" resourcekey="pnlAVFResource1" visible="False">
											<table style="width: 650px; text-align: left;">
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblAddVideoFolderSelectFolder" runat="server" HelpKey="lblAddVideoFolderSelectFolder.HelpText"
															HelpText="Select folder:" ResourceKey="lblAddVideoFolderSelectFolder" Text="Select folder:" />
													</td>
													<td>
														<asp:dropdownlist id="ddlAVFFolders" runat="server" autopostback="True" causesvalidation="True"
															resourcekey="ddlAVFFoldersResource1">
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblAddVideoFolderShowMainGalleryFolder" runat="server" HelpKey="lblAddVideoFolderShowMainGalleryFolder.HelpText"
															HelpText="Add main EasyDNN gallery folder to folders list:" ResourceKey="lblAddVideoFolderShowMainGalleryFolder"
															Text="Show main gallery folder:" />
													</td>
													<td>
														<asp:checkbox id="cbAVFShowMainGalFolder" runat="server" autopostback="True" oncheckedchanged="cbAVFShowMainGalFolder_CheckedChanged"
															resourcekey="cbAVFShowMainGalFolderResource1" />
													</td>
												</tr>
												<tr>
													<td class="tablecolumnleft2">
														<dnn:Label ID="lblAddVideoFolderDeleteOriginalFile" runat="server" HelpKey="lblAddVideoFolderDeleteOriginalFile.HelpText"
															HelpText="File will be copied to gallery folder. Delete original file:" ResourceKey="lblAddVideoFolderDeleteOriginalFile"
															Text="Delete original file:" />
													</td>
													<td>
														<asp:checkbox id="cbAVFDeleteFile" runat="server" resourcekey="cbAVFDeleteFileResource1" />
													</td>
												</tr>
											</table>
										</asp:panel>
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
										<dnn:Label ID="lblVideoUploadVideoTitle" runat="server" ControlName="tbFlashTitle"
											HelpKey="lblVideoUploadVideoTitle.HelpText" HelpText="Enter the title of video file:"
											ResourceKey="lblVideoUploadVideoTitle" Text="Video title:" />
									</td>
									<td>
										<div id="divVideoTitle" runat="server">
											<asp:textbox id="tbFlashTitle" runat="server" resourcekey="tbFlashTitleResource1"
												width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										<asp:checkbox id="cbVideoUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
											resourcekey="cbVideoUploadFilenameAsTitleResource1" text="Use filename as title" />
										<div id="divVUFilenameAsTitle" runat="server" style="display: none">
											<asp:panel id="pnlVUFilenameasTitle" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
												<asp:checkbox id="cbVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
													text="Remove extension" />
												<br />
												<asp:checkbox id="cbVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
													text="Set this to replace &quot;_&quot; with blank space in title" />
												<br />
												<asp:checkbox id="cbVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
													text="Set this to replace &quot;-&quot; with blank space in title" />
												<asp:radiobuttonlist id="rblVideoUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
													<asp:listitem resourcekey="ListItemResource79" text="Set this to change title to uppercase"
														value="AllUppercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource80" text="Set this to change title to lowercase"
														value="AllLowercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource81" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource82" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
													</asp:listitem>
												</asp:radiobuttonlist>
											</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblVideoUploadDescription" runat="server" ControlName="tbFlashDescription"
											HelpKey="lblVideoUploadDescription.HelpText" HelpText="Enter the video description:"
											ResourceKey="lblVideoUploadDescription" Text="Description:" />
									</td>
									<td>
										<asp:textbox id="tbFlashDescription" runat="server" height="150px" maxlength="4000"
											resourcekey="tbFlashDescriptionResource1" textmode="MultiLine" width="300px">
										</asp:textbox>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblVideoUploadWidth" runat="server" ControlName="tbFlashWidth" HelpKey="lblVideoUploadWidth.HelpText"
											HelpText="Enter the video width to be used displaying video:" ResourceKey="lblVideoUploadWidth"
											Text="Video width:" />
									</td>
									<td>
										<asp:textbox id="tbFlashWidth" runat="server" resourcekey="tbFlashWidthResource1"
											validationgroup="vgVideoUpload" width="50px">
										</asp:textbox>
										<asp:comparevalidator id="cvVideoUploadWidth" runat="server" controltovalidate="tbFlashWidth"
											errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
											type="Integer" validationgroup="vgVideoUpload">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblVideoUploadHeight" runat="server" ControlName="tbFlashHeight" HelpKey="lblVideoUploadHeight.HelpText"
											HelpText="Enter the video height to be used when displaying video:" ResourceKey="lblVideoUploadHeight"
											Text="Video height:" />
									</td>
									<td>
										<asp:textbox id="tbFlashHeight" runat="server" resourcekey="tbFlashHeightResource1"
											width="50px">
										</asp:textbox>
										<asp:comparevalidator id="cvVideoUploadheight" runat="server" controltovalidate="tbFlashHeight"
											errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
											type="Integer" validationgroup="vgVideoUpload">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style231">
										<dnn:Label ID="lblVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
											HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
											Text="Thumbnail:" />
									</td>
									<td class="style232">
										<asp:radiobuttonlist id="rblVideoThumbnailSelect" runat="server" onload="rblFlashThumbnail_Load"
											repeatdirection="Horizontal" resourcekey="rblVideoThumbnailSelectResource1" onselectedindexchanged="rblVideoThumbnailSelect_SelectedIndexChanged">
											<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
												value="standard">
											</asp:listitem>
											<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
											</asp:listitem>
										</asp:radiobuttonlist>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										<div id="divVUStandardImage" runat="server">
											<asp:label id="lblVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
												text="Select standard thumbnail:"></asp:label>
											&nbsp;<asp:dropdownlist id="ddlVUThumbSelect" runat="server" onload="dllVUThumbSelect_Load"
												resourcekey="ddlVUThumbSelectResource1">
											</asp:dropdownlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style22">
										&nbsp;
									</td>
									<td class="style23">
										<div id="divVUUploadThumb" runat="server" style="display: none">
											<asp:label id="lblVideoUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
												text="Select thumbnail to upload:"></asp:label>
											&nbsp;
											<asp:fileupload id="fuFlashThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
												width="322px" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
										<dnn:Label ID="lblVideoUploadStartupImage" runat="server" HelpText="Upload the image for video file or use standard image to be used as startup image:"
											Text="Startup image:" HelpKey="lblVideoUploadStartupImage.HelpText" ResourceKey="lblVideoUploadStartupImage" />
									</td>
									<td>
										<asp:checkbox id="cbVideoStartUp" runat="server" resourcekey="cbVideoStartUp" text="Use thumbnail as startup image"
											checked="True" />
										<div id="DivVUStartupImagesetup" runat="server" style="display: none">
											<asp:radiobuttonlist id="rblVideoStartupImageSelect" runat="server" onload="rblFlashThumbnail_Load"
												onselectedindexchanged="rblVideoThumbnailSelect_SelectedIndexChanged" repeatdirection="Horizontal"
												resourcekey="rblVideoThumbnailSelectResource1">
												<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
													value="standard">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
												</asp:listitem>
											</asp:radiobuttonlist>
											<div id="divVUStandardStartImage" runat="server">
												<asp:label id="lblVideoUploadSelectStartImage" runat="server" resourcekey="lblVideoUploadSelectStartImage"
													text="Select standard start image:"></asp:label>
												&nbsp;<asp:dropdownlist id="ddlVUStartImageSelect" runat="server" onload="dllVUThumbSelect_Load">
												</asp:dropdownlist>
											</div>
											<div id="divVideoStartupImage" runat="server" style="display: none">
												<asp:label id="lblVideoStartupImage" runat="server" resourcekey="lblVideoStartupImage"
													text="Select thumbnail to upload:"></asp:label>
												&nbsp;
												<asp:fileupload id="fuVideoStartupImage" runat="server" width="322px" />
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										<asp:button id="btnVideoUpload" runat="server" onclick="btnFashUpload_Click" resourcekey="btnVideoUploadResource1"
											style="height: 26px" text="Upload" validationgroup="vgVideoUpload" width="90px" />
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
						</asp:panel>
						<asp:panel id="pnlMultiVideoUpload" runat="server" visible="False">
							<table style="width: 650px; text-align: left;">
								<tr>
									<td colspan="2">
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
										<dnn:Label ID="lblMultiVideoUploadVideoTitle" runat="server" ControlName="tbFlashTitle"
											HelpKey="lblVideoUploadVideoTitle.HelpText" HelpText="Enter the title of video file:"
											ResourceKey="lblVideoUploadVideoTitle" Text="Video title:" />
									</td>
									<td>
										<div id="divMultiVideoTitle" runat="server">
											<asp:textbox id="tbMultiFlashTitle" runat="server" resourcekey="tbFlashTitleResource1"
												width="300px">
											</asp:textbox>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										<asp:checkbox id="cbMultiVideoUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
											resourcekey="cbVideoUploadFilenameAsTitleResource1" text="Use filename as title" />
										<div id="divMultiVUFilenameAsTitle" runat="server" style="display: none">
											<asp:panel id="pnlMultiVUFilenameasTitle" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
												<asp:checkbox id="cbMultiVideoUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
													text="Remove extension" />
												<br />
												<asp:checkbox id="cbMultiVideoUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
													text="Set this to replace &quot;_&quot; with blank space in title" />
												<br />
												<asp:checkbox id="cbMultiVideoUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
													text="Set this to replace &quot;-&quot; with blank space in title" />
												<asp:radiobuttonlist id="rblMulitVideoUploadTitleOptionsList" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
													<asp:listitem resourcekey="ListItemResource79" text="Set this to change title to uppercase"
														value="AllUppercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource80" text="Set this to change title to lowercase"
														value="AllLowercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource81" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource82" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
													</asp:listitem>
												</asp:radiobuttonlist>
											</asp:panel>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblMultiVideoUploadDescription" runat="server" ControlName="tbFlashDescription"
											HelpKey="lblVideoUploadDescription.HelpText" HelpText="Enter the video description:"
											ResourceKey="lblVideoUploadDescription" Text="Description:" />
									</td>
									<td>
										<asp:textbox id="tbMultiFlashDescription" runat="server" height="150px" maxlength="4000"
											resourcekey="tbFlashDescriptionResource1" textmode="MultiLine" width="300px">
										</asp:textbox>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblMultiVideoUploadWidth" runat="server" ControlName="tbFlashWidth"
											HelpKey="lblVideoUploadWidth.HelpText" HelpText="Enter the video width to be used displaying video:"
											ResourceKey="lblVideoUploadWidth" Text="Video width:" />
									</td>
									<td>
										<asp:textbox id="tbMultiFlashWidth" runat="server" resourcekey="tbFlashWidthResource1"
											validationgroup="vgVideoUpload" width="50px">
										</asp:textbox>
										<asp:comparevalidator id="cvMultiVideoUploadWidth" runat="server" controltovalidate="tbMultiFlashWidth"
											errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadWidthResource1.ErrorMessage"
											type="Integer" validationgroup="vgVideoUpload">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblMultiVideoUploadHeight" runat="server" ControlName="tbFlashHeight"
											HelpKey="lblVideoUploadHeight.HelpText" HelpText="Enter the video height to be used when displaying video:"
											ResourceKey="lblVideoUploadHeight" Text="Video height:" />
									</td>
									<td>
										<asp:textbox id="tbMultiFlashHeight" runat="server" resourcekey="tbFlashHeightResource1"
											width="50px">
										</asp:textbox>
										<asp:comparevalidator id="cvMultiVideoUploadheight" runat="server" controltovalidate="tbMultiFlashHeight"
											errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVideoUploadheightResource1.ErrorMessage"
											type="Integer" validationgroup="vgVideoUpload">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style231">
										<dnn:Label ID="lblMultiVideoUploadThumbnail" runat="server" HelpKey="lblVideoUploadThumbnail.HelpText"
											HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblVideoUploadThumbnail"
											Text="Thumbnail:" />
									</td>
									<td class="style232">
										<asp:radiobuttonlist id="rblMultiVideoThumbnailSelect" runat="server" onload="rblFlashThumbnail_Load"
											repeatdirection="Horizontal" resourcekey="rblVideoThumbnailSelectResource1" onselectedindexchanged="rblMultiVideoThumbnailSelect_SelectedIndexChanged">
											<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
												value="standard">
											</asp:listitem>
											<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
											</asp:listitem>
										</asp:radiobuttonlist>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										<div id="divMultiVUStandardImage" runat="server">
											<asp:label id="lblMultiVideoUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
												text="Select standard thumbnail:"></asp:label>
											&nbsp;<asp:dropdownlist id="ddlMultiVUThumbSelect" runat="server" onload="ddlMultiVUThumbSelect_Load"
												resourcekey="ddlVUThumbSelectResource1">
											</asp:dropdownlist>
										</div>
									</td>
								</tr>
								<tr>
									<td class="style22">
										&nbsp;
									</td>
									<td class="style23">
										<div id="divMultiVUUploadThumb" runat="server" style="display: none">
											<asp:label id="lblMultiVideoUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
												text="Select thumbnail to upload:"></asp:label>
											&nbsp;
											<asp:fileupload id="fuMultiFlashThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
												width="322px" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										<dnn:Label ID="lblVideoMultiUploadStartupImage" runat="server" HelpText="Upload the image for video file or use standard image to be used as startup image:"
											Text="Startup image:" ResourceKey="lblVideoMultiUploadStartupImage" HelpKey="lblVideoMultiUploadStartupImage.HelpText" />
									</td>
									<td>
										<asp:checkbox id="cbMultiVideoStartUp" runat="server" text="Upload startup image"
											resourcekey="cbMultiVideoStartUp" checked="True" />
										<div id="DivMUltiVideoStartupSetup" runat="server" style="display: none">
											<asp:radiobuttonlist id="rblMultiVideoStartupImageSelect" runat="server" onload="rblFlashThumbnail_Load"
												onselectedindexchanged="rblVideoThumbnailSelect_SelectedIndexChanged" repeatdirection="Horizontal"
												resourcekey="rblVideoThumbnailSelectResource1">
												<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
													value="standard">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
												</asp:listitem>
											</asp:radiobuttonlist>
											<div id="divMultiVUStandardStartImage" runat="server">
												<asp:label id="lblMultiStartupImage" runat="server" resourcekey="lblMultiStartupImage"
													text="Select standard start image:"></asp:label>
												&nbsp;<asp:dropdownlist id="ddlMultiStartupStandard" runat="server" onload="dllVUThumbSelect_Load">
												</asp:dropdownlist>
												<br />
											</div>
											<div id="DivMultiStartupUpload" runat="server" style="display: none">
												<asp:label id="lblMultiStartupUpload" runat="server" resourcekey="lblMultiStartupUpload"
													text="Select thumbnail to upload:"></asp:label>
												&nbsp;
												<asp:fileupload id="fuMultiStartupUpload" runat="server" width="322px" />
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="tablecolumnleft2">
										&nbsp;
									</td>
									<td>
										&nbsp;
										<asp:label id="lblMultiVideoUploadMessage" runat="server" visible="False"></asp:label>
									</td>
								</tr>
							</table>
							<br />
							<table cellpadding="0" cellspacing="0" align="center" class="multiuploadcontrol">
								<tr>
									<td>
										<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
											<asp:fileupload id="MultiVideoFileInput" runat="server" enabletheming="True" />
										</div>
										<div style="display: block; float: left; margin-left: 15px;">
											<a class="btnUpload" href="javascript:jQuery('#<%=MultiVideoFileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});jQuery('#<%=MultiVideoFileInput.ClientID%>').uploadifyUpload();">
												<%=ViewState["startUpload"]%></a> <a href="javascript:jQuery('#<%=MultiVideoFileInput.ClientID%>').uploadifyClearQueue();">
													<%=ViewState["ClearQueue"]%></a>
										</div>
										<div style="display: none; line-height: 0pt;">
											<asp:button id="btnSaveMultiVideoUpload" runat="server" onclick="MultiVideoUpload"
												text="Save" />
										</div>
									</td>
								</tr>
							</table>
							<br />
							<br />
						</asp:panel>
					</asp:panel>
					<asp:panel id="pnlFlashEmbeedFlasf" runat="server" visible="False" resourcekey="pnlFlashEmbeedFlasfResource1">
						<div style="margin-top: 25px; margin-bottom: 15px;">
							<table style="width: 650px; text-align: left;">
								<tr>
									<td align="center">
										<dnn:Label ID="lblEmbedVideoTitle" ResourceKey="lblEmbedVideoTitle" runat="server"
											Text="Embed Video" HelpText="Embed video from various video sites." CssClass="subtitleregion"
											HelpKey="lblEmbedVideoTitle.HelpText"></dnn:Label>
									</td>
								</tr>
								<tr>
									<td align="center">
										<asp:radiobuttonlist id="rblEmbedVideoSourceSelect" runat="server" autopostback="True"
											repeatdirection="Horizontal" onselectedindexchanged="rblVideoSources_SelectedIndexChanged"
											height="29px" width="415px" cssclass="subtitleregion" resourcekey="rblEmbedVideoSourceSelectResource1">
											<asp:listitem text="YouTube" value="YouTube" resourcekey="ListItemResource85" selected="True">
											</asp:listitem>
											<asp:listitem text="Vimeo" value="Vimeo" resourcekey="ListItemResource86">
											</asp:listitem>
											<asp:listitem text="Dailymotion" resourcekey="ListItemResource87">
											</asp:listitem>
											<asp:listitem text="Metacafe" resourcekey="ListItemResource88">
											</asp:listitem>
											<asp:listitem resourcekey="liBitsOnTheRun" value="bitsrun">Bits on the Run</asp:listitem>
											<asp:listitem resourcekey="liBrightCrove" value="Brightcove">Brightcove</asp:listitem>
											<asp:listitem text="Others" resourcekey="ListItemResource89">
											</asp:listitem>
										</asp:radiobuttonlist>
										<asp:requiredfieldvalidator id="rfvEmbedVideoSourceSelect" runat="server" controltovalidate="rblEmbedVideoSourceSelect"
											errormessage="Please select." validationgroup="EmbedVideo" resourcekey="rfvEmbedVideoSourceSelectResource1.ErrorMessage">
										</asp:requiredfieldvalidator>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<table style="width: 650px; text-align: left;">
							<tr id="trEnterEmbedCodeRow" runat="server" visible="false">
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblEmbedVideoCode" ResourceKey="lblEmbedVideoCode" runat="server"
										Text="Embed code:" ControlName="tbFlashEmbedUrl" HelpText="Enter video embed code:"
										HelpKey="lblEmbedVideoCode.HelpText"></dnn:Label>
								</td>
								<td>
									<asp:textbox id="tbVideoEmbedCode" runat="server" width="300px" maxlength="2500"
										textmode="MultiLine" height="150px" validationgroup="EmbedVideo" resourcekey="tbFlashEmbedUrlResource1">
									</asp:textbox>
								</td>
								<td>
									<asp:requiredfieldvalidator id="rfvEmbedVideoCode" runat="server" controltovalidate="tbVideoEmbedCode"
										errormessage="This filed is required." validationgroup="EmbedVideo" resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage">
									</asp:requiredfieldvalidator>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblEembedVideoUrl" ResourceKey="lblEembedVideoUrl" runat="server"
										Text="Video url:" ControlName="tbEmbedShortUrl" HelpText="Enter video url:" HelpKey="lblEembedVideoUrl.HelpText"></dnn:Label>
								</td>
								<td>
									<asp:textbox id="tbEmbedVideoURL" runat="server" width="300px" validationgroup="EmbedVideo"
										resourcekey="tbEmbedShortUrlResource1">
									</asp:textbox>
								</td>
								<td>
									<asp:requiredfieldvalidator id="rfvEmbedVideoURL" runat="server" controltovalidate="tbEmbedVideoURL"
										errormessage="This filed is required." validationgroup="EmbedVideo" resourcekey="rfvEmbedVideoURLResource1.ErrorMessage">
									</asp:requiredfieldvalidator>
								</td>
							</tr>
							<tr id="trEmbedVideoDimensions" runat="server">
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblEmbedVideoDimensions" runat="server" Text="Video dimensions:" HelpText="Video dimensions:"
										HelpKey="lblEmbedVideoDimensions.HelpText" ResourceKey="lblEmbedVideoDimensions"></dnn:Label>
								</td>
								<td>
									<asp:label id="lblEmbedVideoWidth" ResourceKey="lblEmbedVideoWidth" runat="server" text="Width:"></asp:label>
									<asp:textbox id="tbEmbedVideoWidth" runat="server" width="30px" validationgroup="EmbedVideo">560</asp:textbox>
									&nbsp;<asp:requiredfieldvalidator id="rfvEmbedVideoWidth" runat="server" controltovalidate="tbEmbedVideoWidth"
										display="Dynamic" errormessage="This filed is required." resourcekey="rfvEmbedVideoURLResource1.ErrorMessage"
										validationgroup="EmbedVideo"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvEmbedVideoWidth" runat="server" controltovalidate="tbEmbedVideoWidth"
										display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
										resourcekey="cvVideoEditHeightResource1.ErrorMessage" type="Integer" validationgroup="EmbedVideo">
									</asp:comparevalidator>
									<asp:label id="lblEmbedVideoHeight" ResourceKey="lblEmbedVideoHeight" runat="server" text="Height:"></asp:label>
									<asp:textbox id="tbEmbedVideoHeight" runat="server" width="30px" validationgroup="EmbedVideo">315</asp:textbox>
									<asp:requiredfieldvalidator id="rfvEmbedVideoCode0" runat="server" controltovalidate="tbEmbedVideoHeight"
										display="Dynamic" errormessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
										validationgroup="EmbedVideo">
									</asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvEmbedVideoHeight" runat="server" controltovalidate="tbEmbedVideoHeight"
										display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
										resourcekey="cvVideoEditHeightResource1.ErrorMessage" type="Integer" validationgroup="EmbedVideo">
									</asp:comparevalidator>
								</td>
								<td>
									&nbsp; 
								</td>
							</tr>
							<tr>
								<td>
									&nbsp; 
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblEmbedVideoEnterTitle" ResourceKey="lblEmbedVideoEnterTitle" runat="server"
										Text="Video title:" ControlName="tbFlashEmbedTitle" HelpText="Enter video title."
										HelpKey="lblEmbedVideoEnterTitle.HelpText"></dnn:Label>
								</td>
								<td>
									<asp:textbox id="tbFlashEmbedTitle" runat="server" width="300px" validationgroup="EmbedVideo"
										resourcekey="tbFlashEmbedTitleResource1">
									</asp:textbox>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblEmbedVideoDescription" ResourceKey="lblEmbedVideoDescription" runat="server"
										Text="Description:" ControlName="tbFlashEmbedDescription" HelpText="Enter video description."
										HelpKey="lblEmbedVideoDescription.HelpText"></dnn:Label>
								</td>
								<td>
									<asp:textbox id="tbFlashEmbedDescription" runat="server" height="150px" textmode="MultiLine"
										width="300px" resourcekey="tbFlashEmbedDescriptionResource1" maxlength="4000">
									</asp:textbox>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<asp:radiobuttonlist id="rblEmbedVideoThumbnail" runat="server" onselectedindexchanged="rblEVThumbCreate_SelectedIndexChanged"
										width="176px" autopostback="True" resourcekey="rblEmbedVideoThumbnailResource1">
										<asp:listitem selected="True" value="Autocreate" text="Auto create thumbnail" resourcekey="ListItemResource90">
										</asp:listitem>
										<asp:listitem value="Upload" text="Upload thumbnail" resourcekey="ListItemResource91">
										</asp:listitem>
										<asp:listitem value="standard" text="Use standard image" resourcekey="ListItemResource92">
										</asp:listitem>
									</asp:radiobuttonlist>
								</td>
								<td colspan="2">
									<div id="divEVEFileUpload" runat="server" style="display: none">
										<asp:fileupload id="fuEmbedAddThumb" runat="server" width="300px" resourcekey="fuEmbedAddThumbResource1" />
										<br />
									</div>
									<div id="divEVESelectThumb" runat="server" style="display: none">
										<asp:dropdownlist id="ddlVUEVSelectThumbnail" runat="server" onload="ddlVUEVSelectThumbnail_Load"
											causesvalidation="True" resourcekey="ddlVUEVSelectThumbnailResource1">
										</asp:dropdownlist>
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
								<td>
									&nbsp;
								</td>
							</tr>
							<tr id="trMVUPostToJournal" runat="server" visible="false">
								<td class="tablecolumnleft">
									<dnn:Label ID="lblMVUPostToJournal" runat="server" Text="Post to Journal:" HelpText="Post to Journal:"
										EnableViewState="True" ResourceKey="lblMAUPostToJournal.Text" />
								</td>
								<td class="style7">
									<asp:checkbox id="cbMvUPostToJournal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:button id="btnAddEmbedVideo" runat="server" onclick="btnAddEmbedFlash_Click"
										style="height: 26px" text="Add" validationgroup="EmbedVideo" width="90px" resourcekey="btnAddEmbedVideoResource1" />
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
									<asp:label id="lblEVUploadMessage" runat="server" resourcekey="lblEVUploadMessageResource1">
									</asp:label>
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
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
						<br />
						<br />
					</asp:panel>
				</div>
			</div>
		</asp:panel>
		<asp:panel id="pnlAudioUpload" runat="server" visible="False" resourcekey="pnlAudioUploadResource1">
			<div class="audiouploadbox">
				<div class="uploadaudioboxbgrd">
					<div class="addaudiotitlebgrd">
						<table style="height: 120px;" cellpadding="0" cellspacing="0" class="style1">
							<tr>
								<td align="left" class="style11" valign="bottom">
									<asp:label id="lblAddAudio" resourcekey="lblAddAudio" runat="server" cssclass="AddDesc"
										text="Add audio"></asp:label>
								</td>
								<td>
									<table style="width: 650px; text-align: left; padding-top: 30px">
										<tr>
											<td align="center">
												<dnn:Label ID="lblAudioUploadTitle" runat="server" CssClass="subtitleregion" HelpKey="lblAudioUploadTitle.HelpText"
													HelpText="Select to upload adio file or to add audio file from upload folder."
													ResourceKey="lblAudioUploadTitle" Text="Audio Upload" />
											</td>
										</tr>
										<tr>
											<td align="center">
												<asp:radiobuttonlist id="rblAudioUploadSelectType" runat="server" autopostback="True"
													cssclass="subtitleregion" onselectedindexchanged="rblSelectAudioUpload_SelectedIndexChanged"
													repeatdirection="Horizontal" resourcekey="rblAudioUploadSelectTypeResource1">
													<asp:listitem resourcekey="ListItemResource93" text="Upload audio file" value="upload">
													</asp:listitem>
													<asp:listitem resourcekey="MultiAudioUpload" value="multi">Multi audio file upload</asp:listitem>
													<asp:listitem resourcekey="ListItemResource94" text="Add audio file from server"
														value="audioserver">
													</asp:listitem>
													<asp:listitem resourcekey="ListItemResource95" text="Add all files from server folder"
														value="folder">
													</asp:listitem>
													<asp:listitem resourcekey="liAmazonS3" value="AmazonS3">Amazon S3</asp:listitem>
												</asp:radiobuttonlist>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<asp:panel id="pnlAmazonS3AudioUpload" runat="server" visible="False">
						<table style="width: 650px; text-align: left;">
							<tr>
								<td align="center" colspan="2">
									<asp:label id="lblAmazonS3Title0" resourcekey="liAmazonS3" runat="server" cssclass="subtitleregion"
										text="Amazon S3"></asp:label>
								</td>
							</tr>
							<tr>
								<td class="style10" colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonUploadAudioURL" runat="server" HelpText="Aamazon S3 audio URL link."
										Text="Aamazon S3 audio URL link:" HelpKey="lblAmazonUploadAudioURL.HelpText"
										ResourceKey="lblAmazonUploadAudioURL.Text" />
								</td>
								<td>
									<asp:textbox id="tbAmazonAudioURL" runat="server" font-size="11px" validationgroup="vgAmazonAudioUpload"
										width="350px">
									</asp:textbox>
									<asp:requiredfieldvalidator id="rfvAmazonAudioURL" runat="server" controltovalidate="tbAmazonAudioURL"
										errormessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage"
										validationgroup="vgAmazonAudioUpload">
									</asp:requiredfieldvalidator>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonUploadAudioTitle" runat="server" HelpText="Enter the title of audio file:"
										Text="Audio title:" HelpKey="lblAmazonUploadAudioTitle.HelpText" ResourceKey="lblAmazonUploadAudioTitle.Text" />
								</td>
								<td>
									<div id="divAmazonAudioTitle" runat="server">
										<asp:textbox id="tbAmazonAudioTitle" runat="server" width="300px">
										</asp:textbox>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:checkbox id="cbAmazonAudioUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
										resourcekey="cbVideoUploadFilenameAsTitleResource1" text="Use filename as title" />
									<div id="divAmazonAudioFilenameAsTitle" runat="server" style="display: none">
										<asp:panel id="pnlVUFilenameasTitle1" runat="server" resourcekey="pnlVUFilenameasTitleResource1">
											<asp:checkbox id="cbAmazonAudioUploadTitleRemoveExtenzion" runat="server" resourcekey="cbVideoUploadTitleRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											<asp:checkbox id="cbAmazonAudioUploadTitleReplaceUnderscore" runat="server" resourcekey="cbVideoUploadTitleReplaceUnderscoreResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											<asp:checkbox id="cbAmazonAudioUploadTitleReplaceMinus" runat="server" resourcekey="cbVideoUploadTitleReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblAmazonAudioUploadTitleOptions" runat="server" resourcekey="rblVideoUploadTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource79" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource80" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource81" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource82" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAmazonAudioUploadDescription" runat="server" ControlName="tbFlashDescription"
										HelpText="Enter the audio description:" Text="Description:" HelpKey="lblAmazonAudioUploadDescription.HelpText"
										ResourceKey="lblAmazonAudioUploadDescription.Text" />
								</td>
								<td>
									<asp:textbox id="tbAmazonAudioDescription" runat="server" height="150px" maxlength="4000"
										resourcekey="tbFlashDescriptionResource1" textmode="MultiLine" width="300px">
									</asp:textbox>
								</td>
							</tr>
							<tr>
								<td class="style231">
									<dnn:Label ID="lblAmazonAudioUploadThumbnail" runat="server" HelpText="Upload the thumbnail for audio file or use standard image:"
										Text="Thumbnail:" HelpKey="lblAmazonAudioUploadThumbnail.HelpText" ResourceKey="lblAmazonAudioUploadThumbnail.Text" />
								</td>
								<td class="style232">
									<asp:radiobuttonlist id="rblAmazonAudioThumbnailSelect" runat="server" onload="rblFlashThumbnail_Load"
										onselectedindexchanged="rblVideoThumbnailSelect_SelectedIndexChanged" repeatdirection="Horizontal"
										resourcekey="rblVideoThumbnailSelectResource1">
										<asp:listitem resourcekey="ListItemResource83" selected="True" text="Use standard image"
											value="standard">
										</asp:listitem>
										<asp:listitem resourcekey="ListItemResource84" text="Upload" value="Upload">
										</asp:listitem>
									</asp:radiobuttonlist>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<div id="divAmazonAudioStandardImage" runat="server">
										<asp:label id="lblAmazonAudioUploadSelectStandardThumbnail" runat="server" resourcekey="lblVideoUploadSelectStandardThumbnailResource1"
											text="Select standard thumbnail:"></asp:label>
										&nbsp;<asp:dropdownlist id="ddlAmazobAudioThumbSelect" runat="server" onload="ddlAmazobVideoThumbSelect_Load"
											resourcekey="ddlVUThumbSelectResource1">
										</asp:dropdownlist>
									</div>
								</td>
							</tr>
							<tr>
								<td class="style22">
									&nbsp;
								</td>
								<td class="style23">
									<div id="divAmazonAudioUploadThumb" runat="server" style="display: none">
										<asp:label id="lblAudioUploadSelectThumbnailToUpload" runat="server" resourcekey="lblVideoUploadSelectThumbnailToUploadResource1"
											text="Select thumbnail to upload:"></asp:label>
										&nbsp;
										<asp:fileupload id="fuAmazonAudioThumbnail" runat="server" resourcekey="fuFlashThumbnailResource1"
											width="322px" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:label id="lblAmazonAudioUploadMessage" runat="server"></asp:label>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:button id="btnAmazonAudioUpload" runat="server" onclick="btnAmazonAudioUpload_Click"
										oncommand="btnAmazonVideoUpload_Command" resourcekey="btnAmazonVideoUpload" style="height: 26px"
										text="Upload" validationgroup="vgAmazonAudioUpload" width="90px" />
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
					</asp:panel>
					<asp:panel id="pnlAuFile" runat="server" visible="False" resourcekey="pnlAuFileResource1">
						<table style="width: 650px; text-align: left;">
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:label id="lblAudioUploadFile" runat="server" cssclass="subtitleregion" text="Upload audio file"
										resourcekey="lblAudioUploadFileResource1"></asp:label>
								</td>
							</tr>
							<tr>
								<td class="style14" colspan="2">
									<asp:panel id="pnlAUUploadFile" runat="server" resourcekey="pnlAUUploadFileResource1">
										<table style="width: 650px; text-align: left;">
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadSelectFile" ResourceKey="lblAudioUploadSelectFile" runat="server"
														HelpText="Select audio file to upload:" Text="Select file:" HelpKey="lblAudioUploadSelectFile.HelpText" />
												</td>
												<td>
													<asp:fileupload id="fuAudio" runat="server" width="300px" resourcekey="fuAudioResource1" />
												</td>
											</tr>
										</table>
									</asp:panel>
									<asp:panel id="pnlAUAddFileFromServer" runat="server" visible="False" resourcekey="pnlAUAddFileFromServerResource1">
										<table style="width: 650px; text-align: left;">
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadSelectFolder" ResourceKey="lblAudioUploadSelectFolder"
														runat="server" Text="Select folder:" HelpText="Select folder:" HelpKey="lblAudioUploadSelectFolder.HelpText"></dnn:Label>
												</td>
												<td>
													<asp:dropdownlist id="ddlAUFolders" runat="server" autopostback="True" onselectedindexchanged="ddlAUFolders_SelectedIndexChanged"
														resourcekey="ddlAUFoldersResource1">
													</asp:dropdownlist>
												</td>
											</tr>
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadSelectFileFromFolder" ResourceKey="lblAudioUploadSelectFileFromFolder"
														runat="server" Text="Select audio file:" HelpText="Select audio file:" HelpKey="lblAudioUploadSelectFileFromFolder.HelpText"></dnn:Label>
												</td>
												<td>
													<asp:dropdownlist id="ddlAUFiles" runat="server" resourcekey="ddlAUFilesResource1">
													</asp:dropdownlist>
												</td>
											</tr>
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadShowMainGalleryFolder" ResourceKey="lblAudioUploadShowMainGalleryFolder"
														runat="server" Text="Show main gallery folder:" HelpText="Add main EasyDNN gallery folder to folders list:"
														HelpKey="lblAudioUploadShowMainGalleryFolder.HelpText"></dnn:Label>
												</td>
												<td>
													<asp:checkbox id="cbAUShowMinGalFolder" runat="server" autopostback="True" oncheckedchanged="cbAUShowMinGalFolder_CheckedChanged"
														resourcekey="cbAUShowMinGalFolderResource1" />
												</td>
											</tr>
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadDeleteOriginalFile" ResourceKey="lblAudioUploadDeleteOriginalFile"
														runat="server" HelpText="File will be copied to gallery folder. Delete original file:"
														Text="Delete original file:" HelpKey="lblAudioUploadDeleteOriginalFile.HelpText" />
												</td>
												<td>
													<asp:checkbox id="cbAUDeleteOriginalFile" runat="server" resourcekey="cbAUDeleteOriginalFileResource1" />
												</td>
											</tr>
										</table>
									</asp:panel>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2" colspan="2">
									&nbsp;
									<asp:panel id="pnlAAF" runat="server" resourcekey="pnlAAFResource1">
										<table style="width: 650px; text-align: left;">
											<tr>
												<td class="tablecolumnleft2">
													<asp:label id="lblAudioUploadAddFolderSelect" runat="server" text="Select folder:"
														resourcekey="lblAudioUploadAddFolderSelectResource1"></asp:label>
												</td>
												<td>
													<asp:dropdownlist id="ddlAddAudioFolder" runat="server" style="margin-left: 0px"
														resourcekey="ddlAddAudioFolderResource1">
													</asp:dropdownlist>
												</td>
											</tr>
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadAddFolderShowMainGalleryFolder" ResourceKey="lblAudioUploadAddFolderShowMainGalleryFolder"
														runat="server" HelpText="Add main EasyDNN gallery folder to folders list:" Text="Show main gallery folder:"
														HelpKey="lblAudioUploadAddFolderShowMainGalleryFolder.HelpText" />
												</td>
												<td>
													<asp:checkbox id="cbAAFShowMainGalFolder" runat="server" autopostback="True" oncheckedchanged="cbAAFShowMainGalFolder_CheckedChanged"
														resourcekey="cbAAFShowMainGalFolderResource1" />
												</td>
											</tr>
											<tr>
												<td class="tablecolumnleft2">
													<dnn:Label ID="lblAudioUploadAddFolderDeleteOriginalFile" ResourceKey="lblAudioUploadAddFolderDeleteOriginalFile"
														runat="server" HelpText="File will be copied to gallery folder. Delete original file:"
														Text="Delete original file:" HelpKey="lblAudioUploadAddFolderDeleteOriginalFile.HelpText"
														Visible="True" />
												</td>
												<td>
													<asp:checkbox id="cbAAFDeleteOriginalFile" runat="server" resourcekey="cbAAFDeleteOriginalFileResource1" />
												</td>
											</tr>
										</table>
									</asp:panel>
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
									<dnn:Label ID="lblAudioUploadEnterTitle" ResourceKey="lblAudioUploadEnterTitle" runat="server"
										Text="Title:" ControlName="tbAudioTitle" HelpText="Enter the audio file title:"
										HelpKey="lblAudioUploadEnterTitle.HelpText"></dnn:Label>
								</td>
								<td>
									<div id="divAUTitleTextBox" runat="server">
										<asp:textbox id="tbAudioTitle" runat="server" width="300px" resourcekey="tbAudioTitleResource1">
										</asp:textbox>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:checkbox id="cbAudioUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
										text="Use filename as title" resourcekey="cbAudioUploadFilenameAsTitleResource1" />
									<div id="divAUFilenameAsTitle" runat="server" style="display: none">
										<asp:panel id="pnlAUFilenameasTitle" runat="server" resourcekey="pnlAUFilenameasTitleResource1">
											<asp:checkbox id="cbAudioUploadRemoveExtenzion" runat="server" text="Remove extension"
												resourcekey="cbAudioUploadRemoveExtenzionResource1" />
											<br />
											<asp:checkbox id="cbAudioUploadTitleReplaceUnderscore" runat="server" text="Set this to replace &quot;_&quot; with blank space in title"
												resourcekey="cbAudioUploadTitleReplaceUnderscoreResource1" />
											<br />
											<asp:checkbox id="cbAudioUploadTitleReplaceMinus" runat="server" text="Set this to replace &quot;-&quot; with blank space in title"
												resourcekey="cbAudioUploadTitleReplaceMinusResource1" />
											<asp:radiobuttonlist id="rblAudioUploadTitleOptions" runat="server" resourcekey="rblAudioUploadTitleOptionsResource1">
												<asp:listitem value="AllUppercase" text="Set this to change title to uppercase" resourcekey="ListItemResource97">
												</asp:listitem>
												<asp:listitem value="AllLowercase" text="Set this to change title to lowercase" resourcekey="ListItemResource98">
												</asp:listitem>
												<asp:listitem value="AllFirstUppercase" text="Set this to change first letter of every 
										word in title to uppercase" resourcekey="ListItemResource99">
												</asp:listitem>
												<asp:listitem value="FirstUppercase" text="Set this to change first letter of title to 
										uppercase" resourcekey="ListItemResource100">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAudioUploadDescription" ResourceKey="lblAudioUploadDescription"
										runat="server" ControlName="tbAudioDescription" HelpText="Enter the audio file description:"
										Text="Description:" HelpKey="lblAudioUploadDescription.HelpText" />
								</td>
								<td>
									<asp:textbox id="tbAudioDescription" runat="server" height="100px" textmode="MultiLine"
										width="300px" resourcekey="tbAudioDescriptionResource1" maxlength="4000">
									</asp:textbox>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									<dnn:Label ID="lblAudioUploadThumbnailSelect" ResourceKey="lblAudioUploadThumbnailSelect"
										runat="server" HelpText="Upload the thumbnail for video file or use standard image:"
										Text="Thumbnail:" HelpKey="lblAudioUploadThumbnailSelect.HelpText" />
								</td>
								<td>
									<asp:radiobuttonlist id="rblAudioUploadSelectThumbSource" runat="server" repeatdirection="Horizontal"
										resourcekey="rblAudioUploadSelectThumbSourceResource1">
										<asp:listitem selected="True" value="standard" text="Use standard image" resourcekey="ListItemResource101">
										</asp:listitem>
										<asp:listitem value="upload" text="Upload" resourcekey="ListItemResource102">
										</asp:listitem>
									</asp:radiobuttonlist>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<div id="divAUSelectStantard" runat="server">
										<asp:dropdownlist id="ddlAUSelectSTandThumb" runat="server" onload="ddlAUSelectSTandThumb_Load"
											resourcekey="ddlAUSelectSTandThumbResource1">
										</asp:dropdownlist>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<div id="divAUUploadThumb" runat="server" style="display: none">
										<asp:fileupload id="fuAudioUpload" runat="server" resourcekey="fuAudioUploadResource1" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:label id="lblAudioMessage" runat="server" resourcekey="lblAudioMessageResource1">
									</asp:label>
								</td>
							</tr>
							<tr>
								<td class="tablecolumnleft2">
									&nbsp;
								</td>
								<td>
									<asp:button id="btnUploadAudio" runat="server" onclick="btnUploadAudio_Click" text="Upload"
										width="90px" resourcekey="btnUploadAudioResource1" />
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
					</asp:panel>
					<asp:panel id="pnlMultiAudioFileUpload" runat="server" resourcekey="pnlAuFileResource1"
						visible="False">
						<table style="width: 650px; text-align: left;">
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:label id="lblMultiAudioUploadFile" runat="server" cssclass="subtitleregion"
										resourcekey="lblMultiAudioUploadFile" text="Multi upload audio file"></asp:label>
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
								<td class="style14">
									<dnn:Label ID="lblMultiAudioUploadEnterTitle" runat="server" ControlName="tbAudioTitle"
										HelpKey="lblAudioUploadEnterTitle.HelpText" HelpText="Enter the audio file title:"
										ResourceKey="lblAudioUploadEnterTitle" Text="Title:" />
								</td>
								<td>
									<div id="divMultiAUTitleTextBox" runat="server">
										<asp:textbox id="tbMultiAudioTitle" runat="server" resourcekey="tbAudioTitleResource1"
											width="300px">
										</asp:textbox>
									</div>
								</td>
							</tr>
							<tr>
								<td class="style14">
									&nbsp;
								</td>
								<td>
									<asp:checkbox id="cbMultiAudioUploadFilenameAsTitle" runat="server" oncheckedchanged="cbvUFilenameAsTitle_CheckedChanged"
										resourcekey="cbAudioUploadFilenameAsTitleResource1" text="Use filename as title" />
									<div id="divMultiAUFilenameAsTitle" runat="server" style="display: none">
										<asp:panel id="pnlAUFilenameasTitle0" runat="server" resourcekey="pnlAUFilenameasTitleResource1">
											<asp:checkbox id="cbMultiAudioUploadRemoveExtenzion" runat="server" resourcekey="cbAudioUploadRemoveExtenzionResource1"
												text="Remove extension" />
											<br />
											<asp:checkbox id="cbMultiAudioUploadTitleReplaceUnderscore" runat="server" resourcekey="cbAudioUploadTitleReplaceUnderscoreResource1"
												text="Set this to replace &quot;_&quot; with blank space in title" />
											<br />
											<asp:checkbox id="cbMultiAudioUploadTitleReplaceMinus" runat="server" resourcekey="cbAudioUploadTitleReplaceMinusResource1"
												text="Set this to replace &quot;-&quot; with blank space in title" />
											<asp:radiobuttonlist id="rblMultiAudioUploadTitleOptions" runat="server" resourcekey="rblAudioUploadTitleOptionsResource1">
												<asp:listitem resourcekey="ListItemResource97" text="Set this to change title to uppercase"
													value="AllUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource98" text="Set this to change title to lowercase"
													value="AllLowercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource99" text="Set this to change first letter of every 
										word in title to uppercase" value="AllFirstUppercase">
												</asp:listitem>
												<asp:listitem resourcekey="ListItemResource100" text="Set this to change first letter of title to 
										uppercase" value="FirstUppercase">
												</asp:listitem>
											</asp:radiobuttonlist>
										</asp:panel>
									</div>
								</td>
							</tr>
							<tr>
								<td class="style14">
									<dnn:Label ID="lblMultiAudioUploadDescription" runat="server" ControlName="tbAudioDescription"
										HelpKey="lblAudioUploadDescription.HelpText" HelpText="Enter the audio file description:"
										ResourceKey="lblAudioUploadDescription" Text="Description:" />
								</td>
								<td>
									<asp:textbox id="tbMultiAudioDescription" runat="server" height="100px" maxlength="4000"
										resourcekey="tbAudioDescriptionResource1" textmode="MultiLine" width="300px">
									</asp:textbox>
								</td>
							</tr>
							<tr>
								<td class="style14">
									<dnn:Label ID="lblMultiAudioUploadThumbnailSelect" runat="server" HelpKey="lblAudioUploadThumbnailSelect.HelpText"
										HelpText="Upload the thumbnail for video file or use standard image:" ResourceKey="lblAudioUploadThumbnailSelect"
										Text="Thumbnail:" />
								</td>
								<td>
									<asp:radiobuttonlist id="rblMultiAudioUploadSelectThumbSource" runat="server" repeatdirection="Horizontal"
										resourcekey="rblAudioUploadSelectThumbSourceResource1">
										<asp:listitem resourcekey="ListItemResource101" selected="True" text="Use standard image"
											value="standard">
										</asp:listitem>
										<asp:listitem resourcekey="ListItemResource102" text="Upload" value="upload">
										</asp:listitem>
									</asp:radiobuttonlist>
								</td>
							</tr>
							<tr>
								<td class="style14">
									&nbsp;
								</td>
								<td>
									<div id="divMultiAUSelectStantard" runat="server">
										<asp:dropdownlist id="ddlMultiAUSelectSTandThumb" runat="server" onload="ddlMultiAUSelectSTandThumb_Load"
											resourcekey="ddlAUSelectSTandThumbResource1">
										</asp:dropdownlist>
									</div>
								</td>
							</tr>
							<tr>
								<td class="style14">
									&nbsp;
								</td>
								<td>
									<div id="divMultiAUUploadThumb" runat="server" style="display: none">
										<asp:fileupload id="fuMultiAudioUpload" runat="server" resourcekey="fuAudioUploadResource1" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="style14">
									&nbsp;
								</td>
								<td>
									<asp:label id="lblMultiAudioMessage" runat="server" resourcekey="lblAudioMessageResource1"
										visible="False"></asp:label>
								</td>
							</tr>
							<tr id="trMAUPostToJournal" runat="server" visible="false">
								<td class="tablecolumnleft">
									<dnn:Label ID="lblMAUPostToJournal" runat="server" Text="Post to Journal:" HelpText="Post to Journal:"
										EnableViewState="True" HelpKey="lblPostToJurnal.HelpText" ResourceKey="lblMAUPostToJournal" />
								</td>
								<td class="style7">
									<asp:checkbox id="cbMAUPostToJournal" runat="server" />
								</td>
							</tr>
						</table>
						<br />
						<table cellpadding="0" cellspacing="0" align="center" class="multiuploadcontrol">
							<tr>
								<td>
									<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
										<asp:fileupload id="MultiAudioFileInput" runat="server" enabletheming="True" />
									</div>
									<div style="display: block; float: left; margin-left: 15px;">
										<a class="btnUpload" href="javascript:jQuery('#<%=MultiAudioFileInput.ClientID%>').uploadifySettings('scriptData', { 'foo': '<%=DirToSave%>'});jQuery('#<%=MultiAudioFileInput.ClientID%>').uploadifyUpload();">
											<%=ViewState["startUpload"]%></a> <a href="javascript:jQuery('#<%=MultiAudioFileInput.ClientID%>').uploadifyClearQueue();">
												<%=ViewState["ClearQueue"]%></a>
									</div>
									<br />
									<div style="display: none; line-height: 0pt;">
										<asp:button id="btnSaveMultiAudioUpload" runat="server" onclick="MultiAudioUpload"
											text="Save" />
									</div>
								</td>
							</tr>
						</table>
						<br />
						<br />
					</asp:panel>
				</div>
			</div>
		</asp:panel>
		<table cellpadding="2" cellspacing="2" width="800px" style="padding-top: 15px; padding-right: 10px;">
			<tr>
				<td align="right">
					<asp:button id="btnclosemedia2" runat="server" onclick="Button1_Click1" text="Close media manager"
						tooltip="Close Media Manager and return to Gallery Manager." resourcekey="btnclosemediaResource1"
						cssclass="btnclosemediamanager" />
				</td>
			</tr>
		</table>
	</div>
</asp:panel>
<asp:panel id="pnlImageEdit" runat="server" width="800px" visible="False" border="0"
	resourcekey="pnlImageEditResource1">
	<div class="imagesuploadbox">
		<div class="uploadimagesboxbgrd">
			<table id="tblImageEdit" runat="server" cellpadding="2" cellspacing="0" style="width: 650px;
				text-align: left;">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:label id="lblImageEditorTitle" runat="server" cssclass="subtitleregion" text="Image Edit"
							resourcekey="lblImageEditorTitleResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						<asp:label id="lblImageEditorGalleryName" runat="server" text="Gallery:" resourcekey="lblImageEditorGalleryNameResource1">
						</asp:label>
						<asp:label id="lblIEGalleryName2" runat="server" resourcekey="lblIEGalleryName2Resource1">
						</asp:label>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						<asp:hyperlink id="hlIEViewImage" runat="server" target="_blank">
							<asp:image id="imgEditPanelthumb" runat="server" borderwidth="1px" resourcekey="imgEditPanelthumbResource1" />
						</asp:hyperlink>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						<dnn:Label ID="lblImageEditorFilename" ResourceKey="lblImageEditorFilename" runat="server"
							ControlName="tbEditTitlePanel" HelpText="Filename:" Text="Filename:" HelpKey="lblImageEditorFilename.HelpText" />
					</td>
					<td>
						<asp:label id="lblImageEditorFilename2" runat="server" resourcekey="lblImageEditorFilename2Resource1">
						</asp:label>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						<dnn:Label ID="lblImageEditorImageTitle" ResourceKey="lblImageEditorImageTitle" runat="server"
							Text="Image title:" HelpText="Edit image title:" ControlName="tbEditTitlePanel"
							HelpKey="lblImageEditorImageTitle.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbEditTitlePanel" runat="server" width="300px" resourcekey="tbEditTitlePanelResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style19">
						<dnn:Label ID="lblImageEditorDescription" ResourceKey="lblImageEditorDescription"
							runat="server" HelpText="Edit description:" Text="Description:" HelpKey="lblImageEditorDescription.HelpText" />
					</td>
					<td>
						<dnn:TextEditor ID="txtDescHmlEdit" runat="server" Height="350" Width="550" />
					</td>
				</tr>
				<tr id="trEdiImageURL" runat="server">
					<td class="style19">
						<dnn:Label ID="lblImageEditorUrl" ResourceKey="lblImageEditorUrl" runat="server"
							ControlName="tbEditImageUrl" HelpText="Edit Media Url link:" Text="Media Url:"
							HelpKey="lblImageEditorUrl.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbEditImageUrl" runat="server" width="300px" resourcekey="tbEditImageUrlResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr id="trEdiReplaceImage" runat="server">
					<td class="style19">
						<dnn:Label ID="lblImageEditorReplaceImage" ResourceKey="lblImageEditorReplaceImage"
							runat="server" HelpText="Use this to upload new image." Text="Replace image:"
							HelpKey="lblImageEditorReplaceImage.HelpText" />
					</td>
					<td style="margin-left: 40px">
						<asp:fileupload id="fuReplaceImage" runat="server" resourcekey="fuReplaceImageResource1" />
						&nbsp;&nbsp;
						<asp:button id="btnImageEditorReplaceImage" runat="server" onclick="btnReplacemage_Click"
							style="height: 26px" text="Replace" resourcekey="btnImageEditorReplaceImageResource1"
							validationgroup="vgReplaceImage" />
						<br />
						<asp:checkbox id="cbIEResizeNewImage" resourcekey="cbIEResizeNewImage" runat="server"
							text="Resize new image" autopostback="True" oncheckedchanged="cbIEResizeNewImage_CheckedChanged" />
						<br />
						<asp:panel id="pnlIEResizeNewImage" runat="server" visible="False">
							<asp:label id="lblIEResizeWidth" resourcekey="lblIEResizeWidth" runat="server" text="Width:">
							</asp:label>
							<asp:textbox id="tbIEResizeWidth" runat="server" width="40px" validationgroup="vgReplaceImage">800</asp:textbox>
							&nbsp;&nbsp;
							<asp:label id="lblResizeHeight" resourcekey="lblResizeHeight" runat="server" text="Height:">
							</asp:label>
							<asp:textbox id="tbIEResizeHeight" runat="server" width="40px" validationgroup="vgReplaceImage">600</asp:textbox>
							<br />
							<asp:requiredfieldvalidator id="rfvIEWidth" runat="server" controltovalidate="tbIEResizeWidth"
								errormessage="Please enter width." validationgroup="vgReplaceImage">
							</asp:requiredfieldvalidator>
							<asp:requiredfieldvalidator id="rfvIEHeight" runat="server" controltovalidate="tbIEResizeHeight"
								errormessage="Please enter height." validationgroup="vgReplaceImage">
							</asp:requiredfieldvalidator>
							<br />
							<asp:checkbox id="cbIEUseUnresizedAsDownload" runat="server" text="Use unresized image as download version." />
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td style="margin-left: 40px">
						&nbsp;
					</td>
				</tr>
				<tr id="trEditImageHiRes" runat="server">
					<td class="style19">
						&nbsp;
						<dnn:Label ID="lblHiResVersion" runat="server" HelpText="Upload downloadable version of the image."
							Text="Upload downloadable version:" HelpKey="lblHiResVersion.HelpText" ResourceKey="lblHiResVersion" />
					</td>
					<td>
						<asp:hyperlink id="hlIEDownloadImage" runat="server" target="_blank">
							<asp:image id="imgEditPanelthumbDownload" runat="server" borderwidth="1px" resourcekey="imgEditPanelthumbResource1"
								visible="False" />
						</asp:hyperlink>
						<br />
						<br />
						<asp:fileupload id="fuIEHiResVersion" runat="server" height="25px" resourcekey="fuImageUploadResource1"
							width="300px" />
						<br />
						<asp:button id="btnHiRes" runat="server" resourcekey="btnHiRes" onclick="btnHiRes_Click"
							text="Upload downloadable version" />
						<asp:button id="btnUseViewVersionAsDownload" resourcekey="btnUseViewVersionAsDownload"
							runat="server" onclick="btnUseViewVersionAsDownload_Click" text="Use view version as download" />
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr id="trEditImageEmpty" runat="server">
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						<asp:button id="btnImageEditorSave" runat="server" onclick="btnImageEditPanelSave_Click"
							text="Save " width="90px" resourcekey="btnImageEditorSaveResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnImageEditorCancel" runat="server" onclick="btnCancelEditPanel_Click"
							text="Cancel" width="90px" resourcekey="btnImageEditorCancelResource1" />
					</td>
				</tr>
				<tr>
					<td class="style19">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</div>
</asp:panel>
<asp:panel id="pnlEmbedVideoEdit" runat="server" visible="False" border="0" width="800px"
	resourcekey="pnlEmbedVideoEditResource1">
	<div class="videouploadbox">
		<div class="uploadvideoboxbgrd">
			<table style="width: 650px; text-align: left;">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:label id="lblEmbedVideoEditorTitle" runat="server" cssclass="subtitleregion"
							text="Embed Video Edit" resourcekey="lblEmbedVideoEditorTitleResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						&nbsp;
					</td>
					<td>
						&nbsp;<asp:label id="lblEVEInfo" runat="server" visible="False"></asp:label>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						&nbsp;
					</td>
					<td>
						<asp:label id="lblEmbedVideoEditGalleryName" runat="server" text="Gallery:" resourcekey="lblEmbedVideoEditGalleryNameResource1">
						</asp:label>
						&nbsp;<asp:label id="lblEVGalleryName" runat="server" resourcekey="lblEVGalleryNameResource1"></asp:label>
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
						<dnn:Label ID="lblEmbedVideoEditTitle" ResourceKey="lblEmbedVideoEditTitle" runat="server"
							ControlName="tbEMbedVideoEditTitle" HelpText="Edit video title:" Text="Video title:"
							HelpKey="lblEmbedVideoEditTitle.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbEMbedVideoEditTitle" runat="server" width="300px" resourcekey="tbEMbedVideoEditTitleResource1">
						</asp:textbox>
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
						<dnn:Label ID="lblEmbedVideoEditCode" ResourceKey="lblEmbedVideoEditCode" runat="server"
							ControlName="tbEmbedVideoEditUrl" HelpText="Edit embed video code:" Text="Embed video code:"
							HelpKey="lblEmbedVideoEditCode.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbEmbedVideoEditUrl" runat="server" width="300px" height="150px"
							textmode="MultiLine" resourcekey="tbEmbedVideoEditUrlResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblEmbedVideoEditUrl" ResourceKey="lblEmbedVideoEditUrl" runat="server"
							ControlName="tbEmbedEditURL" HelpText="Edit video Url:" Text="Video Url:" HelpKey="lblEmbedVideoEditUrl.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbEmbedEditURL" runat="server" width="352px" resourcekey="tbEmbedEditURLResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblEmbedVideoEditDescription" ResourceKey="lblEmbedVideoEditDescription"
							runat="server" ControlName="txtEVEDescription" HelpText="Edit description:" Text="Description:"
							HelpKey="lblEmbedVideoEditDescription.HelpText" />
					</td>
					<td>
						&nbsp;
						<dnn:TextEditor ID="txtEVEDescription" runat="server" Height="250" Width="500" />
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<asp:label id="lblEmbedVideoEditThumbnail" runat="server" text="Thumbnail:" resourcekey="lblEmbedVideoEditThumbnailResource1">
						</asp:label>
					</td>
					<td>
						<asp:image id="imgEVEThumbnail" runat="server" height="150px" width="150px" resourcekey="imgEVEThumbnailResource1" />
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
				<tr id="trEditEmbedReplace" runat="server">
					<td class="tablecolumnleft2">
						&nbsp;
						<dnn:Label ID="lblEmbedVideoEditReplaceThumb" ResourceKey="lblEmbedVideoEditReplaceThumb"
							runat="server" HelpText="Replace thumbnail for video file:" Text="Replace thumbnail:"
							HelpKey="lblEmbedVideoEditReplaceThumb.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbEVEReplaceThumbnail" runat="server" resourcekey="cbEVEReplaceThumbnailResource1" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						<div id="divEVEAddThumb" style="display: none" runat="server">
							<asp:radiobuttonlist id="rblEVEChangeThumb" runat="server" onselectedindexchanged="rblEVEChangeThumb_SelectedIndexChanged"
								repeatdirection="Horizontal" width="371px" resourcekey="rblEVEChangeThumbResource1">
								<asp:listitem selected="True" value="standard" text="Use standard image" resourcekey="ListItemResource103">
								</asp:listitem>
								<asp:listitem text="Upload" resourcekey="ListItemResource104">
								</asp:listitem>
								<asp:listitem value="autocreate" text="Auto create thumbnail">
								</asp:listitem>
							</asp:radiobuttonlist>
							<br />
							<div id="divEVEStandardThumb" runat="server">
								<asp:dropdownlist id="ddlEVESTandardThumbList" runat="server" onload="ddlEVESTandardThumbList_Load"
									resourcekey="ddlEVESTandardThumbListResource1">
								</asp:dropdownlist>
							</div>
							<br />
							<div id="divEVEThumbUpload" runat="server" style="display: none">
								<asp:fileupload id="fuEVEReplaceThumb" runat="server" width="351px" resourcekey="fuEVEReplaceThumbResource1" />
							</div>
							<div id="divEVEThumbAutoCreate" runat="server" style="display: none">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						&nbsp;
					</td>
					<td>
						<asp:button id="bntEmbedVideoEditSave" runat="server" onclick="bntEmbedVideoEditSave_Click"
							text="Save" width="90px" resourcekey="bntEmbedVideoEditSaveResource1" />
						&nbsp;
						<asp:button id="btnEMbedVideoEditCancel" runat="server" onclick="btnEMbedVideoEditCancel_Click"
							text="Cancel" width="90px" resourcekey="btnEMbedVideoEditCancelResource1" />
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
		</div>
	</div>
</asp:panel>
<asp:panel id="pnlFlashEdit" runat="server" visible="False" border="0" width="800px"
	resourcekey="pnlFlashEditResource1">
	<div class="videouploadbox">
		<div class="uploadvideoboxbgrd">
			<table style="width: 650px; text-align: left;">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:label id="lblVideoEditTitle" runat="server" cssclass="subtitleregion" text="Video Edit"
							resourcekey="lblVideoEditTitleResource1"></asp:label>
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
						<asp:label id="lblVideoEditGalleryName" runat="server" text="Gallery:" resourcekey="lblVideoEditGalleryNameResource1">
						</asp:label>
						&nbsp;<asp:label id="lblVEGalleryName" runat="server" resourcekey="lblVEGalleryNameResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditFilename" ResourceKey="lblVideoEditFilename" runat="server"
							HelpText="Filename:" Text="Filename:" HelpKey="lblVideoEditFilename.HelpText" />
					</td>
					<td>
						<asp:label id="lblFEFilename2" runat="server" resourcekey="lblFEFilename2Resource1">
						</asp:label>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditorTitle" ResourceKey="lblVideoEditorTitle" runat="server"
							Text="Title:" ControlName="tbFlashEditorTitle" HelpText="Edit video title:" HelpKey="lblVideoEditorTitle.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbFlashEditorTitle" runat="server" width="300px" style="margin-left: 0px"
							resourcekey="tbFlashEditorTitleResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditorWidth" ResourceKey="lblVideoEditorWidth" runat="server"
							ControlName="tbVideoEditorWidth" HelpText="Edit video width:" Text="Width:" HelpKey="lblVideoEditorWidth.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbVideoEditorWidth" runat="server" width="50px" resourcekey="tbVideoEditorWidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVideoEditorWidth" runat="server" controltovalidate="tbVideoEditorWidth"
							display="Dynamic" errormessage="This filed is required." validationgroup="vgVideoEditor"
							resourcekey="rfvVideoEditorWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVideoEditWidth" runat="server" controltovalidate="tbVideoEditorWidth"
							display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
							type="Integer" validationgroup="vgVideoEditor" resourcekey="cvVideoEditWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditHeight" ResourceKey="lblVideoEditHeight" runat="server"
							ControlName="tbVideoEditorHeight" HelpText="Edit video height:" Text="Height:"
							HelpKey="lblVideoEditHeight.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbVideoEditorHeight" runat="server" width="50px" resourcekey="tbVideoEditorHeightResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVideoEditorHeight" runat="server" controltovalidate="tbVideoEditorHeight"
							display="Dynamic" errormessage="This filed is required." validationgroup="vgVideoEditor"
							resourcekey="rfvVideoEditorHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVideoEditHeight" runat="server" controltovalidate="tbVideoEditorHeight"
							display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
							type="Integer" validationgroup="vgVideoEditor" resourcekey="cvVideoEditHeightResource1.ErrorMessage">
						</asp:comparevalidator>
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
						<asp:label id="lblVideoEditThumbnail" runat="server" text="Thumbnail:" resourcekey="lblVideoEditThumbnailResource1">
						</asp:label>
					</td>
					<td>
						<asp:image id="imgFLEThumbnail" runat="server" height="150px" width="150px" resourcekey="imgFLEThumbnailResource1" />
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditDescription" ResourceKey="lblVideoEditDescription" runat="server"
							HelpText="Edit description." Text="Description:" HelpKey="lblVideoEditDescription.HelpText" />
					</td>
					<td>
						&nbsp;
						<dnn:TextEditor ID="txtVideoEditDescription" runat="server" Height="300" Width="500" />
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditReplaceThumbnail" ResourceKey="lblVideoEditReplaceThumbnail"
							runat="server" HelpText="Upload new or select standard thumbnail:" Text="Replace thumbnail:"
							HelpKey="lblVideoEditReplaceThumbnail.HelpText" />
						<br />
					</td>
					<td>
						<asp:checkbox id="cbVideoEditAddNewThumbnail" runat="server" text="Add new thumbnail"
							causesvalidation="True" resourcekey="cbVideoEditAddNewThumbnailResource1" />
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
						<div id="VEThumb" runat="server" style="display: none">
							<asp:panel id="pnlVEAddNewThumbnail" runat="server" resourcekey="pnlVEAddNewThumbnailResource1">
								<asp:radiobuttonlist id="rblVideoEditSelectNewThumb" runat="server" repeatdirection="Horizontal"
									resourcekey="rblVideoEditSelectNewThumbResource1">
									<asp:listitem selected="True" value="standard" text="Use standard image" resourcekey="ListItemResource105">
									</asp:listitem>
									<asp:listitem value="upload" text="Upload" resourcekey="ListItemResource106">
									</asp:listitem>
								</asp:radiobuttonlist>
								<br />
								<div id="divVEStandardThumb" runat="server">
									<asp:dropdownlist id="ddlVEStandardImage" runat="server" onload="ddlVEStandardImage_Load"
										resourcekey="ddlVEStandardImageResource1">
									</asp:dropdownlist>
								</div>
								<br />
								<div id="divVEUploadThumb" runat="server" style="display: none">
									<asp:fileupload id="fuFLEReplaceThumbnail" runat="server" resourcekey="fuFLEReplaceThumbnailResource1" />
								</div>
							</asp:panel>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						&nbsp;
						<asp:label id="lblVideoEditStartupImage" runat="server" text="Startup image:"></asp:label>
					</td>
					<td>
						&nbsp;
						<asp:image id="imgVideoEditStartupImage" runat="server" height="150px" resourcekey="imgFLEThumbnailResource1"
							width="150px" imageurl="<%=ModulePath%>images/spacer.gif" />
						&nbsp;<asp:button id="btnVideoEditRemoveStartupImage" runat="server" enabled="False"
							onclick="btnVideoEditRemoveStartupImage_Click" text="Remove startup image" />
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblVideoEditReplaceStartupImage" runat="server" HelpText="Upload new or select standard thumbnail:"
							Text="Replace startup image:" />
					</td>
					<td>
						<asp:checkbox id="cbVideoEditAddNewStartupImage" runat="server" causesvalidation="True"
							text="Add new startup image" />
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						&nbsp;
					</td>
					<td>
						<div id="DivReplaceStartupImage" runat="server" style="display: none">
							<asp:panel id="Panel1" runat="server" resourcekey="pnlVEAddNewThumbnailResource1">
								<asp:radiobuttonlist id="rblVideoEditSelectNewStartupImage" runat="server" repeatdirection="Horizontal"
									resourcekey="rblVideoEditSelectNewThumbResource1">
									<asp:listitem selected="True" value="standard" text="Use standard image" resourcekey="ListItemResource105">
									</asp:listitem>
									<asp:listitem value="upload" text="Upload" resourcekey="ListItemResource106">
									</asp:listitem>
								</asp:radiobuttonlist>
								<br />
								<div id="DivVideoEditSelectStartupStandard" runat="server">
									<asp:dropdownlist id="ddlVideoEditStandardStartup" runat="server" onload="ddlVEStandardImage_Load"
										resourcekey="ddlVEStandardImageResource1">
									</asp:dropdownlist>
								</div>
								<br />
								<div id="DivVideoEditSelectStartupUpload" runat="server" style="display: none">
									<asp:fileupload id="fuVideoEditStartupImage" runat="server" resourcekey="fuFLEReplaceThumbnailResource1" />
								</div>
							</asp:panel>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<asp:label id="lblFlashEditorHelper" runat="server" resourcekey="lblFlashEditorHelperResource1"
							visible="False"></asp:label>
					</td>
					<td>
						<asp:button id="btnVideoEditSave" runat="server" onclick="Button2btnFlashEditorSave_Click"
							resourcekey="btnVideoEditSaveResource1" style="width: 90px" text="Save" validationgroup="vgVideoEditor"
							width="117px" />
						&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnVideoEditCancel" runat="server" onclick="btnFlashEditorCancel_Click"
							resourcekey="btnVideoEditCancelResource1" text="Cancel" width="90px" />
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
		</div>
	</div>
</asp:panel>
<asp:panel id="pnlAudioEdit" runat="server" visible="False" width="800px" border="0"
	resourcekey="pnlAudioEditResource1">
	<div class="audiouploadbox">
		<div class="uploadaudioboxbgrd">
			<table style="width: 650px; text-align: left;">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:label id="lblAudioEditorTitle" runat="server" cssclass="subtitleregion" text="Audio Edit"
							resourcekey="lblAudioEditorTitleResource1"></asp:label>
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
						<asp:label id="lblAudeioEditGalleryName" runat="server" text="Gallery:" resourcekey="lblAudeioEditGalleryNameResource1">
						</asp:label>
						&nbsp;<asp:label id="lblAEGalleryName" runat="server" resourcekey="lblAEGalleryNameResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblAudioEditFilename" ResourceKey="lblAudioEditFilename" runat="server"
							HelpText="Filename:" Text="Filename:" HelpKey="lblAudioEditFilename.HelpText" />
					</td>
					<td>
						<asp:label id="lblAEFilename2" runat="server" resourcekey="lblAEFilename2Resource1">
						</asp:label>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblAudioEditTile" ResourceKey="lblAudioEditTile" runat="server" Text="Title:"
							HelpText="Edit title:" HelpKey="lblAudioEditTile.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbAEName" runat="server" resourcekey="tbAENameResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="tablecolumnleft2">
						<dnn:Label ID="lblAudioEditDescription" runat="server" Text="Description:" HelpText="Edit description:"
							HelpKey="lblAudioEditDescription.HelpText"></dnn:Label>
					</td>
					<td>
						<dnn:TextEditor ID="txtAEDescription" runat="server" Height="300" Width="500" />
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
						<asp:label id="lblAudioEditThumbnail" runat="server" text="Thumbnail:" resourcekey="lblAudioEditThumbnailResource1">
						</asp:label>
					</td>
					<td>
						<asp:image id="imgAEThumbnail" runat="server" height="150px" width="150px" resourcekey="imgAEThumbnailResource1" />
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
				<tr id="trEditAudeioReplace" runat="server">
					<td class="style236">
						<dnn:Label ID="lblAudioEditReplaceThumbnail" ResourceKey="lblAudioEditReplaceThumbnail"
							runat="server" HelpText="Upload new or select standard thumbnail:" Text="Replace thumbnail:"
							HelpKey="lblAudioEditReplaceThumbnail.HelpText" />
					</td>
					<td class="style237">
						<asp:checkbox id="cbAEAddNewThumbnail" runat="server" resourcekey="cbAEAddNewThumbnailResource1" />
					</td>
				</tr>
				<tr id="trEditAudeioReplace2" runat="server">
					<td class="tablecolumnleft2">
						&nbsp;
					</td>
					<td>
						<div id="AENewThumbnail" style="display: none" runat="server">
							<asp:radiobuttonlist id="rblAESelectNewThumbnail" runat="server" repeatdirection="Horizontal"
								resourcekey="rblAESelectNewThumbnailResource1">
								<asp:listitem value="standard" selected="True" text="Use standard image" resourcekey="ListItemResource107">
								</asp:listitem>
								<asp:listitem value="upload" text="Upload" resourcekey="ListItemResource108">
								</asp:listitem>
							</asp:radiobuttonlist>
							<br />
							<div id="divAESelectStandardThumb" runat="server">
								<asp:dropdownlist id="ddlAESelectStandardThumb" runat="server" onload="ddlAESelectStandardThumb_Load"
									resourcekey="ddlAESelectStandardThumbResource1">
								</asp:dropdownlist>
							</div>
							<br />
							<div id="divAEUploadThumb" runat="server" style="display: none">
								<asp:fileupload id="fuAEReplaceThumbnail" runat="server" resourcekey="fuAEReplaceThumbnailResource1" />
							</div>
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
						<asp:button id="btnAudioEditSave" runat="server" onclick="btnAESaveSettings_Click"
							text="Save" width="90px" resourcekey="btnAudioEditSaveResource1" />
						&nbsp;
						<asp:button id="btnAudioEditCancel" runat="server" onclick="btnAECancel_Click" text="Cancel"
							width="90px" resourcekey="btnAudioEditCancelResource1" />
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
		</div>
	</div>
</asp:panel>
<asp:panel id="pnlContentLocalization" runat="server" visible="False" width="800px">
	<div class="contentcategories">
		<table width="750px">
			<tr>
				<td class="style2" align="center" colspan="2">
					&nbsp;
					<asp:label id="lblContentLocalization" runat="server" font-bold="True" resourcekey="lblContentLocalization"
						text="Content localization" cssclass="contenttitle"></asp:label>
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style12" align="left">
					<asp:label id="lblContentLocalizationMediaTitle" resourcekey="lblContentLocalizationMediaTitle"
						runat="server" text="Media title:" font-bold="True"></asp:label>
				</td>
				<td class="style13" align="left">
					<asp:label id="lblContentLocalizationMediaTitleOriginal" runat="server"></asp:label>
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					<asp:label id="lblContentLocalizationMediaDescription" resourcekey="lblContentLocalizationMediaDescription"
						runat="server" text="Media description:" font-bold="True"></asp:label>
				</td>
				<td align="left">
					<asp:label id="lblContentLocalizationMediaDescriptionOriginal" runat="server"></asp:label>
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="left" class="style2">
					<asp:label id="lblPortalDefLanguage" runat="server" text="Poratal default language:">
					</asp:label>
				</td>
				<td align="left">
					<asp:label id="lblDefaultPortalLangugageImage" runat="server"></asp:label>
				</td>
			</tr>
			<tr>
				<td align="left" class="style2">
					<asp:label id="lblContentLocalizationLocalizedLanguages" runat="server" resourcekey="lblContentLocalizationLocalizedLanguages"
						text="Localized languages:"></asp:label>
				</td>
				<td align="left">
					<asp:label id="lblContentLocalizationLocalizedLanguagesList" runat="server"></asp:label>
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="left" class="style2">
					<dnn:Label ID="lblContentLocalizationSelectLanguage" runat="server" HelpKey="lblContentLocalizationSelectLanguage.HelpText"
						HelpText="Select the languange you want to edit. There is no need to edit dafault language."
						Text="Select language:" />
				</td>
				<td align="left">
					<asp:dropdownlist id="ddlContentLocalizationSelectLanguage" runat="server" autopostback="True"
						onselectedindexchanged="ddlImageEditorContentLocalizationSelectLanguage_SelectedIndexChanged">
						<asp:listitem value="0">Select language</asp:listitem>
					</asp:dropdownlist>
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					<dnn:Label ID="lblContentLocalizationTitle" ResourceKey="lblContentLocalizationTitle"
						runat="server" Text="Title:" HelpKey="lblContentLocalizationTitle.HelpText" HelpText="Title:"></dnn:Label>
				</td>
				<td align="left">
					<asp:textbox id="tbContentLocalizationTitle" runat="server" width="250px">
					</asp:textbox>
					&nbsp;
					<asp:button id="btnContentLocalizationCopyDefault" runat="server" onclick="btnContentLocalizationCopyDefault_Click"
						resourcekey="btnContentLocalizationCopyDefault" text="Copy default values" />
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					<dnn:Label ID="lblContentLocalizationDescription" ResourceKey="lblContentLocalizationDescription"
						runat="server" Text="Description:" HelpKey="lblContentLocalizationDescription.HelpText"
						HelpText="Description:"></dnn:Label>
				</td>
				<td align="left">
					<dnn:TextEditor ID="txtContentLocalizationDescription" runat="server" Height="300"
						Width="550" />
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style2" align="left">
					<dnn:Label ID="lblContentLocalizationMediaUrl" runat="server" HelpKey="lblContentLocalizationMediaUrl.HelpText"
						HelpText="Media Url:" ResourceKey="lblContentLocalizationMediaUrl" Text="Media Url:" />
				</td>
				<td align="left">
					<asp:textbox id="tbContentLocalizationMediaUrl" runat="server" width="250px">
					</asp:textbox>
				</td>
			</tr>
			<tr>
				<td align="left" class="style2">
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="left" class="style2">
					&nbsp;
				</td>
				<td>
					<asp:button id="btnContentLocalizationUpdate" runat="server" onclick="btnImageEditorContentLocalizationUpdate_Click"
						resourcekey="btnContentLocalizationUpdate" text="Update" />
					&nbsp;
					<asp:button id="btnContentLocalizationClose" runat="server" onclick="btnContentLocalizationClose_Click"
						resourcekey="btnContentLocalizationClose" text="Close" />
				</td>
			</tr>
		</table>
	</div>
</asp:panel>
</p> </div> </td></tr></table> </div>
<asp:hiddenfield id="hfCloseSource" runat="server" />
</div> 