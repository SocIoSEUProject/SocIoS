<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.GallerySettings, App_Web_gallerysettings.ascx.af09375b" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<link href="<%=ModulePath%>AdminUpload.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.styleBolded
	{
		font-weight: bold;
	}
	.style7
	{
		width: 224px;
	}
	.style8
	{
	}
	.style24
	{
		width: 285px;
		height: 22px;
	}
	.style25
	{
		height: 22px;
	}
	.style30
	{
		width: 89px;
		height: 22px;
	}
	.style33
	{
	}
	.style34
	{
	}
	.style35
	{
	}
	.style37
	{
		height: 30px;
	}
	.style38
	{
		height: 30px;
	}
	.settingsleftcell
	{
		width: 158px;
	}
	.settingsleftcell
	{
		height: 23px;
	}
	.style46
	{
		height: 23px;
	}
	.style48
	{
		width: 341px;
	}
	.style51
	{
	}
	.style52
	{
		width: 409px;
	}
	.style53
	{
		width: 416px;
	}
	.style54
	{
		width: 337px;
	}
	.style59
	{
		width: 285px;
		height: 19px;
	}
	.style60
	{
		height: 19px;
	}
	.settingsleftcell2
	{
		width: 150px;
	}
	.style61
	{
	}
	.style64
	{
		width: 158px;
		height: 23px;
	}
	.style65
	{
		width: 158px;
	}
	.style66
	{
		width: 100%;
	}
	.style69
	{
		width: 145px;
		height: 30px;
	}
	.style70
	{
		height: 23px;
	}
	.style71
	{
	}
	.rightcolumn
	{
		width: 500px;
	}
	.style72
	{
		height: 23px;
	}
	.style73
	{
		width: 162px;
	}
	.style74
	{
		width: 284px;
		height: 8px;
	}
	.style79
	{
		width: 284px;
		height: 28px;
	}
	.style80
	{
		height: 28px;
	}
	.style81
	{
		height: 8px;
	}
	.style82
	{
	}
	.style84
	{
		width: 173px;
	}
	.style85
	{
		width: 166px;
	}
	.style86
	{
		width: 285px;
		height: 25px;
	}
	.style87
	{
		height: 25px;
	}
	table, tr, td
	{
		color: #000000;
	}
	.style88
	{
		width: 146px;
	}
	.style89
	{
		width: 54px;
	}
	.style90
	{
		width: 145px;
	}
	.style91
	{
	}
	.style92
	{
		width: 161px;
	}
	.style93
	{
		height: 23px;
	}
	.style94
	{
		width: 233px;
		height: 28px;
	}
	.style95
	{
		width: 233px;
		height: 8px;
	}
	.style96
	{
		width: 326px;
	}
	.style97
	{
		width: 112px;
	}
	.style98
	{
		width: 146px;
	}
	.style99
	{
		height: 23px;
		width: 129px;
	}
	.style100
	{
		width: 129px;
	}
	.style101
	{
	}
	.style102
	{
		width: 164px;
	}
	.style103
	{
		width: 175px;
	}
	.style104
	{
		height: 23px;
		width: 137px;
	}
	.style105
	{
		width: 137px;
	}
	.style106
	{
		width: 135px;
	}
	.style107
	{
		height: 12px;
		width: 137px;
	}
	.style108
	{
		height: 12px;
	}
	.style109
	{
	}
	.style110
	{
		width: 128px;
	}
	.style111
	{
		width: 185px;
	}
	.style112
	{
		height: 30px;
	}
	.style113
	{
		height: 23px;
		width: 171px;
	}
	.style114
	{
		width: 229px;
	}
	.style115
	{
		width: 136px;
	}
	.style116
	{
		width: 126px;
	}
</style>
<script type="text/javascript">
	function cbAction(elem1, elem2) {
		var chk = document.getElementById(elem1);
		var chk2 = document.getElementById(elem2);

		if (chk.checked) {
			chk2.checked = false;
		}
	}

	function cbswitch(elem1, elem2) {
		var chk = document.getElementById(elem1);
		var chk2 = document.getElementById(elem2);

		if (chk.checked == false && chk2.checked == false) {
			chk.checked = true;
		}
	}

	function cbEnable2(melem1, melem2, melem3) {
		var mchk = document.getElementById(melem1);
		var mchk2 = document.getElementById(melem2);
		var mchk3 = document.getElementById(melem3);

		if (mchk.checked) {

			mchk3.disabled = false;
			mchk2.disabled = false;
		}
		else {

			mchk3.disabled = true;
			mchk2.disabled = true;

		}
	}
</script>
<asp:objectdatasource id="odsMainGetCats" typename="DataAcess" runat="server" selectmethod="GetCategories">
	<selectparameters>
			<asp:Parameter Name="PortalID" Type="Int32" />
		</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGallery" typename="DataAcess" runat="server" selectmethod="GetGaleries" oldvaluesparameterformatstring="{0}">
	<selectparameters>
			<asp:ControlParameter ControlID="ddlMainCatSelect" Name="CategoryID" PropertyName="SelectedValue"
				Type="Int32" />
		</selectparameters>
</asp:objectdatasource>
<div id="mainGallerySettings" runat="server">
	<div id="EDGAdminContent">
		<div align="right" style="padding-bottom: 10px;">
			<asp:button id="btnClose" runat="server" onclick="btnGSCLose_Click" text="Close" resourcekey="btncloseResource1" cssclass="btnclose" /></div>
		<div class="settingstitlebox">
			<div class="settingstitletop">
			</div>
			<table cellpadding="0" cellspacing="0" class="style66" style="width: 800px;" align="center">
				<tr>
					<td class="style73">
						<img alt="Gallery Settings" src="<%=ModulePath%>images/settingsthumb.png" style="width: 125px; height: 95px; margin-left: 20px;" />
					</td>
					<td>
						<asp:label id="lblGallerySettingsTitle" runat="server" resourcekey="lblGallerySettingsTitle" cssclass="gallerysettings" text="&lt;b&gt;Gallery&lt;/b&gt; Settings"></asp:label>
						<asp:label id="lblGallerySettingsTitleAdjust" resourcekey="lblGallerySettingsTitleAdjust" runat="server" cssclass="adjustview" text="Adjust your gallery for perfect view"></asp:label>
					</td>
				</tr>
			</table>
			&nbsp;<div class="settingstitlebot">
			</div>
		</div>
		<div class="settingsselectbox">
			<table style="width: 800px;" align="center">
				<tr>
					<td colspan="3">
						<asp:objectdatasource id="odsLastModifiedGals" typename="DataAcess" runat="server" selectmethod="GetTop10Galeries" oldvaluesparameterformatstring="original_{0}">
							<selectparameters>
								<asp:Parameter Name="PortalID" Type="Int32" />
							</selectparameters>
						</asp:objectdatasource>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:checkbox id="cbShowUserImages" runat="server" autopostback="True" oncheckedchanged="cbShowUserImages_CheckedChanged" text="Show user Images" visible="False" />
						<br />
						<asp:panel id="pnlUserGallerySettings" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style73">
										<asp:label id="lblUserGalleriesShowAll" resourcekey="lblUserGalleriesShowAll" runat="server" text="Select galleries to show images from:"></asp:label>
									</td>
									<td>
										<asp:radiobuttonlist id="rblUserGalleryDisplay" runat="server" autopostback="True" repeatdirection="Horizontal" onselectedindexchanged="rblUserGalleryDisplay_SelectedIndexChanged">
											<asp:listitem resourcekey="liShowAll" value="ShowAll" selected="True">Show all</asp:listitem>
											<asp:listitem resourcekey="liShowCategories" value="select">Select categories to show galleries from</asp:listitem>
										</asp:radiobuttonlist>
									</td>
								</tr>
								<tr>
									<td class="style73">
										&nbsp;
									</td>
									<td>
										<asp:checkboxlist id="cblUserCategoriesSelect" runat="server" datatextfield="CategoryName" datavaluefield="CategoryID" repeatcolumns="3" repeatdirection="Horizontal" visible="False">
										</asp:checkboxlist>
									</td>
								</tr>
								<tr>
									<td class="style73">
										<asp:label id="lblUserGalleriesDisplayType" resourcekey="lblUserGalleriesDisplayType" runat="server" text="Select meida display mode:"></asp:label>
									</td>
									<td>
										<asp:radiobuttonlist id="rblUserGalleriesDisplayMode" runat="server" repeatdirection="Horizontal" autopostback="True" onselectedindexchanged="rblUserGalleriesDisplayMode_SelectedIndexChanged">
											<asp:listitem resourcekey="liDisplayAsNested" selected="True" value="nested">Display as nested galleries</asp:listitem>
											<asp:listitem resourcekey="liDisplayAllInOne" value="one">Display all user images in one gallery</asp:listitem>
										</asp:radiobuttonlist>
									</td>
								</tr>
								<tr>
									<td class="style73">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr id="trCatGalSelection" runat="server">
					<td colspan="3">
						<table cellpadding="2" cellspacing="2" width="100%">
							<tr>
								<td>
									<asp:panel id="pnlPortalSharing" runat="server">
										<div class="settingsportal">
											<table cellspacing="0" cellpadding="0" width="100%">
												<tr>
													<td>
														<div class="settingsportleft">
														</div>
													</td>
													<td>
														<asp:label id="lblPortalSharing" forecolor="White" style="margin-right: 38px;" font-bold="True" runat="server" resourcekey="lblPortalSharing" text="Select portal:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlPortalSharing" runat="server" appenddatabounditems="True" autopostback="True" datatextfield="PortalName" datavaluefield="PortalIDFrom" onselectedindexchanged="ddlPortalSharing_SelectedIndexChanged" cssclass="ddlcategorysettings"
															style="margin-right: 15px;">
															<asp:listitem resourcekey="liCurrentPortal" value="-1">Current portal</asp:listitem>
														</asp:dropdownlist>
													</td>
													<td>
														<div class="settingsportright">
														</div>
													</td>
												</tr>
											</table>
										</div>
									</asp:panel>
								</td>
							</tr>
							<tr>
								<td>
									<div class="settingscategory">
										<table cellspacing="0" cellpadding="0" width="100%">
											<tr>
												<td>
													<div class="settingscatleft">
													</div>
												</td>
												<td>
													<asp:label id="lblCategorySelect" runat="server" text="Select category:" forecolor="White" style="margin-right: 15px;" font-bold="True" resourcekey="lblCategorySelectResource1"></asp:label>
													&nbsp;
												</td>
												<td>
													<asp:dropdownlist id="ddlMainCatSelect" runat="server" style="margin-right: 15px;" autopostback="True" cssclass="ddlcategorysettings" onselectedindexchanged="ddlMainCatSelect_SelectedIndexChanged" datatextfield="CategoryName" datavaluefield="CategoryID"
														appenddatabounditems="True" resourcekey="ddlMainCatSelectResource1">
													</asp:dropdownlist>
												</td>
												<td>
													<div class="settingscatright">
													</div>
												</td>
											</tr>
										</table>
									</div>
								</td>
								<td rowspan="2">
									<table align="right" cellpadding="0" cellspacing="0" class="boxmovecopy">
										<tr>
											<td style="background-color: #cbe48c">
												<div class="boxlasttop">
													<asp:label id="lblSelectLastModifiedGallery" resourcekey="lblSelectLastModifiedGallery" runat="server" cssclass="lastMod" text="Select last modified gallery:"></asp:label>
												</div>
												<table cellpadding="0" cellspacing="0" style="height: 35px;" width="100%">
													<tr>
														<td align="center">
															<asp:dropdownlist id="ddlLastModifiedGalleries" runat="server" autopostback="True" datasourceid="odsLastModifiedGals" datatextfield="GalleryName" datavaluefield="GalleryID" onselectedindexchanged="ddlLastModifiedGalleries_SelectedIndexChanged" appenddatabounditems="True"
																causesvalidation="True" cssclass="ddlcategorysettings" resourcekey="ddlLastModifiedGalleriesResource1">
																<asp:listitem value="select" resourcekey="ListItemResource1">Select gallery</asp:listitem>
															</asp:dropdownlist>
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
								<td>
									<div class="settingsgallery">
										<table cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td>
													<div class="settingsgalleft">
													</div>
												</td>
												<td>
													<asp:label id="lblGallerySelect" runat="server" font-bold="True" forecolor="White" style="margin-right: 33px;" text="Select gallery: " resourcekey="lblGallerySelectResource1"></asp:label>
												</td>
												<td>
													<asp:dropdownlist id="ddlGallerySelect" runat="server" autopostback="True" causesvalidation="True" cssclass="ddlcategorysettings" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" ondatabound="ddlGallerySelect_DataBound"
														style="margin-right: 15px;" resourcekey="ddlGallerySelectResource1">
														<asp:listitem resourcekey="ListItemResource2">
														</asp:listitem>
													</asp:dropdownlist>
												</td>
												<td>
													<div class="settingsgalright">
													</div>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="style44" colspan="2">
						<asp:requiredfieldvalidator id="rfvGallerySelect" runat="server" controltovalidate="ddlGallerySelect" errormessage="Please select gallery." setfocusonerror="True" validationgroup="vvNema" resourcekey="rfvGallerySelectResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
					</td>
					<td rowspan="2" valign="bottom">
						<br />
					</td>
				</tr>
				<tr>
					<td colspan="2">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:label id="lblDisplayTypeSelect" runat="server" text="Select type of display:" cssclass="selecttitle" resourcekey="lblDisplayTypeSelectResource1"></asp:label>
						<div class="selectline">
						</div>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblSelectDisplayType" ResourceKey="lblSelectDisplayType" runat="server" Text="Select type of display:" HelpText="Select the type of display to display gallery media:" HelpKey="lblSelectDisplayType.HelpText"></dnn:Label>
					</td>
					<td colspan="2" class="rightcolumn">
						<asp:radiobuttonlist id="rblDisplaySelect" runat="server" autopostback="True" onselectedindexchanged="rblDisplaySelect_SelectedIndexChanged" width="587px" resourcekey="rblDisplaySelectResource1">
							<asp:listitem value="tablegallery" resourcekey="ListItemResource3">Lightbox Gallery (Images, Video, Audio) <span style="font-weight: bold; font-size: 10px; color: #ff0000;">responsive</span></asp:ListItem>
							<asp:listitem value="lightbox2" resourcekey="lightbox2Resource">LightBox Caption Slider (images, video, audio)</asp:listitem>
							<asp:listitem resourcekey="ListItemPortfolio" value="portfolio">Lightbox portfolio gallery (Images, Video, Audio)</asp:listitem>
							<asp:listitem value="slideshow" resourcekey="ListItemResource4">Slide Show (Images)</asp:listitem>
							<asp:listitem value="ssthumbs" resourcekey="ListItemResource5">Slideshow with thumbnails (Images)</asp:listitem>
							<asp:listitem value="ssthumbs2" resourcekey="ListItemResourceSS2">Slideshow with thumbnails 2 (Images)</asp:listitem>
							<asp:listitem value="ssthumbs3" resourcekey="ListItemResourceSS3">Slideshow with thumbnails 3 (Images)</asp:listitem>
							<%--<asp:ListItem Value="ssthumbs4">Slideshow with thumbnails 4 (Images)</asp:ListItem> --%>
							<asp:listitem value="AdvancedSlideShow" resourcekey="ASSListItem">Advanced Slide Show</asp:listitem>
							<asp:listitem value="FlashGallery" resourcekey="ListItemResource6">Flash Tab Gallery (Images, FLV video)</asp:listitem>
							<asp:listitem value="VideoGallery" resourcekey="ListItemResource7">Video Gallery (Video)</asp:listitem>
							<asp:listitem value="videogallery2" resourcekey="VideoGallery2">Video Gallery 2 (Video)</asp:listitem>
							<asp:listitem value="videogallery3" resourcekey="VideoGallery3">Video Gallery 3 (Video)</asp:listitem>
							<asp:listitem value="audiogallery" resourcekey="ListItemResource8">Audio Gallery (Audio)</asp:listitem>
							<asp:listitem value="audiogallery2" resourcekey="audiogallery2">Audio Gallery 2 (Audio)</asp:listitem>
							<asp:listitem value="ImageSlider" resourcekey="ListItemResource9">Image Slider 1 (Images)</asp:listitem>
							<asp:listitem value="ImageCarousel" resourcekey="ListItemResource10">Image Carousel (Images)</asp:listitem>
							<asp:listitem value="verticalcarousel" resourcekey="ListItemResourceVC">Vertical Carousel (Images, Video, Audio)</asp:listitem>
							<asp:listitem value="streaming" resourcekey="ListItemResourceStreaming">Streaming Video</asp:listitem>
							<asp:ListItem Value="Chameleon" resourcekey="ListItemResourceChameleon">Chameleon gallery (Images, Video, Audio) <span style="font-weight: bold; font-size: 10px; color: #ff0000;">responsive</span></asp:ListItem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxThemeSelect" ResourceKey="lblLightBoxThemeSelect" runat="server" Text="Select lightbox theme:" HelpText="Select the theme for lightbox:" HelpKey="lblLightBoxThemeSelect.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblLightboxType" runat="server" width="282px" resourcekey="rblLightboxTypeResource1">
							<asp:listitem value="pp_default" resourcekey="ListItemResourceBlackAndWhite" selected="True">Black and white modern</asp:listitem>
							<asp:listitem value="light_rounded" resourcekey="ListItemResource11">Light rounded</asp:listitem>
							<asp:listitem value=" light_square" resourcekey="ListItemResource12"> Light square</asp:listitem>
							<asp:listitem value="dark_rounded" resourcekey="ListItemResource13">Dark rounded</asp:listitem>
							<asp:listitem value="dark_square" resourcekey="ListItemResource14">Dark square</asp:listitem>
							<asp:listitem value="facebook" resourcekey="ListItemResource15">Black and white rounded</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxImageOptions" runat="server" Text="Lightbox image options:" HelpText="Lightbox image options:" HelpKey="lblLightBoxImageOptions.HelpText" ResourceKey="lblLightBoxImageOptions"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbShowPrintButton" resourcekey="cbShowPrintButton" runat="server" text="Show print button" />
						<br />
						<asp:checkbox id="cbShowEmailButton" resourcekey="cbShowEmailButton" runat="server" text="Show email button" />
						<br />
						<asp:checkbox id="cbEnableSocialSharing" resourcekey="cbEnableSocialSharing" runat="server" text="Enable social sharing" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxJquerySelect" runat="server" Text="Include jQuery:" HelpText="Include jQuery:" HelpKey="lblLightBoxJquerySelect.HelpText" ResourceKey="lblLightBoxJquerySelect"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblIncludejQuery" runat="server" autopostback="True" onselectedindexchanged="rblIncludejQuery_SelectedIndexChanged" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liUseDafultSettings" selected="True" value="default">Use default settings</asp:listitem>
							<asp:listitem resourcekey="liCustomizeForThisModuleSettings" value="custom">Customize for this module</asp:listitem>
						</asp:radiobuttonlist>
						<asp:checkbox id="cbIncludeJquery" runat="server" checked="True" visible="False" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxOpacity" runat="server" Text="Lightbox opacity:" HelpText="Set the Lightbox opacity:" Visible="False"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbLightboxOpacity" runat="server" width="50px" visible="False">80</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAGSPlayerVolume0" runat="server" controltovalidate="tbLightboxOpacity" display="Dynamic" errormessage="This field is required." visible="False" resourcekey="rfvAGSPlayerVolume0Resource1.ErrorMessage" setfocusonerror="True"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAGVolume0" runat="server" controltovalidate="tbLightboxOpacity" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" type="Integer" visible="False" resourcekey="rvAGVolume0Resource1.ErrorMessage"
							setfocusonerror="True">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxOpacity0" runat="server" Text="Lightbox padding:" HelpText="Lightbox padding:" Visible="False"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbLightboxPadding" runat="server" visible="False" width="50px">80</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAGSPlayerVolume1" runat="server" controltovalidate="tbLightboxPadding" display="Dynamic" errormessage="This field is required." visible="False" resourcekey="rfvAGSPlayerVolume1Resource1.ErrorMessage" setfocusonerror="True"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAGVolume1" runat="server" controltovalidate="tbLightboxPadding" display="Dynamic" errormessage="Enter value between 20-300." maximumvalue="300" minimumvalue="20" type="Integer" visible="False" resourcekey="rvAGVolume1Resource1.ErrorMessage"
							setfocusonerror="True">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblLightBoxOpacity1" runat="server" Text="Show title in Lightbox:" HelpText="Show media title in Lightbox:" Visible="False"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightBoxTitle" runat="server" visible="False" resourcekey="cbLightBoxTitleResource1" />
					</td>
				</tr>
			</table>
		</div>
		<div style="background: #EFEFEF">
			<table id="tblIntegrate" runat="server" width="80%" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<asp:checkbox id="cbIntegrateGalleryWithBlog" runat="server" oncheckedchanged="cbIntegrate_CheckedChanged" text="Integrate this gallery display with news or blog module" autopostback="True" font-bold="True" resourcekey="cbIntegrateGalleryWithBlogResource1" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
		<asp:panel id="pnlBlogIntegrate" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlBlogIntegrateResource1">
			<table cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td>
						<div class="settingsintleft">
						</div>
					</td>
					<td style="background-color: #7a7a7a">
						<asp:label id="lblEditIntegration" runat="server" cssclass="settingsinttitle" text="Edit Integration" resourcekey="lblEditIntegrationResource1"></asp:label>
					</td>
					<td>
						<div class="settingsintright">
						</div>
					</td>
				</tr>
			</table>
			<div class="settingsintbgrd">
			</div>
			<div class="settingsinttable">
				<table align="center" cellpadding="2" cellspacing="2">
					<tr>
						<td class="style8" colspan="3">
							<table align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td class="style61">
										&nbsp;
									</td>
									<td class="style7">
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style61">
										<dnn:Label ID="lblQueryString" ResourceKey="lblQueryString" runat="server" Text="Enter query string:" ControlName="tbQueryString" HelpText="Enter the query string of blog module:" HelpKey="lblQueryString.HelpText"></dnn:Label>
									</td>
									<td class="style7">
										<asp:textbox id="tbQueryString" runat="server" style="margin-left: 0px" width="100px">
										</asp:textbox>
									</td>
									<td>
										<asp:requiredfieldvalidator id="rfvIntegrationQueryString" runat="server" controltovalidate="tbQueryString" display="Dynamic" errormessage="This field is required." resourcekey="rfvIntegrationQueryStringResource1.ErrorMessage">
										</asp:requiredfieldvalidator>
									</td>
								</tr>
								<tr>
									<td class="style61">
										<dnn:Label ID="lblArticleID" ResourceKey="lblArticleID" runat="server" ControlName="tbIntegArtID" HelpText="Enter the ID of blog article:" Text="Enter ArticleID:" HelpKey="lblArticleID.HelpText" />
									</td>
									<td class="style7">
										<dnn:Label ID="lblIntegratedGalllerySelection" ResourceKey="lblIntegratedGalllerySelection" runat="server" ControlName="ddlIntegGalSel" HelpText="Select the gallery to integrate with blog:" Text="Select gallery to display:" HelpKey="lblIntegratedGalllerySelection.HelpText" />
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style61">
										<asp:textbox id="tbIntegArtID" runat="server" style="margin-left: 0px" width="100px" resourcekey="tbIntegArtIDResource1">
										</asp:textbox>
										<br />
									</td>
									<td class="style7">
										<asp:dropdownlist id="ddlIntegGalSel" runat="server" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" width="190px" resourcekey="ddlIntegGalSelResource1">
										</asp:dropdownlist>
									</td>
									<td>
										<asp:button id="btnAddList" runat="server" onclick="btnAddList_Click" text="Add" width="90px" resourcekey="btnAddListResource1" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="style8" colspan="2">
							&nbsp;
							<asp:requiredfieldvalidator id="rfvIntegrationArticleID" runat="server" controltovalidate="tbIntegArtID" display="Dynamic" errormessage="This field is required." resourcekey="rfvIntegrationArticleIDResource1.ErrorMessage">
							</asp:requiredfieldvalidator>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style5" colspan="3" align="center">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<asp:gridview id="gvIntegration" runat="server" allowpaging="True" autogeneratecolumns="False" border="0" cellpadding="4" cssclass="intliststylebox" datakeynames="EntryID" datasourceid="odsIntegration" forecolor="Black" gridlines="Horizontal" onselectedindexchanged="gvIntegration_SelectedIndexChanged"
								pagesize="30" width="600px" resourcekey="gvIntegrationResource1">
								<alternatingrowstyle cssclass="intgrid1" />
								<columns>
									<asp:TemplateField HeaderText="Actions" ShowHeader="False">
										<EditItemTemplate>
											<asp:LinkButton ID="lblgvIntegrateUpdate" runat="server" CausesValidation="True"
												CommandName="Update" Text="Update" resourcekey="lblgvIntegrateUpdate"></asp:LinkButton>
											&nbsp;<asp:LinkButton ID="lblgvIntegrateCancel" runat="server" CausesValidation="False"
												CommandName="Cancel" Text="Cancel" resourcekey="lblgvIntegrateCancel"></asp:LinkButton>
										</EditItemTemplate>
										<ItemTemplate>
											<asp:LinkButton ID="lblGVIntegrateEdit" runat="server" CausesValidation="False" CommandName="Edit"
												Text="Edit" resourcekey="lblGVIntegrateEdit"></asp:LinkButton>
											&nbsp;<asp:LinkButton ID="lblGVIntegrateDelete" runat="server" CausesValidation="False"
												CommandName="Delete" Text="Delete" resourcekey="lblGVIntegrateDelete"></asp:LinkButton>
										</ItemTemplate>
										<ControlStyle CssClass="gallerycontrollinklight" />
										<HeaderStyle VerticalAlign="Middle" />
										<ItemStyle CssClass="gallerycontrollinklight" />
									</asp:TemplateField>
									<asp:BoundField DataField="ArticleID" HeaderText="ArticleID" meta:resourcekey="ArticleID">
										<HeaderStyle VerticalAlign="Middle" />
										<ItemStyle HorizontalAlign="Center" />
									</asp:BoundField>
									<asp:BoundField DataField="GalleryID" HeaderText="GalleryID" meta:resourcekey="GalleryID">
										<HeaderStyle VerticalAlign="Middle" />
										<ItemStyle HorizontalAlign="Center" />
									</asp:BoundField>
									<asp:BoundField DataField="GalleryName" HeaderText="Galleryname" meta:resourcekey="Galleryname"
										ReadOnly="True">
										<ItemStyle HorizontalAlign="Center" />
									</asp:BoundField>
								</columns>
								<footerstyle cssclass="intgrid1" />
								<headerstyle cssclass="settingsintheaderbgrd" font-names="arial" font-size="14px" forecolor="#343E1C" verticalalign="Middle" />
								<pagerstyle backcolor="#E3E1E1" cssclass="pagegal" forecolor="#556C20" height="45px" horizontalalign="Center" />
								<rowstyle cssclass="intgrid2" />
								<selectedrowstyle cssclass="intgridselected" />
							</asp:gridview>
						</td>
					</tr>
					<tr>
						<td class="style8">
							<asp:objectdatasource id="odsIntegration" typename="DataAcess" runat="server" selectmethod="GetAllIntegration" deletemethod="DeleteIntegration" updatemethod="UpdateIntegration">
								<deleteparameters>
									<asp:Parameter Name="EntryID" Type="Int32" />
								</deleteparameters>
								<selectparameters>
									<asp:Parameter Name="PortalID" Type="Int32" />
									<asp:Parameter Name="ModuleID" Type="Int32" />
								</selectparameters>
								<updateparameters>
									<asp:Parameter Name="EntryID" Type="Int32" />
									<asp:Parameter Name="ArticleID" Type="Int32" />
									<asp:Parameter Name="GalleryID" Type="Int32" />
								</updateparameters>
							</asp:objectdatasource>
						</td>
						<td class="style7">
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style8">
							&nbsp;
						</td>
						<td class="style7">
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style8">
							&nbsp;
						</td>
						<td class="style7">
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<br />
			<br />
		</asp:panel>
		<asp:panel id="pnlUserUpload" runat="server" backcolor="#EFEFEF" resourcekey="pnlBlogIntegrateResource1">
			<div style="background: #EFEFEF">
				<table width="80%" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<asp:checkbox id="cbEnableUserUpload" runat="server" autopostback="True" oncheckedchanged="cbEnableUserUpload_CheckedChanged" text="Enable user upload into this gallery" resourcekey="lblEnableUserUpload" font-bold="True" />
						</td>
					</tr>
				</table>
			</div>
			<br />
			<asp:panel id="pnlUserUpladSettings" runat="server" visible="False">
				<table cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<div class="settingsintleft">
							</div>
						</td>
						<td style="background-color: #7a7a7a">
							<asp:label id="lblUUserUpload" runat="server" resourcekey="lblUUserUpload" cssclass="settingsinttitle" text="User Upload"></asp:label>
						</td>
						<td>
							<div class="settingsintright">
							</div>
						</td>
					</tr>
				</table>
				<div class="settingsintbgrd">
				</div>
				<div class="settingsinttable">
					<table align="center" cellpadding="2" cellspacing="2">
						<tr>
							<td class="style8">
								<table align="center" cellpadding="2" cellspacing="2">
									<tr>
										<td class="style61">
											<table class="style66">
												<tr>
													<td class="style84">
														&nbsp;
													</td>
													<td>
													</td>
												</tr>
												<tr>
													<td class="style84">
														<dnn:Label ID="lblUserUploadRoles" runat="server" Text="Select roles:" HelpText="Select security roles that can upload or approve media." HelpKey="lblUserUploadRoles.HelpText" ResourceKey="lblUserUploadRoles"></dnn:Label>
													</td>
													<td>
														<asp:gridview id="gvUploadRoles" runat="server" autogeneratecolumns="False" cellpadding="4" cssclass="intliststylebox" forecolor="#333333" gridlines="None" onrowdatabound="gvUploadRoles_RowDataBound">
															<rowstyle backcolor="#EFEFEF" forecolor="#333333" />
															<columns>
																<asp:TemplateField HeaderText="Role">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Role") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:Label ID="lblRoleName" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Images">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="cbImage" runat="server" Checked='<%# Bind("Image") %>' />
																	</ItemTemplate>
																	<ItemStyle HorizontalAlign="Center" />
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Video files">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Video files]") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="cbVideoFiles" runat="server" Checked='<%# Bind("[Video files]") %>' />
																	</ItemTemplate>
																	<ItemStyle HorizontalAlign="Center" />
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Embed Video">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Video") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="cbVideo" runat="server" Checked='<%# Bind("Video") %>' />
																	</ItemTemplate>
																	<ItemStyle HorizontalAlign="Center" />
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Audio">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Audio") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="cbAudio" runat="server" Checked='<%# Bind("Audio") %>' />
																	</ItemTemplate>
																	<ItemStyle HorizontalAlign="Center" />
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Approve">
																	<EditItemTemplate>
																		<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Approve") %>'></asp:TextBox>
																	</EditItemTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="cbApproved" runat="server" Checked='<%# Bind("Approved") %>' />
																	</ItemTemplate>
																	<ItemStyle HorizontalAlign="Center" />
																</asp:TemplateField>
															</columns>
															<footerstyle backcolor="#5D7B9D" forecolor="White" font-bold="True" />
															<pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
															<selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
															<headerstyle backcolor="#7A7A7A" font-bold="True" forecolor="White" />
															<editrowstyle backcolor="#999999" />
															<alternatingrowstyle backcolor="White" forecolor="#284775" />
														</asp:gridview>
													</td>
												</tr>
												<tr>
													<td class="style84">
														<dnn:Label ID="lblEnableApproval" runat="server" Text="Aprove Media:" HelpText="Uploaded media needs approval." HelpKey="lblEnableApproval.HelpText" ResourceKey="lblEnableApproval"></dnn:Label>
													</td>
													<td>
														<asp:checkbox id="cbApproveMedia" runat="server" />
													</td>
												</tr>
												<tr>
													<td class="style84">
														<dnn:Label ID="lblEnterUrl" runat="server" Text="Show enter url:" HelpText="Show field for image link on upload form." HelpKey="lblEnterUrl.HelpText" ResourceKey="lblEnterUrl"></dnn:Label>
													</td>
													<td>
														<asp:checkbox id="cbShowEnterUrl" runat="server" />
													</td>
												</tr>
												<tr>
													<td class="style84">
														<dnn:Label ID="lblResizeImages" runat="server" Text="Resize images:" HelpText="Resize uploaded images:" HelpKey="lblResizeImages.HelpText" ResourceKey="lblResizeImages"></dnn:Label>
													</td>
													<td>
														<asp:panel id="pnlImageUploadResize" runat="server" meta:resourcekey="pnlImageUploadResizeResource1" resourcekey="pnlImageUploadResizeResource1">
															<table>
																<tr>
																	<td rowspan="2">
																		<asp:checkbox id="cbResizeImages" runat="server" />
																		&nbsp;
																	</td>
																	<td>
																		<asp:label id="lblImageUploadResizeWidth" runat="server" resourcekey="lblImageUploadResizeWidthResource1" text="Max width:"></asp:label>
																	</td>
																	<td>
																		<asp:textbox id="tbImageUploadResizeWidth" runat="server" meta:resourcekey="tbImageUploadResizeWidthResource1" resourcekey="tbImageUploadResizeWidthResource1" text="800" width="50px">
																		</asp:textbox>
																		<asp:comparevalidator id="cvImagerResize" runat="server" controltovalidate="tbImageUploadResizeWidth" display="Dynamic" errormessage="Please enter number only." meta:resourcekey="cvImagerResizeResource1" operator="DataTypeCheck" resourcekey="cvImagerResizeResource1.ErrorMessage"
																			type="Integer" validationgroup="vgImageUpload">
																		</asp:comparevalidator>
																		<asp:requiredfieldvalidator id="rfvImageUpload" runat="server" controltovalidate="tbImageUploadResizeWidth" errormessage="This filed is required." meta:resourcekey="rfvImageUploadResource1" resourcekey="rfvImageUploadResource1.ErrorMessage" validationgroup="vgImageUpload">
																		</asp:requiredfieldvalidator>
																	</td>
																</tr>
																<tr>
																	<td>
																		<asp:label id="lblImageUploadResizeHeight" runat="server" resourcekey="lblImageUploadResizeHeightResource1" text="Max height:"></asp:label>
																	</td>
																	<td>
																		<asp:textbox id="tbImageUploadResizeHeight" runat="server" meta:resourcekey="tbImageUploadResizeHeightResource1" resourcekey="tbImageUploadResizeHeightResource1" text="600" width="50px">
																		</asp:textbox>
																		<asp:comparevalidator id="cvImagerResizeHeight" runat="server" controltovalidate="tbImageUploadResizeHeight" display="Dynamic" errormessage="Please enter number only." meta:resourcekey="cvImagerResizeHeightResource1" operator="DataTypeCheck" resourcekey="cvImagerResizeHeightResource1.ErrorMessage"
																			type="Integer" validationgroup="vgImageUpload">
																		</asp:comparevalidator>
																		<asp:requiredfieldvalidator id="rfvImageUploadHeight" runat="server" controltovalidate="tbImageUploadResizeHeight" errormessage="This filed is required." meta:resourcekey="rfvImageUploadHeightResource1" resourcekey="rfvImageUploadHeightResource1.ErrorMessage"
																			validationgroup="vgImageUpload">
																		</asp:requiredfieldvalidator>
																	</td>
																</tr>
															</table>
													</td>
												</tr>
												<tr>
													<td class="style84">
														<dnn:Label ID="lblShowOnlyUpload" runat="server" Text="Show only upload control:" HelpKey="lblShowOnlyUpload.HelpText" HelpText="Show only user upload control on the page:" ResourceKey="lblShowOnlyUpload"></dnn:Label>
													</td>
													<td>
														<asp:checkbox id="cbShowOnlyUpload" runat="server" />
													</td>
												</tr>
											</table>
			</asp:panel>
			</td>
			<td>
				&nbsp;
			</td>
		</tr> </table> </td> </tr> </table></div>
	</asp:Panel>
	<br />
	<br />
	</asp:Panel>
	<asp:panel id="pnlChameleonGallery" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlTableGalleryResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblChameleonGallery" resourcekey="lblChameleonGallery" runat="server" cssclass="settingsdetailtitle" text="Chameleon Gallery"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style112">
						&nbsp;
					</td>
					<td class="style38" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style112">
						<dnn:Label ID="lblChameleonSelectLayoutType" runat="server" HelpText="Select the layout type:" Text="Select the layout type:" HelpKey="lblChameleonSelectLayoutType.HelpText" ResourceKey="lblChameleonSelectLayoutType" />
					</td>
					<td align="left" class="style38" colspan="2">
						<asp:radiobuttonlist id="rblChameleonLayoutTypeSelect" runat="server" repeatdirection="Horizontal" autopostback="True" onselectedindexchanged="rblChameleonLayoutTypeSelect_SelectedIndexChanged">
							<asp:listitem resourcekey="liFixed" selected="True" value="fixed">Fixed Layout</asp:listitem>
							<asp:listitem resourcekey="liResponsive" value="responsive">Responsive Layout</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style112" colspan="3">
						<div class="settings_category_container">
							<div class="category_toggle">
								<p class="section_number">
									1</p>
								<h2>
									<span>Predefined settings</span>
								</h2>
							</div>
							<div class="category_content">
								<asp:hiddenfield id="hfChameleonPreset" runat="server" value="0" />
								<asp:datalist id="dlChameleonPresets" runat="server" repeatcolumns="4" onitemcommand="dlChameleonPresets_ItemCommand" repeatdirection="Horizontal" cssclass="datalist_table" itemstyle-horizontalalign="Center" itemstyle-verticalalign="Top">
									<itemtemplate>
							<div>
							<h2>
								<asp:Label ID="lblPresetName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:Label></h2>
							
							<asp:Image ID="imgThumbPreSet" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImageURL") %>' CssClass="presetimage" />
							<asp:LinkButton ID="lbLoadXmlPreSet" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FileName") %>' CommandName="Load" CssClass="EDR_admin_button"><span>Load</span></asp:LinkButton>
							</div>
						</itemtemplate>
								</asp:datalist>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="style38" colspan="2">
						<asp:label id="lblChameleonGalleryTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style112">
						<dnn:Label ID="lblLightboxTemplateSelect2" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" Text="Select template:" ResourceKey="lblVerticalCarouselTemplateSelect" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlChameleonGalleryTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlLightboxTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style112">
						<dnn:Label ID="lblChameleonGalleryThemeSelect" runat="server" HelpText="Select the CSS theme file:" Text="Select CSS:" HelpKey="lblImageCarouselThemeSelect.HelpText" ResourceKey="lblImageCarouselThemeSelect" />
					</td>
					<td class="style38" align="left" colspan="2">
						<asp:dropdownlist id="ddlChameleonGalleryThemeSelect" runat="server" autopostback="True" onselectedindexchanged="ddlChameleonGalleryThemeSelect_SelectedIndexChanged1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style112">
						<dnn:Label ID="lblChameleonGalleryThemeDisplayStyle" runat="server" HelpText="Select the CSS theme styling:" Text="Select the CSS theme styling:" HelpKey="lblChameleonGalleryThemeDisplayStyle.HelpText" ResourceKey="lblChameleonGalleryThemeDisplayStyle" />
					</td>
					<td align="left" class="style38" colspan="2">
						<asp:dropdownlist id="ddlChameleonGalleryThemeSelectStyling" runat="server">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style112">
						&nbsp;
					</td>
					<tr>
						<td class="style112" style="background-color: #ceeff8">
							<dnn:Label ID="lblChameleonGalleryDispplayNestedGalleries" runat="server" HelpKey="lblLightboxGalleryDispplayNestedGalleries.HelpText" HelpText="Display nested galleries:" ResourceKey="lblLightboxGalleryDispplayNestedGalleries" Text="Display nested galleries:" />
						</td>
						<td class="style38" colspan="2">
							<div style="background-color: #ceeff8; display: inline-block; padding: 7px;">
								<asp:checkbox id="cbChameleonGalleryDisplayNestedGalleries" runat="server" autopostback="True" oncheckedchanged="cbChameleonGalleryDisplayNestedGalleries_CheckedChanged" resourcekey="cbLightboxGalleryDisplayNestedGalleriesResource1" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="style37" colspan="3">
							<asp:panel id="pnlChameleonGalleryNestedGalleriesOptions" runat="server" resourcekey="pnlNestedGalleriesOptionsResource1" visible="False">
								<table border="0" cellpadding="0" cellspacing="0" class="tblnestedgallery" width="100%">
									<tr>
										<td>
											<asp:panel id="pnlChameleonGalleryNGGallerySettings" runat="server" backcolor="#C9DEAD" resourcekey="pnlTGNGGallerySettingsResource1">
												<table cellpadding="0" cellspacing="0" class="style66" style="border-top: 3px solid #91c848">
													<tr>
														<td>
															<table cellpadding="2" cellspacing="2" class="tbltitlenestedcategory">
																<tr>
																	<td style="background-color: #91c848">
																		<asp:label id="lblLightboxGalleryNestedGallerySettings2" runat="server" cssclass="settingsdetailtitle" resourcekey="lblLightboxGalleryNestedGallerySettingsResource1" text="Nested galleries settings"></asp:label>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table align="center" border="0" cellpadding="2" cellspacing="2" width="80%">
																<tr>
																	<td align="left" colspan="3">
																		&nbsp;
																	</td>
																</tr>
																<tr>
																	<td align="left" colspan="3">
																		<asp:label id="lblChameleonGalleryNestedGallerySelection" runat="server" font-bold="True" resourcekey="lblLightboxGalleryNestedGallerySelectionResource1" text="Gallery selection:"></asp:label>
																		<br />
																		<asp:checkboxlist id="cblChameleonGalleryNestedGallerySelection" runat="server" cellpadding="2" cellspacing="5" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" ondatabound="cblTGNGGallerySelection_DataBound" onselectedindexchanged="cblChameleonGalleryNestedGallerySelection_SelectedIndexChanged"
																			repeatcolumns="2" resourcekey="cblLightboxGalleryNestedGallerySelectionResource1">
																		</asp:checkboxlist>
																		<asp:label id="lblChameleonGalleryNoNestedGalleryError" runat="server" forecolor="Red" resourcekey="lblLightboxGalleryNoNestedGalleryErrorResource1" text="Please add an select some galleries." visible="False"></asp:label>
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
																		<asp:checkbox id="cbChameleonGalleryNestedShowAllGalleries" runat="server" autopostback="True" oncheckedchanged="cbChameleonGalleryNestedShowAllGalleries_CheckedChanged" resourcekey="cbLightboxGalleryNestedShowAllGalleriesResource1" text="Show all galleries" />
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
																		&nbsp;
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
																		<asp:label id="lblChameleonGalleryCategory" runat="server" font-bold="True" resourcekey="lblChameleonGalleryCategory" text="Category options"></asp:label>
																	</td>
																</tr>
																<tr id="trChamcNestedWidth" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGThumbWidth" runat="server" HelpText="Category item width:" Text="Category item width:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:textbox id="tbChameleonGalleryNGImageWidth" runat="server" resourcekey="tbTGImageHeightResource1" validationgroup="vgChameleonSettings" width="50px">100</asp:textbox>
																		<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageHeight3" runat="server" controltovalidate="tbChameleonGalleryNGImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageHeightResource1.ErrorMessage"
																			validationgroup="vgChameleonSettings">
																		</asp:requiredfieldvalidator>
																		<asp:comparevalidator id="cvLightboxGalleryNestedImageHeight3" runat="server" controltovalidate="tbChameleonGalleryNGImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
																			setfocusonerror="True" type="Integer" validationgroup="vgChameleonSettings">
																		</asp:comparevalidator>
																	</td>
																</tr>
																<tr id="trChamcNestedHeight" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGThumbHeight" runat="server" HelpKey="lblChameleonGalleryNGThumbHeight.HelpText" HelpText="Category item height:" ResourceKey="lblChameleonGalleryNGThumbHeight.Text" Text="Category item height:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:textbox id="tbChameleonGalleryNGImageHeight" runat="server" validationgroup="vgChameleonSettings" width="50px">45</asp:textbox>
																		<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth5" runat="server" controltovalidate="tbChameleonGalleryNGImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
																			validationgroup="vgChameleonSettings">
																		</asp:requiredfieldvalidator>
																		<asp:comparevalidator id="cvLightBoxGalleryImageWidth3" runat="server" controltovalidate="tbChameleonGalleryNGImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageWidthResource1.ErrorMessage"
																			type="Integer" validationgroup="vgChameleonSettings">
																		</asp:comparevalidator>
																	</td>
																</tr>
																<tr id="trChamcNestedThumbPosition" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGThumbPosition" runat="server" HelpKey="lblChameleonGalleryNGThumbPosition.HelpText" HelpText="Category items position:" ResourceKey="lblChameleonGalleryNGThumbPosition.Text" Text="Category items position:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:radiobuttonlist id="rblChameleonGalleryNGThumbPositionInOut" runat="server" repeatdirection="Horizontal">
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutIN" value="Inside">Inside image panel</asp:listitem>
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutOUT" selected="True" value="Outside">Outside image panel</asp:listitem>
																		</asp:radiobuttonlist>
																	</td>
																</tr>
																<tr id="trChamcNestedThumbPosition2" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGThumbPosition1" runat="server" HelpKey="lblChameleonGalleryNGThumbPosition1.HelpText" HelpText="Category items position:" ResourceKey="lblChameleonGalleryNGThumbPosition1.Text" Text="Category items position:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:radiobuttonlist id="rblChameleonGalleryNGThumbPositionLRTB" runat="server" autopostback="True" onselectedindexchanged="rblChameleonGalleryNGThumbPositionLRTB_SelectedIndexChanged" repeatdirection="Horizontal">
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBTop">Top</asp:listitem>
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBBottom" selected="True">Bottom</asp:listitem>
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBLeft">Left</asp:listitem>
																			<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBRight">Right</asp:listitem>
																		</asp:radiobuttonlist>
																	</td>
																</tr>
																<tr id="trChamcNestedGalContainer" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGContainer" runat="server" HelpKey="lblChameleonGalleryNGContainer.HelpText" HelpText="Category containter width:" ResourceKey="lblChameleonGalleryNGContainer.Text" Text="Category containter width:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:textbox id="tbChameleonGalleryCategoryWitdh" runat="server" width="50px">580</asp:textbox>
																		<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth6" runat="server" controltovalidate="tbChameleonGalleryCategoryWitdh" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
																			validationgroup="vgChameleonSettings">
																		</asp:requiredfieldvalidator>
																		<asp:comparevalidator id="cvLightBoxGalleryImageHeight5" runat="server" controltovalidate="tbChameleonGalleryCategoryWitdh" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
																			type="Integer" validationgroup="vgChameleonSettings">
																		</asp:comparevalidator>
																	</td>
																</tr>
																<tr id="trChamcNestedGalContainerHeight" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGContainerHeight" runat="server" HelpKey="lblChameleonGalleryNGContainerHeight.HelpText" HelpText="Category containter height:" ResourceKey="lblChameleonGalleryNGContainerHeight.Text" Text="Category containter height:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:textbox id="tbChameleonGalleryCategoryHeight" runat="server" height="22px" width="50px">60</asp:textbox>
																		<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth7" runat="server" controltovalidate="tbChameleonGalleryCategoryHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
																			validationgroup="vgChameleonSettings">
																		</asp:requiredfieldvalidator>
																		<asp:comparevalidator id="cvLightBoxGalleryImageHeight6" runat="server" controltovalidate="tbChameleonGalleryCategoryHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
																			type="Integer" validationgroup="vgChameleonSettings">
																		</asp:comparevalidator>
																	</td>
																</tr>
																<tr id="trChamcNestedGalContainerPosition" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGContainerPosition" runat="server" HelpKey="lblChameleonGalleryNGContainerPosition.HelpText" HelpText="Position:" ResourceKey="lblChameleonGalleryNGContainerPosition.Text" Text="Position:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:textbox id="tbChameleonGalleryCategoryPriority" runat="server" width="50px">1</asp:textbox>
																		<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth8" runat="server" controltovalidate="tbChameleonGalleryCategoryPriority" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
																			validationgroup="vgChameleonSettings">
																		</asp:requiredfieldvalidator>
																		<asp:comparevalidator id="cvLightBoxGalleryImageHeight7" runat="server" controltovalidate="tbChameleonGalleryCategoryPriority" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
																			type="Integer" validationgroup="vgChameleonSettings">
																		</asp:comparevalidator>
																	</td>
																</tr>
																<tr id="trChamcNestedGalContainerExpand" runat="server">
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGContainerExpand" runat="server" HelpKey="lblChameleonGalleryNGContainerExpand.HelpText" HelpText="Expand to 100% width:" ResourceKey="lblChameleonGalleryNGContainerExpand.Text" Text="Expand to 100% width:" />
																	</td>
																	<td class="style109" colspan="2">
																		<asp:checkbox id="cbChameleonGalleryNestedExpand" runat="server" />
																	</td>
																</tr>
																<tr>
																	<td class="style110">
																		<dnn:Label ID="lblChameleonGalleryNGSorting" runat="server" HelpKey="lblChameleonGalleryNGSorting.HelpText" HelpText="Nested category sorting:" ResourceKey="lblChameleonGalleryNGSorting" Text="Nested category sorting:" />
																	</td>
																	<td class="style111">
																		<asp:dropdownlist id="ddlChameleonGalleryNestedSorting" runat="server">
																			<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
																			<asp:listitem resourcekey="liTitle" value="GalleryName">Title</asp:listitem>
																			<asp:listitem resourcekey="liDateCreated" value="DateCreated">Date created</asp:listitem>
																			<asp:listitem resourcekey="liLAstModified" value="DateLastModified">Date last modified</asp:listitem>
																		</asp:dropdownlist>
																	</td>
																	<td class="style109">
																		<asp:radiobuttonlist id="rblChameleonGalleryNestedSortingAscDesc" runat="server" repeatdirection="Horizontal">
																			<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
																			<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
																		</asp:radiobuttonlist>
																	</td>
																</tr>
																<tr>
																	<td class="style110">
																		&nbsp;
																	</td>
																	<td class="style111">
																		&nbsp;
																	</td>
																	<td class="style109">
																		&nbsp;
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</asp:panel>
										</td>
									</tr>
								</table>
							</asp:panel>
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryMainPanel" runat="server" font-bold="True" resourcekey="lblChameleonGalleryMainPanel" text="Main panel"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryMainPanelWidth" runat="server" HelpKey="lblChameleonGalleryMainPanelWidth.HelpText" HelpText="Set the maximum image width for resizing:" ResourceKey="lblChameleonGalleryMainPanelWidth" Text="Maximum panel width:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryMainPanelWidth" runat="server" resourcekey="tbTGNGImageWidthResource1" validationgroup="vgChameleonSettings" width="35px">700</asp:textbox>
							<asp:label id="lblChamMainPanelWidthType" runat="server" text="%" visible="False"></asp:label>
							<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageWidth2" runat="server" controltovalidate="tbChameleonGalleryMainPanelWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageWidthResource1.ErrorMessage"
								setfocusonerror="True" validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightboxGalleryNestedImageWidth2" runat="server" controltovalidate="tbChameleonGalleryMainPanelWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageWidthResource1.ErrorMessage"
								setfocusonerror="True" type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
							<asp:rangevalidator id="rvChameleonWidthPerct" runat="server" controltovalidate="tbChameleonGalleryMainPanelWidth" display="Dynamic" enabled="False" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" resourcekey="rvAGVolume0Resource1.ErrorMessage"
								setfocusonerror="True" type="Integer" validationgroup="vgChameleonSettings" visible="False">
							</asp:rangevalidator>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryMainPanelHeight" runat="server" ControlName="tbTGImageHeight" HelpKey="lblChameleonGalleryMainPanelHeight.HelpText" HelpText="Set the maximum image height for resizing:" ResourceKey="lblChameleonGalleryMainPanelHeight"
								Text="Maximum panel height: " />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryMainPanelHeight" runat="server" resourcekey="tbTGNGImageHeightResource1" validationgroup="vgChameleonSettings" width="35px">600</asp:textbox>
							<asp:label id="lblChamMainPanelHeightType" runat="server" text="px" visible="False"></asp:label>
							&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageHeight2" runat="server" controltovalidate="tbChameleonGalleryMainPanelHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
								setfocusonerror="True" validationgroup="vgChameleonSettings"></asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightboxGalleryNestedImageHeight2" runat="server" controltovalidate="tbChameleonGalleryMainPanelHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
								setfocusonerror="True" type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td id="trChamThumbMain" runat="server" colspan="2">
							<asp:label id="lblChameleonGalleryThumbnailsPanel" runat="server" font-bold="True" resourcekey="lblChameleonGalleryThumbnailsPanel" text="Thumbnails"></asp:label>
						</td>
					</tr>
					<tr id="trChamThumbWidth" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbWidth" runat="server" HelpKey="lblASSThumbWidth.HelpKey" HelpText="Thumb width:" ResourceKey="lblASSThumbWidth" Text="Thumb width:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryImageWidth" runat="server" validationgroup="vgChameleonSettings" width="50px">80</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth2" runat="server" controltovalidate="tbChameleonGalleryImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage" validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageWidth2" runat="server" controltovalidate="tbChameleonGalleryImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageWidthResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamThumbHeight" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbHeight" runat="server" HelpKey="lblASSThumbHeight.HelpKey" HelpText="Thumb height:" ResourceKey="lblASSThumbHeight" Text="Thumb height:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryImageHeight" runat="server" resourcekey="tbTGImageHeightResource1" validationgroup="vgChameleonSettings" width="50px">60</asp:textbox>
							&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageHeight2" runat="server" controltovalidate="tbChameleonGalleryImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageHeightResource1.ErrorMessage"
								validationgroup="vgChameleonSettings"></asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight2" runat="server" controltovalidate="tbChameleonGalleryImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamThumbPosition" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbPosition" runat="server" HelpKey="lblChameleonGalleryThumbPosition.HelpText" HelpText="Thumbnails position:" ResourceKey="lblChameleonGalleryThumbPosition.Text" Text="Thumbnails position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryThumbnailPositionInOut" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutIN" value="Inside">Inside image panel</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutOUT" selected="True" value="Outside">Outside image panel</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamThumbPosition2" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbPosition0" runat="server" HelpKey="lblChameleonGalleryThumbPosition.HelpText" HelpText="Thumbnails position:" ResourceKey="lblChameleonGalleryThumbPosition.Text" Text="Thumbnails position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryThumbnailPositionLRTB" runat="server" autopostback="True" onselectedindexchanged="rblChameleonGalleryThumbnailPositionLRTB_SelectedIndexChanged" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBTop">Top</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBBottom" selected="True">Bottom</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBLeft">Left</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBRight">Right</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamThumbStrinpSize" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbStripSize" runat="server" HelpKey="lblChameleonGalleryThumbStripSize.HelpText" HelpText="Thumbnail strip width:" ResourceKey="lblChameleonGalleryThumbStripSize.Text" Text="Thumbnail strip width:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryThumbStripWitdh" runat="server" autopostback="True" width="50px">700</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth3" runat="server" controltovalidate="tbChameleonGalleryThumbStripWitdh" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight3" runat="server" controltovalidate="tbChameleonGalleryThumbStripWitdh" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamThumbStrinpHeight" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbStripHeight" runat="server" HelpKey="lblChameleonGalleryThumbStripHeight.HelpText" HelpText="Thumbnail strip height:" ResourceKey="lblChameleonGalleryThumbStripHeight.Text" Text="Thumbnail strip height:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryThumbStripHeight" runat="server" width="50px">100</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth4" runat="server" controltovalidate="tbChameleonGalleryThumbStripHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight4" runat="server" controltovalidate="tbChameleonGalleryThumbStripHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamThumbShowTitle" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbShowTitle" runat="server" HelpKey="lblChameleonGalleryThumbShowTitle.HelpText" HelpText="Show title in thumbnail:" ResourceKey="lblChameleonGalleryThumbShowTitle.Text" Text="Show title in thumbnail:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowThumbCaption" runat="server" />
						</td>
					</tr>
					<tr id="trChamThumbPorition3" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbnailPosition" runat="server" HelpKey="lblChameleonGalleryThumbnailPosition.HelpText" HelpText="Position:" ResourceKey="lblChameleonGalleryThumbnailPosition.Text" Text="Position:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryThumbPriority" runat="server" width="50px">2</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth9" runat="server" controltovalidate="tbChameleonGalleryCategoryHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight8" runat="server" controltovalidate="tbChameleonGalleryCategoryHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamThumbExpand" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryThumbnailsExpand" runat="server" HelpKey="lblChameleonGalleryThumbnailsExpand.HelpText" HelpText="Expand to 100% width:" ResourceKey="lblChameleonGalleryThumbnailsExpand.Text" Text="Expand to 100% width:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryThumbnailsExpand" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryGaleryTitle" runat="server" font-bold="True" resourcekey="lblChameleonGalleryGaleryTitle" text="Gallery title and description"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowGalleryTitle" runat="server" HelpKey="lblChameleonGalleryShowGalleryTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblChameleonGalleryShowGalleryTitle.Text" Text="Show gallery title:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowGalleyTitle" runat="server" checked="False" resourcekey="cbLightboxGalleryShowMediaTitleResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowGalleryDescription" runat="server" HelpKey="lblChameleonGalleryShowGalleryDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblChameleonGalleryShowGalleryDescription.Text" Text="Show gallery description:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowGalleryDescription" runat="server" resourcekey="cbLightboxGalleryShowMediaDescriptionResource1" />
						</td>
					</tr>
					<tr id="trChamGalerreyINout" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryGalleryCaptionPositionInOut" runat="server" HelpKey="lblChameleonGalleryGalleryCaptionPositionInOut.HelpText" HelpText="Gallery title and description position:" ResourceKey="lblChameleonGalleryGalleryCaptionPositionInOut.Text"
								Text="Gallery title and description position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryGalleryTitleDescPositionInOut" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutIN" selected="True" value="Inside">Inside image panel</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutOUT" value="Outside">Outside image panel</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamGalerreyTopBotom" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryTitleDescriptionPositionTBLR" runat="server" HelpKey="lblChameleonGalleryTitleDescriptionPositionTBLR.HelpText" HelpText="Gallery title and description position:" ResourceKey="lblChameleonGalleryTitleDescriptionPositionTBLR.Text"
								Text="Gallery title and description position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryGalleryCaptionPositionLRTB" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBTop" selected="True">Top</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBBottom">Bottom</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamcaptionHeitgh" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryGalleryCaptionHeight" runat="server" HelpKey="lblChameleonGalleryGalleryCaptionHeight.HelpText" HelpText="Gallery title and description height:" ResourceKey="lblChameleonGalleryGalleryCaptionHeight.Text" Text="Gallery title and description height:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryGalleryCaptionHeight" runat="server" width="50px">100</asp:textbox>
						</td>
					</tr>
					<tr id="trChamGalleryPosition" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryNGContainer3" runat="server" HelpKey="lblChameleonGalleryThumbnailPosition.HelpText" HelpText="Position:" ResourceKey="lblChameleonGalleryThumbnailPosition.Text" Text="Position:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryGalleryCaptionPriority" runat="server" width="50px">3</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth10" runat="server" controltovalidate="tbChameleonGalleryGalleryCaptionPriority" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight9" runat="server" controltovalidate="tbChameleonGalleryGalleryCaptionPriority" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamGalleryExpand" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryNGContainer7" runat="server" HelpKey="lblChameleonGalleryThumbnailsExpand.HelpText" HelpText="Expand to 100% width:" ResourceKey="lblChameleonGalleryThumbnailsExpand.Text" Text="Expand to 100% width:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryGalleryCaptionExpand" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryGaleryTitleDescription" runat="server" font-bold="True" resourcekey="lblChameleonGalleryGaleryTitleDescription" text="Title and description"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowMediaTitle" runat="server" HelpKey="lblLightboxGalleryShowMediaTitle.HelpText" HelpText="Show media title:" ResourceKey="lblLightboxGalleryShowMediaTitle" Text="Show media title:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowMediaTitle" runat="server" checked="True" resourcekey="cbLightboxGalleryShowMediaTitleResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowMediaDescription" runat="server" HelpKey="lblLightboxGalleryShowMediaDescription.HelpText" HelpText="Show media description:" ResourceKey="lblLightboxGalleryShowMediaDescription" Text="Show media description:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowMediaDescription" runat="server" checked="True" resourcekey="cbLightboxGalleryShowMediaDescriptionResource1" />
						</td>
					</tr>
					<tr id="trChamcTitleDescPosition" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryCaptionPositionInOut" runat="server" HelpKey="lblChameleonGalleryCaptionPositionInOut.HelpText" HelpText="Title and description position:" ResourceKey="lblChameleonGalleryCaptionPositionInOut.Text" Text="Title and description position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryTitleDescPositionInOut" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutIN" selected="True" value="Inside">Inside image panel</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionInOutOUT" value="Outside">Outside image panel</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamcTitleDescPosition2" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryCaptionPositionTBLR" runat="server" HelpKey="lblChameleonGalleryCaptionPositionTBLR.HelpText" HelpText="Title and description position:" ResourceKey="lblChameleonGalleryCaptionPositionTBLR.Text" Text="Title and description position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryCaptionPositionLRTB" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBTop">Top</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryThumbnailPositionLRTBBottom" selected="True">Bottom</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trChamcTitleDescHeight" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryCaptionHeight" runat="server" HelpKey="lblChameleonGalleryCaptionHeight.HelpText" HelpText="Title and description height:" ResourceKey="lblChameleonGalleryCaptionHeight.Text" Text="Title and description height:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryCaptionHeight" runat="server" width="50px">100</asp:textbox>
						</td>
					</tr>
					<tr id="trChamcTitleDescPosition3" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryTitleDescriptionPosition" runat="server" HelpKey="lblChameleonGalleryTitleDescriptionPosition.HelpText" HelpText="Position:" ResourceKey="lblChameleonGalleryTitleDescriptionPosition.Text" Text="Position:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryCaptionPriority" runat="server" width="50px">4</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth11" runat="server" controltovalidate="tbChameleonGalleryCaptionPriority" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryImageHeight10" runat="server" controltovalidate="tbChameleonGalleryCaptionPriority" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr id="trChamcTitleDescExpand" runat="server">
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryTitleDescriptionExpand" runat="server" HelpKey="lblChameleonGalleryTitleDescriptionExpand.HelpText" HelpText="Expand to 100% width:" ResourceKey="lblChameleonGalleryTitleDescriptionExpand.Text" Text="Expand to 100% width:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryCaptionExpand" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryNavigation" runat="server" font-bold="True" resourcekey="lblChameleonGalleryNavigation" text="Navigation"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowNavigation" runat="server" HelpKey="lblChameleonGalleryShowNavigation.HelpText" HelpText="Show navigation arrows:" ResourceKey="lblChameleonGalleryShowNavigation.HelpText" Text="Show navigation arrows:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowNavigation" runat="server" checked="True" resourcekey="cbTGShowDescriptionResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryButtons" runat="server" font-bold="True" resourcekey="lblChameleonGalleryButtons" text="Buttons"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113" valign="top">
							<dnn:Label ID="lblChameleonGalleryShowSharingButtons" runat="server" CssClass="styleBolded" HelpKey="lblChameleonGalleryShowSharingButtons.HelpText" HelpText="Show social sharing buttons inside Image:" ResourceKey="lblChameleonGalleryShowSharingButtons.Text"
								Text="Show sharing buttons:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowSocialSharing" runat="server" autopostback="True" checked="True" oncheckedchanged="cbChameleonGalleryShowSocialSharing_CheckedChanged" />
							<asp:panel id="pnlChameleonGalleryShowSharing" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px">
								<table class="style66">
									<tr>
										<td class="style92">
											<dnn:Label ID="lblChameleonGalleryShowSharingButtonsFacebook" runat="server" HelpKey="lblChameleonGalleryShowSharingButtonsFacebook.HelpText" HelpText="Show Facebook button:" ResourceKey="lblChameleonGalleryShowSharingButtonsFacebook.Text" Text="Show Facebook button:" />
										</td>
										<td>
											<asp:checkbox id="cbChameleonGalleryShowSocialFacebook" runat="server" autopostback="True" checked="True" />
										</td>
									</tr>
									<tr>
										<td class="style92">
											<dnn:Label ID="lblChameleonGalleryShowSharingButtonsGoogle" runat="server" HelpKey="lblChameleonGalleryShowSharingButtonsGoogle.HelpText" HelpText="Show Google Plus button:" ResourceKey="lblChameleonGalleryShowSharingButtonsGoogle.Text" Text="Show Google Plus button:" />
										</td>
										<td>
											<asp:checkbox id="cbChameleonGalleryShowSocialGoogle" runat="server" autopostback="True" checked="True" />
										</td>
									</tr>
									<tr>
										<td class="style92">
											<dnn:Label ID="lblChameleonGalleryShowSharingButtonsTwitter" runat="server" HelpKey="lblChameleonGalleryShowSharingButtonsTwitter.HelpText" HelpText="Show Twitter button:" ResourceKey="lblChameleonGalleryShowSharingButtonsTwitter.Text" Text="Show Twitter button:" />
										</td>
										<td>
											<asp:checkbox id="cbChameleonGalleryShowSocialTwitter" runat="server" autopostback="True" checked="True" />
										</td>
									</tr>
								</table>
							</asp:panel>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryDisplayEmailButton" runat="server" HelpKey="lblChameleonGalleryDisplayEmailButton.HelpText" HelpText="Display email button:" ResourceKey="lblChameleonGalleryDisplayEmailButton.Text" Text="Display email button:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryDisplayEmailButton" runat="server" checked="True" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryDisplayDownloadButton" runat="server" HelpKey="lblASSDisplayDownloadButton.HelpKey" HelpText="Display download button:" ResourceKey="lblASSDisplayDownloadButton" Text="Display download button:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryDisplayDownloadButton" runat="server" checked="True" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryEffects" runat="server" font-bold="True" resourcekey="lblChameleonGalleryEffects" text="Effects"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGallerySlideEffect" runat="server" HelpKey="lblASSSlideEffect.HelpKey" HelpText="Image transition effect:" ResourceKey="lblASSSlideEffect" Text="Image transition effect:" />
						</td>
						<td colspan="2">
							<asp:dropdownlist id="ddlChameleonGalleryTransitionEffect" runat="server">
								<asp:listitem resourcekey="ddlChameleonGalleryTransitionEffectFade" value="fade">Fade</asp:listitem>
								<asp:listitem resourcekey="ddlChameleonGalleryTransitionEffectSlide" selected="True" value="slide">Slide</asp:listitem>
								<asp:listitem resourcekey="ddlChameleonGalleryTransitionEffectShow" value="show">Show</asp:listitem>
							</asp:dropdownlist>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryTransitionSpeed0" runat="server" HelpKey="lblASStransitionSpeed.HelpKey" HelpText="Transition speed:" ResourceKey="lblASStransitionSpeed" Text="Transition speed:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryIntervalSpeed" runat="server" resourcekey="tbLightboxSSDurationResource1" validationgroup="vgChameleonSettings" width="58px">1000</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns24" runat="server" controltovalidate="tbChameleonGalleryIntervalSpeed" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns24" runat="server" controltovalidate="tbChameleonGalleryIntervalSpeed" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryAutoPLAy" runat="server" font-bold="True" resourcekey="lblChameleonGalleryAutoPLAy" text="Autoplay"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryDisplayPlayButton" runat="server" HelpText="Autoplay:" Text="Autoplay:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryAutoPlay" runat="server" checked="True" resourcekey="cbTGShowDescriptionResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryAutoPlayInterval" runat="server" HelpKey="lblChameleonGalleryAutoPlayInterval.HelpText" HelpText="Autoplay interval:" ResourceKey="lblChameleonGalleryAutoPlayInterval.Text" Text="Autoplay interval:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbChameleonGalleryAutoPlayInterval" runat="server" width="50px">5000</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns25" runat="server" controltovalidate="tbChameleonGalleryAutoPlayInterval" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
								validationgroup="vgChameleonSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns25" runat="server" controltovalidate="tbChameleonGalleryAutoPlayInterval" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
								type="Integer" validationgroup="vgChameleonSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryVideoOptions" runat="server" font-bold="True" resourcekey="lblChameleonGalleryVideoOptions" text="Video options"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryVideoPlayPlace" runat="server" HelpKey="lblChameleonGalleryVideoPlayPlace.HelpText" HelpText="Play video embedded in page or play video in lightbox:" ResourceKey="lblChameleonGalleryVideoPlayPlace.Text" Text="Video play place:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryVideoPlayPlace" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryVideoPlayPlaceLB" value="videolightbox">Play video in lightbox</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryVideoPlayPlaceEM" selected="True" value="videoembed">Play video embedded in page</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblLightBoxGalleryVideoPlayerSelect2" runat="server" HelpKey="SelectVideoPlayer.HelpText" HelpText="Select player:" ResourceKey="SelectVideoPlayer.Text" Text="Select player:" />
						</td>
						<td colspan="2">
							<asp:dropdownlist id="ddlChameleonGalleryVPSelectPlayer" runat="server" autopostback="True" onselectedindexchanged="ddlChameleonGalleryVPSelectPlayer_SelectedIndexChanged" resourcekey="ddlTGVPSelectThemeResource1">
								<asp:listitem selected="True" value="True">Flow player</asp:listitem>
								<asp:listitem value="False">Standard</asp:listitem>
							</asp:dropdownlist>
							<asp:panel id="pnlFlowPlayerOptionsChameleon" runat="server" visible="False">
								<table class="style66">
									<tr>
										<td>
											<asp:label id="lblFlowVideoScalingChameleon" runat="server" resourcekey="lblFlowVideoScaling" text="Video scaling:"></asp:label>
											<asp:dropdownlist id="ddlFlowPlayerScalingChameleon" runat="server" autopostback="True">
												<asp:listitem resourcekey="liScale" value="scale">Scale</asp:listitem>
												<asp:listitem resourcekey="liorig" value="orig">Original</asp:listitem>
												<asp:listitem resourcekey="lihalf" value="half">Half</asp:listitem>
												<asp:listitem resourcekey="lifit" value="fit">Fit to window</asp:listitem>
											</asp:dropdownlist>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
								</table>
							</asp:panel>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryVideoPlayerSelectSkin" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" Text="Select video player skin:" />
						</td>
						<td colspan="2">
							<asp:dropdownlist id="ddlChameleonGalleryVPSelectTheme" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
								<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
								<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
							</asp:dropdownlist>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayOnLoad1" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" HelpText="Start to play video on page load:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" Text="Play on load:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryPlayOnLoad" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryAudioOptions" runat="server" font-bold="True" resourcekey="lblChameleonGalleryAudioOptions" text="Audio options"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryAudioDisplay" runat="server" HelpKey="lblChameleonGalleryAudioDisplay.HelpText" HelpText="Play audio embedded in page or play audio in lightbox:" ResourceKey="lblChameleonGalleryAudioDisplay.Text" Text="Audio play place:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryAudioPlayPlace" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="rblChameleonGalleryAudioPlayPlaceLB" value="audiolightbox">Play audio in lightbox</asp:listitem>
								<asp:listitem resourcekey="rblChameleonGalleryAudioPlayPlaceEM" selected="True" value="audioembed">Play audio embedded in page</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryAudioPlayerPlayOnLoad" runat="server" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" HelpText="Start to play audio on page load:" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" Text="Play on load:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryAudioPlayOnLoad" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryFullscreen" runat="server" font-bold="True" resourcekey="lblChameleonGalleryFullscreen" text="Fullscreen"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryEnableFullscreen" runat="server" HelpKey="lblChameleonGalleryEnableFullscreen.HelpText" HelpText="Enable fullscreen:" ResourceKey="lblChameleonGalleryEnableFullscreen" Text="Enable fullscreen:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryEnableFullscreen" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:label id="lblChameleonGalleryToolTips" runat="server" font-bold="True" resourcekey="lblChameleonGalleryToolTipsTitle" text="Tooltips"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryShowTooltips" runat="server" HelpKey="lblChameleonGalleryToolTips.HelpText" HelpText="Show tooltips on thumbnail mouse over:" ResourceKey="lblChameleonGalleryToolTips" Text="Show tooltips:" />
							&nbsp;
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowTooltips" runat="server" autopostback="True" oncheckedchanged="cbChameleonGalleryShowTooltips_CheckedChanged" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:panel id="pnlChameleonGalleryQtipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
								<table>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblChameleonGalleryShowTooltipsTitle" runat="server" HelpKey="lblChameleonGalleryShowTooltipsTitle.HelpText" HelpText="Show title in tooltips:" ResourceKey="lblChameleonGalleryShowTooltipsTitle" Text="Show title in tooltips:" />
										</td>
										<td>
											<asp:checkbox id="cbChameleonGalleryShowTooltipTitle" runat="server" checked="True" />
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblChameleonGalleryShowTooltipsDescription" runat="server" HelpKey="cbChameleonGalleryShowTooltipDescription.HelpText" HelpText="Show description in tooltips:" ResourceKey="cbChameleonGalleryShowTooltipDescription" Text="Show description in tooltips:" />
										</td>
										<td>
											<asp:checkbox id="cbChameleonGalleryShowTooltipDescription" runat="server" />
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblChameleonGalleryShowTooltipsPosition" runat="server" HelpKey="lblChameleonGalleryShowTooltipsPosition.HelpText" HelpText="Tooltips position:" ResourceKey="lblChameleonGalleryShowTooltipsPosition" Text="Tooltips position:" />
										</td>
										<td>
											<asp:dropdownlist id="ddlChameleonGalleryToolTipPosition" runat="server">
												<asp:listitem value="top">Top</asp:listitem>
												<asp:listitem value="bottom">Bottom</asp:listitem>
												<asp:listitem value="left">Left</asp:listitem>
												<asp:listitem value="right">Right</asp:listitem>
											</asp:dropdownlist>
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblChameleonGalleryShowTooltipsStyle" runat="server" HelpKey="lblChameleonGalleryShowTooltipsStyle.HelpText" HelpText="Tooltips style:" ResourceKey="lblChameleonGalleryShowTooltipsStyle" Text="Tooltips style:" />
										</td>
										<td>
											<asp:dropdownlist id="ddlChameleonGalleryToolTipClasss" runat="server">
												<asp:listitem text="grey" value="grey" />
												<asp:listitem text="red" value="red" />
												<asp:listitem text="green" value="green" />
												<asp:listitem text="blue" value="blue" />
											</asp:dropdownlist>
										</td>
									</tr>
								</table>
							</asp:panel>
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="Label20" runat="server" HelpKey="lblLightboxGalleryLightboxThumbnails.HelpText" HelpText="Show thumbnails inside lightbox:" ResourceKey="lblLightboxGalleryLightboxThumbnails" Text="Show thumbnails inside lightbox:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryGalleryShowThumbnailsInLightbox" runat="server" resourcekey="cbLightboxGalleryLightboxThumbnailsResource1" />
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="lblLightboxGalleryShowLightboxTitle1" runat="server" HelpKey="lblLightboxGalleryShowLightboxTitle.HelpText" HelpText="Show media title in lightbox:" ResourceKey="lblLightboxGalleryShowLightboxTitle" Text="Show media title in lightbox:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowLightboxTitle" runat="server" resourcekey="cbLightboxGalleryShowLightboxTitleResource1" />
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="lblLightboxGalleryLightboxDescription1" runat="server" HelpKey="lblLightboxGalleryLightboxDescription.HelpText" HelpText="Show media description in lightbox:" ResourceKey="lblLightboxGalleryLightboxDescription" Text="Show media description in lightbox:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryShowLightboxDescription" runat="server" autopostback="True" oncheckedchanged="cbTGShowLightboxDescription_CheckedChanged" resourcekey="cbTGShowLightboxDescriptionResource1" />
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="lblChameleonGalleryOpenMediaUrl" runat="server" HelpKey="lblLightBoxGalleryOpenMediaUrl.HelpText" HelpText="On image click dont open image in lightbox, but open Media Url link." ResourceKey="lblLightBoxGalleryOpenMediaUrl" Text="On click go to Media Url:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryGalleryOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbChameleonGalleryGalleryOpenMediaUrl_CheckedChanged" resourcekey="cbLightBoxGalleryOpenMediaUrlResource1" />
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="lblChameleonGalleryOpenMediaUrlNewWindow" runat="server" HelpKey="lblLightBoxGalleryOpenMediaUrlNewWindow.HelpText" HelpText="Open link in new window:" ResourceKey="lblLightBoxGalleryOpenMediaUrlNewWindow" Text="Open link in new window:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbLightBoxGalleryOpenMediaUrlNewWindowResource1" />
						</td>
					</tr>
					<tr>
						<td class="style112">
							<dnn:Label ID="lblChameleonGalleryOnClickNothing" runat="server" HelpKey="lblChameleonGalleryOnClickNothing.HelpText" HelpText="No action on mouse click no main image panel:" ResourceKey="lblChameleonGalleryOnClickNothing" Text="Open media in lightbox:" />
						</td>
						<td class="style38" colspan="2">
							<asp:checkbox id="cbChameleonGalleryOpenInLightbox" runat="server" autopostback="True" checked="True" oncheckedchanged="cbChameleonGalleryNothigOnclick_CheckedChanged" resourcekey="cbLightBoxGalleryOpenMediaUrlNewWindowResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryRandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryRandomizeMedia" runat="server" autopostback="True" oncheckedchanged="cbChameleonGalleryRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryGrayscaleThumbnails" runat="server" HelpKey="lblChameleonGalleryGrayscaleThumbnails.HelpText" HelpText="Thumbnails will be desaturated." ResourceKey="lblChameleonGalleryGrayscaleThumbnails" Text="Create grayscale thumbnails:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryCreateGrayScaleImages" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryEnableDragging" runat="server" HelpKey="lblChameleonGalleryEnableDragging" HelpText="Enable item dragging:" ResourceKey="lblChameleonGalleryEnableDragging" Text="Touch &amp; swipe:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbChameleonGalleryEnableItemDragging" runat="server" checked="True" />
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblMainImageResize" runat="server" HelpKey="lblMainImageResize.HelpText" HelpText="Main image resize:" ResourceKey="lblMainImageResize" Text="Main image resize:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblChameleonGalleryMainImageRsize" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="liResCrop" selected="True" value="default">Resize and crop</asp:listitem>
								<asp:listitem resourcekey="liProportionally" value="proportionally">Proportionally resize</asp:listitem>
								<asp:listitem resourcekey="liProportionallyVertical" value="proportionallyVertical">Proportionally resize vertical images</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChamaleonAlignTopLeft" runat="server" HelpKey="lblChamaleonAlignTopLeft.HelpText" HelpText="Align image in main panel:" ResourceKey="lblChamaleonAlignTopLeft" Text="Align image in main panel:" />
						</td>
						<td colspan="2">
							<asp:DropDownList ID="ddlChameleonGalleryAlignimageinmainpanel" runat="server">
								<asp:ListItem resourcekey="liCenterCenter" value="false">Center center</asp:ListItem>
								<asp:ListItem resourcekey="liTopLeft" value="true">Top left</asp:ListItem>
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style113">
							<dnn:Label ID="lblChameleonGalleryMediaSorting" runat="server" HelpKey="lblLightBoxMediaSorting.HelpText" HelpText="Select media sorting options:" ResourceKey="lblLightBoxMediaSorting" Text="Media sorting:" />
						</td>
						<td class="style91">
							<asp:dropdownlist id="ddlChameleonGalleryMediaSort" runat="server">
								<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
								<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
								<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
								<asp:listitem resourcekey="liTitle">Title</asp:listitem>
							</asp:dropdownlist>
							&nbsp;
						</td>
						<td class="style91">
							<asp:radiobuttonlist id="rblChameleonGalleryMediaSortType" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
								<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
							</asp:radiobuttonlist>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style113">
							&nbsp;
						</td>
						<td colspan="2">
							<asp:button id="btnChameleonGallerySave" runat="server" onclick="btnChameleonGallerySave_Click" resourcekey="btnLightBoxGallerySaveResource1" text="Save settings" validationgroup="vgChameleonSettings" width="140px" />
							&nbsp;<asp:button id="btnChameleonGallerySaveClose" runat="server" onclick="btnChameleonGallerySaveClose_Click" resourcekey="btnLightBoxGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgChameleonSettings" width="140px" />
							&nbsp;
							<asp:label id="lblChameleonGalleryStatus" runat="server" resourcekey="lblLightBoxGalleryStatusResource1" width="120px"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="style70" colspan="3">
							&nbsp;<asp:panel id="pnlInvisibleASS0" runat="server" visible="False">
								<table align="center" cellpadding="2" cellspacing="2" width="80%">
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGalleryInitialOpen" runat="server" />
											<dnn:Label ID="lblChameleonGalleryInitialOpen" runat="server" HelpKey="lblASSInitialOpen.HelpText" HelpText="Show image selection on open:" ResourceKey="lblASSInitialOpen.Text" Text="Show image selection on open:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGalleryResizeAndCrop" runat="server" checked="True" oncheckedchanged="cbTGSmartResizeAndCrop_CheckedChanged" resourcekey="cbLightBoxGalleryResizeAndCropResource1" />
											<dnn:Label ID="lblChameleonGalleryResizeCrop" runat="server" HelpKey="lblLightBoxGalleryResizeCrop.HelpText" HelpText="Set this this to resize all images to same width and height:" ResourceKey="lblLightBoxGalleryResizeCrop" Text="Resize and crop all images:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGallerySmartCropVertical" runat="server" oncheckedchanged="cbSmartCropVertical_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
											<dnn:Label ID="lblChameleonGalleryCropImages" runat="server" ControlName="cbSmartCropVertical" HelpKey="lblLightBoxGalleryCropImages.HelpText" HelpText="Set this to crop vertical images:" ResourceKey="lblLightBoxGalleryCropImages" Text="Resize and crop vertical images:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:textbox id="tbChameleonGalleryItems" runat="server" resourcekey="tbTGItemsResource1" validationgroup="vgChameleonSettings" width="50px">2</asp:textbox>
											<dnn:Label ID="lblChameleonGalleryThumbnailRows" runat="server" HelpKey="lblASSThumbnailRows.HelpKey" HelpText="Set the number of thumbnail rows:" ResourceKey="lblASSThumbnailRows" Text="Number of thumbnail rows:" />
											<asp:comparevalidator id="cvLightBoxGalleryNumberOfItems2" runat="server" controltovalidate="tbChameleonGalleryItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfItemsResource1.ErrorMessage"
												type="Integer" validationgroup="vgChameleonSettings">
											</asp:comparevalidator>
											<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfItems2" runat="server" controltovalidate="tbChameleonGalleryItems" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfItemsResource1.ErrorMessage" validationgroup="vgChameleonSettings">
											</asp:requiredfieldvalidator>
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGalleryNestedProportionalyResize" runat="server" autopostback="True" oncheckedchanged="cbASSNestedProportionalyResize_CheckedChanged" />
											<dnn:Label ID="lblChameleonGalleryShowOnMouseOver" runat="server" HelpKey="lblASSShowOnMouseOver.HelpKey" HelpText="Show navigation bar on mouse over:" ResourceKey="lblASSShowOnMouseOver" Text="Show navigation bar on mouse over:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGalleryNestedShowBreadcrumbs" runat="server" />
											<dnn:Label ID="lblChameleonGalleryFLoatingCpanel" runat="server" HelpKey="lblASSFLoatingCpanel.HelpKey" HelpText="Floating navigation bar:" ResourceKey="lblASSFLoatingCpanel" Text="Floating navigation bar:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:checkbox id="cbChameleonGalleryNestedShowGalleryInfo" runat="server" checked="True" />
											<dnn:Label ID="lblChameleonGalleryDisplayNumber" runat="server" HelpKey="lblASSDisplayNumber.HelpKey" HelpText="Display image number:" Text="Display image number:" />
											<asp:checkbox id="cbChameleonGalleryShowTitle" runat="server" checked="True" resourcekey="cbTGShowTitleResource1" />
											<dnn:Label ID="lblChameleonGalleryDisplayTimer" runat="server" HelpKey="lblASSDisplayTimer.HelpKey" HelpText="Display timer:" ResourceKey="lblASSDisplayTimer" Text="Display timer:" />
										</td>
									</tr>
									<tr>
										<td class="style70" colspan="3">
											<asp:textbox id="tbChameleonGalleryNumberOfColumns" runat="server" resourcekey="tbTGNumberOfColumnsResource1" validationgroup="vgChameleonSettings" width="50px">4</asp:textbox>
											<dnn:Label ID="lblChameleonGalleryNumberOfColumns" runat="server" HelpKey="lblASSNumberOfColumns.HelpKey" HelpText="Set the number of thumbnail columns:" ResourceKey="lblASSNumberOfColumns" Text="Number of thumbnail columns:" />
											<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns23" runat="server" controltovalidate="tbChameleonGalleryNumberOfColumns" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
												validationgroup="vgChameleonSettings">
											</asp:requiredfieldvalidator>
											<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns23" runat="server" controltovalidate="tbChameleonGalleryNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
												type="Integer" validationgroup="vgChameleonSettings">
											</asp:comparevalidator>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<asp:label id="lblLightBoxGalleryViseoPlayerSettings2" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1" text="Video player in lightbox settings:"></asp:label>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<asp:label id="lblLightBoxGalleryAudioPlayerSettings3" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
										</td>
									</tr>
									<tr>
										<td class="style70">
											&nbsp;
										</td>
										<td colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											&nbsp;
										</td>
										<td colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightBoxAjaxPreloader2" runat="server" HelpKey="lblLightBoxAjaxPreloader.HelpText" HelpText="Select Ajax preloader type:" ResourceKey="lblLightBoxAjaxPreloader" Text="Select Ajax preloader type:" />
										</td>
										<td colspan="2">
											<asp:radiobuttonlist id="rblLighboxPreloaderType1" runat="server" repeatdirection="Horizontal">
												<asp:listitem resourcekey="LighboxPreloaderFullscreen" selected="True">Fullscreen</asp:listitem>
												<asp:listitem resourcekey="LighboxPreloaderBellowImages" value="Belowimages">Below images</asp:listitem>
											</asp:radiobuttonlist>
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightboxGalleryShowTitle1" runat="server" HelpKey="lblLightboxGalleryShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblLightboxGalleryShowTitle" Text="Show gallery title:" />
										</td>
										<td colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightboxGalleryShowDescription1" runat="server" HelpKey="lblLightboxGalleryShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblLightboxGalleryShowDescription" Text="Show gallery description:" />
										</td>
										<td colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											&nbsp;
										</td>
										<td class="style52">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											&nbsp;&nbsp;
										</td>
										<td colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="style70">
											&nbsp;
										</td>
										<td colspan="2">
											<asp:panel id="pnlLightboxToolTipOptions1" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
												<table class="style66">
													<tr>
														<td class="style85">
															&nbsp;
														</td>
														<td>
															<asp:label id="lblLightBoxToolTipOptions1" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxShowTooltips1" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
														</td>
														<td>
															<asp:checkbox id="cbShowToolTips1" runat="server" checked="True" />
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxTargetPosition1" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
														</td>
														<td>
															<asp:dropdownlist id="ddlLightboxTargetPosition1" runat="server">
																<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
																<asp:listitem resourcekey="topMiddle" selected="True" value="topMiddle">Top middle</asp:listitem>
																<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
																<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
																<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
																<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
																<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
																<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
																<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
																<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
																<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
																<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
																<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
															</asp:dropdownlist>
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxTooltipPosition1" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
														</td>
														<td>
															<asp:dropdownlist id="ddlLightboxTooltipPosition1" runat="server">
																<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
																<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
																<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
																<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
																<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
																<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
																<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
																<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
																<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
																<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
																<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
																<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom middle</asp:listitem>
																<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
															</asp:dropdownlist>
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxShowEffect1" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
														</td>
														<td>
															<asp:dropdownlist id="ddlLightboxShoweffect1" runat="server">
																<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
																<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
																<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
															</asp:dropdownlist>
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxShowEffectDuration1" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxShowHideEffect1" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
														</td>
														<td>
															<asp:dropdownlist id="ddlLightboxHideEffect1" runat="server">
																<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
																<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
																<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
															</asp:dropdownlist>
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxHideEffectDuration1" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxTooltipBorder1" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxTooltipCornerRadius1" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
														</td>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="style85">
															<asp:label id="lblLightboxTooltipTheme1" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
														</td>
														<td>
															<asp:dropdownlist id="ddlLightboxTooltipTheme1" runat="server">
																<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
																<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
																<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
																<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
																<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
																<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
															</asp:dropdownlist>
														</td>
													</tr>
												</table>
											</asp:panel>
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightboxGalleryLightboxThumbnails1" runat="server" HelpKey="lblLightboxGalleryLightboxThumbnails.HelpText" HelpText="Show thumbnails inside lightbox:" ResourceKey="lblLightboxGalleryLightboxThumbnails" Text="Show thumbnails inside lightbox:" />
										</td>
										<td colspan="2">
											<asp:checkbox id="cbASSLightboxThumbnails0" runat="server" resourcekey="cbLightboxGalleryLightboxThumbnailsResource1" />
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightboxGalleryLightboxSlideShow1" runat="server" HelpKey="lblLightboxGalleryLightboxSlideShow.HelpText" HelpText="Slide show inside lightbox:" ResourceKey="lblLightboxGalleryLightboxSlideShow" Text="Slide show inside lightbox:" />
										</td>
										<td colspan="2">
											<asp:checkbox id="cbASSSlideShow0" runat="server" autopostback="True" oncheckedchanged="cbLightBoxSlideShow_CheckedChanged" resourcekey="cbLightBoxSlideShowResource1" />
										</td>
									</tr>
									<tr>
										<td class="style70">
											<dnn:Label ID="lblLightBoxGalleryAnimationSpeed1" runat="server" HelpKey="lblLightBoxGalleryAnimationSpeed.HelpText" HelpText="Lightbox animation speed:" ResourceKey="lblLightBoxGalleryAnimationSpeed" Text="Lightbox animation speed:" />
										</td>
										<td colspan="2">
											<asp:dropdownlist id="ddlASSLightboxAnimationSpeed0" runat="server" resourcekey="ddlTGLightboxAnimationSpeedResource1">
												<asp:listitem resourcekey="ListItemResource25" value="fade">Fade</asp:listitem>
												<asp:listitem resourcekey="ListItemResource26" value="normal">Normal</asp:listitem>
												<asp:listitem resourcekey="ListItemResource27" value="slow">Slow</asp:listitem>
											</asp:dropdownlist>
										</td>
									</tr>
								</table>
							</asp:panel>
						</td>
					</tr>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlAdvancedSlideShow" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlTableGalleryResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblAdvancedSlideShow" resourcekey="lblAdvancedSlideShow" runat="server" cssclass="settingsdetailtitle" text="Advanced Slide Show"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxTemplateSelect1" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblLightboxTemplateSelect" Text="Select template:" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlASSTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlLightboxTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryThemeSelect1" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblLightBoxGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblLightBoxGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style38" align="left" colspan="2">
						<asp:dropdownlist id="ddlASSThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38" colspan="2">
						<asp:label id="lblASSTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style69" style="background-color: #ceeff8">
						<dnn:Label ID="lblLightboxGalleryDispplayNestedGalleries1" runat="server" HelpKey="lblLightboxGalleryDispplayNestedGalleries.HelpText" HelpText="Display nested galleries:" ResourceKey="lblLightboxGalleryDispplayNestedGalleries" Text="Display nested galleries:" />
					</td>
					<td class="style38" colspan="2">
						<div style="background-color: #ceeff8; display: inline-block; padding: 7px;">
							<asp:checkbox id="cbASSDisplayNestedGalleries" runat="server" autopostback="True" oncheckedchanged="cbASSDisplayNestedGalleries_CheckedChanged" resourcekey="cbLightboxGalleryDisplayNestedGalleriesResource1" />
						</div>
					</td>
				</tr>
				<tr>
					<td class="style37" colspan="3">
						<asp:panel id="pnlASSNestedGalleriesOptions" runat="server" visible="False" resourcekey="pnlNestedGalleriesOptionsResource1">
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tblnestedgallery">
								<tr>
									<td>
										<asp:panel id="pnlASSNGGallerySettings" runat="server" backcolor="#C9DEAD" resourcekey="pnlTGNGGallerySettingsResource1">
											<table cellpadding="0" cellspacing="0" class="style66" style="border-top: 3px solid #91c848">
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" class="tbltitlenestedcategory">
															<tr>
																<td style="background-color: #91c848">
																	<asp:label id="lblLightboxGalleryNestedGallerySettings1" runat="server" cssclass="settingsdetailtitle" text="Nested galleries settings" resourcekey="lblLightboxGalleryNestedGallerySettingsResource1"></asp:label>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" border="0" width="80%" align="center">
															<tr>
																<td align="left">
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td align="left">
																	<asp:label id="lblLightboxGalleryNestedGallerySelection0" runat="server" font-bold="True" text="Gallery selection:" resourcekey="lblLightboxGalleryNestedGallerySelectionResource1"></asp:label>
																	<br />
																	<asp:checkboxlist id="cblASSNestedGallerySelection" runat="server" cellpadding="2" cellspacing="5" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" ondatabound="cblTGNGGallerySelection_DataBound" onselectedindexchanged="cblTGNGGallerySelection_SelectedIndexChanged"
																		repeatcolumns="2" resourcekey="cblLightboxGalleryNestedGallerySelectionResource1">
																	</asp:checkboxlist>
																	<asp:label id="lblASSNoNestedGalleryError" runat="server" forecolor="Red" text="Please add an select some galleries." visible="False" resourcekey="lblLightboxGalleryNoNestedGalleryErrorResource1"></asp:label>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbASSNestedShowAllGalleries" runat="server" autopostback="True" oncheckedchanged="cbASSNestedShowAllGalleries_CheckedChanged" text="Show all galleries" resourcekey="cbLightboxGalleryNestedShowAllGalleriesResource1" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:panel id="pnlInvisible" runat="server" visible="False">
																		<table class="style66">
																			<tr>
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
																				<td>
																					<asp:textbox id="tbASSNGColumns" runat="server" resourcekey="tbTGNGColumnsResource1" validationgroup="vgTGSettings" width="35px">2</asp:textbox>
																					<asp:label id="lblLightboxGalleryNestedNumberOfColumns1" runat="server" resourcekey="lblLightboxGalleryNestedNumberOfColumnsResource1" text="Number of columns."></asp:label>
																					<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns3" runat="server" controltovalidate="tbASSNGColumns" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																						setfocusonerror="True" validationgroup="vgTGSettings">
																					</asp:requiredfieldvalidator>
																					<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns3" runat="server" controltovalidate="tbASSNGColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																						setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																					</asp:comparevalidator>
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<asp:textbox id="tbASSNGItems" runat="server" resourcekey="tbTGNGItemsTB" validationgroup="vgTGSettings" width="35px">4</asp:textbox>
																					<asp:label id="lblLightboxGalleryNestedNumberOfItems1" runat="server" resourcekey="lblLightboxGalleryNestedNumberOfItems" text="Number of items."></asp:label>
																					<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns4" runat="server" controltovalidate="tbASSNGItems" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																						setfocusonerror="True" validationgroup="vgTGSettings">
																					</asp:requiredfieldvalidator>
																					<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns4" runat="server" controltovalidate="tbASSNGItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																						setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																					</asp:comparevalidator>
																				</td>
																			</tr>
																		</table>
																	</asp:panel>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowMediaTitle0" ResourceKey="lblLightboxGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblLightboxGalleryShowMediaTitle.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSShowMediaTitle" runat="server" resourcekey="cbLightboxGalleryShowMediaTitleResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowMediaDescription0" ResourceKey="lblLightboxGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblLightboxGalleryShowMediaDescription.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSShowMediaDescription" runat="server" resourcekey="cbLightboxGalleryShowMediaDescriptionResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSDisplayNumber" runat="server" HelpText="Display image number:" Text="Display image number:" HelpKey="lblASSDisplayNumber.HelpKey" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSShowTitle" runat="server" resourcekey="cbTGShowTitleResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSDisplayPlayButton" runat="server" HelpText="Display play button:" Text="Display play button:" HelpKey="lblASSDisplayPlayButton.HelpKey" ResourceKey="lblASSDisplayPlayButton" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSShowDescription" runat="server" resourcekey="cbTGShowDescriptionResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSDisplayDownloadButton" runat="server" HelpText="Display download button:" Text="Display download button:" HelpKey="lblASSDisplayDownloadButton.HelpKey" ResourceKey="lblASSDisplayDownloadButton" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSNestedShowGalleryName" runat="server" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSDisplayInfoButton" runat="server" HelpText="Display info button:" Text="Display info button:" HelpKey="lblASSDisplayInfoButton.HelpKey" ResourceKey="lblASSDisplayInfoButton" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSNestedShowGalleryDescription" runat="server" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSDisplayTimer" runat="server" HelpText="Display timer:" Text="Display timer:" HelpKey="lblASSDisplayTimer.HelpKey" ResourceKey="lblASSDisplayTimer" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSNestedShowGalleryInfo" runat="server" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSFLoatingCpanel" runat="server" HelpText="Floating navigation bar:" Text="Floating navigation bar:" HelpKey="lblASSFLoatingCpanel.HelpKey" ResourceKey="lblASSFLoatingCpanel" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSNestedShowBreadcrumbs" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSShowOnMouseOver" runat="server" HelpText="Show navigation bar on mouse over:" Text="Show navigation bar on mouse over:" HelpKey="lblASSShowOnMouseOver.HelpKey" ResourceKey="lblASSShowOnMouseOver" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSNestedProportionalyResize" runat="server" autopostback="True" oncheckedchanged="cbASSNestedProportionalyResize_CheckedChanged" />
					</td>
				</tr>
				<tr>
					<td class="style90">
						<dnn:Label ID="lblASSInitialOpen" runat="server" HelpKey="lblASSInitialOpen.HelpText" HelpText="Show image selection on open:" ResourceKey="lblASSInitialOpen.Text" Text="Show image selection on open:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbASSInitialOpen" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSSlideEffect" runat="server" HelpText="Image transition effect:" Text="Image transition effect:" HelpKey="lblASSSlideEffect.HelpKey" ResourceKey="lblASSSlideEffect" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlASSTransitionEffect" runat="server">
							<asp:listitem resourcekey="lifade" value="fade">Fade</asp:listitem>
							<asp:listitem resourcekey="lihorizontal" value="h_slide">Horizontal slide</asp:listitem>
							<asp:listitem resourcekey="livertical" value="v_slide">Vertical slide</asp:listitem>
							<asp:listitem resourcekey="lihwipe" value="h_wipe">Horizontal wipe</asp:listitem>
							<asp:listitem resourcekey="livwipe" value="v_wipe">Vertical wipe</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSTextSlideEffect" runat="server" HelpText="Text transition effect:" Text="Text transition effect:" HelpKey="lblASSTextSlideEffect.HelpKey" ResourceKey="lblASSTextSlideEffect" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlASSTextTransitionEffect" runat="server">
							<asp:listitem resourcekey="lifade" value="fade">Fade</asp:listitem>
							<asp:listitem resourcekey="liUp" value="up">Up</asp:listitem>
							<asp:listitem resourcekey="liDown" value="down">Down</asp:listitem>
							<asp:listitem resourcekey="liLeft" value="left">Left</asp:listitem>
							<asp:listitem resourcekey="LiRight" value="right">Right</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSSyncEffect" runat="server" HelpText="Sync image and text transition effect:" Text="Sync effects:" HelpKey="lblASSSyncEffect.HelpKey" ResourceKey="lblASSSyncEffect" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSSyncEffects" runat="server" oncheckedchanged="cbASSNestedResizeCrop_CheckedChanged" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSPAuse" runat="server" HelpText="Pause between transitions:" Text="Pause between transitions:" HelpKey="lblASSPAuse.HelpKey" ResourceKey="lblASSPAuse" />
					</td>
					<td class="style38" colspan="2">
						<asp:textbox id="tbASSSSDuration" runat="server" width="58px" resourcekey="tbLightboxSSDurationResource1">5000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns14" runat="server" controltovalidate="tbASSSSDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgADVSSSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns14" runat="server" controltovalidate="tbASSSSDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgADVSSSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASStransitionSpeed" runat="server" HelpText="Transition speed:" Text="Transition speed:" HelpKey="lblASStransitionSpeed.HelpKey" ResourceKey="lblASStransitionSpeed" />
					</td>
					<td class="style38" colspan="2">
						<asp:textbox id="tbASSIntervalSpeed" runat="server" resourcekey="tbLightboxSSDurationResource1" width="58px">1000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns16" runat="server" controltovalidate="tbASSIntervalSpeed" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgADVSSSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns16" runat="server" controltovalidate="tbASSIntervalSpeed" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgADVSSSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblASSTolltipPosition" runat="server" HelpText="Enter toltip position corditanes::" Text="Tolltip position:" HelpKey="lblASSTolltipPosition.HelpKey" ResourceKey="lblASSTolltipPosition" />
					</td>
					<td class="style38" colspan="2">
						<table class="style69">
							<tr>
								<td>
									<asp:label id="lblASSTTTop" runat="server" resourcekey="lblASSTTTop" text="Top:"></asp:label>
									&nbsp;
								</td>
								<td class="style88">
									<asp:textbox id="tbASSTooltipTop" runat="server" validationgroup="vgADVSSSettings" width="40px">15</asp:textbox>
									<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns10" runat="server" controltovalidate="tbASSTooltipTop" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" setfocusonerror="True"
										validationgroup="vgADVSSSettings">
									</asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns10" runat="server" controltovalidate="tbASSTooltipTop" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
										setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
									</asp:comparevalidator>
								</td>
								<td class="style89">
									<asp:label id="lblASSTTLeft" runat="server" resourcekey="lblASSTTLeft" text="Left:"></asp:label>
								</td>
								<td>
									<asp:textbox id="tbASSToltipLeft" runat="server" validationgroup="vgADVSSSettings" width="40px">15</asp:textbox>
									<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns11" runat="server" controltovalidate="tbASSToltipLeft" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" setfocusonerror="True"
										validationgroup="vgADVSSSettings">
									</asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns11" runat="server" controltovalidate="tbASSToltipLeft" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
										setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
									</asp:comparevalidator>
								</td>
							</tr>
							<tr>
								<td>
									<asp:label id="lblASSTTWidth" runat="server" resourcekey="lblASSTTWidth" text="Width:"></asp:label>
								</td>
								<td class="style88">
									<asp:textbox id="tbASSTooltipWidth" runat="server" validationgroup="vgADVSSSettings" width="40px">340</asp:textbox>
									<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns12" runat="server" controltovalidate="tbASSTooltipWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" setfocusonerror="True"
										validationgroup="vgADVSSSettings">
									</asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns12" runat="server" controltovalidate="tbASSTooltipWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
										setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
									</asp:comparevalidator>
								</td>
								<td class="style89">
									<asp:label id="lblASSTTHeight" runat="server" resourcekey="lblASSTTHeight" text="Height:"></asp:label>
								</td>
								<td>
									<asp:textbox id="tbASSTooltipHeight" runat="server" validationgroup="vgADVSSSettings" width="40px">100</asp:textbox>
									<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns13" runat="server" controltovalidate="tbASSTooltipHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" setfocusonerror="True"
										validationgroup="vgADVSSSettings">
									</asp:requiredfieldvalidator>
									<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns13" runat="server" controltovalidate="tbASSTooltipHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
										setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
									</asp:comparevalidator>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryOpenMediaUrl0" ResourceKey="lblLightBoxGalleryOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblLightBoxGalleryOpenMediaUrl.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSGalleryOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbASSGalleryOpenMediaUrl_CheckedChanged" resourcekey="cbLightBoxGalleryOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryOpenMediaUrlNewWindow0" ResourceKey="lblLightBoxGalleryOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblLightBoxGalleryOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbASSOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbLightBoxGalleryOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblASSThumbWidth" runat="server" HelpText="Thumb width:" Text="Thumb width:" HelpKey="lblASSThumbWidth.HelpKey" ResourceKey="lblASSThumbWidth" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSImageWidth" runat="server" validationgroup="vgADVSSSettings" width="50px">75</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth1" runat="server" controltovalidate="tbASSImageWidth" errormessage="This field is required." validationgroup="vgADVSSSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageWidth1" runat="server" controltovalidate="tbASSImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgADVSSSettings" resourcekey="cvLightBoxGalleryImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblASSThumbHeight" runat="server" HelpText="Thumb height:" Text="Thumb height:" HelpKey="lblASSThumbHeight.HelpKey" ResourceKey="lblASSThumbHeight" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSImageHeight" runat="server" validationgroup="vgADVSSSettings" width="50px" resourcekey="tbTGImageHeightResource1">75</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageHeight1" runat="server" controltovalidate="tbASSImageHeight" errormessage="This field is required." validationgroup="vgADVSSSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageHeight1" runat="server" controltovalidate="tbASSImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgADVSSSettings" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryImageWidth0" runat="server" ControlName="tbTGImageWidth" HelpKey="lblLightBoxGalleryImageWidth.HelpText" HelpText="Set the maximum image width for resizing:" ResourceKey="lblLightBoxGalleryImageWidth" Text="Maximum image width:" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSNGImageWidth" runat="server" resourcekey="tbTGNGImageWidthResource1" width="35px" validationgroup="vgADVSSSettings">700</asp:textbox>
						<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageWidth1" runat="server" controltovalidate="tbASSNGImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageWidthResource1.ErrorMessage" setfocusonerror="True"
							validationgroup="vgADVSSSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightboxGalleryNestedImageWidth1" runat="server" controltovalidate="tbASSNGImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageWidthResource1.ErrorMessage"
							setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGallerySetImageHeight0" runat="server" ControlName="tbTGImageHeight" HelpKey="lblLightBoxGallerySetImageHeight.HelpText" HelpText="Set the maximum image height for resizing:" Text="Maximum image height: " ResourceKey="lblLightBoxGallerySetImageHeight" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSNGImageHeight" runat="server" resourcekey="tbTGNGImageHeightResource1" width="35px" validationgroup="vgADVSSSettings">500</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageHeight1" runat="server" controltovalidate="tbASSNGImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
							setfocusonerror="True" validationgroup="vgADVSSSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightboxGalleryNestedImageHeight1" runat="server" controltovalidate="tbASSNGImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
							setfocusonerror="True" type="Integer" validationgroup="vgADVSSSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblASSNumberOfColumns" runat="server" HelpText="Set the number of thumbnail columns:" Text="Number of thumbnail columns:" HelpKey="lblASSNumberOfColumns.HelpKey" ResourceKey="lblASSNumberOfColumns" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSNumberOfColumns" runat="server" resourcekey="tbTGNumberOfColumnsResource1" validationgroup="vgADVSSSettings" width="50px">4</asp:textbox>
						<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns15" runat="server" controltovalidate="tbASSNumberOfColumns" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgADVSSSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns15" runat="server" controltovalidate="tbASSNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgADVSSSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblASSThumbnailRows" runat="server" Text="Number of thumbnail rows:" HelpText="Set the number of thumbnail rows:" HelpKey="lblASSThumbnailRows.HelpKey" ResourceKey="lblASSThumbnailRows"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbASSItems" runat="server" validationgroup="vgADVSSSettings" width="50px" resourcekey="tbTGItemsResource1">2</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfItems1" runat="server" controltovalidate="tbASSItems" errormessage="This field is required." validationgroup="vgADVSSSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryNumberOfItemsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfItems1" runat="server" controltovalidate="tbASSItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgADVSSSettings" resourcekey="cvLightBoxGalleryNumberOfItemsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryCropImages0" ResourceKey="lblLightBoxGalleryCropImages" runat="server" Text="Resize and crop vertical images:" ControlName="cbSmartCropVertical" HelpText="Set this to crop vertical images:" HelpKey="lblLightBoxGalleryCropImages.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbASSSmartCropVertical" runat="server" oncheckedchanged="cbSmartCropVertical_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryResizeCrop0" ResourceKey="lblLightBoxGalleryResizeCrop" runat="server" Text="Resize and crop all images:" ControlName="cbTGSmartResizeAndCrop" HelpText="Set this this to resize all images to same width and height:" HelpKey="lblLightBoxGalleryResizeCrop.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbASSResizeAndCrop" runat="server" oncheckedchanged="cbTGSmartResizeAndCrop_CheckedChanged" checked="True" resourcekey="cbLightBoxGalleryResizeAndCropResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxRandomizeMedia0" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbASSRandomizeMedia" runat="server" oncheckedchanged="cbASSRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label6" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlASSMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblASSMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:button id="btnASSSave" runat="server" onclick="btnASSSave_Click" resourcekey="btnLightBoxGallerySaveResource1" text="Save settings" validationgroup="vgADVSSSettings" width="140px" style="height: 26px" />
						&nbsp;<asp:button id="btnLightBoxGallerySaveClose1" runat="server" onclick="btnASSGallerySaveClose_Click" resourcekey="btnLightBoxGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgADVSSSettings" width="140px" />
						&nbsp;
						<asp:label id="lblASSGalleryStatus" runat="server" resourcekey="lblLightBoxGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70" colspan="3">
						&nbsp;<asp:panel id="pnlInvisibleASS" runat="server" visible="False">
							<table align="center" cellpadding="2" cellspacing="2" width="80%">
								<tr>
									<td class="style70" colspan="3">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<asp:label id="lblLightBoxGalleryViseoPlayerSettings1" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1" text="Video player in lightbox settings:"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryVideoPlayerSelect0" runat="server" HelpKey="SelectVideoPlayer.HelpText" HelpText="Select player:" ResourceKey="SelectVideoPlayer.Text" Text="Select player:" />
									</td>
									<td colspan="2">
										<asp:dropdownlist id="ddlTGVPSelectPlayer0" runat="server" autopostback="True" onselectedindexchanged="ddlTGVPSelectPlayer_SelectedIndexChanged" resourcekey="ddlTGVPSelectThemeResource1">
											<asp:listitem selected="True" value="False">Standard</asp:listitem>
											<asp:listitem value="True">Flow player</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryVideoPlayerSelectSkin0" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" Text="Select video player skin:" />
									</td>
									<td colspan="2">
										<asp:dropdownlist id="ddlTGVPSelectTheme0" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
											<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
											<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayOnLoad0" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" HelpText="Start to play video on page load:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" Text="Play on load:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbTGVPPlayOnLoad0" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryViseoPlayerPlayOnLoad0" runat="server" HelpKey="lblLightBoxGalleryViseoPlayerPlayOnLoad.HelpText" HelpText="Show description inside video player:" ResourceKey="lblLightBoxGalleryViseoPlayerPlayOnLoad" Text="Show description:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbTGVPShowDescription0" runat="server" resourcekey="cbTGVPShowDescriptionResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblTGVPAllowFullscreen0" runat="server" HelpKey="lblTGVPAllowFullscreen.HelpText" HelpText="Allow video to be played in fullscreen:" ResourceKey="lblTGVPAllowFullscreen" Text="Allow fullscreen:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbTGVPAllowFullscreen0" runat="server" resourcekey="cbTGVPAllowFullscreenResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayQTInFlash1" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash.HelpText" HelpText="Play QuickTime videos in flash player:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash" Text="Play QuickTime videos in flash player:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbTGVPPlayQTinFlash1" runat="server" resourcekey="cbTGVPPlayQTinFlashResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										&nbsp;
									</td>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										&nbsp;
									</td>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<asp:label id="lblLightBoxGalleryAudioPlayerSettings2" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryAudioPlayerPlayOnLoad1" runat="server" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" HelpText="Start to play audio on page load:" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" Text="Play on load:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbTGAPPlayOnLoad0" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										&nbsp;
									</td>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxAjaxPreloader1" runat="server" HelpKey="lblLightBoxAjaxPreloader.HelpText" HelpText="Select Ajax preloader type:" ResourceKey="lblLightBoxAjaxPreloader" Text="Select Ajax preloader type:" />
									</td>
									<td colspan="2">
										<asp:radiobuttonlist id="rblLighboxPreloaderType0" runat="server" repeatdirection="Horizontal">
											<asp:listitem resourcekey="LighboxPreloaderFullscreen" selected="True">Fullscreen</asp:listitem>
											<asp:listitem resourcekey="LighboxPreloaderBellowImages" value="Belowimages">Below 
											images</asp:listitem>
										</asp:radiobuttonlist>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightboxGalleryShowTitle0" runat="server" HelpKey="lblLightboxGalleryShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblLightboxGalleryShowTitle" Text="Show gallery title:" />
									</td>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightboxGalleryShowDescription0" runat="server" HelpKey="lblLightboxGalleryShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblLightboxGalleryShowDescription" Text="Show gallery description:" />
									</td>
									<td colspan="2">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightboxGalleryShowLightboxTitle0" runat="server" HelpKey="lblLightboxGalleryShowLightboxTitle.HelpText" HelpText="Show image title in lightbox:" ResourceKey="lblLightboxGalleryShowLightboxTitle" Text="Show image title in lightbox:" />
									</td>
									<td class="style52">
										<asp:checkbox id="cbASSShowLightboxTitle" runat="server" resourcekey="cbLightboxGalleryShowLightboxTitleResource1" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										&nbsp;<dnn:Label ID="lblLightboxGalleryLightboxDescription0" runat="server" HelpKey="lblLightboxGalleryLightboxDescription.HelpText" HelpText="Show media description in lightbox:" ResourceKey="lblLightboxGalleryLightboxDescription" Text="Show media description in lightbox:" />
										&nbsp;
									</td>
									<td colspan="2">
										<asp:checkbox id="cbASSShowLightboxDescription" runat="server" autopostback="True" oncheckedchanged="cbTGShowLightboxDescription_CheckedChanged" resourcekey="cbTGShowLightboxDescriptionResource1" />
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="style70">
										&nbsp;
									</td>
									<td colspan="2">
										<asp:panel id="pnlLightboxToolTipOptions0" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
											<table class="style66">
												<tr>
													<td class="style85">
														&nbsp;
													</td>
													<td>
														<asp:label id="lblLightBoxToolTipOptions0" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxShowTooltips0" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
													</td>
													<td>
														<asp:checkbox id="cbShowToolTips0" runat="server" checked="True" />
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxTargetPosition0" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlLightboxTargetPosition0" runat="server">
															<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
															<asp:listitem resourcekey="topMiddle" selected="True" value="topMiddle">Top 
															middle</asp:listitem>
															<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
															<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
															<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
															<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
															<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
															<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
															<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
															<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
															<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
															<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
															<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxTooltipPosition0" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlLightboxTooltipPosition0" runat="server">
															<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
															<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
															<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
															<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
															<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
															<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
															<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
															<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
															<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
															<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
															<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
															<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
															middle</asp:listitem>
															<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxShowEffect0" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlLightboxShoweffect0" runat="server">
															<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
															<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
															<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxShowEffectDuration0" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxShowHideEffect0" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlLightboxHideEffect0" runat="server">
															<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
															<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
															<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxHideEffectDuration0" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxTooltipBorder0" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxTooltipCornerRadius0" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
													</td>
													<td>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td class="style85">
														<asp:label id="lblLightboxTooltipTheme0" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
													</td>
													<td>
														<asp:dropdownlist id="ddlLightboxTooltipTheme0" runat="server">
															<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
															<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
															<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
															<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
															<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
															<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
														</asp:dropdownlist>
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightboxGalleryLightboxThumbnails0" runat="server" HelpKey="lblLightboxGalleryLightboxThumbnails.HelpText" HelpText="Show thumbnails inside lightbox:" ResourceKey="lblLightboxGalleryLightboxThumbnails" Text="Show thumbnails inside lightbox:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbASSLightboxThumbnails" runat="server" resourcekey="cbLightboxGalleryLightboxThumbnailsResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightboxGalleryLightboxSlideShow0" runat="server" HelpKey="lblLightboxGalleryLightboxSlideShow.HelpText" HelpText="Slide show inside lightbox:" ResourceKey="lblLightboxGalleryLightboxSlideShow" Text="Slide show inside lightbox:" />
									</td>
									<td colspan="2">
										<asp:checkbox id="cbASSSlideShow" runat="server" autopostback="True" oncheckedchanged="cbLightBoxSlideShow_CheckedChanged" resourcekey="cbLightBoxSlideShowResource1" />
									</td>
								</tr>
								<tr>
									<td class="style70">
										<dnn:Label ID="lblLightBoxGalleryAnimationSpeed0" runat="server" HelpKey="lblLightBoxGalleryAnimationSpeed.HelpText" HelpText="Lightbox animation speed:" ResourceKey="lblLightBoxGalleryAnimationSpeed" Text="Lightbox animation speed:" />
									</td>
									<td colspan="2">
										<asp:dropdownlist id="ddlASSLightboxAnimationSpeed" runat="server" resourcekey="ddlTGLightboxAnimationSpeedResource1">
											<asp:listitem resourcekey="ListItemResource25" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="ListItemResource26" value="normal">Normal</asp:listitem>
											<asp:listitem resourcekey="ListItemResource27" value="slow">Slow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
						&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlImageCarousel" runat="server" backcolor="#EFEFEF" visible="False" resourcekey="pnlImageCarouselResource1">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblImageCarouselDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Image carousel display settings" resourcekey="lblImageCarouselDisplaySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table align="center" cellpadding="2" cellspacing="2" width="80%">
				<tr>
					<td colspan="3">
					</td>
				</tr>
				<tr>
					<td class="style93">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style94">
						<dnn:Label ID="lblImageCarouselTemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblImageCarouselTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblImageCarouselTemplateSelect" Text="Select template:" />
					</td>
					<td class="style80" colspan="2">
						<asp:dropdownlist id="ddlICTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlICTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style95">
						<dnn:Label ID="lblImageCarouselThemeSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblImageCarouselThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblImageCarouselThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style81" colspan="2">
						<asp:dropdownlist id="ddlICThemeSelect" runat="server" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
						&nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style95">
						&nbsp;
					</td>
					<td class="style81" colspan="2">
						<asp:label id="lblImageCarouselTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style95">
						&nbsp;
					</td>
					<td class="style81" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style95">
						<dnn:Label ID="lblImageCarouselShowTitle" runat="server" HelpKey="lblImageCarouselShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblImageCarouselShowTitle" Text="Show gallery title:" Visible="True" />
					</td>
					<td class="style81" colspan="2">
						<asp:checkbox id="cbImageCarouselShowTitle" runat="server" resourcekey="cbImageCarouselShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style95">
						<dnn:Label ID="lblImageCarouselShowDescription" runat="server" HelpKey="lblImageCarouselShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblImageCarouselShowDescription" Text="Show gallery description:" Visible="True" />
					</td>
					<td class="style81" colspan="2">
						<asp:checkbox id="cbImageCarouselShowDescription" runat="server" resourcekey="cbImageCarouselShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselShowMediaTitle" ResourceKey="lblImageCarouselShowMediaTitle" runat="server" HelpText="Show image title:" Text="Show image title:" HelpKey="lblImageCarouselShowMediaTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselShowMediaTitle" runat="server" resourcekey="cbImageCarouselShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselShowMediaDescription" ResourceKey="lblImageCarouselShowMediaDescription" runat="server" HelpText="Show image description:" Text="Show image description:" HelpKey="lblImageCarouselShowMediaDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselShowMediaDescription" runat="server" resourcekey="cbImageCarouselShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselShowLightboxTitle" ResourceKey="lblImageCarouselShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblImageCarouselShowLightboxTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselShowLightboxTitle" runat="server" resourcekey="cbImageCarouselShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93" valign="top">
						<dnn:Label ID="lblImageCarouselShowLightBoxDescription" ResourceKey="lblImageCarouselShowLightBoxDescription" runat="server" HelpText="Show image description in lightbox:" Text="Show image description in lightbox:" HelpKey="lblImageCarouselShowLightBoxDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselShowLightboxDescription" runat="server" resourcekey="cbImageCarouselShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbImageCarouselShowLightboxDescription_CheckedChanged1" />
						<br />
						<asp:panel id="pnlImageCarouselTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblImageCarouselToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderShowToolTips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbImageCarouselShowTooltips" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageCarouselTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth0" runat="server" controltovalidate="tbImageCarouselTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgImageCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth0" runat="server" controltovalidate="tbImageCarouselTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgImageCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageCarouselTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth1" runat="server" controltovalidate="tbImageCarouselTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgImageCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth1" runat="server" controltovalidate="tbImageCarouselTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgImageCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageCarouselTooltipBorder" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth2" runat="server" controltovalidate="tbImageCarouselTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage" setfocusonerror="True"
											validationgroup="vgImageCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth2" runat="server" controltovalidate="tbImageCarouselTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgImageCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageCarouselTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth3" runat="server" controltovalidate="tbImageCarouselTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgImageCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth3" runat="server" controltovalidate="tbImageCarouselTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgImageCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageCarouselTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselOpenMediaUrl" ResourceKey="lblImageCarouselOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblImageCarouselOpenMediaUrl.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbImageCarouselOpenMediaUrl_CheckedChanged" resourcekey="cbImageCarouselOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselOpenMediaUrlNewWindow" ResourceKey="lblImageCarouselOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblImageCarouselOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbImageCarouselOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselMaxImageWidth" ResourceKey="lblImageCarouselMaxImageWidth" runat="server" ControlName="tbMaxImageWidth" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image width:" HelpKey="lblImageCarouselMaxImageWidth.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbImageCarouselMaxImageWidth" runat="server" validationgroup="vgImageSliderSettings" width="45px" resourcekey="tbImageCarouselMaxImageWidthResource1">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth" runat="server" controltovalidate="tbImageCarouselMaxImageWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgImageCarouselSettings" resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageCarouselImageWidth" runat="server" controltovalidate="tbImageCarouselMaxImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageCarouselSettings"
							resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselMaxImageHeight" ResourceKey="lblImageCarouselMaxImageHeight" runat="server" ControlName="tbMaxImageHeight" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image height:" HelpKey="lblImageCarouselMaxImageHeight.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbImageCaruselMaxImageHeight" runat="server" validationgroup="vgImageSliderSettings" width="45px" resourcekey="tbImageCaruselMaxImageHeightResource1">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageHeight" runat="server" controltovalidate="tbImageCaruselMaxImageHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgImageCarouselSettings" resourcekey="rfvImageCarouselImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageCarouselImageHeight" runat="server" controltovalidate="tbImageCaruselMaxImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageCarouselSettings"
							resourcekey="cvImageCarouselImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselAutoSlideImages" ResourceKey="lblImageCarouselAutoSlideImages" runat="server" HelpText="Auto slide images:" Text="Auto slide images:" HelpKey="lblImageCarouselAutoSlideImages.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageCarouselAuoSlideImages" runat="server" resourcekey="cbImageCarouselAuoSlideImagesResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselAutoSlidePause" ResourceKey="lblImageCarouselAutoSlidePause" runat="server" ControlName="tbAutoSlidePause" HelpText="Set the pause between images when in auto slide mode:" Text="Auto slide pause between imags (ms): " HelpKey="lblImageCarouselAutoSlidePause.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:panel id="pnlSlideOpt1" runat="server" resourcekey="pnlSlideOpt1Resource1">
							<asp:textbox id="tbImageCarouselAutoSlidePause" runat="server" validationgroup="vgImageCarouselSettings" width="51px" resourcekey="tbImageCarouselAutoSlidePauseResource1">5000</asp:textbox>
							<asp:requiredfieldvalidator id="rfvImageCarouselAutoSlidePause" runat="server" controltovalidate="tbImageCarouselAutoSlidePause" display="Dynamic" errormessage="This field is required." validationgroup="vgImageCarouselSettings" resourcekey="rfvImageCarouselAutoSlidePauseResource1.ErrorMessage">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvImageCarouselAutoSlidePause" runat="server" controltovalidate="tbImageCarouselAutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageCarouselSettings"
								resourcekey="cvImageCarouselAutoSlidePauseResource1.ErrorMessage">
							</asp:comparevalidator>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselNumberOfImages" ResourceKey="lblImageCarouselNumberOfImages" runat="server" ControlName="tbAutoSlidePause" HelpText="Number of images to show:" Text="Number of images to show:" HelpKey="lblImageCarouselNumberOfImages.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:textbox id="tbImageCarouselNumberOfImages" runat="server" validationgroup="vgImageCarouselSettings" width="51px" resourcekey="tbImageCarouselNumberOfImagesResource1">4</asp:textbox>
						<asp:requiredfieldvalidator id="rfvImageCarouselNumberOfImages" runat="server" controltovalidate="tbImageCarouselNumberOfImages" display="Dynamic" errormessage="This field is required." validationgroup="vgImageCarouselSettings" resourcekey="rfvImageCarouselNumberOfImagesResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageCarouselNumberOfImages" runat="server" controltovalidate="tbImageCarouselNumberOfImages" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageCarouselSettings"
							resourcekey="cvImageCarouselNumberOfImagesResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselNumberOfImagesToSlide" ResourceKey="lblImageCarouselNumberOfImagesToSlide" runat="server" ControlName="tbAutoSlidePause" HelpText="Number of images to slide:" Text="Number of images to slide:" HelpKey="lblImageCarouselNumberOfImagesToSlide.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:textbox id="tbImageCarouselNumberOfImagesSlide" runat="server" validationgroup="vgImageCarouselSettings" width="51px" resourcekey="tbImageCarouselNumberOfImagesSlideResource1">1</asp:textbox>
						<asp:requiredfieldvalidator id="rfvImageCarouselNumberOfImagesToSlide" runat="server" controltovalidate="tbImageCarouselNumberOfImagesSlide" display="Dynamic" errormessage="This field is required." validationgroup="vgImageCarouselSettings" resourcekey="rfvImageCarouselNumberOfImagesToSlideResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageCarouselNumberOfImagesToSlide" runat="server" controltovalidate="tbImageCarouselNumberOfImagesSlide" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageCarouselSettings"
							resourcekey="cvImageCarouselNumberOfImagesToSlideResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselShowNavigation" ResourceKey="lblImageCarouselShowNavigation" runat="server" HelpText="Show navigation:" Text="Show navigation:" HelpKey="lblImageCarouselShowNavigation.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageCarouselShowNavigation" runat="server" checked="True" resourcekey="cbImageCarouselShowNavigationResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselShowPaging" ResourceKey="lblImageCarouselShowPaging" runat="server" HelpText="Show paging:" Text="Show paging:" HelpKey="lblImageCarouselShowPaging.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageCarouselShowPaging" runat="server" resourcekey="cbImageCarouselShowPagingResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselRandomizeMedia" runat="server" HelpText="Randomize media positions at every page load:" Text="Randomize media positions:" HelpKey="lblImageCarouselRandomizeMedia.HelpText" ResourceKey="lblImageCarouselRandomizeMedia" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageCarouselRandomizeMedia" runat="server" resourcekey="cbImageCarouselShowPagingResource1" autopostback="True" oncheckedchanged="cbImageCarouselRandomizeMedia_CheckedChanged" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="Label8" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlImageCarouselMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblImageCarouselMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselArrowTypes" runat="server" HelpText="Select navigation arrow style:" Text="Select navigation arrow style:" HelpKey="lblImageCarouselArrowTypes.HelpText" ResourceKey="lblImageCarouselArrowTypes.Text" />
					</td>
					<td class="style35" colspan="2">
						<asp:dropdownlist id="ddlImageCarouselArrows" runat="server">
							<asp:listitem>Default</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style93" valign="top">
						<dnn:Label ID="lblImageCarouselEnableFullscreen" runat="server" CssClass="styleBolded" HelpKey="lblLightBoxEnableFullscreen.HelpText" HelpText="Enable fullscreen:" ResourceKey="lblLightBoxEnableFullscreen" Text="Enable fullscreen:" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageCarouselEnableFullscreen" runat="server" autopostback="True" oncheckedchanged="cbImageCarouselEnableFullscreen_CheckedChanged" />
						<asp:panel id="pnlImageCarouselFullscreenOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<dnn:Label ID="lblImageCarouselFullscreenThemeSelect" runat="server" HelpKey="lblLightboxFullscreenThemeSelect.HelpText" HelpText="Select fullscreen theme:" ResourceKey="lblLightboxFullscreenThemeSelect" Text="Select fullscreen theme:" />
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselFullScreenThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblImageCarouselFullscreenShowArrows" runat="server" HelpKey="lblLightboxFullscreenShowArrows.HelpText" HelpText="Show navigation arrows:" ResourceKey="lblLightboxFullscreenShowArrows" Text="Show navigation arrows:" />
									</td>
									<td>
										<asp:checkbox id="cbImageCarouselFullscreenShowArrows" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblImageCarouselFullscreenAutoHideNavigationArrows" runat="server" HelpKey="lblLightboxFullscreenAutoHideNavigationArrows.HelpText" HelpText="Auto hide navigation arrows on mouse out:" ResourceKey="lblLightboxFullscreenAutoHideNavigationArrows.Text"
											Text="Auto hide navigation arrows:" />
									</td>
									<td>
										<asp:checkbox id="cbImageCarouselFullscreenAutoHideArrows" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblImageCarouselFullscreenArrows" runat="server" HelpKey="lblLightboxFullscreenArrows.HelpText" HelpText="Navigation arrows:" ResourceKey="lblLightboxFullscreenArrows.Text" Text="Navigation arrows:" />
									</td>
									<td>
										<asp:dropdownlist id="ddlImageCarouselFullscreenArrows" runat="server">
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblImageCarouselFullscreenGalleryTitle" runat="server" HelpKey="lblLightboxFullscreenGalleryTitle.HelpText" HelpText="Please enter title to display:" ResourceKey="lblLightboxFullscreenGalleryTitle.Text" Text="Title to display:" />
									</td>
									<td>
										<asp:textbox id="tbImageCarouselFullscreenTitle" runat="server" width="302px">
										</asp:textbox>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style93" valign="top">
						<dnn:Label ID="lblLightBoxShowDownload1" runat="server" HelpKey="lblLightBoxShowDownload.HelpText" HelpText="Show image download link:" ResourceKey="lblLightBoxShowDownload" Text="Show image download link:" />
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageCarouselDownloadLink" runat="server" autopostback="True" oncheckedchanged="cbImageCarouselDownloadLink_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
						<asp:panel id="pnlImageCarouselDownloadOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<asp:label id="lblLighboxSelectDownloadRoles1" runat="server" resourcekey="lblLighboxSelectDownloadRoles" text="Select download roles:"></asp:label>
									</td>
									<td>
										<br />
										<asp:gridview id="gvImageCarouselDownloadRoles" runat="server" autogeneratecolumns="False" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="1px" cellpadding="4" cssclass="intliststylebox" forecolor="#333333" gridlines="None" onrowdatabound="gvImageCarouselDownloadRoles_RowDataBound">
											<rowstyle backcolor="#F7F6F3" forecolor="#333333" />
											<columns>
												<asp:TemplateField HeaderText="Role">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Role") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:Label ID="lblRoleName2" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Enable download">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("EnableDownload") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:CheckBox ID="cbICEnableDownload" runat="server" Checked='<%# Bind("EnableDownload") %>' />
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
											</columns>
											<footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
											<pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
											<selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
											<headerstyle backcolor="#0BA2CE" font-bold="True" forecolor="#FFFFFF" />
											<editrowstyle backcolor="#999999" />
											<alternatingrowstyle backcolor="White" forecolor="#284775" />
										</asp:gridview>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<asp:label id="lblUseViewVersionAsDownload1" runat="server" resourcekey="lblUseViewVersionAsDownload" text="Use view version as download version if there is no download verison:" width="130px"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbImageCarouselUseViewAsDownload" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style93">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:label id="lblImageCarouselVideoinLighTitle" runat="server" text="Video player in lightbox settings:" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselVPSelectPLayer" runat="server" HelpText="Select player:" Text="Select player:" HelpKey="SelectVideoPlayer.HelpText" ResourceKey="SelectVideoPlayer.Text" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlImageCarouselVPSelectPlayer" runat="server" resourcekey="ddlTGVPSelectThemeResource1" autopostback="True" onselectedindexchanged="ddlImageCarouselVPSelectPlayer_SelectedIndexChanged">
							<asp:listitem selected="True" value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselVPSkin" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" Text="Select video player skin:" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlImageCarouselVPTheme" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselVPPlayOnLoad" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" runat="server" HelpText="Start to play video on page load:" Text="Play on load:" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbImageCarouselVPPlayOnLOad" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselVPShowDescription" ResourceKey="lblLightBoxGalleryViseoPlayerPlayOnLoad" runat="server" HelpText="Show description inside video player:" Text="Show description:" HelpKey="lblLightBoxGalleryViseoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbImageCarouselVPShowDescription" runat="server" resourcekey="cbTGVPShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselVPAllowFullscreen" ResourceKey="lblTGVPAllowFullscreen" runat="server" HelpText="Allow video to be played in fullscreen:" Text="Allow fullscreen:" HelpKey="lblTGVPAllowFullscreen.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbImageCarouselVPAllowFullscreen" runat="server" resourcekey="cbTGVPAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselPlayQTinFlash" ResourceKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash" runat="server" HelpText="Play QuickTime videos in flash player:" Text="Play QuickTime videos in flash player:" HelpKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbImageCarouselVPPlayQTInFlash" runat="server" resourcekey="cbTGVPPlayQTinFlashResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style93">
						<asp:label id="lblLightBoxGalleryAudioPlayerSettings1" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style93">
						<dnn:Label ID="lblImageCarouselAPAutoStart" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" runat="server" HelpText="Start to play audio on page load:" Text="Play on load:" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbImageCarouselAPAutostart" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style93">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:button id="btnImageCarouselSaveSettings" runat="server" onclick="btnImageCarouselSaveSettings_Click" style="height: 26px" text="Save settings" validationgroup="vgImageCarouselSettings" width="140px" resourcekey="btnImageCarouselSaveSettingsResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnImageCaouselSaveClose" runat="server" onclick="btnImageCaouselSaveClose_Click" text="Save &amp; Close" validationgroup="vgImageCarouselSettings" width="140px" resourcekey="btnImageCaouselSaveCloseResource1"
							style="height: 26px" />
						&nbsp;&nbsp;
						<asp:label id="lblImageCarouselSstatus" runat="server" width="120px" resourcekey="lblImageCarouselSstatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style93">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style93" colspan="3">
						<asp:panel id="pnlImageCarouselHidden" runat="server" visible="False">
							<dnn:Label ID="lblImageCarouselFullscreenDropDownImages" runat="server" HelpKey="lblLightboxFullscreenDropDownImages.HelpText" HelpText="Dropdown menu style:" ResourceKey="lblLightboxFullscreenDropDownImages.Text" Text="Dropdown menu style:" />
							<asp:dropdownlist id="ddlImageCarouselFullscreenDropDownStyle" runat="server">
							</asp:dropdownlist>
							<dnn:Label ID="lblImageCarouselFullscreenNavbar" runat="server" HelpKey="lblLightboxFullscreenNavbar.HelpText" HelpText="Show navigation:" ResourceKey="lblLightboxFullscreenNavbar" Text="Show navigation:" />
							<asp:checkbox id="cbImageCarouselShowNavigationBar" runat="server" checked="True" />
							<br />
							<asp:dropdownlist id="ddlImageCarouselFullscreenMenuStyle" runat="server" autopostback="True">
								<asp:listitem value="classic">Navigation bar</asp:listitem>
								<asp:listitem value="dropdown">Dropdown list</asp:listitem>
							</asp:dropdownlist>
							<dnn:Label ID="lblImageCarouselFullscreenMenuType" runat="server" HelpKey="lblLightboxFullscreenMenuType.HelpText" HelpText="Select navigation menu type:" ResourceKey="lblLightboxFullscreenMenuType" Text="Navigation menu type:" />
							<br />
							<br />
						</asp:panel>
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlVerticalCarousel" runat="server" backcolor="#EFEFEF" visible="False" resourcekey="pnlImageCarouselResource1">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblVerticalCarousel" resourcekey="lblVerticalCarousel" runat="server" cssclass="settingsdetailtitle" text="Vertical carousel display settings"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table align="center" cellpadding="2" cellspacing="2" width="80%">
				<tr>
					<td colspan="3">
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style79">
						<dnn:Label ID="lblVerticalCarouselTemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblVerticalCarouselTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblVerticalCarouselTemplateSelect" Text="Select template:" />
					</td>
					<td class="style80" colspan="2">
						<asp:dropdownlist id="ddlVerticalTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlVerticalTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style79">
						<dnn:Label ID="lblVerticalCarouselThemeSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblImageCarouselThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblImageCarouselThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style80" colspan="2">
						<asp:dropdownlist id="ddlVerticalThemeSelect" runat="server" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style74">
						&nbsp;
					</td>
					<td class="style81" colspan="2">
						<asp:label id="lblVerticalCarouselTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselShowMediaTitle" ResourceKey="lblVerticalCarouselShowMediaTitle" runat="server" HelpText="Show image title:" Text="Show image title:" HelpKey="lblVerticalCarouselShowMediaTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselShowMediaTitle" runat="server" resourcekey="cbImageCarouselShowMediaTitleResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselShowMediaDescription" ResourceKey="lblVerticalCarouselShowMediaDescription" runat="server" HelpText="Show image description:" Text="Show image description:" HelpKey="lblVerticalCarouselShowMediaDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselShowMediaDescription" runat="server" resourcekey="cbImageCarouselShowMediaDescriptionResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselShowLightboxTitle" ResourceKey="lblVerticalCarouselShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblVerticalCarouselShowLightboxTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselShowLightboxTitle" runat="server" resourcekey="cbImageCarouselShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72" valign="top">
						<dnn:Label ID="lblVerticalCarouselShowLightBoxDescription" ResourceKey="lblVerticalCarouselShowLightBoxDescription" runat="server" HelpText="Show image description in lightbox:" Text="Show image description in lightbox:" HelpKey="lblVerticalCarouselShowLightBoxDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselShowLightboxDescription" runat="server" resourcekey="cbImageCarouselShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbVerticalCarouselShowLightboxDescription_CheckedChanged" />
						<asp:panel id="pnlVerticalCarouselTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblVerticalCarouselToolTipOptions0" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderLightboxShowTooltips0" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselShowToolTips" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlVerticalCarouselTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlVerticalCarouselTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlVerticalCarouselShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbVerticalCarouselTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth4" runat="server" controltovalidate="tbVerticalCarouselTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth4" runat="server" controltovalidate="tbVerticalCarouselTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlVerticalCarouselHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbVerticalCarouselTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth5" runat="server" controltovalidate="tbVerticalCarouselTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth5" runat="server" controltovalidate="tbVerticalCarouselTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbVerticalCarouselTooltipBorder" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth6" runat="server" controltovalidate="tbVerticalCarouselTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage" setfocusonerror="True"
											validationgroup="vgVerticalCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth6" runat="server" controltovalidate="tbVerticalCarouselTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbVerticalCarouselTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth7" runat="server" controltovalidate="tbVerticalCarouselTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth7" runat="server" controltovalidate="tbVerticalCarouselTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblVerticalCarouselTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlVerticalCarouselTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselOpenMediaUrl" ResourceKey="lblVerticalCarouselOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblVerticalCarouselOpenMediaUrl.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbVerticalCarouselOpenMediaUrl_CheckedChanged" resourcekey="cbImageCarouselOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselOpenMediaUrlNewWindow" ResourceKey="lblVerticalCarouselOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblVerticalCarouselOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbVerticalCarouselOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbImageCarouselOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselMaxImageWidth" ResourceKey="lblVerticalCarouselMaxImageWidth" runat="server" ControlName="tbMaxImageWidth" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image width:" HelpKey="lblVerticalCarouselMaxImageWidth.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbVerticalCarouselMaxImageWidth" runat="server" validationgroup="vgVerticalCarouselSettings" width="45px" resourcekey="tbImageCarouselMaxImageWidthResource1">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVerticalCarouselImageWidth" runat="server" controltovalidate="tbVerticalCarouselMaxImageWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgVerticalCarouselSettings" resourcekey="rfvVerticalCarouselImageWidth.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVerticalCarouselImageWidth" runat="server" controltovalidate="tbVerticalCarouselMaxImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVerticalCarouselSettings"
							resourcekey="cvVerticalCarouselImageWidth.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselMaxImageHeight" ResourceKey="lblVerticalCarouselMaxImageHeight" runat="server" ControlName="tbMaxImageHeight" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image height:" HelpKey="lblVerticalCarouselMaxImageHeight.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbVerticalCaruselMaxImageHeight" runat="server" validationgroup="vgVerticalCarouselSettings" width="45px" resourcekey="tbImageCaruselMaxImageHeightResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVerticalCarouselImageHeight" runat="server" controltovalidate="tbVerticalCaruselMaxImageHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgVerticalCarouselSettings" resourcekey="rfvVerticalCarouselImageHeight.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVerticalCarouselImageHeight" runat="server" controltovalidate="tbVerticalCaruselMaxImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVerticalCarouselSettings"
							resourcekey="cvVerticalCarouselImageHeight.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselAutoSlidePause" ResourceKey="lblVerticalCarouselAutoSlidePause" runat="server" ControlName="tbAutoSlidePause" HelpText="Set the pause between images when in auto slide mode:" Text="Auto slide pause between imags (ms): "
							HelpKey="lblVerticalCarouselAutoSlidePause.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:panel id="pnlSlideOpt2" runat="server" resourcekey="pnlSlideOpt1Resource1">
							<asp:textbox id="tbVerticalCarouselAutoSlidePause" runat="server" validationgroup="vgVerticalCarouselSettings" width="51px" resourcekey="tbImageCarouselAutoSlidePauseResource1">5000</asp:textbox>
							<asp:requiredfieldvalidator id="rfvVerticalCarouselAutoSlidePause" runat="server" controltovalidate="tbVerticalCarouselAutoSlidePause" display="Dynamic" errormessage="This field is required." validationgroup="vgVerticalCarouselSettings" resourcekey="rfvVerticalCarouselAutoSlidePause.ErrorMessage">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvVerticalCarouselAutoSlidePause" runat="server" controltovalidate="tbVerticalCarouselAutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVerticalCarouselSettings"
								resourcekey="cvVerticalCarouselAutoSlidePause.ErrorMessage">
							</asp:comparevalidator>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselNumberOfImagesToSlide" runat="server" HelpKey="lblVerticalCarouselNumberOfImagesToSlide.HelpText" HelpText="Number of images to slide:" ResourceKey="lblVerticalCarouselNumberOfImagesToSlide" Text="Number of images to slide:" />
					</td>
					<td class="style35" colspan="2">
						<asp:textbox id="tbVerticalCarouselNumberOfImagesSlide" runat="server" resourcekey="tbImageCarouselNumberOfImagesSlideResource1" validationgroup="vgVerticalCarouselSettings" width="51px">1</asp:textbox>
						<asp:requiredfieldvalidator id="rfvVerticalCarouselNumberOfImagesToSlide" runat="server" controltovalidate="tbVerticalCarouselNumberOfImagesSlide" display="Dynamic" errormessage="This field is required." resourcekey="rfvVerticalCarouselNumberOfImagesToSlide.ErrorMessage"
							validationgroup="vgVerticalCarouselSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVerticalCarouselNumberOfImagesToSlide" runat="server" controltovalidate="tbVerticalCarouselNumberOfImagesSlide" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVerticalCarouselNumberOfImagesToSlide.ErrorMessage"
							type="Integer" validationgroup="vgVerticalCarouselSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselNumberOfImages" runat="server" HelpKey="lblVerticalCarouselNumberOfImages.HelpText" HelpText="Number of images to show:" ResourceKey="lblVerticalCarouselNumberOfImages" Text="Number of images to show:" />
					</td>
					<td class="style35" colspan="2">
						<asp:textbox id="tbVerticalCarouselNumberOfImages" runat="server" resourcekey="tbImageCarouselNumberOfImagesResource1" validationgroup="vgVerticalCarouselSettings" width="51px">1</asp:textbox>
						<asp:requiredfieldvalidator id="rfvVerticalCarouselNumberOfImages" runat="server" controltovalidate="tbVerticalCarouselNumberOfImages" display="Dynamic" errormessage="This field is required." resourcekey="rfvVerticalCarouselNumberOfImages.ErrorMessage"
							validationgroup="vgVerticalCarouselSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVerticalCarouselNumberOfImages" runat="server" controltovalidate="tbVerticalCarouselNumberOfImages" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVerticalCarouselNumberOfImages.ErrorMessage"
							type="Integer" validationgroup="vgVerticalCarouselSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselScrollingDirection" runat="server" HelpText="Scrolling direction:" Text="Scrolling direction:" HelpKey="lblVerticalCarouselScrollingDirection.HelpText" ResourceKey="lblVerticalCarouselScrollingDirection" />
					</td>
					<td class="style35" colspan="2">
						<asp:dropdownlist id="ddlVerticalCarouselScrollingDirection" runat="server">
							<asp:listitem resourcekey="liUp" value="up">Up</asp:listitem>
							<asp:listitem resourcekey="liDown" value="down">Down</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblVerticalCarouselRandomizeMedia" runat="server" HelpKey="lblImageCarouselRandomizeMedia.HelpText" HelpText="Randomize media positions at every page load:" ResourceKey="lblImageCarouselRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbVerticalCarouselRandomizeMedia" runat="server" resourcekey="cbImageCarouselShowPagingResource1" autopostback="True" oncheckedchanged="cbVerticalCarouselRandomizeMedia_CheckedChanged" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label9" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlVerticalCarouselMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblVerticalCarouselMediasortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:label id="lblVerticaCarouselVPTitle" runat="server" text="Video player in lightbox settings:" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselSelectVideoPlayer" runat="server" HelpText="Select video player:" Text="Select video player:" HelpKey="SelectVideoPlayer.HelpText" ResourceKey="SelectVideoPlayer.Text" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlVerticalCarouselVPSelection" runat="server" resourcekey="ddlTGVPSelectThemeResource1" autopostback="True" onselectedindexchanged="ddlVerticalCarouselVPSelection_SelectedIndexChanged">
							<asp:listitem selected="True" value="False">Standard 
							player</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselVideoPlayer" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" Text="Select video player skin:" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlVerticalCarouselVPTheme" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselVPPlayOnLoad" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" runat="server" HelpText="Start to play video on page load:" Text="Play on load:" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbVeticalCarouselVPPlayOnload" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselVPShowDescription" ResourceKey="lblLightBoxGalleryViseoPlayerPlayOnLoad" runat="server" HelpText="Show description inside video player:" Text="Show description:" HelpKey="lblLightBoxGalleryViseoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbVeticalCarouselVPShowDescription" runat="server" resourcekey="cbTGVPShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselVPAllowFullscreen" ResourceKey="lblTGVPAllowFullscreen" runat="server" HelpText="Allow video to be played in fullscreen:" Text="Allow fullscreen:" HelpKey="lblTGVPAllowFullscreen.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbVeticalCarouselVPAllowFullscreen" runat="server" resourcekey="cbTGVPAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticaCarouselVPPlayQtInFlash" ResourceKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash" runat="server" HelpText="Play QuickTime videos in flash player:" Text="Play QuickTime videos in flash player:" HelpKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbVeticalCarouselVPPlayQtInFlash" runat="server" resourcekey="cbTGVPPlayQTinFlashResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						<asp:label id="lblVerticalCarouselAPLightTitle" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVerticalCarouselAPPlayOnLoad" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" runat="server" HelpText="Start to play audio on page load:" Text="Play on load:" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbVerticalCarouselAPPlayONLoad" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="2">
						<asp:button id="btnVerticalCarouselSaveSettings" runat="server" onclick="btnVerticalCarouselSaveSettings_Click" resourcekey="btnVerticalCarouselSaveSettings" style="height: 26px" text="Save settings" validationgroup="vgVerticalCarouselSettings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnVerticalCaouselSaveClose" runat="server" onclick="btnVerticalCaouselSaveClose_Click" oncommand="btnVerticalCaouselSaveClose_Command" resourcekey="btnVerticalCaouselSaveClose" text="Save &amp; Close" validationgroup="vgVerticalCarouselSettings"
							width="140px" />
						&nbsp;&nbsp;
						<asp:label id="lblVerticalCarouselSstatus" runat="server" resourcekey="lblImageCarouselSstatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style72" colspan="3">
						&nbsp; &nbsp; &nbsp; &nbsp;
						<asp:panel id="pnlVerticalCarouselHidden" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td>
										<dnn:Label ID="lblVerticalCarouselShowTitle" runat="server" HelpKey="lblVerticalCarouselShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblVerticalCarouselShowTitle" Text="Show gallery title:" Visible="False" />
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselShowTitle0" runat="server" resourcekey="cbImageCarouselShowTitleResource1" visible="False" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblVerticalCarouselShowDescription" runat="server" HelpKey="lblVerticalCarouselShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblVerticalCarouselShowDescription" Text="Show gallery description:" Visible="False" />
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselShowDescription" runat="server" resourcekey="cbImageCarouselShowDescriptionResource1" visible="False" />
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblVerticalCarouselShowNavigation" runat="server" HelpKey="lblImageCarouselShowNavigation.HelpText" HelpText="Show navigation:" ResourceKey="lblImageCarouselShowNavigation" Text="Show navigation:" />
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselShowNavigation" runat="server" resourcekey="cbImageCarouselShowNavigationResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblVerticalCarouselShowPaging" runat="server" HelpKey="lblImageCarouselShowPaging.HelpText" HelpText="Show paging:" ResourceKey="lblImageCarouselShowPaging" Text="Show paging:" />
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselShowPaging" runat="server" resourcekey="cbImageCarouselShowPagingResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblVerticalCarouselAutoSlideImages" runat="server" HelpKey="lblImageCarouselAutoSlideImages.HelpText" HelpText="Auto slide images:" ResourceKey="lblImageCarouselAutoSlideImages" Text="Auto slide images:" />
									</td>
									<td>
										<asp:checkbox id="cbVerticalCarouselAuoSlideImages" runat="server" checked="True" resourcekey="cbImageCarouselAuoSlideImagesResource1" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlImageSlider" runat="server" backcolor="#EFEFEF" visible="False" resourcekey="pnlImageSliderResource1">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblImageSliderDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Image slider display settings" resourcekey="lblImageSliderDisplaySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table align="center" cellpadding="2" cellspacing="2" width="80%">
				<tr>
					<td colspan="3">
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderTemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblImageSliderTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblImageSliderTemplateSelect" Text="Select template:" />
					</td>
					<td class="style35" colspan="2">
						<asp:dropdownlist id="ddlImageSliderTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlImageSliderTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						<asp:label id="lblImageSliderTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderShowMeidaTitle" ResourceKey="lblImageSliderShowMeidaTitle" runat="server" HelpText="Show image title:" Text="Show image title:" HelpKey="lblImageSliderShowMeidaTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderShowMediaTitle" runat="server" resourcekey="cbImageSliderShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderShowMediaDescription" ResourceKey="lblImageSliderShowMediaDescription" runat="server" HelpText="Show image description:" Text="Show image description:" HelpKey="lblImageSliderShowMediaDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderShowMediaDescription" runat="server" resourcekey="cbImageSliderShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderShowLightboxTitle" ResourceKey="lblImageSliderShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblImageSliderShowLightboxTitle.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderShowLightboxTitle" runat="server" resourcekey="cbImageSliderShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72" valign="top">
						<dnn:Label ID="lblImageSliderShowLightboxDescription" ResourceKey="lblImageSliderShowLightboxDescription" runat="server" HelpText="Show image description in lightbox:" Text="Show image description in lightbox:" HelpKey="lblImageSliderShowLightboxDescription.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderShowLightboxDescription" runat="server" resourcekey="cbImageSliderShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbImageSliderShowLightboxDescription_CheckedChanged" />
						<asp:panel id="pnlImageSliderTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblImageSliderToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderLightboxShowTooltips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbImageSliderShowToolTips" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageSliderTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageSliderTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageSliderShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageSliderTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth8" runat="server" controltovalidate="tbImageSliderTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth8" runat="server" controltovalidate="tbImageSliderTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageSliderHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageSliderTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth9" runat="server" controltovalidate="tbImageSliderTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth9" runat="server" controltovalidate="tbImageSliderTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageSliderTooltipBorder" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth10" runat="server" controltovalidate="tbImageSliderTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage" setfocusonerror="True"
											validationgroup="vgVerticalCarouselSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth10" runat="server" controltovalidate="tbImageSliderTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbImageSliderTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth11" runat="server" controltovalidate="tbImageSliderTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgVerticalCarouselSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth11" runat="server" controltovalidate="tbImageSliderTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgVerticalCarouselSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblImageSliderTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlImageSliderTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderOpenMediaUrl" ResourceKey="lblImageSliderOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblImageSliderOpenMediaUrl.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbImageSliderOpenMediaUrl_CheckedChanged" resourcekey="cbImageSliderOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderOpenMediaUrlNewWindow" ResourceKey="lblImageSliderOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblImageSliderOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:checkbox id="cbImageSliderOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbImageSliderOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderMaxImageWidth" ResourceKey="lblImageSliderMaxImageWidth" runat="server" ControlName="tbMaxImageWidth" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image width:" HelpKey="lblImageSliderMaxImageWidth.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbImageSliderMaxImageWidth" runat="server" validationgroup="vgImageSliderSettings" width="45px" resourcekey="tbImageSliderMaxImageWidthResource1">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvImageSliderImageWidth" runat="server" controltovalidate="tbImageSliderMaxImageWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgImageSliderSettings" resourcekey="rfvImageSliderImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageSliderImageWidth" runat="server" controltovalidate="tbImageSliderMaxImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageSliderSettings"
							resourcekey="cvImageSliderImageWidthResource1">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderMaxImageHeight" ResourceKey="lblImageSliderMaxImageHeight" runat="server" ControlName="tbMaxImageHeight" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image height:" HelpKey="lblImageSliderMaxImageHeight.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:textbox id="tbImageSliderMaxImageHeight" runat="server" validationgroup="vgImageSliderSettings" width="45px" resourcekey="tbImageSliderMaxImageHeightResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvImageSliderImageHeight" runat="server" controltovalidate="tbImageSliderMaxImageHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgImageSliderSettings" resourcekey="rfvImageSliderImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageSliderImageHeight" runat="server" controltovalidate="tbImageSliderMaxImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgImageSliderSettings"
							resourcekey="cvImageSliderImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderTransitionEffect" ResourceKey="lblImageSliderTransitionEffect" runat="server" ControlName="tbMaxImageHeight" HelpText="Select transition effect:" Text="Select transition effect:" HelpKey="lblImageSliderTransitionEffect.HelpText" />
					</td>
					<td class="style33" colspan="2">
						<asp:dropdownlist id="ddlImageSliderTransitionEffect" runat="server" resourcekey="ddlImageSliderTransitionEffectResource1">
							<asp:listitem value="random" resourcekey="ListItemResource16">Random</asp:listitem>
							<asp:listitem value="sliceDown" resourcekey="ListItemResource17">Slice down</asp:listitem>
							<asp:listitem value="sliceDownLeft" resourcekey="ListItemResource18">Slice down left</asp:listitem>
							<asp:listitem value="sliceUp" resourcekey="ListItemResource19">Slice up</asp:listitem>
							<asp:listitem value="sliceUpLeft" resourcekey="ListItemResource20">Slice up left</asp:listitem>
							<asp:listitem value="sliceUpDown" resourcekey="ListItemResource21">Slice up down</asp:listitem>
							<asp:listitem value="sliceUpDownLeft" resourcekey="ListItemResource22">Slice up down left</asp:listitem>
							<asp:listitem value="fold" resourcekey="ListItemResource23">Fold</asp:listitem>
							<asp:listitem value="fade" resourcekey="ListItemResource24">Fade</asp:listitem>
							<asp:listitem value="sliceDownRight" resourcekey="sliceDownRight">Slice down right</asp:listitem>
							<asp:listitem value="sliceUpRight" resourcekey="sliceUpRight">Slice up right</asp:listitem>
							<asp:listitem value="boxRandom" resourcekey="boxRandom">Random box</asp:listitem>
							<asp:listitem value="boxRain" resourcekey="boxRain">Rain box</asp:listitem>
							<asp:listitem value="boxRainReverse" resourcekey="boxRainReverse">Rain box reverse</asp:listitem>
							<asp:listitem value="boxRainGrow" resourcekey="boxRainGrow">Rain box grow</asp:listitem>
							<asp:listitem value="boxRainGrowReverse" resourcekey="boxRainGrowReverse">Rain box grow reverse</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderAutoSlidePause" ResourceKey="lblImageSliderAutoSlidePause" runat="server" HelpText="Set the pause between images when in auto slide mode:" Text="Auto slide pause between imags (ms): " HelpKey="lblImageSliderAutoSlidePause.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:panel id="pnlSlideOpt0" runat="server" resourcekey="pnlSlideOpt0Resource1">
							<asp:textbox id="tbImageSliderAutoSlidePause" runat="server" validationgroup="vgImageSliderSettings" width="51px" resourcekey="tbImageSliderAutoSlidePauseResource1">5000</asp:textbox>
							<asp:requiredfieldvalidator id="rfvSSWidth1" runat="server" controltovalidate="tbImageSliderAutoSlidePause" display="Dynamic" errormessage="This field is required." validationgroup="vgImageSliderSettings" resourcekey="rfvSSWidth1Resource1.ErrorMessage">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvImageSliderImageHeight0" runat="server" controltovalidate="tbImageSliderAutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageSliderImageHeightResource1.ErrorMessage"
								type="Integer" validationgroup="vgImageSliderSettings">
							</asp:comparevalidator>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderTransitionSpeed" ResourceKey="lblImageSliderTransitionSpeed" runat="server" HelpText="Slide transition speed (ms):" Text="Slide transition speed (ms):" HelpKey="lblImageSliderTransitionSpeed.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:textbox id="tbImageSliderAutoSlideTransition" runat="server" validationgroup="vgImageSliderSettings" width="51px" resourcekey="tbImageSliderAutoSlideTransitionResource1">500</asp:textbox>
						<asp:requiredfieldvalidator id="rfvImageSliderTransitionSpeed" runat="server" controltovalidate="tbImageSliderAutoSlideTransition" display="Dynamic" errormessage="This field is required." validationgroup="vgImageSliderSettings" resourcekey="rfvImageSliderTransitionSpeedResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvImageSliderImageHeight1" runat="server" controltovalidate="tbImageSliderAutoSlideTransition" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageSliderImageHeightResource1.ErrorMessage"
							type="Integer" validationgroup="vgImageSliderSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderStartRandom" ResourceKey="lblImageSliderStartRandom" runat="server" ControlName="cbSSStartRandom" HelpText="Set this if you want the auto slide mode to start with random image:" Text="Start slide show with random image:" HelpKey="lblImageSliderStartRandom.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageSliderStartRandom" runat="server" resourcekey="cbImageSliderStartRandomResource1" />
						&nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderShowPaging" ResourceKey="lblImageSliderShowPaging" runat="server" HelpText="Show paging:" Text="Show paging:" HelpKey="lblImageSliderShowPaging.HelpText" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageSliderShowPaging" runat="server" resourcekey="cbImageSliderShowPagingResource1" />
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderRandomizeMedia" runat="server" HelpText="Randomize media positions at every page load:" Text="Randomize media positions:" HelpKey="lblImageSliderRandomizeMedia.HelpText" ResourceKey="lblImageSliderRandomizeMedia" />
					</td>
					<td class="style35" colspan="2">
						<asp:checkbox id="cbImageSliderRandomizeMedia" runat="server" resourcekey="cbImageSliderShowPagingResource1" autopostback="True" oncheckedchanged="cbImageSliderRandomizeMedia_CheckedChanged" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label7" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlImageSliderMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblImageSliderMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						<dnn:Label ID="lblImageSliderSelectTheme" runat="server" HelpKey="lblImageSliderSelectTheme.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblImageSliderSelectTheme" Text="Select the CSS theme file:" Visible="False" />
					</td>
					<td class="style35" colspan="2">
						<asp:dropdownlist id="ddlImageSliderThemeSelect" runat="server" resourcekey="ddlImageSliderThemeSelectResource1" visible="False">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:button id="btnImageSliderSaveSettings" runat="server" onclick="btnImageSliderSaveSettings_Click" style="height: 26px" text="Save settings" validationgroup="vgImageSliderSettings" width="140px" resourcekey="btnImageSliderSaveSettingsResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnImageSliderSaveClose" runat="server" onclick="btnSSSave0_Click" text="Save &amp; Close" validationgroup="vgImageSliderSettings" width="140px" resourcekey="btnImageSliderSaveCloseResource1" />
						&nbsp;&nbsp;
						<asp:label id="lblImageSliderStatus" runat="server" width="120px" resourcekey="lblImageSliderStatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style72">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style72" colspan="3">
						&nbsp;<asp:panel id="pnlImageSliderHidden" runat="server" visible="False">
							<dnn:Label ID="lblImageSliderShowTitle0" runat="server" HelpKey="lblImageSliderShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblImageSliderShowTitle" Text="Show gallery title:" Visible="False" />
							<asp:checkbox id="cbImageSliderShowTitle" runat="server" resourcekey="cbImageSliderShowTitleResource1" visible="False" />
							<br />
							<dnn:Label ID="lblImageSliderShowDescription0" runat="server" HelpKey="lblImageSliderShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblImageSliderShowDescription" Text="Show gallery description:" Visible="False" />
							<asp:checkbox id="cbImageSliderShowDescription" runat="server" resourcekey="cbImageSliderShowDescriptionResource1" visible="False" />
							<br />
							<br />
						</asp:panel>
						&nbsp;&nbsp; &nbsp; &nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlSlideShowDisplay" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlSlideShowDisplayResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblSlideShowDisplaySettings" runat="server" text="Slide show display settings" cssclass="settingsdetailtitle" resourcekey="lblSlideShowDisplaySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td colspan="4">
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;<dnn:Label ID="lblSlideShowThemeSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblSlideShowThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblSlideShowThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style35">
						&nbsp;<asp:dropdownlist id="ddlSSThemeSelect" runat="server" resourcekey="ddlSSThemeSelectResource1">
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style30">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowShowTitle" ResourceKey="lblSlideShowShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblSlideShowShowTitle.HelpText" />
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowShowTitle" runat="server" resourcekey="cbSlideShowShowTitleResource1" />
					</td>
					<td class="style30">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowShowDescription" ResourceKey="lblSlideShowShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblSlideShowShowDescription.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowShowDescription" runat="server" resourcekey="cbSlideShowShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowMediaTitle" ResourceKey="lblSlideShowMediaTitle" runat="server" HelpText="Show image title:" Text="Show image title:" HelpKey="lblSlideShowMediaTitle.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowShowMediaTitle" runat="server" resourcekey="cbSlideShowShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowShowMediaDescription" ResourceKey="lblSlideShowShowMediaDescription" runat="server" HelpText="Show image description:" Text="Show image description:" HelpKey="lblSlideShowShowMediaDescription.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowShowMediaDescription" runat="server" resourcekey="cbSlideShowShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowShowLightboxTitle" ResourceKey="lblSlideShowShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblSlideShowShowLightboxTitle.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowShowLightboxTitle" runat="server" resourcekey="cbSlideShowShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblSlideShowShowLightboxDescription" ResourceKey="lblSlideShowShowLightboxDescription" runat="server" HelpText="Show image description in lightbox:" Text="Show image description in lightbox:" HelpKey="lblSlideShowShowLightboxDescription.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowShowLightboxDescription" runat="server" resourcekey="cbSlideShowShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbSlideShowShowLightboxDescription_CheckedChanged" />
						<asp:panel id="pnlSlideShowTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblSlideShowToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowLightboxShowTooltips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbSSSHowToolTips" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth12" runat="server" controltovalidate="tbSlideShowTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth12" runat="server" controltovalidate="tbSlideShowTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth13" runat="server" controltovalidate="tbSlideShowTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth13" runat="server" controltovalidate="tbSlideShowTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTooltipBorder" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth14" runat="server" controltovalidate="tbSlideShowTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage" setfocusonerror="True"
											validationgroup="vgSSSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth14" runat="server" controltovalidate="tbSlideShowTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth15" runat="server" controltovalidate="tbSlideShowTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth15" runat="server" controltovalidate="tbSlideShowTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowOpenMediaUrl" ResourceKey="lblSlideShowOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblSlideShowOpenMediaUrl.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbSSOpenMediaUrl_CheckedChanged" resourcekey="cbSlideShowOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowOpenMediaUrlNewWindow" ResourceKey="lblSlideShowOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblSlideShowOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideShowOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbSlideShowOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowMaxImageWidth" ResourceKey="lblSlideShowMaxImageWidth" runat="server" ControlName="tbMaxImageWidth" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image width:" HelpKey="lblSlideShowMaxImageWidth.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:textbox id="tbMaxImageWidth" runat="server" validationgroup="vgSSSettings" width="45px" resourcekey="tbMaxImageWidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowImageWidth" runat="server" controltovalidate="tbMaxImageWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgSSSettings" setfocusonerror="True" resourcekey="rfvSlideShowImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowImageWidth" runat="server" controltovalidate="tbMaxImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSSettings" setfocusonerror="True"
							resourcekey="cvSlideShowImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowMaxImageHeight" ResourceKey="lblSlideShowMaxImageHeight" runat="server" Text="Maximum image height:" HelpText="Maximum  image width for proportional resizing:" ControlName="tbMaxImageHeight" HelpKey="lblSlideShowMaxImageHeight.HelpText"></dnn:Label>
					</td>
					<td class="style33" colspan="3">
						<asp:textbox id="tbMaxImageHeight" runat="server" validationgroup="vgSSSettings" width="45px">300</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowImageHeight" runat="server" controltovalidate="tbMaxImageHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgSSSettings" setfocusonerror="True" resourcekey="rfvSlideShowImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowImageHeight" runat="server" controltovalidate="tbMaxImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSSettings" setfocusonerror="True"
							resourcekey="cvSlideShowImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowAutoSlide" ResourceKey="lblSlideShowAutoSlide" runat="server" Text="Enable auto slide: " HelpText="Enable auto slide of images." ControlName="cbAutoSlide" HelpKey="lblSlideShowAutoSlide.HelpText"></dnn:Label>
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowAutoSlide" runat="server" autopostback="True" oncheckedchanged="cbAutoSlide_CheckedChanged1" checked="True" resourcekey="cbSlideShowAutoSlideResource1" />
					</td>
					<td class="style34" id="Random">
						&nbsp;
					</td>
					<td id="Random">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowSlideRandom" ResourceKey="lblSlideShowSlideRandom" runat="server" ControlName="cbSlideRandom" HelpText="Auto slide random images." Text="Random:" HelpKey="lblSlideShowSlideRandom.HelpText" />
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowSlideRandom" runat="server" resourcekey="cbSlideShowSlideRandomResource1" />
					</td>
					<td id="Random" class="style34">
						&nbsp;
					</td>
					<td id="Random">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowAutoSlidePause" ResourceKey="lblSlideShowAutoSlidePause" runat="server" Text="Auto slide pause between imags (ms): " HelpText="Set the pause between images when in auto slide mode:" HelpKey="lblSlideShowAutoSlidePause.HelpText"></dnn:Label>
					</td>
					<td class="style35">
						<asp:panel id="pnlSlideOpt" runat="server" resourcekey="pnlSlideOptResource1">
							<asp:textbox id="tbAutoSlidePause" runat="server" width="51px" resourcekey="tbAutoSlidePauseResource1">5000</asp:textbox>
							&nbsp;
<asp:requiredfieldvalidator id="rfvSlideShowImageWidth0" runat="server" controltovalidate="tbAutoSlidePause" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowImageWidthResource1.ErrorMessage" setfocusonerror="True" validationgroup="vgSSSettings">
							</asp:requiredfieldvalidator>
							&nbsp;
<asp:comparevalidator id="cvSlideShowImageHeight0" runat="server" controltovalidate="tbAutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowImageHeightResource1.ErrorMessage" setfocusonerror="True" type="Integer"
								validationgroup="vgSSSettings">
							</asp:comparevalidator>
						</asp:panel>
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowStartRandom" ResourceKey="lblSlideShowStartRandom" runat="server" Text="Start slide show with random image:" ControlName="cbSSStartRandom" HelpText="Set this if you want the auto slide mode to start with random image:" HelpKey="lblSlideShowStartRandom.HelpText"></dnn:Label>
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowStartRandom" runat="server" resourcekey="cbSlideShowStartRandomResource1" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowSmartCrop" ResourceKey="lblSlideShowSmartCrop" runat="server" ControlName="cbSSSmartCrop" HelpText="Use this if you want all images to have same width and height. Otherwise images will be resized proportionaly." Text="Smart resize and crop images:"
							HelpKey="lblSlideShowSmartCrop.HelpText" />
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowSmartCrop" runat="server" resourcekey="cbSlideShowSmartCropResource1" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowPagingVisible" ResourceKey="lblSlideShowPagingVisible" runat="server" HelpText="Show paging:" Text="Show paging:" HelpKey="lblSlideShowPagingVisible.HelpText" />
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowShowPaging" runat="server" resourcekey="cbSlideShowShowPagingResource1" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowRandomizeMedia" runat="server" HelpKey="lblImageSliderRandomizeMedia.HelpText" HelpText="Randomize media positions at every page load:" ResourceKey="lblImageSliderRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td class="style35">
						<asp:checkbox id="cbSlideShowRandomizeMedia" runat="server" resourcekey="cbImageSliderShowPagingResource1" autopostback="True" oncheckedchanged="cbSlideShowRandomizeMedia_CheckedChanged" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label2" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlSlideShowMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblSlideShowMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style35">
						&nbsp;
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						<asp:button id="btnSlideShowSaveSettings" runat="server" onclick="btnSaveSettings_Click" text="Save settings" validationgroup="vgSSSettings" width="140px" resourcekey="btnSlideShowSaveSettingsResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnSlideShowSaveClose" runat="server" onclick="btnSSSave_Click" text="Save &amp; Close" width="140px" validationgroup="vgSSSettings" resourcekey="btnSlideShowSaveCloseResource1" />
					</td>
					<td>
						<asp:label id="lblSlideShowSstatus" runat="server" width="120px" resourcekey="lblSlideShowSstatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style35">
						&nbsp;
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlSlideShowThumbnails3" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlSlideShowDisplayResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblSlideshowWithThumbnails3" runat="server" text="Slideshow With Thumbnails 3 display settings" cssclass="settingsdetailtitle" resourcekey="lblSlideshowWithThumbnails3"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td colspan="4">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3TemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblSlideshowWithThumbnails3TemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblSlideshowWithThumbnails3TemplateSelect"
							Text="Select template:" />
					</td>
					<td class="style82" colspan="3">
						<asp:dropdownlist id="ddlSlideshowWithThumbnails3TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlImageSliderTemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
						&nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3ThemeSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblSlideshowWithThumbnails3ThemeSelect.HelpText" HelpText="Select theme:" ResourceKey="lblSlideshowWithThumbnails3ThemeSelect" Text="Select theme:" />
					</td>
					<td class="style82" colspan="3">
						<asp:dropdownlist id="ddlSlideshowWithThumbnails3ThemeSelect" runat="server" resourcekey="ddlSSThemeSelectResource1">
							<asp:listitem value="classic">Slideshow with thumbnails</asp:listitem>
							<asp:listitem value="dots">Slideshow without thumbnails</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3MediaTitle" runat="server" HelpText="Show image title:" Text="Show image title:" HelpKey="lblSlideshowWithThumbnails3MediaTitle.HelpText" ResourceKey="lblSlideshowWithThumbnails3MediaTitle" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideshowWithThumbnails3ShowMediaTitle" runat="server" resourcekey="cbSlideShowShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3ShowMediaDescription" ResourceKey="lblSlideshowWithThumbnails3ShowMediaDescription" runat="server" HelpText="Show image description:" Text="Show image description:" HelpKey="lblSlideshowWithThumbnails3ShowMediaDescription.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideshowWithThumbnails3ShowMediaDescription" runat="server" resourcekey="cbSlideShowShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3ShowFullscreen" ResourceKey="lblSlideshowWithThumbnails3ShowFullscreen" runat="server" HelpText="Enable fullscreen:" Text="Enable fullscreen:" HelpKey="lblSlideshowWithThumbnails3ShowFullscreen.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:checkbox id="cbSlideshowWithThumbnails3ShowFullscreenOption" runat="server" resourcekey="cbSlideShowShowLightboxDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3MaxImageWidth" runat="server" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image width:" HelpKey="lblSlideshowWithThumbnails3MaxImageWidth.HelpText" ResourceKey="lblSlideshowWithThumbnails3MaxImageWidth"
							ControlName="tbMaxImageWidth" />
					</td>
					<td class="style33" colspan="3">
						<asp:textbox id="tbSlideshowWithThumbnails3MaxImageWidth" runat="server" validationgroup="vgSSTN3Settings" width="45px">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideshowWithThumbnails3ImageWidth" runat="server" controltovalidate="tbSlideshowWithThumbnails3MaxImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowImageWidthResource1.ErrorMessage"
							setfocusonerror="True" validationgroup="vgSSTN3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideshowWithThumbnails3ImageWidth" runat="server" controltovalidate="tbSlideshowWithThumbnails3MaxImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowImageWidthResource1.ErrorMessage"
							setfocusonerror="True" type="Integer" validationgroup="vgSSTN3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3MaxImageHeight" ResourceKey="lblSlideshowWithThumbnails3MaxImageHeight" runat="server" ControlName="tbMaxImageHeight" HelpText="Maximum  image width for proportional resizing:" Text="Maximum image height:" HelpKey="lblSlideshowWithThumbnails3MaxImageHeight.HelpText" />
					</td>
					<td class="style33" colspan="3">
						<asp:textbox id="tbSlideshowWithThumbnails3MaxImageHeight" runat="server" validationgroup="vgSSTN3Settings" width="45px" resourcekey="tbMaxImageHeightResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideshowWithThumbnails3ImageHeight" runat="server" controltovalidate="tbSlideshowWithThumbnails3MaxImageHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTN3Settings" setfocusonerror="True"
							resourcekey="rfvSlideShowImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideshowWithThumbnails3ImageHeight" runat="server" controltovalidate="tbSlideshowWithThumbnails3MaxImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTN3Settings"
							setfocusonerror="True" resourcekey="cvSlideShowImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td>
						<dnn:Label ID="lblSlideshowWithThumbnails3AutoSlidePause" ResourceKey="lblSlideshowWithThumbnails3AutoSlidePause" runat="server" Text="Transition duration (ms): " HelpText="Transition duration in miliseconds: " ControlName="tbAutoSlidePause" HelpKey="lblSlideshowWithThumbnails3AutoSlidePause.HelpText"
							EnableViewState="True"></dnn:Label>
					</td>
					<td class="style82">
						<asp:panel id="pnlSlideOpt3" runat="server" resourcekey="pnlSlideOptResource1">
							<asp:textbox id="tbSlideshowWithThumbnails3AutoSlidePause" runat="server" resourcekey="tbAutoSlidePauseResource1" validationgroup="vgSSTN3Settings" width="51px">1500</asp:textbox>
							&nbsp;
<asp:requiredfieldvalidator id="rfvSlideshowWithThumbnails3Pause" runat="server" controltovalidate="tbSlideshowWithThumbnails3AutoSlidePause" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowImageWidthResource1.ErrorMessage" setfocusonerror="True"
								validationgroup="vgSSTN3Settings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvSlideshowWithThumbnails3Pause" runat="server" controltovalidate="tbSlideshowWithThumbnails3AutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowImageWidthResource1.ErrorMessage"
								setfocusonerror="True" type="Integer" validationgroup="vgSSTN3Settings">
							</asp:comparevalidator>
						</asp:panel>
					</td>
					<td class="style34" colspan="2">
						&nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<dnn:Label ID="lblSSlideshowWithThumbnails3AutoSlide" runat="server" Text="Enable auto slide: " ControlName="cbAutoSlide" HelpText="Enable auto slide of images." HelpKey="lblSSlideshowWithThumbnails3AutoSlide.HelpText" ResourceKey="lblSSlideshowWithThumbnails3AutoSlide"></dnn:Label>
					</td>
					<td class="style82">
						<asp:checkbox id="cbSlideshowWithThumbnails3AutoSlide" runat="server" autopostback="True" checked="True" oncheckedchanged="cbAutoSlide_CheckedChanged1" resourcekey="cbSlideShowAutoSlideResource1" />
					</td>
					<td class="style34" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<dnn:Label ID="lblSlideshowWithThumbnails3AutoSlideDelay" runat="server" ControlName="tbAutoSlidePause" HelpKey="lblSlideshowWithThumbnails3AutoSlideDelay.HelpText" HelpText="Delay between transitions in miliseconds: " ResourceKey="lblSlideshowWithThumbnails3AutoSlideDelay"
							Text="Delay between transitions (ms): " EnableViewState="True" />
					</td>
					<td class="style82">
						<asp:panel id="pnlSlideOpt4" runat="server" resourcekey="pnlSlideOptResource1">
							<asp:textbox id="tbSlideshowWithThumbnails3AutoSlideDelay" runat="server" resourcekey="tbAutoSlidePauseResource1" validationgroup="vgSSTN3Settings" width="51px">5000</asp:textbox>
							&nbsp;
<asp:requiredfieldvalidator id="rfvSlideshowWithThumbnails3Delay" runat="server" controltovalidate="tbSlideshowWithThumbnails3AutoSlideDelay" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowImageWidthResource1.ErrorMessage" setfocusonerror="True"
								validationgroup="vgSSTN3Settings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvSlideshowWithThumbnails3AutoSlideDelay" runat="server" controltovalidate="tbSlideshowWithThumbnails3AutoSlideDelay" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowImageWidthResource1.ErrorMessage"
								setfocusonerror="True" type="Integer" validationgroup="vgSSTN3Settings">
							</asp:comparevalidator>
						</asp:panel>
					</td>
					<td class="style34" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<dnn:Label ID="lblSlideshowWithThumbnails3TransitionEffect" runat="server" ControlName="tbAutoSlidePause" EnableViewState="True" HelpText="Transition effect: " Text="Transition effect: " HelpKey="lblSlideshowWithThumbnails3TransitionEffect.HelpText" ResourceKey="lblSlideshowWithThumbnails3TransitionEffect" />
					</td>
					<td class="style82">
						<asp:dropdownlist id="ddlSlideshowWithThumbnails3TransitionEffect" runat="server" resourcekey="ddlICThemeSelectResource1">
							<asp:listitem resourcekey="SST3Fade" value="fade">Fade</asp:listitem>
							<asp:listitem resourcekey="SST3Flash" value="flash">Flash</asp:listitem>
							<asp:listitem resourcekey="SST3Pulse" value="pulse">&gt;Pulse</asp:listitem>
							<asp:listitem resourcekey="SST3Slide" value="slide">Slide</asp:listitem>
							<asp:listitem resourcekey="SST3FadeSlide" value="fadeslide">Fade and slide</asp:listitem>
						</asp:dropdownlist>
					</td>
					<td class="style34" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3SmartCrop" runat="server" ControlName="cbSSSmartCrop" HelpText="Use this if you want all images to have same width and height. Otherwise images will be resized proportionaly." Text="Smart resize and crop images:"
							HelpKey="lblSlideshowWithThumbnails3SmartCrop.HelpText" ResourceKey="lblSlideshowWithThumbnails3SmartCrop" />
					</td>
					<td class="style82">
						<asp:checkbox id="cbSlideshowWithThumbnails3SmartCrop" runat="server" resourcekey="cbSlideShowSmartCropResource1" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3BackgroundColor" ResourceKey="lblSlideshowWithThumbnails3BackgroundColor" runat="server" HelpText="Background color:" Text="Background color:" HelpKey="lblSlideshowWithThumbnails3BackgroundColor.HelpText" />
					</td>
					<td class="style82">
						<asp:textbox id="tbSlideshowWithThumbnails3BackgroundColor" runat="server" maxlength="6" resourcekey="tbSSTBOverlayColorResource1" validationgroup="vgSSTN3Settings" width="50px">000000</asp:textbox>
						<asp:requiredfieldvalidator id="rfvSlideshowWithThumbnails3ThumbnailsOverlayColor" runat="server" controltovalidate="tbSlideshowWithThumbnails3BackgroundColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
							validationgroup="vgSSTN3Settings">
						</asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideshowWithThumbnails3ThumbnailsOverlayColor" runat="server" controltovalidate="tbSlideshowWithThumbnails3BackgroundColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
							validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTN3Settings">
						</asp:regularexpressionvalidator>
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideshowWithThumbnails3RandomizeMedia" runat="server" HelpText="Randomize media positions at every page load:" Text="Randomize media positions:" HelpKey="lblImageSliderRandomizeMedia.HelpText" ResourceKey="lblImageSliderRandomizeMedia" />
					</td>
					<td class="style82">
						<asp:checkbox id="cbSlideshowWithThumbnails3RandomizeMedia" runat="server" resourcekey="cbImageSliderShowPagingResource1" autopostback="True" oncheckedchanged="cbSlideshowWithThumbnails3RandomizeMedia_CheckedChanged" />
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label5" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlSSTN3MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblSSTN3MediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style82">
						&nbsp;
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style35" colspan="2">
						<asp:button id="btnSlideshowWithThumbnails3SaveSettings" runat="server" onclick="btnSlideshowWithThumbnails3SaveSettings_Click" resourcekey="btnSlideShowSaveSettingsResource1" style="height: 26px" text="Save settings" validationgroup="vgSSTN3Settings"
							width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnSlideshowWithThumbnails3SaveClose" runat="server" onclick="btnSlideshowWithThumbnails3SaveClose_Click" resourcekey="btnSlideShowSaveCloseResource1" text="Save &amp; Close" validationgroup="vgSSTN3Settings"
							width="140px" />
					</td>
					<td>
						<asp:label id="lblSlideshowWithThumbnails3Sstatus" runat="server" resourcekey="lblSlideShowSstatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style82">
						&nbsp;
					</td>
					<td class="style34">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" colspan="4">
						<asp:panel id="pnlSSthumbs3Hidden" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3PagingVisible" runat="server" HelpKey="lblSlideShowPagingVisible.HelpText" HelpText="Show paging:" ResourceKey="lblSlideShowPagingVisible" Text="Show paging:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3ShowPaging" runat="server" resourcekey="cbSlideShowShowPagingResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3StartRandom" runat="server" ControlName="cbSSStartRandom" HelpKey="lblSlideShowStartRandom.HelpText" HelpText="Set this if you want the auto slide mode to start with random image:" ResourceKey="lblSlideShowStartRandom"
											Text="Start slide show with random image:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3StartRandom" runat="server" resourcekey="cbSlideShowStartRandomResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3SlideRandom" runat="server" ControlName="cbSlideRandom" HelpKey="lblSlideShowSlideRandom.HelpText" HelpText="Auto slide random images." ResourceKey="lblSlideShowSlideRandom" Text="Random:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3SlideRandom" runat="server" oncheckedchanged="cbSlideshowWithThumbnails3SlideRandom_CheckedChanged" resourcekey="cbSlideShowSlideRandomResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3ShowLightboxTitle" runat="server" HelpKey="lblSlideshowWithThumbnails3ShowLightboxTitle.HelpText" HelpText="Show image title in lightbox:" ResourceKey="lblSlideshowWithThumbnails3ShowLightboxTitle" Text="Show image title in lightbox:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3ShowLightboxTitle" runat="server" resourcekey="cbSlideShowShowLightboxTitleResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3ShowLightboxDescription" runat="server" HelpKey="lblSlideshowWithThumbnails3ShowLightboxDescription.HelpText" HelpText="Show image description in lightbox:" ResourceKey="lblSlideshowWithThumbnails3ShowLightboxDescription"
											Text="Show image description in lightbox:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3ShowLightboxDescription" runat="server" resourcekey="cbSlideShowShowLightboxDescriptionResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3ShowTitle" runat="server" HelpKey="lblSlideShowShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblSlideShowShowTitle" Text="Show gallery title:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3ShowTitle" runat="server" resourcekey="cbSlideShowShowTitleResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3ShowDescription" runat="server" HelpKey="lblSlideShowShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblSlideShowShowDescription" Text="Show gallery description:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3ShowDescription" runat="server" resourcekey="cbSlideShowShowDescriptionResource1" visible="False" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3OpenMediaUrlNewWindow" runat="server" HelpKey="lblSlideShowOpenMediaUrlNewWindow.HelpText" HelpText="Open link in new window:" ResourceKey="lblSlideShowOpenMediaUrlNewWindow" Text="Open link in new window:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3OpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbSlideShowOpenMediaUrlNewWindowResource1" />
									</td>
								</tr>
								<tr>
									<td>
										<dnn:Label ID="lblSlideshowWithThumbnails3OpenMediaUrl" runat="server" HelpKey="lblSlideShowOpenMediaUrl.HelpText" HelpText="On image click dont open image in lightbox, but open Media Url link." ResourceKey="lblSlideShowOpenMediaUrl" Text="On click go to Media Url:" />
									</td>
									<td>
										<asp:checkbox id="cbSlideshowWithThumbnails3OpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbSSOpenMediaUrl_CheckedChanged" resourcekey="cbSlideShowOpenMediaUrlResource1" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlTableGallery" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlTableGalleryResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblLightboxGalleryDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Lightbox gallery display settings" resourcekey="lblLightboxGalleryDisplaySettingsResource1"></asp:label>
					<asp:label id="lblLightboxCaptionSliderSettings" runat="server" cssclass="settingsdetailtitle" resourcekey="lblLightboxCaptionSlider" text="Lightbox caption slider display settings" visible="False"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxTemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblLightboxTemplateSelect" Text="Select template:" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlLightboxTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlLightboxTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryThemeSelect" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblLightBoxGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblLightBoxGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlTGThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr runat="server" id="trLBResFixedSelect">
					<td class="style112">
						<dnn:Label ID="lblLightboxSelectLayoutType" runat="server" HelpKey="lblChameleonSelectLayoutType.HelpText" HelpText="Select the layout type:" ResourceKey="lblChameleonSelectLayoutType" Text="Select the layout type:" />
					</td>
					<td align="left" class="style38" colspan="2">
						<asp:radiobuttonlist id="rblLightBoxLayoutTypeSelect" runat="server" repeatdirection="Horizontal" autopostback="True" onselectedindexchanged="rblChameleonLayoutTypeSelect_SelectedIndexChanged">
							<asp:listitem resourcekey="liFixed" selected="True" value="fixed">Fixed Layout</asp:listitem>
							<asp:listitem resourcekey="liResponsive" value="responsive">Responsive Layout</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38" colspan="2">
						<asp:label id="lblLightboxTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style69" style="background-color: #ceeff8">
						<dnn:Label ID="lblLightboxGalleryDispplayNestedGalleries" runat="server" HelpKey="lblLightboxGalleryDispplayNestedGalleries.HelpText" HelpText="Display nested galleries:" ResourceKey="lblLightboxGalleryDispplayNestedGalleries" Text="Display nested galleries:" />
					</td>
					<td class="style38" colspan="2">
						<div style="background-color: #ceeff8; display: inline-block; padding: 7px;">
							<asp:checkbox id="cbLightboxGalleryDisplayNestedGalleries" runat="server" autopostback="True" oncheckedchanged="cbTGDisplayNestedGalleries_CheckedChanged" resourcekey="cbLightboxGalleryDisplayNestedGalleriesResource1" />
						</div>
					</td>
				</tr>
				<tr>
					<td class="style37" colspan="3">
						<asp:panel id="pnlNestedGalleriesOptions" runat="server" visible="False" resourcekey="pnlNestedGalleriesOptionsResource1">
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tblnestedgallery">
								<tr>
									<td>
										<asp:panel id="pnlTGNGGallerySettings" runat="server" backcolor="#C9DEAD" resourcekey="pnlTGNGGallerySettingsResource1">
											<table cellpadding="0" cellspacing="0" class="style66" style="border-top: 3px solid #91c848">
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" class="tbltitlenestedcategory">
															<tr>
																<td style="background-color: #91c848">
																	<asp:label id="lblLightboxGalleryNestedGallerySettings" runat="server" cssclass="settingsdetailtitle" text="Nested galleries settings" resourcekey="lblLightboxGalleryNestedGallerySettingsResource1"></asp:label>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" border="0" width="80%" align="center">
															<tr>
																<td align="left" colspan="4">
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td align="left" colspan="4">
																	<asp:label id="lblLightboxGalleryNestedGallerySelection" runat="server" font-bold="True" text="Gallery selection:" resourcekey="lblLightboxGalleryNestedGallerySelectionResource1"></asp:label>
																	<br />
																	<asp:checkboxlist id="cblLightboxGalleryNestedGallerySelection" runat="server" cellpadding="2" cellspacing="5" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" ondatabound="cblTGNGGallerySelection_DataBound" onselectedindexchanged="cblTGNGGallerySelection_SelectedIndexChanged"
																		repeatcolumns="2" resourcekey="cblLightboxGalleryNestedGallerySelectionResource1">
																	</asp:checkboxlist>
																	<asp:label id="lblLightboxGalleryNoNestedGalleryError" runat="server" forecolor="Red" text="Please add an select some galleries." visible="False" resourcekey="lblLightboxGalleryNoNestedGalleryErrorResource1"></asp:label>
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowAllGalleries" runat="server" autopostback="True" oncheckedchanged="cbTGNGShowAllGalleries_CheckedChanged" text="Show all galleries" resourcekey="cbLightboxGalleryNestedShowAllGalleriesResource1" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowGalleryName" runat="server" text="Show gallery name" resourcekey="cbLightboxGalleryNestedShowGalleryNameResource1" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowGalleryDescription" runat="server" text="Show gallery description" resourcekey="cbLightboxGalleryNestedShowGalleryDescriptionResource1" />
																</td>
															</tr>
															<tr id="trShowGalleryOwner" runat="server" visible="False">
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowGalleryOwner" runat="server" text="Show gallery owner" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:textbox id="tbTGNGImageWidth" runat="server" width="35px" resourcekey="tbTGNGImageWidthResource1">200</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryNestedImageWidth" runat="server" text="Nested gallery thumbnail width." resourcekey="lblLightboxGalleryNestedImageWidthResource1"></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageWidth" runat="server" controltovalidate="tbTGNGImageWidth" display="Dynamic" errormessage="This field is required." setfocusonerror="True" validationgroup="vgTGSettings" resourcekey="rfvLightboxGalleryNestedImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedImageWidth" runat="server" controltovalidate="tbTGNGImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" setfocusonerror="True" type="Integer" validationgroup="vgTGSettings"
																		resourcekey="cvLightboxGalleryNestedImageWidthResource1.ErrorMessage">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:textbox id="tbTGNGImageHeight" runat="server" width="35px" resourcekey="tbTGNGImageHeightResource1">200</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryImageHeight" runat="server" text="Nested gallery thumbnail height." resourcekey="lblLightboxGalleryImageHeightResource1"></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageHeight" runat="server" controltovalidate="tbTGNGImageHeight" display="Dynamic" errormessage="This field is required." setfocusonerror="True" validationgroup="vgTGSettings" resourcekey="rfvLightboxGalleryNestedImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedImageHeight" runat="server" controltovalidate="tbTGNGImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" setfocusonerror="True" type="Integer" validationgroup="vgTGSettings"
																		resourcekey="cvLightboxGalleryNestedImageHeightResource1.ErrorMessage">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:textbox id="tbTGNGColumns" runat="server" validationgroup="vgTGSettings" width="35px" resourcekey="tbTGNGColumnsResource1">2</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryNestedNumberOfColumns" runat="server" text="Number of columns." resourcekey="lblLightboxGalleryNestedNumberOfColumnsResource1"></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns" runat="server" controltovalidate="tbTGNGColumns" display="Dynamic" errormessage="This field is required." setfocusonerror="True" validationgroup="vgTGSettings" resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns" runat="server" controltovalidate="tbTGNGColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" setfocusonerror="True" type="Integer" validationgroup="vgTGSettings"
																		resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:textbox id="tbTGNGItems" runat="server" resourcekey="tbTGNGItemsTB" validationgroup="vgTGSettings" width="35px">4</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryNestedNumberOfItems" runat="server" resourcekey="lblLightboxGalleryNestedNumberOfItems" text="Number of items."></asp:label>
																	<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns0" runat="server" controltovalidate="tbTGNGItems" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" validationgroup="vgTGSettings">
																	</asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns0" runat="server" controltovalidate="tbTGNGItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedProportionalyResize" runat="server" autopostback="True" oncheckedchanged="cbTGNGGalResize_CheckedChanged" text="Proportionally resize gallery thumbnails" resourcekey="cbLightboxGalleryNestedProportionalyResizeResource1" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedResizeCrop" runat="server" text="Resize and crop gallery thumbnails" resourcekey="cbLightboxGalleryNestedResizeCropResource1" autopostback="True" checked="True" oncheckedchanged="cbTGNGGalResizeCrop_CheckedChanged" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowBreadcrumbs" runat="server" text="Show breadcrumbs" resourcekey="cbLightboxGalleryNestedShowBreadcrumbsResource1" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedShowGalleryInfo" runat="server" resourcekey="cbLightboxGalleryNestedShowGalleryInfoResource1" text="Show gallery info" />
																</td>
															</tr>
															<tr>
																<td class="style97">
																	<dnn:Label ID="lblLightboxNestGalleryButtonPos" runat="server" HelpText="Back button position:" Text="Back button position:" HelpKey="lblLightboxNestGalleryButtonPos.HelpText" ResourceKey="lblLightboxNestGalleryButtonPos" />
																</td>
																<td class="style96" colspan="2">
																	<asp:radiobuttonlist id="rblLBNestedButtonPos" runat="server" repeatdirection="Horizontal">
																		<asp:listitem resourcekey="liTop">Top</asp:listitem>
																		<asp:listitem resourcekey="liBottom" selected="True">Bottom</asp:listitem>
																		<asp:listitem resourcekey="liTopBottom" value="Topandbottom">Top and bottom</asp:listitem>
																	</asp:radiobuttonlist>
																</td>
																<td>
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td class="style97">
																	<dnn:Label ID="lblLightboxNestGallerySorting" runat="server" HelpText="Nested galleries sorting:" Text="Nested galleries sorting:" HelpKey="lblChameleonGalleryNGSorting.HelpText" ResourceKey="lblChameleonGalleryNGSorting" />
																</td>
																<td class="style106">
																	<asp:dropdownlist id="ddlLBNestedSorting" runat="server">
																		<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
																		<asp:listitem resourcekey="liTitle" value="GalleryName">Title</asp:listitem>
																		<asp:listitem resourcekey="liDateCreated" value="DateCreated">Date created</asp:listitem>
																		<asp:listitem resourcekey="liLAstModified" value="DateLastModified">Date last modified</asp:listitem>
																	</asp:dropdownlist>
																</td>
																<td class="style96">
																	<asp:radiobuttonlist id="rblLightboxNestedSortingAscDesc" runat="server" repeatdirection="Horizontal">
																		<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
																		<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
																	</asp:radiobuttonlist>
																</td>
																<td>
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	<asp:checkbox id="cbLightboxGalleryNestedRegenerateThumbnails" runat="server" resourcekey="cbLightboxGalleryNestedRegeterateThumbnails" text="Regenerate thumbnails" font-bold="True" />
																</td>
															</tr>
															<tr>
																<td colspan="4">
																	&nbsp;
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowTitle" runat="server" HelpKey="lblLightboxGalleryShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblLightboxGalleryShowTitle" Text="Show gallery title:" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbTGShowTitle" runat="server" resourcekey="cbTGShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowDescription" ResourceKey="lblLightboxGalleryShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblLightboxGalleryShowDescription.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbTGShowDescription" runat="server" resourcekey="cbTGShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowMediaTitle" ResourceKey="lblLightboxGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblLightboxGalleryShowMediaTitle.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightboxGalleryShowMediaTitle" runat="server" resourcekey="cbLightboxGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowMediaDescription" ResourceKey="lblLightboxGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblLightboxGalleryShowMediaDescription.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightboxGalleryShowMediaDescription" runat="server" resourcekey="cbLightboxGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryShowLightboxTitle" ResourceKey="lblLightboxGalleryShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblLightboxGalleryShowLightboxTitle.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightboxGalleryShowLightboxTitle" runat="server" resourcekey="cbLightboxGalleryShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69" valign="top">
						<dnn:Label ID="lblLightboxGalleryLightboxDescription" ResourceKey="lblLightboxGalleryLightboxDescription" runat="server" HelpText="Show media description in lightbox:" Text="Show media description in lightbox:" HelpKey="lblLightboxGalleryLightboxDescription.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbTGShowLightboxDescription" runat="server" resourcekey="cbTGShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbTGShowLightboxDescription_CheckedChanged" />
						<br />
						<asp:panel id="pnlLightboxToolTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblLightBoxToolTipOptions" resourcekey="lblLightBoxToolTipOptions" runat="server" text="Tooltip options" font-bold="True"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxShowTooltips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbShowToolTips" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxTargetPosition" resourcekey="lblLightboxTargetPosition" runat="server" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxTooltipPosition" resourcekey="lblLightboxTooltipPosition" runat="server" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxShowEffect" resourcekey="lblLightboxShowEffect" runat="server" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxShowEffectDuration" resourcekey="lblLightboxShowEffectDuration" runat="server" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbLightboxTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns1" runat="server" controltovalidate="tbLightboxTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgTGSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns1" runat="server" controltovalidate="tbLightboxTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxShowHideEffect" resourcekey="lblLightboxShowHideEffect" runat="server" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxHideEffectDuration" resourcekey="lblLightboxHideEffectDuration" runat="server" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbLightboxTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns2" runat="server" controltovalidate="tbLightboxTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgTGSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns2" runat="server" controltovalidate="tbLightboxTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxTooltipBorder" resourcekey="lblLightboxTooltipBorder" runat="server" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbLightboxTooltipBorder" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns3" runat="server" controltovalidate="tbLightboxTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgTGSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns3" runat="server" controltovalidate="tbLightboxTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbLightboxTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns4" runat="server" controltovalidate="tbLightboxTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgTGSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns4" runat="server" controltovalidate="tbLightboxTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblLightboxTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryLightboxThumbnails" ResourceKey="lblLightboxGalleryLightboxThumbnails" runat="server" HelpText="Show thumbnails inside lightbox:" Text="Show thumbnails inside lightbox:" HelpKey="lblLightboxGalleryLightboxThumbnails.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightboxGalleryLightboxThumbnails" runat="server" resourcekey="cbLightboxGalleryLightboxThumbnailsResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxGalleryLightboxSlideShow" ResourceKey="lblLightboxGalleryLightboxSlideShow" runat="server" HelpText="Slide show inside lightbox:" Text="Slide show inside lightbox:" HelpKey="lblLightboxGalleryLightboxSlideShow.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightBoxSlideShow" runat="server" autopostback="True" oncheckedchanged="cbLightBoxSlideShow_CheckedChanged" resourcekey="cbLightBoxSlideShowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGallerySlideShowPause" ResourceKey="lblLightBoxGallerySlideShowPause" runat="server" HelpText="Slide show inside lightbox interval in miliseconds:" Text="Slide show inside lightbox (ms):" HelpKey="lblLightBoxGallerySlideShowPause.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:textbox id="tbLightboxSSDuration" runat="server" width="58px" enabled="False" resourcekey="tbLightboxSSDurationResource1">5000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns9" runat="server" controltovalidate="tbLightboxSSDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgTGSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns9" runat="server" controltovalidate="tbLightboxSSDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgTGSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGallerySlideShowAutoPlay" ResourceKey="lblLightBoxGallerySlideShowAutoPlay" runat="server" HelpText="Slide show inside lightbox autoplay:" Text="Slide show inside lightbox autoplay:" HelpKey="lblLightBoxGallerySlideShowAutoPlay.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbTBLightBoxSSAP" runat="server" enabled="False" resourcekey="cbTBLightBoxSSAPResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryAnimationSpeed" ResourceKey="lblLightBoxGalleryAnimationSpeed" runat="server" HelpText="Lightbox animation speed:" Text="Lightbox animation speed:" HelpKey="lblLightBoxGalleryAnimationSpeed.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:dropdownlist id="ddlTGLightboxAnimationSpeed" runat="server" resourcekey="ddlTGLightboxAnimationSpeedResource1">
							<asp:listitem value="fast" resourcekey="ListItemResource25">Fast</asp:listitem>
							<asp:listitem value="normal" resourcekey="ListItemResource26">Normal</asp:listitem>
							<asp:listitem value="slow" resourcekey="ListItemResource27">Slow</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryOpenMediaUrl" ResourceKey="lblLightBoxGalleryOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblLightBoxGalleryOpenMediaUrl.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightBoxGalleryOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbTGOpenMediaUrl_CheckedChanged" resourcekey="cbLightBoxGalleryOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryOpenMediaUrlNewWindow" ResourceKey="lblLightBoxGalleryOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblLightBoxGalleryOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:checkbox id="cbLightBoxGalleryOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbLightBoxGalleryOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryNumberOfColumns" ResourceKey="lblLightBoxGalleryNumberOfColumns" runat="server" ControlName="tbTGNumberOfColumns" HelpText="Set the number of columns:" Text="Number of columns:" HelpKey="lblLightBoxGalleryNumberOfColumns.HelpText" />
					</td>
					<td class="style38" colspan="2">
						<asp:textbox id="tbTGNumberOfColumns" runat="server" validationgroup="vgTGSettings" width="50px" resourcekey="tbTGNumberOfColumnsResource1">4</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns" runat="server" controltovalidate="tbTGNumberOfColumns" display="Dynamic" errormessage="This field is required." validationgroup="vgTGSettings" resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns" runat="server" controltovalidate="tbTGNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgTGSettings" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryImageWidth" ResourceKey="lblLightBoxGalleryImageWidth" runat="server" Text="Maximum image width:" ControlName="tbTGImageWidth" HelpText="Set the maximum image width for resizing:" HelpKey="lblLightBoxGalleryImageWidth.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbTGImageWidth" runat="server" validationgroup="vgTGSettings" width="50px">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth" runat="server" controltovalidate="tbTGImageWidth" errormessage="This field is required." validationgroup="vgTGSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageWidth" runat="server" controltovalidate="tbTGImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgTGSettings" resourcekey="cvLightBoxGalleryImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGallerySetImageHeight" runat="server" Text="Maximum image height: " ControlName="tbTGImageHeight" HelpText="Set the maximum image height for resizing:" HelpKey="lblLightBoxGallerySetImageHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbTGImageHeight" runat="server" validationgroup="vgTGSettings" width="50px" resourcekey="tbTGImageHeightResource1">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageHeight" runat="server" controltovalidate="tbTGImageHeight" errormessage="This field is required." validationgroup="vgTGSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageHeight" runat="server" controltovalidate="tbTGImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgTGSettings" resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryNumberOfItems" ResourceKey="lblLightBoxGalleryNumberOfItems" runat="server" Text="Number of items per page:" ControlName="tbTGItems" HelpText="Set the maximum number of items on one page:" HelpKey="lblLightBoxGalleryNumberOfItems.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbTGItems" runat="server" validationgroup="vgTGSettings" width="50px" resourcekey="tbTGItemsResource1">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfItems" runat="server" controltovalidate="tbTGItems" errormessage="This field is required." validationgroup="vgTGSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryNumberOfItemsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfItems" runat="server" controltovalidate="tbTGItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgTGSettings" resourcekey="cvLightBoxGalleryNumberOfItemsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryCropImages" ResourceKey="lblLightBoxGalleryCropImages" runat="server" Text="Resize and crop vertical images:" ControlName="cbSmartCropVertical" HelpText="Set this to crop vertical images:" HelpKey="lblLightBoxGalleryCropImages.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightBoxGallerySmartCropVertical" runat="server" oncheckedchanged="cbSmartCropVertical_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryResizeCrop" ResourceKey="lblLightBoxGalleryResizeCrop" runat="server" Text="Resize and crop all images:" ControlName="cbTGSmartResizeAndCrop" HelpText="Set this this to resize all images to same width and height:" HelpKey="lblLightBoxGalleryResizeCrop.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightBoxGalleryResizeAndCrop" runat="server" oncheckedchanged="cbTGSmartResizeAndCrop_CheckedChanged" checked="True" resourcekey="cbLightBoxGalleryResizeAndCropResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxRandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightBoxRandomizeMedia" runat="server" oncheckedchanged="cbLightBoxRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxMediaSorting" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlLBMediaSorting" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblLightboxSortingAscending" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxAjaxPreloader" runat="server" HelpKey="lblLightBoxAjaxPreloader.HelpText" HelpText="Select Ajax preloader type:" ResourceKey="lblLightBoxAjaxPreloader" Text="Select Ajax preloader type:" />
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblLighboxPreloaderType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="LighboxPreloaderFullscreen" selected="True">Fullscreen</asp:listitem>
							<asp:listitem value="Belowimages" resourcekey="LighboxPreloaderBellowImages">Below images</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblLightBoxShowDownload" runat="server" HelpText="Show image download link:" Text="Show image download link:" HelpKey="lblLightBoxShowDownload.HelpText" ResourceKey="lblLightBoxShowDownload" />
						&nbsp;
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightBoxShowDownloadLink" runat="server" autopostback="True" oncheckedchanged="cbLightBoxShowDownloadLink_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
						&nbsp;<asp:panel id="pnlLightboxDownloadOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<asp:label id="lblLighboxSelectDownloadRoles" resourcekey="lblLighboxSelectDownloadRoles" runat="server" text="Select download roles:"></asp:label>
									</td>
									<td>
										<br />
										<asp:gridview id="gvLightboxDownloadRoles" runat="server" autogeneratecolumns="False" cellpadding="4" cssclass="intliststylebox" forecolor="#333333" gridlines="None" onrowdatabound="gvLightboxDownloadRoles_RowDataBound" bordercolor="#65CDEB" borderstyle="Solid"
											borderwidth="1px">
											<rowstyle backcolor="#F7F6F3" forecolor="#333333" />
											<columns>
												<asp:TemplateField HeaderText="Role">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Role") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:Label ID="lblRoleName0" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Enable download">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("EnableDownload") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:CheckBox ID="cbLBEnableDownload" runat="server" Checked='<%# Bind("EnableDownload") %>' />
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
											</columns>
											<footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
											<pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
											<selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
											<headerstyle backcolor="#0BA2CE" font-bold="True" forecolor="#FFFFFF" />
											<editrowstyle backcolor="#999999" />
											<alternatingrowstyle backcolor="White" forecolor="#284775" />
										</asp:gridview>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<asp:label id="lblUseViewVersionAsDownload" resourcekey="lblUseViewVersionAsDownload" runat="server" text="Use view version as download version if there is no download verison:" width="130px"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbLightboxUseViewAsDownload" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblLightBoxEnableFullscreen" runat="server" HelpText="Enable fullscreen:" Text="Enable fullscreen:" HelpKey="lblLightBoxEnableFullscreen.HelpText" ResourceKey="lblLightBoxEnableFullscreen" CssClass="styleBolded" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLightboxEnableFullscreen" runat="server" autopostback="True" oncheckedchanged="cbLightboxEnableFullscreen_CheckedChanged" />
						<asp:panel id="pnlLightboxFullscreenOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenThemeSelect" runat="server" HelpText="Select fullscreen theme:" Text="Select fullscreen theme:" HelpKey="lblLightboxFullscreenThemeSelect.HelpText" ResourceKey="lblLightboxFullscreenThemeSelect" />
									</td>
									<td>
										<asp:dropdownlist id="ddlTGFullscreenThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenNavbar" runat="server" HelpText="Show navigation:" Text="Show navigation:" HelpKey="lblLightboxFullscreenNavbar.HelpText" ResourceKey="lblLightboxFullscreenNavbar" />
									</td>
									<td>
										<asp:checkbox id="cbLightBoxShowNavigationBar" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenMenuType" runat="server" HelpText="Select navigation menu type:" Text="Navigation menu type:" HelpKey="lblLightboxFullscreenMenuType.HelpText" ResourceKey="lblLightboxFullscreenMenuType" />
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxFullscreenMenuStyle" runat="server" autopostback="True">
											<asp:listitem resourcekey="liNavBar" value="classic">Navigation bar</asp:listitem>
											<asp:listitem resourcekey="liDropDownList" value="dropdown">Dropdown list</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenDropDownImages" runat="server" HelpText="Dropdown menu style:" Text="Dropdown menu style:" HelpKey="lblLightboxFullscreenDropDownImages.HelpText" ResourceKey="lblLightboxFullscreenDropDownImages.Text" />
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxFullscreenDropDownStyle" runat="server">
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenShowArrows" runat="server" HelpText="Show navigation arrows:" Text="Show navigation arrows:" HelpKey="lblLightboxFullscreenShowArrows.HelpText" ResourceKey="lblLightboxFullscreenShowArrows" />
									</td>
									<td>
										<asp:checkbox id="cbLightboxFullscreenShowArrows" runat="server" autopostback="True" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenAutoHideNavigationArrows" runat="server" HelpText="Auto hide navigation arrows on mouse out:" Text="Auto hide navigation arrows:" HelpKey="lblLightboxFullscreenAutoHideNavigationArrows.HelpText" ResourceKey="lblLightboxFullscreenAutoHideNavigationArrows.Text" />
									</td>
									<td>
										<asp:checkbox id="cbLightboxFullscreenAutoHideArrows" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenArrows" runat="server" HelpText="Navigation arrows:" Text="Navigation arrows:" HelpKey="lblLightboxFullscreenArrows.HelpText" ResourceKey="lblLightboxFullscreenArrows.Text" />
									</td>
									<td>
										<asp:dropdownlist id="ddlLightboxFullscreenArrows" runat="server">
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxFullscreenGalleryTitle" runat="server" HelpText="Please enter title to display:" Text="Title to display:" HelpKey="lblLightboxFullscreenGalleryTitle.HelpText" ResourceKey="lblLightboxFullscreenGalleryTitle.Text" />
									</td>
									<td>
										<asp:textbox id="tbLightboxFullscreenTitle" runat="server" width="302px">
										</asp:textbox>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblLightBoxShowSocialSharingButtons" runat="server" CssClass="styleBolded" HelpText="Show social sharing buttons inside thumbnail:" Text="Show sharing buttons:" HelpKey="lblLightBoxShowSocialSharingButtons.HelpText" ResourceKey="lblLightBoxShowSocialSharingButtons" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbLighboxShowSharingButtons" runat="server" autopostback="True" oncheckedchanged="cbLighboxShowSharingButtons_CheckedChanged" />
						<asp:panel id="pnlLightboxSharingButtonsOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonFacebook" runat="server" HelpText="Show Facebook button:" Text="Show Facebook button:" HelpKey="lblLightboxSharingButtonFacebook.HelpText" ResourceKey="lblLightboxSharingButtonFacebook" />
									</td>
									<td>
										<asp:checkbox id="cbLightboxSharingButtonFacebook" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonGooglePlus" runat="server" HelpText="Show Googple Plus button:" Text="Show Googple Plus button:" HelpKey="lblLightboxSharingButtonGooglePlus.HelpText" ResourceKey="lblLightboxSharingButtonGooglePlus" />
									</td>
									<td>
										<asp:checkbox id="cbLightboxSharingButtonGooglePlus" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonTwitter" runat="server" HelpText="Show Twitter button:" Text="Show Twitter button:" HelpKey="lblLightboxSharingButtonTwitter.HelpText" ResourceKey="lblLightboxSharingButtonTwitter" />
									</td>
									<td>
										<asp:checkbox id="cbLightboxSharingButtonTwitter" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:label id="lblLightBoxGalleryViseoPlayerSettings" runat="server" text="Video player in lightbox settings:" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryVideoPlayerSelect" runat="server" HelpKey="SelectVideoPlayer.HelpText" Text="Select player:" HelpText="Select player:" ResourceKey="SelectVideoPlayer.Text" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlTGVPSelectPlayer" runat="server" autopostback="True" onselectedindexchanged="ddlTGVPSelectPlayer_SelectedIndexChanged" resourcekey="ddlTGVPSelectThemeResource1">
							<asp:listitem selected="True" value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryVideoPlayerSelectSkin" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" runat="server" HelpText="Select video player skin:" Text="Select video player skin:" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlTGVPSelectTheme" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayOnLoad" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" runat="server" HelpText="Start to play video on page load:" Text="Play on load:" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbTGVPPlayOnLoad" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryViseoPlayerPlayOnLoad" ResourceKey="lblLightBoxGalleryViseoPlayerPlayOnLoad" runat="server" HelpText="Show description inside video player:" Text="Show description:" HelpKey="lblLightBoxGalleryViseoPlayerPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbTGVPShowDescription" runat="server" resourcekey="cbTGVPShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblTGVPAllowFullscreen" ResourceKey="lblTGVPAllowFullscreen" runat="server" HelpText="Allow video to be played in fullscreen:" Text="Allow fullscreen:" HelpKey="lblTGVPAllowFullscreen.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbTGVPAllowFullscreen" runat="server" resourcekey="cbTGVPAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayQTInFlash" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash.HelpText" Text="Play QuickTime videos in flash player:" HelpText="Play QuickTime videos in flash player:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbTGVPPlayQTinFlash" runat="server" resourcekey="cbTGVPPlayQTinFlashResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:label id="lblLightBoxGalleryAudioPlayerSettings" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryAudioPlayerPlayOnLoad" runat="server" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" HelpText="Start to play audio on page load:" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" Text="Play on load:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbTGAPPlayOnLoad" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style91">
						<asp:button id="btnLightBoxGallerySave" runat="server" onclick="btnTableGallerySave_Click" resourcekey="btnLightBoxGallerySaveResource1" text="Save settings" validationgroup="vgTGSettings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnASSGallerySaveClose" runat="server" onclick="btnTGSaveClose_Click" resourcekey="btnLightBoxGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgTGSettings" width="140px" />
					</td>
					<td>
						<asp:label id="lblLightBoxGalleryStatus" runat="server" resourcekey="lblLightBoxGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlPortfolioGalery" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlTableGalleryResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblPortfolioGalleryDisplaySettings" resourcekey="lblPortfolioGalleryDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Lightbox portfolio gallery display settings"></asp:label>
					&nbsp;
				</td>
				<td>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightboxTemplateSelect0" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblLightboxTemplateSelect" Text="Select template:" />
					</td>
					<td class="style38">
						<asp:dropdownlist id="ddlPortfolioTemplateSelect" runat="server" resourcekey="ddlICThemeSelectResource1" autopostback="True" onselectedindexchanged="ddlPortfolioTemplateSelect_SelectedIndexChanged">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblLightBoxGalleryThemeSelect0" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblLightBoxGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblLightBoxGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style38">
						<asp:dropdownlist id="ddlPortThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						&nbsp;
					</td>
					<td class="style38">
						<asp:label id="lblPortfolioTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style69" style="background-color: #ceeff8">
						<dnn:Label ID="lblLightboxGalleryDispplayNestedGalleries0" runat="server" HelpKey="lblLightboxGalleryDispplayNestedGalleries.HelpText" HelpText="Display nested galleries:" ResourceKey="lblLightboxGalleryDispplayNestedGalleries" Text="Display nested galleries:" />
					</td>
					<td class="style38">
						<div style="background-color: #ceeff8; display: inline-block; padding: 7px;">
							<asp:checkbox id="cbPortfolioGalleryDisplayNestedGalleries" runat="server" autopostback="True" oncheckedchanged="cbPortfolioGalleryDisplayNestedGalleries_CheckedChanged" resourcekey="cbLightboxGalleryDisplayNestedGalleriesResource1" />
						</div>
					</td>
				</tr>
				<tr>
					<td class="style37" colspan="2">
						<asp:panel id="pnlPortfolioNestedGalleriesOptions" runat="server" visible="False" resourcekey="pnlNestedGalleriesOptionsResource1">
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tblnestedgallery">
								<tr>
									<td>
										<asp:panel id="pnlPortfolioGallerySettings" runat="server" backcolor="#C9DEAD" resourcekey="pnlTGNGGallerySettingsResource1">
											<table cellpadding="0" cellspacing="0" class="style66" style="border-top: 3px solid #91c848">
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" class="tbltitlenestedcategory">
															<tr>
																<td style="background-color: #91c848">
																	<asp:label id="lblLightboxGalleryNestedGallerySettings0" runat="server" cssclass="settingsdetailtitle" text="Nested galleries settings" resourcekey="lblLightboxGalleryNestedGallerySettingsResource1"></asp:label>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<table cellpadding="2" cellspacing="2" border="0" width="80%" align="center">
															<tr>
																<td align="left">
																	&nbsp;
																</td>
															</tr>
															<tr>
																<td align="left">
																	<asp:label id="lblPortfolioGalleryNestedGallerySelection" runat="server" font-bold="True" text="Gallery selection:" resourcekey="lblLightboxGalleryNestedGallerySelectionResource1"></asp:label>
																	<br />
																	<asp:checkboxlist id="cblPortfolioGalleryNestedGallerySelection" runat="server" cellpadding="2" cellspacing="5" datasourceid="odsGallery" datatextfield="GalleryName" datavaluefield="GalleryID" ondatabound="cblPortfolioGalleryNestedGallerySelection_DataBound"
																		onselectedindexchanged="cblPortfolioGalleryNestedGallerySelection_SelectedIndexChanged" repeatcolumns="2" resourcekey="cblLightboxGalleryNestedGallerySelectionResource1">
																	</asp:checkboxlist>
																	<asp:label id="lblPortfolioGalleryNoNestedGalleryError" runat="server" forecolor="Red" text="Please add an select some galleries." visible="False" resourcekey="lblLightboxGalleryNoNestedGalleryErrorResource1"></asp:label>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioShowAllButton" runat="server" text="Show all button" checked="True" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedShowAllGalleries" runat="server" autopostback="True" oncheckedchanged="cbPortfolioGalleryNestedShowAllGalleries_CheckedChanged" resourcekey="cbLightboxGalleryNestedShowAllGalleriesResource1" text="Show all galleries" />
																</td>
															</tr>
															<tr>
																<td>
																	&nbsp;
																</td>
															</tr>
														</table>
														<table align="center" border="0" cellpadding="2" cellspacing="2" width="80%">
															<tr>
																<td>
																	&nbsp;
																</td>
															</tr>
														</table>
														<p>
														</p>
														<table align="center" border="0" cellpadding="2" cellspacing="2" width="80%" style="display: none">
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedShowGalleryDescription" runat="server" resourcekey="cbLightboxGalleryNestedShowGalleryDescriptionResource1" text="Show gallery description" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:textbox id="tbPortfolioImageWidth" runat="server" resourcekey="tbTGNGImageWidthResource1" width="35px">200</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryNestedImageWidth0" runat="server" resourcekey="lblLightboxGalleryNestedImageWidthResource1" text="Nested gallery thumbnail width."></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageWidth0" runat="server" controltovalidate="tbPortfolioImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageWidthResource1.ErrorMessage"
																		setfocusonerror="True" validationgroup="vgTGSettings"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedImageWidth0" runat="server" controltovalidate="tbPortfolioImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageWidthResource1.ErrorMessage"
																		setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:textbox id="tbPortfolioImageHeight" runat="server" resourcekey="tbTGNGImageHeightResource1" width="35px">200</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryImageHeight0" runat="server" resourcekey="lblLightboxGalleryImageHeightResource1" text="Nested gallery thumbnail height."></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedImageHeight0" runat="server" controltovalidate="tbPortfolioImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
																		setfocusonerror="True" validationgroup="vgTGSettings"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedImageHeight0" runat="server" controltovalidate="tbPortfolioImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedImageHeightResource1.ErrorMessage"
																		setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:textbox id="tbPortfolioColumns" runat="server" resourcekey="tbTGNGColumnsResource1" validationgroup="vgTGSettings" width="35px">2</asp:textbox>
																	&nbsp;<asp:label id="lblLightboxGalleryNestedNumberOfColumns0" runat="server" resourcekey="lblLightboxGalleryNestedNumberOfColumnsResource1" text="Number of columns."></asp:label>
																	&nbsp;<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns1" runat="server" controltovalidate="tbPortfolioColumns" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" validationgroup="vgTGSettings"></asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns1" runat="server" controltovalidate="tbPortfolioColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:textbox id="tbPortfolioItems" runat="server" resourcekey="tbTGNGItemsTB" validationgroup="vgTGSettings" width="35px">4</asp:textbox>
																	<asp:label id="lblLightboxGalleryNestedNumberOfItems0" runat="server" resourcekey="lblLightboxGalleryNestedNumberOfItems" text="Number of items."></asp:label>
																	<asp:requiredfieldvalidator id="rfvLightboxGalleryNestedNumberOfColumns2" runat="server" controltovalidate="tbPortfolioItems" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" validationgroup="vgTGSettings">
																	</asp:requiredfieldvalidator>
																	<asp:comparevalidator id="cvLightboxGalleryNestedNumberOfColumns2" runat="server" controltovalidate="tbPortfolioItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightboxGalleryNestedNumberOfColumnsResource1.ErrorMessage"
																		setfocusonerror="True" type="Integer" validationgroup="vgTGSettings">
																	</asp:comparevalidator>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedProportionalyResize" runat="server" autopostback="True" oncheckedchanged="cbTGNGGalResize_CheckedChanged" resourcekey="cbLightboxGalleryNestedProportionalyResizeResource1" text="Proportionally resize gallery thumbnails" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedResizeCrop" runat="server" autopostback="True" checked="True" oncheckedchanged="cbTGNGGalResizeCrop_CheckedChanged" resourcekey="cbLightboxGalleryNestedResizeCropResource1" text="Resize and crop gallery thumbnails" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedShowBreadcrumbs" runat="server" resourcekey="cbLightboxGalleryNestedShowBreadcrumbsResource1" text="Show breadcrumbs" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:checkbox id="cbPortfolioGalleryNestedShowGalleryInfo" runat="server" resourcekey="cbLightboxGalleryNestedShowGalleryInfoResource1" text="Show gallery info" />
																</td>
															</tr>
															<tr>
																<td>
																	&nbsp;
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</asp:panel>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryShowMediaTitle" ResourceKey="lblLightboxGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblLightboxGalleryShowMediaTitle.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryShowMediaTitle" runat="server" resourcekey="cbLightboxGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryShowMediaDescription" ResourceKey="lblLightboxGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblLightboxGalleryShowMediaDescription.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryShowMediaDescription" runat="server" resourcekey="cbLightboxGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryShowLightboxTitle" ResourceKey="lblLightboxGalleryShowLightboxTitle" runat="server" HelpText="Show image title in lightbox:" Text="Show image title in lightbox:" HelpKey="lblLightboxGalleryShowLightboxTitle.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryShowLightboxTitle" runat="server" resourcekey="cbLightboxGalleryShowLightboxTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69" valign="top">
						<dnn:Label ID="lblPortfolioGalleryLightboxDescription" ResourceKey="lblLightboxGalleryLightboxDescription" runat="server" HelpText="Show media description in lightbox:" Text="Show media description in lightbox:" HelpKey="lblLightboxGalleryLightboxDescription.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioShowLightboxDescription" runat="server" resourcekey="cbTGShowLightboxDescriptionResource1" autopostback="True" oncheckedchanged="cbPortfolioShowLightboxDescription_CheckedChanged" />
						<asp:panel id="pnlPortfolioToolTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblPortfolioToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioShowTooltips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbPortfolioShowToolTips" runat="server" checked="True" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlPortfolioTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlPortfolioTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlPortfolioShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbPortfolioTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns5" runat="server" controltovalidate="tbPortfolioTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgPortfolioSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns5" runat="server" controltovalidate="tbPortfolioTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgPortfolioSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlPortfolioHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbPortfolioTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns6" runat="server" controltovalidate="tbPortfolioTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgPortfolioSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns6" runat="server" controltovalidate="tbLightboxTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgPortfolioSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbPortfolioTooltipBorder" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns7" runat="server" controltovalidate="tbPortfolioTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgPortfolioSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns7" runat="server" controltovalidate="tbPortfolioTooltipBorder" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgPortfolioSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbPortfolioTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns8" runat="server" controltovalidate="tbPortfolioTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgPortfolioSettings">
										</asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns8" runat="server" controltovalidate="tbPortfolioTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgPortfolioSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblPortfolioTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlPortfolioTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryLightboxThumbnails" ResourceKey="lblLightboxGalleryLightboxThumbnails" runat="server" HelpText="Show thumbnails inside lightbox:" Text="Show thumbnails inside lightbox:" HelpKey="lblLightboxGalleryLightboxThumbnails.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryLightboxThumbnails" runat="server" resourcekey="cbLightboxGalleryLightboxThumbnailsResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryLightboxSlideShow" ResourceKey="lblLightboxGalleryLightboxSlideShow" runat="server" HelpText="Slide show inside lightbox:" Text="Slide show inside lightbox:" HelpKey="lblLightboxGalleryLightboxSlideShow.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioSlideShow" runat="server" autopostback="True" oncheckedchanged="cbPortfolioSlideShow_CheckedChanged" resourcekey="cbLightBoxSlideShowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGallerySlideShowPause" ResourceKey="lblLightBoxGallerySlideShowPause" runat="server" HelpText="Slide show inside lightbox interval in miliseconds:" Text="Slide show inside lightbox (ms):" HelpKey="lblLightBoxGallerySlideShowPause.HelpText" />
					</td>
					<td class="style38">
						<asp:textbox id="tbPortfolioSSDuration" runat="server" width="58px" enabled="False" resourcekey="tbLightboxSSDurationResource1">5000</asp:textbox>
						<asp:requiredfieldvalidator id="rfvPortfolioGalleryWidth0" runat="server" controltovalidate="tbPortfolioSSDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" validationgroup="vgPortfolioSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvPortfolioGalleryWidth0" runat="server" controltovalidate="tbPortfolioSSDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgPortfolioSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioSlideShowAutoPlay" ResourceKey="lblLightBoxGallerySlideShowAutoPlay" runat="server" HelpText="Slide show inside lightbox autoplay:" Text="Slide show inside lightbox autoplay:" HelpKey="lblLightBoxGallerySlideShowAutoPlay.HelpText" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioLightBoxSSAP" runat="server" enabled="False" resourcekey="cbTBLightBoxSSAPResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryAnimationSpeed" ResourceKey="lblLightBoxGalleryAnimationSpeed" runat="server" HelpText="Lightbox animation speed:" Text="Lightbox animation speed:" HelpKey="lblLightBoxGalleryAnimationSpeed.HelpText" />
					</td>
					<td class="style38">
						<asp:dropdownlist id="ddlPortfolioLightboxAnimationSpeed" runat="server" resourcekey="ddlTGLightboxAnimationSpeedResource1">
							<asp:listitem value="fast" resourcekey="ListItemResource25">Fast</asp:listitem>
							<asp:listitem value="normal" resourcekey="ListItemResource26">Normal</asp:listitem>
							<asp:listitem value="slow" resourcekey="ListItemResource27">Slow</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryOpenMediaUrl" runat="server" HelpKey="lblLightBoxGalleryOpenMediaUrl.HelpText" HelpText="On image click dont open image in lightbox, but open Media Url link." ResourceKey="lblLightBoxGalleryOpenMediaUrl" Text="On click go to Media Url:" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbPortfolioGalleryOpenMediaUrl_CheckedChanged" resourcekey="cbLightBoxGalleryOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryOpenMediaUrlNewWindow" runat="server" HelpKey="lblLightBoxGalleryOpenMediaUrlNewWindow.HelpText" HelpText="Open link in new window:" ResourceKey="lblLightBoxGalleryOpenMediaUrlNewWindow" Text="Open link in new window:" />
					</td>
					<td class="style38">
						<asp:checkbox id="cbPortfolioGalleryOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbLightBoxGalleryOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryWidth" runat="server" HelpText="Set the maximum gallery width:" Text="Maximum gallery width:" HelpKey="lblPortfolioGalleryWidth.HelpText" ResourceKey="lblPortfolioGalleryWidth" />
					</td>
					<td class="style38">
						<asp:textbox id="tbPortfolioGalleryImageWidth" runat="server" validationgroup="vgPortfolioSettings" width="50px">740</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvPortfolioGalleryWidth" runat="server" controltovalidate="tbPortfolioGalleryImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgPortfolioSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvPortfolioGalleryWidth" runat="server" controltovalidate="tbPortfolioGalleryImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgPortfolioSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblPortfolioGalleryImageHeight" runat="server" HelpText="Set the maximum gallery height:" Text="Maximum gallery height:" HelpKey="lblPortfolioGalleryImageHeight.HelpText" ResourceKey="lblPortfolioGalleryImageHeight" Visible="True" />
					</td>
					<td class="style38">
						<asp:textbox id="tbPortfolioGalleryImageHeight" runat="server" validationgroup="vgPortfolioSettings" width="50px">550</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvPortfolioGalleryHeight" runat="server" controltovalidate="tbPortfolioGalleryImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgPortfolioSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvPortfolioGalleryHeight" runat="server" controltovalidate="tbPortfolioGalleryImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgPortfolioSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryImageWidth" ResourceKey="lblLightBoxGalleryImageWidth" runat="server" Text="Maximum image width:" ControlName="tbTGImageWidth" HelpText="Set the maximum image width for resizing:" HelpKey="lblLightBoxGalleryImageWidth.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbPortfolioThumbImageWidth" runat="server" validationgroup="vgPortfolioSettings" width="50px">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageWidth0" runat="server" controltovalidate="tbPortfolioThumbImageWidth" errormessage="This field is required." validationgroup="vgPortfolioSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageWidth0" runat="server" controltovalidate="tbPortfolioThumbImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgPortfolioSettings"
							resourcekey="cvLightBoxGalleryImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGallerySetImageHeight" runat="server" Text="Maximum image height: " ControlName="tbTGImageHeight" HelpText="Set the maximum image height for resizing:" HelpKey="lblLightBoxGallerySetImageHeight.HelpText" ResourceKey="lblLightBoxGallerySetImageHeight"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbPortfolioThumbImageHeight" runat="server" validationgroup="vgPortfolioSettings" width="50px" resourcekey="tbTGImageHeightResource1">150</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryImageHeight0" runat="server" controltovalidate="tbPortfolioThumbImageHeight" errormessage="This field is required." validationgroup="vgPortfolioSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryImageHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryImageHeight0" runat="server" controltovalidate="tbPortfolioThumbImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgPortfolioSettings"
							resourcekey="cvLightBoxGalleryImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPotfolioGalleryNumberOfItems" ResourceKey="lblLightBoxGalleryNumberOfItems" runat="server" Text="Number of items per page:" HelpText="Set the maximum number of items on one page:" HelpKey="lblPotfolioGalleryNumberOfItems.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbPortfolioNumOfItems" runat="server" validationgroup="vgPortfolioSettings" width="50px" resourcekey="tbTGItemsResource1">12</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfItems0" runat="server" controltovalidate="tbPortfolioNumOfItems" errormessage="This field is required." validationgroup="vgPortfolioSettings" display="Dynamic" resourcekey="rfvLightBoxGalleryNumberOfItemsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfItems0" runat="server" controltovalidate="tbPortfolioNumOfItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgPortfolioSettings"
							resourcekey="cvLightBoxGalleryNumberOfItemsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioSlideEasing" runat="server" HelpText="Slide animation effect:" Text="Slide animation effect:" HelpKey="lblPortfolioSlideEasing.HelpText" ResourceKey="lblPortfolioSlideEasing" />
					</td>
					<td>
						<asp:dropdownlist id="dllPortfoliosSlideEasing" runat="server">
							<asp:listitem>easeOutQuad</asp:listitem>
							<asp:listitem>easeInQuad</asp:listitem>
							<asp:listitem>easeInOutQuad</asp:listitem>
							<asp:listitem>easeInCubic</asp:listitem>
							<asp:listitem>easeOutCubic</asp:listitem>
							<asp:listitem>easeInOutCubic</asp:listitem>
							<asp:listitem>easeInQuart</asp:listitem>
							<asp:listitem>easeOutQuart</asp:listitem>
							<asp:listitem>easeInOutQuart</asp:listitem>
							<asp:listitem>easeInQuint</asp:listitem>
							<asp:listitem>easeOutQuint</asp:listitem>
							<asp:listitem>easeInOutQuint</asp:listitem>
							<asp:listitem>easeInSine</asp:listitem>
							<asp:listitem>easeOutSine</asp:listitem>
							<asp:listitem>easeInOutSine</asp:listitem>
							<asp:listitem>easeInExpo</asp:listitem>
							<asp:listitem>easeOutExpo</asp:listitem>
							<asp:listitem>easeInOutExpo</asp:listitem>
							<asp:listitem>easeInCirc</asp:listitem>
							<asp:listitem>easeOutCirc</asp:listitem>
							<asp:listitem>easeInOutCirc</asp:listitem>
							<asp:listitem>easeInElastic</asp:listitem>
							<asp:listitem>easeOutElastic</asp:listitem>
							<asp:listitem>easeInOutElastic</asp:listitem>
							<asp:listitem>easeInBack</asp:listitem>
							<asp:listitem>easeOutBack</asp:listitem>
							<asp:listitem>easeInOutBack</asp:listitem>
							<asp:listitem>easeInBounce</asp:listitem>
							<asp:listitem>easeOutBounce</asp:listitem>
							<asp:listitem>easeInOutBounce</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioSlideAnimationDuration" runat="server" HelpText="Slide animation duration in miliseconds:" Text="Slide animation effect (ms):" HelpKey="lblPortfolioSlideAnimationDuration.HelpText" ResourceKey="lblPortfolioSlideAnimationDuration" />
					</td>
					<td>
						<asp:textbox id="tbPortfolioSlideAimationDuration" runat="server" validationgroup="vgPortfolioSettings" width="50px">1500</asp:textbox>
						<asp:requiredfieldvalidator id="rfvPortfolioSLideAnimationDuration" runat="server" controltovalidate="tbPortfolioSlideAimationDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							validationgroup="vgPortfolioSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideAnimationDuration" runat="server" controltovalidate="tbPortfolioSlideAimationDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
							type="Integer" validationgroup="vgPortfolioSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryCropImages" ResourceKey="lblLightBoxGalleryCropImages" runat="server" Text="Resize and crop vertical images:" ControlName="cbSmartCropVertical" HelpText="Set this to crop vertical images:" HelpKey="lblLightBoxGalleryCropImages.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:checkbox id="cbPortfolioGallerySmartCropVertical" runat="server" oncheckedchanged="cbPortfolioGallerySmartCropVertical_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryResizeCrop" ResourceKey="lblLightBoxGalleryResizeCrop" runat="server" Text="Resize and crop all images:" ControlName="cbTGSmartResizeAndCrop" HelpText="Set this this to resize all images to same width and height:" HelpKey="lblLightBoxGalleryResizeCrop.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:checkbox id="cbPortfolioGalleryResizeAndCrop" runat="server" oncheckedchanged="cbPortfolioGalleryResizeAndCrop_CheckedChanged" checked="True" resourcekey="cbLightBoxGalleryResizeAndCropResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label1" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlPortfolioMediaSorting" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblPortfolioSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioGalleryTitle" runat="server" HelpKey="lblLightboxPortfolioGalleryTitle.HelpText" HelpText="Please enter title to display:" ResourceKey="lblLightboxPortfolioGalleryTitle" Text="Title to display:" />
					</td>
					<td class="style91">
						<asp:textbox id="tbLightboxPortoflioTitle" runat="server" width="302px">
						</asp:textbox>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style91">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioEnableFullscreen" runat="server" HelpKey="lblLightboxPortfolioEnableFullscreen.HelpText" HelpText="Enable fullscreen:" ResourceKey="lblLightboxPortfolioEnableFullscreen.Text" Text="Enable fullscreen:" Font-Bold="True"
							CssClass="styleBolded" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbPortfolioEnableFullscreen" runat="server" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioFullscreenTheme" runat="server" HelpKey="lblLightboxPortfolioFullscreenTheme.HelpText" HelpText="Select fullscreen theme:" ResourceKey="lblLightboxPortfolioFullscreenTheme.Text" Text="Select fullscreen theme:" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlPortfolioFullscreenThemeSelect" runat="server" resourcekey="ddlTGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblLightBoxShowDownload0" runat="server" HelpKey="lblLightBoxShowDownload.HelpText" HelpText="Show image download link:" ResourceKey="lblLightBoxShowDownload" Text="Show image download link:" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbPortfolioShowDownloadLink" runat="server" autopostback="True" oncheckedchanged="cbPortfolioShowDownloadLink_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" />
						<asp:panel id="pnlPortfolioDownloadOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<asp:label id="lblLighboxSelectDownloadRoles0" runat="server" resourcekey="lblLighboxSelectDownloadRoles" text="Select download roles:"></asp:label>
									</td>
									<td>
										<br />
										<asp:gridview id="gvPortfolioDownloadRoles" runat="server" autogeneratecolumns="False" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="1px" cellpadding="4" cssclass="intliststylebox" forecolor="#333333" gridlines="None" onrowdatabound="gvPortfolioDownloadRoles_RowDataBound">
											<rowstyle backcolor="#F7F6F3" forecolor="#333333" />
											<columns>
												<asp:TemplateField HeaderText="Role">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Role") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:Label ID="lblRoleName1" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Enable download">
													<EditItemTemplate>
														<asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("EnableDownload") %>'></asp:TextBox>
													</EditItemTemplate>
													<ItemTemplate>
														<asp:CheckBox ID="cbPortEnableDownload" runat="server" Checked='<%# Bind("EnableDownload") %>' />
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
											</columns>
											<footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
											<pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
											<selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
											<headerstyle backcolor="#0BA2CE" font-bold="True" forecolor="#FFFFFF" />
											<editrowstyle backcolor="#999999" />
											<alternatingrowstyle backcolor="White" forecolor="#284775" />
										</asp:gridview>
									</td>
								</tr>
								<tr>
									<td class="style92">
										<asp:label id="lblUseViewVersionAsDownload0" runat="server" resourcekey="lblUseViewVersionAsDownload" text="Use view version as download version if there is no download verison:" width="130px"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbPortfolioUseViewAsDownload" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblPortfolioShowSocialSharingButtons" runat="server" CssClass="styleBolded" HelpText="Show social sharing buttons inside thumbnail:" Text="Show sharing buttons:" HelpKey="lblLightBoxShowSocialSharingButtons.HelpText" ResourceKey="lblLightBoxShowSocialSharingButtons" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbPortfolioShowSharingButtons" runat="server" autopostback="True" oncheckedchanged="cbPortfolioShowSharingButtons_CheckedChanged" />
						<asp:panel id="pnlPortfolioSharingButtonsOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonFacebook0" runat="server" HelpText="Show Facebook button:" Text="Show Facebook button:" HelpKey="lblLightboxSharingButtonFacebook.HelpText" ResourceKey="lblLightboxSharingButtonFacebook" />
									</td>
									<td>
										<asp:checkbox id="cbPortfolioSharingButtonFacebook" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonGooglePlus0" runat="server" HelpText="Show Googple Plus button:" Text="Show Googple Plus button:" HelpKey="lblLightboxSharingButtonGooglePlus.HelpText" ResourceKey="lblLightboxSharingButtonGooglePlus" />
									</td>
									<td>
										<asp:checkbox id="cbPortfolioSharingButtonGooglePlus" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style92">
										<dnn:Label ID="lblLightboxSharingButtonTwitter0" runat="server" HelpText="Show Twitter button:" Text="Show Twitter button:" HelpKey="lblLightboxSharingButtonTwitter.HelpText" ResourceKey="lblLightboxSharingButtonTwitter" />
									</td>
									<td>
										<asp:checkbox id="cbPortfolioSharingButtonTwitter" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" colspan="2">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" colspan="2">
						<asp:label id="lblPortfolioNavigationSettings" runat="server" font-bold="True" resourcekey="lblPortfolioNavigationSettings" text="Navigation settings:"></asp:label>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblNavbarOptions" runat="server" HelpText="Show navigation:" Text="Show navigation:" HelpKey="lblNavbarOptions.HelpText" ResourceKey="lblNavbarOptions" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbPortfolioGalleryNestedShowNavigationBar" runat="server" autopostback="True" checked="True" oncheckedchanged="cbPortfolioGalleryNestedShowNavigationBar_CheckedChanged" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioMenuType" runat="server" HelpText="Select navigation menu type:" Text="Navigation menu type:" HelpKey="lblLightboxPortfolioMenuType.HelpText" ResourceKey="lblLightboxPortfolioMenuType" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlLightboxPortfolioMenuStyle" runat="server" autopostback="True" onselectedindexchanged="ddlLightboxPortfolioMenuStyle_SelectedIndexChanged">
							<asp:listitem resourcekey="liNavBar" value="classic">Navigation bar</asp:listitem>
							<asp:listitem resourcekey="liDropDownList" value="dropdown">Dropdown list</asp:listitem>
							<asp:listitem resourcekey="liLeftMenu" value="left">Left menu</asp:listitem>
							<asp:listitem resourcekey="liRightMenu" value="right">Right menu</asp:listitem>
						</asp:dropdownlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioMenuSlidableNames" runat="server" HelpText="Slidable titles:" Text="Slidable titles:" HelpKey="lblLightboxPortfolioMenuSlidableNames.HelpText" ResourceKey="lblLightboxPortfolioMenuSlidableNames" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbLightboxPortfolioSlidableTitles" runat="server" autopostback="True" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioMenuWidth" runat="server" HelpText="Menu width:" Text="Menu width:" HelpKey="lblLightboxPortfolioMenuWidth.HelpText" ResourceKey="lblLightboxPortfolioMenuWidth" />
					</td>
					<td class="style91">
						<asp:textbox id="tbPortfolioMenuWidth" runat="server" enabled="False" resourcekey="tbTGImageHeightResource1" validationgroup="vgPortfolioSettings" width="50px">200</asp:textbox>
						<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfItems3" runat="server" controltovalidate="tbPortfolioMenuWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfItemsResource1.ErrorMessage" validationgroup="vgPortfolioSettings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvLightBoxGalleryNumberOfItems3" runat="server" controltovalidate="tbPortfolioMenuWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfItemsResource1.ErrorMessage"
							type="Integer" validationgroup="vgPortfolioSettings">
						</asp:comparevalidator>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxShowNavigationArrows" runat="server" HelpText="Show navigation arrows:" Text="Show navigation arrows:" HelpKey="lblLightboxShowNavigationArrows.HelpText" ResourceKey="lblLightboxShowNavigationArrows" Visible="True" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbLightboxPortfolioShowArrows" runat="server" autopostback="True" oncheckedchanged="cbLightboxPortfolioShowArrows_CheckedChanged" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioAutoHideNavigationArrows" runat="server" HelpText="Auto hide navigation arrows on mouse out:" Text="Auto hide navigation arrows:" HelpKey="lblLightboxPortfolioAutoHideNavigationArrows.HelpText" ResourceKey="lblLightboxPortfolioAutoHideNavigationArrows" />
					</td>
					<td class="style91">
						<asp:checkbox id="cbLightboxPortfolioAutoHideArrows" runat="server" enabled="False" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioDropDownImages" runat="server" HelpText="Dropdown menu style:" Text="Dropdown menu style:" HelpKey="lblLightboxPortfolioDropDownImages.HelpText" ResourceKey="lblLightboxPortfolioDropDownImages" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlLightboxPortfolioDropDownStyle" runat="server" enabled="False">
						</asp:dropdownlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightboxPortfolioArrows" runat="server" HelpText="Navigation arrows:" Text="Navigation arrows:" HelpKey="lblLightboxPortfolioArrows.HelpText" ResourceKey="lblLightboxPortfolioArrows" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlLightboxPortfolioArrows" runat="server" enabled="False">
						</asp:dropdownlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<asp:label id="lblLightBoxGalleryViseoPlayerSettings0" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryViseoPlayerSettingsResource1" text="Video player in lightbox settings:"></asp:label>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioVPSelectPlayer" runat="server" HelpKey="SelectVideoPlayer.HelpText" HelpText="Select player:" ResourceKey="SelectVideoPlayer.Text" Text="Select player:" />
					</td>
					<td>
						<asp:dropdownlist id="ddlPortfolioVPSelectPlayer" runat="server" resourcekey="ddlTGVPSelectThemeResource1" autopostback="True" onselectedindexchanged="ddlPortfolioVPSelectPlayer_SelectedIndexChanged">
							<asp:listitem selected="False" value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryVideoPlayerSelectSkin0" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerSelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblLightBoxGalleryVideoPlayerSelectSkin" Text="Select video player skin:" />
					</td>
					<td>
						<asp:dropdownlist id="ddlPortfolioVPSelectTheme" runat="server" resourcekey="ddlTGVPSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource28" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource29" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryVideoPlayerPlayOnLoad0" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayOnLoad.HelpText" HelpText="Start to play video on page load:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayOnLoad" Text="Play on load:" />
					</td>
					<td>
						<asp:checkbox id="cbPortfolioVPPlayOnLoad" runat="server" resourcekey="cbTGVPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioGalleryViseoPlayerPlayOnLoad0" runat="server" HelpKey="lblLightBoxGalleryViseoPlayerPlayOnLoad.HelpText" HelpText="Show description inside video player:" ResourceKey="lblLightBoxGalleryViseoPlayerPlayOnLoad" Text="Show description:" />
					</td>
					<td>
						<asp:checkbox id="cbPortfolioVPShowDescription" runat="server" resourcekey="cbTGVPShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblPortfolioVPAllowFullscreen" runat="server" HelpKey="lblTGVPAllowFullscreen.HelpText" HelpText="Allow video to be played in fullscreen:" ResourceKey="lblTGVPAllowFullscreen" Text="Allow fullscreen:" />
					</td>
					<td>
						<asp:checkbox id="cbPortfolioVPAllowFullscreen" runat="server" resourcekey="cbTGVPAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<asp:label id="lblLightBoxGalleryAudioPlayerSettings0" runat="server" font-bold="True" resourcekey="lblLightBoxGalleryAudioPlayerSettingsResource1" text="Audio player in lightbox settings:"></asp:label>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblLightBoxGalleryAudioPlayerPlayOnLoad0" runat="server" HelpKey="lblLightBoxGalleryAudioPlayerPlayOnLoad.HelpText" HelpText="Start to play audio on page load:" ResourceKey="lblLightBoxGalleryAudioPlayerPlayOnLoad" Text="Play on load:" />
					</td>
					<td>
						<asp:checkbox id="cbPortfolioAPPlayOnLoad" runat="server" resourcekey="cbTGAPPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						<asp:label id="lblPortfolioGalleryStatus" runat="server" resourcekey="lblLightBoxGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
						<asp:button id="btnPortfolioGallerySaveSettings" runat="server" onclick="btnPortfolioGallerySaveSettings_Click" resourcekey="btnLightBoxGallerySaveResource1" style="height: 26px" text="Save settings" validationgroup="vgPortfolioSettings" width="140px" />
						&nbsp;<asp:button id="btnLightBoxGallerySaveClose0" runat="server" onclick="btnLightBoxGallerySaveClose0_Click" resourcekey="btnLightBoxGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgPortfolioSettings" width="140px" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<asp:panel id="pnlPortfolioHidden" runat="server" visible="False">
				<table align="center" cellpadding="2" cellspacing="2" width="80%">
					<tr>
						<td class="style70">
							<dnn:Label ID="lblLightboxPortfolioFullscreenCode" runat="server" HelpText="HTML code to enable fullscreen in other modules:" Text="Fullscreen code:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbLightboxPortfolioFullscreen" runat="server" height="70px" textmode="MultiLine" width="300px">
							</asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<asp:button id="btnPortfolioGenerateCode" runat="server" onclick="btnPortfolioGenerateCode_Click" text="Generate Code" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbPortfolioGeneratedCode" runat="server" textmode="MultiLine">
							</asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblPortfolioRandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" Visible="False" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbPortfolioRandomizeMedia" runat="server" oncheckedchanged="cbSmartCropVertical_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" visible="False" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblPortfolioGalleryShowTitle" runat="server" HelpKey="lblLightboxGalleryShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblLightboxGalleryShowTitle" Text="Show gallery title:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbPortfolioShowTitle" runat="server" resourcekey="cbTGShowTitleResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblPortfolioGalleryShowDescription" runat="server" HelpKey="lblLightboxGalleryShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblLightboxGalleryShowDescription" Text="Show gallery description:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbPortfolioShowDescription" runat="server" resourcekey="cbTGShowDescriptionResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblLightBoxGalleryNumberOfColumns0" runat="server" ControlName="tbTGNumberOfColumns" HelpKey="lblLightBoxGalleryNumberOfColumns.HelpText" HelpText="Set the number of columns:" ResourceKey="lblLightBoxGalleryNumberOfColumns" Text="Number of columns:" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbPortfolioNumberOfColumns" runat="server" resourcekey="tbTGNumberOfColumnsResource1" validationgroup="vgTGSettings" width="50px">4</asp:textbox>
							<asp:requiredfieldvalidator id="rfvLightBoxGalleryNumberOfColumns0" runat="server" controltovalidate="tbTGNumberOfColumns" display="Dynamic" errormessage="This field is required." resourcekey="rfvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage" validationgroup="vgTGSettings">
							</asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvLightBoxGalleryNumberOfColumns0" runat="server" controltovalidate="tbTGNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvLightBoxGalleryNumberOfColumnsResource1.ErrorMessage"
								type="Integer" validationgroup="vgTGSettings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblLightBoxGalleryVideoPlayerPlayQTInFlash0" runat="server" HelpKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash.HelpText" HelpText="Play QuickTime videos in flash player:" ResourceKey="lblLightBoxGalleryVideoPlayerPlayQTInFlash" Text="Play QuickTime videos in flash player:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbTGVPPlayQTinFlash0" runat="server" resourcekey="cbTGVPPlayQTinFlashResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
							<dnn:Label ID="lblLightBoxAjaxPreloader0" runat="server" HelpKey="lblLightBoxAjaxPreloader.HelpText" HelpText="Select Ajax preloader type:" ResourceKey="lblLightBoxAjaxPreloader" Text="Select Ajax preloader type:" />
						</td>
						<td colspan="2">
							&nbsp;
							<asp:radiobuttonlist id="rblPortfolioPreloaderType" runat="server" repeatdirection="Horizontal">
								<asp:listitem resourcekey="LighboxPreloaderFullscreen" selected="True">Fullscreen</asp:listitem>
								<asp:listitem resourcekey="LighboxPreloaderBellowImages" value="Belowimages">Below 
								images</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td class="style52">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
				</table>
			</asp:panel>
		</div>
	</asp:panel>
	<asp:panel id="pnlVideoGallerySettings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlVideoGallerySettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblVideoGalleryDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Video gallery display settings" resourcekey="lblVideoGalleryDisplaySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallerySelectCSS" runat="server" HelpText="Select the CSS theme file:" Text="SelectCSS:" HelpKey="lblVideoGallerySelectCSS.HelpText" ResourceKey="lblVideoGallerySelectCSS" ControlName="ddlVGSelectCSS" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVGSelectCSS" runat="server" resourcekey="ddlVGSelectCSSResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalelrySelectPLayer" runat="server" HelpKey="SelectVideoPlayer.HelpText" HelpText="Use flow player:" ResourceKey="SelectVideoPlayer.Text" Text="Use flow player:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlSelectVideoPlayer" runat="server" autopostback="True" onselectedindexchanged="ddlSelectVideoPlayer_SelectedIndexChanged">
							<asp:listitem value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
						<br />
						<asp:panel id="pnlFlowPlayerOptions" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style114">
										<asp:label id="lblFlowVideoScaling" resourcekey="lblFlowVideoScaling" runat="server" text="Video scaling:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlFlowPlayerScaling" runat="server" autopostback="True" style="margin-left: 0px">
											<asp:listitem resourcekey="liScale" value="scale">Scale</asp:listitem>
											<asp:listitem resourcekey="liorig" value="orig">Original</asp:listitem>
											<asp:listitem resourcekey="lihalf" value="half">Half</asp:listitem>
											<asp:listitem resourcekey="lifit" value="fit">Fit to window</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style114">
										<asp:label id="lblFlowVideoLoop" runat="server" resourcekey="lblFlowVideoLoop" text="Video loop:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbFlowPlayerLoop" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryShowTitle" ResourceKey="lblVideoGalleryShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblVideoGalleryShowTitle.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryShowTitle" runat="server" resourcekey="cbVideoGalleryShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryShowDescription" ResourceKey="lblVideoGalleryShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblVideoGalleryShowDescription.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryShowDescription" runat="server" resourcekey="cbVideoGalleryShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryShowMediaTitle" ResourceKey="lblVideoGalleryShowMediaTitle" runat="server" HelpText="Show video title:" Text="Show video title:" HelpKey="lblVideoGalleryShowMediaTitle.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryShowMediaTitle" runat="server" resourcekey="cbVideoGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryShowMediaDescription" ResourceKey="lblVideoGalleryShowMediaDescription" runat="server" HelpText="Show video description:" Text="Show video description:" HelpKey="lblVideoGalleryShowMediaDescription.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryShowMediaDescription" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryShowMediaDescriptionInVideo" ResourceKey="lblVideoGalleryShowMediaDescriptionInVideo" runat="server" HelpText="Show description inside video:" Text="Show description inside video:" HelpKey="lblVideoGalleryShowMediaDescriptionInVideo.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryShowMediaDescriptionInVideo" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionInVideoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryUseThumbnailAsStartPhoto" ResourceKey="lblVideoGalleryUseThumbnailAsStartPhoto" runat="server" HelpText="Use thumbnail as start image:" Text="Use thumbnail as start image:" HelpKey="lblVideoGalleryUseThumbnailAsStartPhoto.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryUseThumbnailAsStartPhoto" runat="server" resourcekey="cbVideoGalleryUseThumbnailAsStartPhotoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryPlayOnLoad" runat="server" HelpText="Start to play video on page load:" Text="Play on load:" HelpKey="lblVideoGalleryPlayOnLoad.HelpText" ResourceKey="lblVideoGalleryPlayOnLoad" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryPlayOnLoad" runat="server" resourcekey="cbVideoGalleryPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryAllowFullscreen" runat="server" HelpText="Allow video to be played fullscreen:" Text="Allow fullscreen:" HelpKey="lblVideoGalleryAllowFullscreen.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGalleryAllowFullscreen" runat="server" resourcekey="cbVideoGalleryAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallerySelectSkin" ResourceKey="lblVideoGallerySelectSkin" runat="server" HelpText="Select video player skin:" Text="Select video player skin:" HelpKey="lblVideoGallerySelectSkin.HelpText" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVGSelectTheme" runat="server" resourcekey="ddlVGSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource30" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource31" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblVideoGalleryInitialVolume" ResourceKey="lblVideoGalleryInitialVolume" runat="server" HelpText="Initial video volume:" Text="Initial video volume:" HelpKey="lblVideoGalleryInitialVolume.HelpText" />
					</td>
					<td colspan="3" class="style38">
						<asp:textbox id="tbVGInitialVolume" runat="server" validationgroup="vgVGSettings" width="50px" resourcekey="tbVGInitialVolumeResource1">250</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSSTNOverOpacity0" runat="server" controltovalidate="tbVGInitialVolume" display="Dynamic" errormessage="This field is required." validationgroup="vgVGSettings" resourcekey="rfvSSTNOverOpacity0Resource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvVGTBInitialVolume" runat="server" controltovalidate="tbVGInitialVolume" display="Dynamic" errormessage="Enter value between 0-300." maximumvalue="300" minimumvalue="0" resourcekey="rvVGTBInitialVolumeResource1.ErrorMessage" type="Integer"
							validationgroup="vgVGSettings">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryWidth" ResourceKey="lblVideoGalleryWidth" runat="server" Text="Video width:" ControlName="tbVGVideoWidth" HelpText="Set the video width. Does not apply to embeded video." Visible="False" HelpKey="lblVideoGalleryWidth.HelpText"></dnn:Label>
					</td>
					<td colspan="3">
						<asp:textbox id="tbVGVideoWidth" runat="server" validationgroup="vgVGSettings" width="50px" visible="False" resourcekey="tbVGVideoWidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGWidth" runat="server" controltovalidate="tbVGVideoWidth" errormessage="This field is required." validationgroup="vgVGSettings" display="Dynamic" visible="False" resourcekey="rfvVGWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings" runat="server" controltovalidate="tbVGVideoWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVGSettings" visible="False" resourcekey="cvVGSettingsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryHeight" ResourceKey="lblVideoGalleryHeight" runat="server" Text="Video height:" ControlName="tbVGVideoHeight" HelpText="Set the video height. Does not apply to embeded video." HelpKey="lblVideoGalleryHeight.HelpText" Visible="False"></dnn:Label>
					</td>
					<td colspan="3">
						<asp:textbox id="tbVGVideoHeight" runat="server" width="50px" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVGSettings" visible="False">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight" runat="server" controltovalidate="tbVGVideoHeight" errormessage="This field is required." validationgroup="vgVGSettings" display="Dynamic" resourcekey="rfvVGHeightResource1.ErrorMessage" visible="False"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings0" runat="server" controltovalidate="tbVGVideoHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVGSettings" resourcekey="cvVGSettings0Resource1.ErrorMessage"
							visible="False">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryItemsPerPage" ResourceKey="lblVideoGalleryItemsPerPage" runat="server" ControlName="tbVGItemsPerPage" HelpText="Set the number if items on one page:" Text="Items per page:" HelpKey="lblVideoGalleryItemsPerPage.HelpText" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVGItemsPerPage" runat="server" width="50px" resourcekey="tbVGItemsPerPageResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight0" runat="server" controltovalidate="tbVGItemsPerPage" display="Dynamic" errormessage="This field is required." validationgroup="vgVGSettings" resourcekey="rfvVGHeight0Resource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings1" runat="server" controltovalidate="tbVGItemsPerPage" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVGSettings" resourcekey="cvVGSettings1Resource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalleryColomunPerPage" ResourceKey="lblVideoGalleryColomunPerPage" runat="server" ControlName="tbVGNumberOfCols" HelpText="Set the number of columns:" Text="Number of columns:" HelpKey="lblVideoGalleryColomunPerPage.HelpText" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVGNumberOfCols" runat="server" resourcekey="tbVGNumberOfColsResource1" width="50px">1</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight1" runat="server" controltovalidate="tbVGNumberOfCols" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeight1Resource1.ErrorMessage" validationgroup="vgVGSettings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings2" runat="server" controltovalidate="tbVGNumberOfCols" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings2Resource1.ErrorMessage" type="Integer" validationgroup="vgVGSettings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGalelryRandomizeMedia" runat="server" HelpText="Randomize media positions on every page load:" Text="Randomize media positions:" HelpKey="lblLightBoxRandomizeMedia.HelpText" ResourceKey="lblLightBoxRandomizeMedia" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGalleryRandomizeMedia" runat="server" oncheckedchanged="cbVideoGalleryRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label10" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlVideoGalleryMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblVideoGalleryMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVideoGalleryShowPaging" runat="server" HelpText="Show paging:" Text="Show paging:" HelpKey="lblVideoGalleryShowPaging.HelpText" ResourceKey="lblVideoGalleryShowPaging" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbVideoGalleryShowPaging" runat="server" checked="True" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblVideoGalleryShowSocialSharing3" runat="server" HelpText="Show social sharing:" Text="Show social sharing:" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" ResourceKey="lblVideoGalleryShowSocialSharing" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbVideoGalleryShowSocialSharing" runat="server" autopostback="True" oncheckedchanged="cbVideoGalleryShowSocialSharing_CheckedChanged" />
						<asp:panel id="pnlVideoGallerySocialSharingOptions" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVideoGallerySSOptions1" runat="server" HelpText="Open/Close sharing on button click:" Text="Open on button click:" HelpKey="lblVideoGallerySSOptions.HelpText" ResourceKey="lblVideoGallerySSOptions" />
									</td>
									<td>
										<asp:checkbox id="cbVGSSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblVideoGallery2ShowSocialSharing3" runat="server" HelpText="Show textbox that contains media link:" Text="Show media link:" HelpKey="lblVideoGalleryShowBackLink.HelpText" ResourceKey="lblVideoGalleryShowBackLink" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbVideoGalleryShowMediaLink" runat="server" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style59">
						&nbsp;
					</td>
					<td colspan="3" class="style60">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style59">
						&nbsp;
					</td>
					<td class="style60" colspan="3">
						<asp:label id="lblVideoGalleryStatus" runat="server" resourcekey="lblVideoGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td class="style53" colspan="2">
						<asp:button id="btnVideoGallerySaveSettings" runat="server" onclick="Button1_Click3" resourcekey="btnVideoGallerySaveSettingsResource1" text="Save settings" validationgroup="vgVGSettings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnVideoGallerySaveClose" runat="server" onclick="btnVGSaveClose_Click" resourcekey="btnVideoGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgVGSettings" width="140px" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlVideoGallery2Settings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlVideoGallerySettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblVideoGalleryDisplay2Settings" resourcekey="lblVideoGalleryDisplay2Settings" runat="server" cssclass="settingsdetailtitle" text="Video gallery 2 display settings"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2TemplateSelect" runat="server" HelpKey="lblVideoGallery2TemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblVideoGallery2TemplateSelect" Text="Select template:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVideoGallery2TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlVideoGallery2TemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2SelectCSS" runat="server" HelpKey="lblVideoGallery2SelectCSS.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblVideoGallery2SelectCSS" Text="Select CSS:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG2SelectCSS" runat="server" resourcekey="ddlVGSelectCSSResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						<asp:label id="lblVG2TemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalelry2UseFlowPlayer" runat="server" HelpText="Use Flow player:" Text="Use Flow player:" HelpKey="SelectVideoPlayer.Text" ResourceKey="SelectVideoPlayer.HelpText" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG2SelectPlayer" runat="server" onselectedindexchanged="ddlVG2SelectPlayer_SelectedIndexChanged" resourcekey="ddlVGSelectCSSResource1" autopostback="True">
							<asp:listitem value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
						<asp:panel id="pnlFlowPlayerOptionsVG2" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style115">
										<asp:label id="lblFlowVideoScalingVG2" runat="server" resourcekey="lblFlowVideoScaling" text="Video scaling:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlFlowPlayerScalingVG2" runat="server" autopostback="True">
											<asp:listitem resourcekey="liScale" value="scale">Scale</asp:listitem>
											<asp:listitem resourcekey="liorig" value="orig">Original</asp:listitem>
											<asp:listitem resourcekey="lihalf" value="half">Half</asp:listitem>
											<asp:listitem resourcekey="lifit" value="fit">Fit to window</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style115">
										<asp:label id="lblFlowLoopVG2" runat="server" resourcekey="lblFlowVideoLoop" text="Video loop:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbFlowLoopVG2" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowTitle" ResourceKey="lblVideoGallery2ShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblVideoGallery2ShowTitle.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowTitle" runat="server" resourcekey="cbVideoGalleryShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowDescription" ResourceKey="lblVideoGallery2ShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblVideoGallery2ShowDescription.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowDescription" runat="server" resourcekey="cbVideoGalleryShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowMediaTitle" ResourceKey="lblVideoGallery2ShowMediaTitle" runat="server" HelpText="Show video title:" Text="Show video title:" HelpKey="lblVideoGallery2ShowMediaTitle.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaTitle" runat="server" resourcekey="cbVideoGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowMediaDescription" runat="server" HelpText="Show video description:" Text="Show video description:" HelpKey="lblVideoGallery2ShowMediaDescription.HelpText" ResourceKey="lblVideoGallery2ShowMediaDescription" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaDescription" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowMediaTitleThumbnail" runat="server" HelpText="Show video title in thumbnail:" Text="Show video title in thumbnail:" HelpKey="lblVideoGallery2ShowMediaTitleThumbnail.HelpText" ResourceKey="lblVideoGallery2ShowMediaTitleThumbnail" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaTitleThumbnail" runat="server" resourcekey="cbVideoGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowMediaDescriptionThumbnail" ResourceKey="lblVideoGallery2ShowMediaDescriptionThumbnail" runat="server" HelpText="Show video description in thumbnail:" Text="Show video description in thumbnail:" HelpKey="lblVideoGallery2ShowMediaDescriptionThumbnail.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaDescriptionThumbnail" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ShowMediaDescriptionInVideo" ResourceKey="lblVideoGallery2ShowMediaDescriptionInVideo" runat="server" HelpText="Show description inside video:" Text="Show description inside video:" HelpKey="lblVideoGallery2ShowMediaDescriptionInVideo.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaDescriptionInVideo" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionInVideoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2UseThumbnailAsStartPhoto" ResourceKey="lblVideoGallery2UseThumbnailAsStartPhoto" runat="server" HelpText="Use thumbnail as start image:" Text="Use thumbnail as start image:" HelpKey="lblVideoGallery2UseThumbnailAsStartPhoto.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2UseThumbnailAsStartPhoto" runat="server" resourcekey="cbVideoGalleryUseThumbnailAsStartPhotoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2PlayOnLoad" runat="server" HelpText="Start to play video on page load:" Text="Play on load:" HelpKey="lblVideoGallery2PlayOnLoad.HelpText" ResourceKey="lblVideoGallery2PlayOnLoad" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2PlayOnLoad" runat="server" resourcekey="cbVideoGalleryPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2AllowFullscreen" ResourceKey="lblVideoGallery2AllowFullscreen" runat="server" HelpText="Allow video to be played fullscreen:" Text="Allow fullscreen:" HelpKey="lblVideoGallery2AllowFullscreen.HelpText" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery2AllowFullscreen" runat="server" resourcekey="cbVideoGalleryAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2SelectSkin" ResourceKey="lblVideoGallery2SelectSkin" runat="server" HelpText="Select video player skin:" Text="Select video player skin:" HelpKey="lblVideoGallery2SelectSkin.HelpText" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG2SelectTheme" runat="server" resourcekey="ddlVGSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource30" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource31" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblVideoGallery2InitialVolume" runat="server" Text="Initial video volume:" HelpKey="lblVideoGallery2InitialVolume.HelpText" HelpText="Initial video volume:" ResourceKey="lblVideoGallery2InitialVolume" />
					</td>
					<td colspan="3" class="style38">
						<asp:textbox id="tbVG2InitialVolume" runat="server" validationgroup="vgVG2Settings" width="50px" resourcekey="tbVGInitialVolumeResource1">250</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSSTNOverOpacity1" runat="server" controltovalidate="tbVG2InitialVolume" display="Dynamic" errormessage="This field is required." validationgroup="vgVG2Settings" resourcekey="rfvSSTNOverOpacity0Resource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvVGTBInitialVolume0" runat="server" controltovalidate="tbVG2InitialVolume" display="Dynamic" errormessage="Enter value between 0-300." maximumvalue="300" minimumvalue="0" resourcekey="rvVGTBInitialVolumeResource1.ErrorMessage"
							type="Integer" validationgroup="vgVG2Settings">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2Width" runat="server" Text="Thumbnail width:" Visible="True" HelpKey="lblVideoGallery2Width.HelpText" HelpText="Thumbnail width:" ResourceKey="lblVideoGallery2Width"></dnn:Label>
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG2VideoWidth" runat="server" validationgroup="vgVG2Settings" width="50px" resourcekey="tbVGVideoWidthResource1">100</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGWidth0" runat="server" controltovalidate="tbVG2VideoWidth" errormessage="This field is required." validationgroup="vgVG2Settings" display="Dynamic" resourcekey="rfvVGWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings3" runat="server" controltovalidate="tbVG2VideoWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVG2Settings" resourcekey="cvVGSettingsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2Height" ResourceKey="lblVideoGallery2Height" runat="server" Text="Thumbnail height:" ControlName="tbVGVideoHeight" HelpText="Thumbnail height:" HelpKey="lblVideoGallery2Height.HelpText" Visible="True"></dnn:Label>
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG2VideoHeight" runat="server" width="50px" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG2Settings">100</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight2" runat="server" controltovalidate="tbVG2VideoHeight" errormessage="This field is required." validationgroup="vgVG2Settings" display="Dynamic" resourcekey="rfvVGHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings4" runat="server" controltovalidate="tbVG2VideoHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVG2Settings" resourcekey="cvVGSettings0Resource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style86">
						<dnn:Label ID="lblVideoGallery2ItemsPerPage" ResourceKey="lblVideoGallery2ItemsPerPage" runat="server" ControlName="tbVGItemsPerPage" HelpText="Set the number if items on one page:" Text="Items per page:" HelpKey="lblVideoGallery2ItemsPerPage.HelpText" />
					</td>
					<td colspan="3" class="style87">
						<asp:textbox id="tbVG2ItemsPerPage" runat="server" width="50px" resourcekey="tbVGItemsPerPageResource1" validationgroup="vgVG2Settings">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight3" runat="server" controltovalidate="tbVG2ItemsPerPage" display="Dynamic" errormessage="This field is required." validationgroup="vgVG2Settings" resourcekey="rfvVGHeight0Resource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings5" runat="server" controltovalidate="tbVG2ItemsPerPage" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgVG2Settings" resourcekey="cvVGSettings1Resource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ColomunPerPage" runat="server" HelpKey="lblVideoGallery2ColomunPerPage.HelpText" HelpText="Set the number of columns:" ResourceKey="lblVideoGallery2ColomunPerPage" Text="Number of columns:" ControlName="tbVGNumberOfCols" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG2NumberOfCols" runat="server" resourcekey="tbVGNumberOfColsResource1" validationgroup="vgVG2Settings" width="50px">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight4" runat="server" controltovalidate="tbVG2NumberOfCols" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeight1Resource1.ErrorMessage" validationgroup="vgVG2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings6" runat="server" controltovalidate="tbVG2NumberOfCols" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings2Resource1.ErrorMessage" type="Integer" validationgroup="vgVG2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery2ThumbnailRepeat" runat="server" HelpText="Thumbnail repeat direction:" Text="Thumbnail repeat direction:" HelpKey="lblVideoGallery2ThumbnailRepeat.HelpText" ResourceKey="lblVideoGallery2ThumbnailRepeat" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVideoGallery2ThumbnailRepeat" runat="server">
							<asp:listitem resourcekey="liHorizontalDir" selected="True" value="Horizontal">Horizontal</asp:listitem>
							<asp:listitem resourcekey="liVerticalDir" value="Vertical">Vertical</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGalelry2RandomizeMedia" runat="server" HelpText="Randomize media positions on every page load:" Text="Randomize media positions:" HelpKey="lblLightBoxRandomizeMedia.HelpText" ResourceKey="lblLightBoxRandomizeMedia" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery2RandomizeMedia" runat="server" oncheckedchanged="cbVideoGallery2RandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label11" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlVideoGallery2MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblVideoGallery2MediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ShowImages" runat="server" HelpText="Show also images from this gallery:" Text="Show images:" HelpKey="lblVideoGallery2ShowImages.HelpText" ResourceKey="lblVideoGallery2ShowImages" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowImages" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ImageWidth" runat="server" HelpText="Image width:" Text="Image width:" HelpKey="lblVideoGallery2ImageWidth.HelpText" ResourceKey="lblVideoGallery2ImageWidth" />
					</td>
					<td class="style60" colspan="3">
						<asp:textbox id="tbVG2ImageWidth" runat="server" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG2Settings" width="50px">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGWidth2" runat="server" controltovalidate="tbVG2ImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGWidthResource1.ErrorMessage" validationgroup="vgVG2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings12" runat="server" controltovalidate="tbVG2ImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettingsResource1.ErrorMessage" type="Integer" validationgroup="vgVG2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ImageHeight" runat="server" HelpText="Image height:" Text="Image height:" HelpKey="lblVideoGallery2ImageHeight.HelpText" ResourceKey="lblVideoGallery2ImageHeight" />
					</td>
					<td class="style60" colspan="3">
						<asp:textbox id="tbVG2ImageHeight" runat="server" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG2Settings" width="50px">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGWidth3" runat="server" controltovalidate="tbVG2ImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGWidthResource1.ErrorMessage" validationgroup="vgVG2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings13" runat="server" controltovalidate="tbVG2ImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettingsResource1.ErrorMessage" type="Integer" validationgroup="vgVG2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGalleryShowPaging0" runat="server" HelpText="Show paging:" Text="Show paging:" HelpKey="lblVideoGalleryShowPaging.HelpText" ResourceKey="lblVideoGalleryShowPaging" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowPaging" runat="server" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style59" valign="top">
						<dnn:Label ID="lblVideoGallery2ShowSocialSharing" runat="server" HelpText="Show social sharing:" Text="Show social sharing:" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" ResourceKey="lblVideoGalleryShowSocialSharing" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowSocialSharing" runat="server" autopostback="True" oncheckedchanged="cbVideoGallery2ShowSocialSharing_CheckedChanged" />
						&nbsp;<asp:panel id="pnlVideoGallery2SocialSharingOptions" runat="server">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVG2Opn" runat="server" HelpText="Open/Close sharing on button click:" Text="Open on button click:" HelpKey="lblVideoGallerySSOptions.HelpText" ResourceKey="lblVideoGallerySSOptions" />
									</td>
									<td>
										<asp:checkbox id="cbVG2SSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ShowSocialSharing0" runat="server" HelpText="Show textbox that contains media link:" Text="Show media link:" HelpKey="lblVideoGalleryShowBackLink.HelpText" ResourceKey="lblVideoGalleryShowBackLink" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery2ShowMediaLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style59">
						&nbsp;
					</td>
					<td class="style60" colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
						<asp:label id="lblVideoGallery2Status" runat="server" resourcekey="lblVideoGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td class="style53" colspan="2">
						<asp:button id="btnVideoGallery2SaveSettings" runat="server" onclick="btnVideoGallery2SaveSettings_Click" resourcekey="btnVideoGallerySaveSettingsResource1" style="height: 26px" text="Save settings" validationgroup="vgVG2Settings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnVideoGallery2SaveClose" runat="server" onclick="btnVideoGallery2SaveClose_Click" resourcekey="btnVideoGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgVG2Settings" width="140px" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlVideoGallery3Settings" runat="server" backcolor="#EFEFEF" resourcekey="pnlVideoGallerySettingsResource1" visible="False">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblVideoGalleryDisplay3Settings" runat="server" cssclass="settingsdetailtitle" resourcekey="lblVideoGalleryDisplay3Settings" text="Video gallery 3 display settings"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table align="center" cellpadding="2" cellspacing="2" width="80%">
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3TemplateSelect" runat="server" HelpKey="lblVideoGallery2TemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblVideoGallery2TemplateSelect" Text="Select template:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVideoGallery3TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlVideoGallery3TemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3SelectCSS" runat="server" HelpKey="lblVideoGallery2SelectCSS.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblVideoGallery2SelectCSS" Text="Select CSS:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG3SelectCSS" runat="server" resourcekey="ddlVGSelectCSSResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						<asp:label id="lblVG3TemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGalelry3UseFlowPlayer" runat="server" HelpText="Select player:" Text="Select player:" HelpKey="SelectVideoPlayer.HelpText" ResourceKey="SelectVideoPlayer.Text" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG3SelectPlayer" runat="server" autopostback="True" onselectedindexchanged="ddlVG3SelectPlayer_SelectedIndexChanged" resourcekey="ddlVGSelectCSSResource1">
							<asp:listitem value="False">Standard</asp:listitem>
							<asp:listitem value="True">Flow player</asp:listitem>
						</asp:dropdownlist>
						<asp:panel id="pnlFlowPlayerOptionsVG3" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style116">
										<asp:label id="lblFlowVideoScalingVG3" runat="server" resourcekey="lblFlowVideoScaling" text="Video scaling:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlFlowPlayerScalingVG3" runat="server" autopostback="True">
											<asp:listitem resourcekey="liScale" value="scale">Scale</asp:listitem>
											<asp:listitem resourcekey="liorig" value="orig">Original</asp:listitem>
											<asp:listitem resourcekey="lihalf" value="half">Half</asp:listitem>
											<asp:listitem resourcekey="lifit" value="fit">Fit to window</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style116">
										<asp:label id="lblFlowLoopVG3" runat="server" resourcekey="lblFlowVideoLoop" text="Video loop:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbFlowLoopVG3" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowTitle" runat="server" HelpKey="lblVideoGallery2ShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblVideoGallery2ShowTitle" Text="Show gallery title:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowTitle" runat="server" resourcekey="cbVideoGalleryShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowDescription" runat="server" HelpKey="lblVideoGallery2ShowDescription.HelpText" HelpText="Show gallery description:" ResourceKey="lblVideoGallery2ShowDescription" Text="Show gallery description:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowDescription" runat="server" resourcekey="cbVideoGalleryShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowMediaTitle" runat="server" HelpKey="lblVideoGallery2ShowMediaTitle.HelpText" HelpText="Show video title:" ResourceKey="lblVideoGallery2ShowMediaTitle" Text="Show video title:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaTitle" runat="server" resourcekey="cbVideoGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowMediaDescription" runat="server" HelpKey="lblVideoGallery2ShowMediaDescription.HelpText" HelpText="Show video description:" ResourceKey="lblVideoGallery2ShowMediaDescription" Text="Show video description:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaDescription" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowMediaTitleThumbnail" runat="server" HelpKey="lblVideoGallery2ShowMediaTitleThumbnail.HelpText" HelpText="Show video title in thumbnail:" ResourceKey="lblVideoGallery2ShowMediaTitleThumbnail" Text="Show video title in thumbnail:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaTitleThumbnail" runat="server" resourcekey="cbVideoGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowMediaDescriptionThumbnail" runat="server" HelpKey="lblVideoGallery2ShowMediaDescriptionThumbnail.HelpText" HelpText="Show video description in thumbnail:" ResourceKey="lblVideoGallery2ShowMediaDescriptionThumbnail" Text="Show video description in thumbnail:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaDescriptionThumbnail" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ShowMediaDescriptionInVideo" runat="server" HelpKey="lblVideoGallery2ShowMediaDescriptionInVideo.HelpText" HelpText="Show description inside video:" ResourceKey="lblVideoGallery2ShowMediaDescriptionInVideo" Text="Show description inside video:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaDescriptionInVideo" runat="server" resourcekey="cbVideoGalleryShowMediaDescriptionInVideoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3UseThumbnailAsStartPhoto" runat="server" HelpKey="lblVideoGallery2UseThumbnailAsStartPhoto.HelpText" HelpText="Use thumbnail as start image:" ResourceKey="lblVideoGallery2UseThumbnailAsStartPhoto" Text="Use thumbnail as start image:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3UseThumbnailAsStartPhoto" runat="server" resourcekey="cbVideoGalleryUseThumbnailAsStartPhotoResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3PlayOnLoad" runat="server" HelpKey="lblVideoGallery2PlayOnLoad.HelpText" HelpText="Start to play video on page load:" ResourceKey="lblVideoGallery2PlayOnLoad" Text="Play on load:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3PlayOnLoad" runat="server" resourcekey="cbVideoGalleryPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3AllowFullscreen" runat="server" HelpKey="lblVideoGallery2AllowFullscreen.HelpText" HelpText="Allow video to be played fullscreen:" ResourceKey="lblVideoGallery2AllowFullscreen" Text="Allow fullscreen:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3AllowFullscreen" runat="server" resourcekey="cbVideoGalleryAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3PaggingVisible" runat="server" HelpKey="lblVideoGallery3PaggingVisible.HelpText" HelpText="Show pagging:" ResourceKey="lblVideoGallery3PaggingVisible" Text="Show pagging:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowPagging" runat="server" resourcekey="cbVideoGalleryAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3SelectSkin" runat="server" HelpKey="lblVideoGallery2SelectSkin.HelpText" HelpText="Select video player skin:" ResourceKey="lblVideoGallery2SelectSkin" Text="Select video player skin:" />
					</td>
					<td colspan="3">
						<asp:dropdownlist id="ddlVG3SelectTheme" runat="server" resourcekey="ddlVGSelectThemeResource1" width="70px">
							<asp:listitem resourcekey="ListItemResource30" selected="True" value="black">Black</asp:listitem>
							<asp:listitem resourcekey="ListItemResource31" value="white">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style69">
						<dnn:Label ID="lblVideoGallery3InitialVolume" runat="server" HelpKey="lblVideoGallery2InitialVolume.HelpText" HelpText="Initial video volume:" ResourceKey="lblVideoGallery2InitialVolume" Text="Initial video volume:" />
					</td>
					<td colspan="3" class="style38">
						<asp:textbox id="tbVG3InitialVolume" runat="server" resourcekey="tbVGInitialVolumeResource1" validationgroup="vgVG3Settings" width="50px">250</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSSTNOverOpacity2" runat="server" controltovalidate="tbVG3InitialVolume" display="Dynamic" errormessage="This field is required." resourcekey="rfvSSTNOverOpacity0Resource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvVGTBInitialVolume1" runat="server" controltovalidate="tbVG3InitialVolume" display="Dynamic" errormessage="Enter value between 0-300." maximumvalue="300" minimumvalue="0" resourcekey="rvVGTBInitialVolumeResource1.ErrorMessage"
							type="Integer" validationgroup="vgVG3Settings">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3Width" runat="server" HelpKey="lblVideoGallery2Width.HelpText" HelpText="Thumbnail width:" ResourceKey="lblVideoGallery2Width" Text="Thumbnail width:" Visible="True" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG3VideoWidth" runat="server" resourcekey="tbVGVideoWidthResource1" validationgroup="vgVG3Settings" width="50px">100</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGWidth1" runat="server" controltovalidate="tbVG3VideoWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGWidthResource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings7" runat="server" controltovalidate="tbVG3VideoWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettingsResource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3Height" runat="server" ControlName="tbVGVideoHeight" HelpKey="lblVideoGallery2Height.HelpText" HelpText="Thumbnail height:" ResourceKey="lblVideoGallery2Height" Text="Thumbnail height:" Visible="True" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG3VideoHeight" runat="server" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG3Settings" width="50px">100</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight5" runat="server" controltovalidate="tbVG3VideoHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeightResource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings8" runat="server" controltovalidate="tbVG3VideoHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings0Resource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ItemstoShow" runat="server" ControlName="tbVGItemsPerPage" HelpKey="lblVideoGallery3ItemstoShow.HelpText" HelpText="Items to show:" ResourceKey="lblVideoGallery3ItemstoShow" Text="Items to show:" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG3ItemsPerPage" runat="server" resourcekey="tbVGItemsPerPageResource1" validationgroup="vgVG3Settings" width="50px">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight6" runat="server" controltovalidate="tbVG3ItemsPerPage" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeight0Resource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings9" runat="server" controltovalidate="tbVG3ItemsPerPage" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings1Resource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3ItemsToScroll" runat="server" ControlName="tbVGNumberOfCols" HelpKey="lblVideoGallery3ItemsToScroll.HelpText" HelpText="Items to scroll:" ResourceKey="lblVideoGallery3ItemsToScroll" Text="Items to scroll:" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG3NumberOfCols" runat="server" resourcekey="tbVGNumberOfColsResource1" validationgroup="vgVG3Settings" width="50px">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight7" runat="server" controltovalidate="tbVG3NumberOfCols" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeight1Resource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings10" runat="server" controltovalidate="tbVG3NumberOfCols" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings2Resource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3AutoSlide" runat="server" ControlName="tbVGNumberOfCols" HelpKey="lblVideoGallery3AutoSlide.HelpText" HelpText="Auto slide:" ResourceKey="lblVideoGallery3AutoSlide" Text="Auto slide:" />
					</td>
					<td colspan="3">
						<asp:checkbox id="cbVideoGallery3AutoSlide" runat="server" resourcekey="cbVideoGalleryAllowFullscreenResource1" />
					</td>
				</tr>
				<tr>
					<td class="style71">
						<dnn:Label ID="lblVideoGallery3AutoSlidePause" runat="server" HelpKey="lblVideoGallery3AutoSlidePause.HelpText" HelpText="Auto slide items pause:" ResourceKey="lblVideoGallery3AutoSlidePause" Text="Auto slide items pause:" ControlName="tbVGNumberOfCols" />
					</td>
					<td colspan="3">
						<asp:textbox id="tbVG3AutoSlidePause" runat="server" resourcekey="tbVGInitialVolumeResource1" validationgroup="vgVG3Settings" width="50px">5000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvVGHeight8" runat="server" controltovalidate="tbVG3AutoSlidePause" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGHeight1Resource1.ErrorMessage" validationgroup="vgVG3Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings11" runat="server" controltovalidate="tbVG3AutoSlidePause" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettings2Resource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGalelry3RandomizeMedia" runat="server" HelpText="Randomize media positions on every page load:" Text="Randomize media positions:" HelpKey="lblLightBoxRandomizeMedia.HelpText" ResourceKey="lblLightBoxRandomizeMedia" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery3RandomizeMedia" runat="server" oncheckedchanged="cbVideoGallery3RandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label12" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlVideoGallery3MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td class="style91">
						<asp:radiobuttonlist id="rblVideoGallery3MediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ShowImages0" runat="server" HelpKey="lblVideoGallery2ShowImages.HelpText" HelpText="Show also images from this gallery:" ResourceKey="lblVideoGallery2ShowImages" Text="Show images:" />
					</td>
					<td colspan="3" class="style60">
						<asp:checkbox id="cbVideoGallery3ShowImages" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ImageWidth0" runat="server" HelpKey="lblVideoGallery2ImageWidth.HelpText" HelpText="Image width:" ResourceKey="lblVideoGallery2ImageWidth" Text="Image width:" />
					</td>
					<td class="style60" colspan="3">
						<asp:textbox id="tbVG3ImageWidth" runat="server" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG3Settings" width="50px">600</asp:textbox>
						<asp:requiredfieldvalidator id="rfvVGWidth4" runat="server" controltovalidate="tbVG3ImageWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGWidthResource1.ErrorMessage" validationgroup="vgVG3Settings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings14" runat="server" controltovalidate="tbVG3ImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettingsResource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ImageHeight0" runat="server" HelpKey="lblVideoGallery2ImageHeight.HelpText" HelpText="Image height:" ResourceKey="lblVideoGallery2ImageHeight" Text="Image height:" />
					</td>
					<td class="style60" colspan="3">
						<asp:textbox id="tbVG3ImageHeight" runat="server" resourcekey="tbVGVideoHeightResource1" validationgroup="vgVG3Settings" width="50px">400</asp:textbox>
						<asp:requiredfieldvalidator id="rfvVGWidth5" runat="server" controltovalidate="tbVG3ImageHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvVGWidthResource1.ErrorMessage" validationgroup="vgVG3Settings">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvVGSettings15" runat="server" controltovalidate="tbVG3ImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvVGSettingsResource1.ErrorMessage" type="Integer" validationgroup="vgVG3Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2Arrows" runat="server" HelpText="Navigation arrows:" Text="Navigation arrows:" HelpKey="lblVideoGallery2Arrows.HelpText" ResourceKey="lblVideoGallery2Arrows" />
					</td>
					<td class="style60" colspan="3">
						<asp:dropdownlist id="ddlVG3Arrows" runat="server">
							<asp:listitem resourcekey="liDefault">Default</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style59" valign="top">
						<dnn:Label ID="lblVideoGallery2ShowSocialSharing2" runat="server" HelpText="Show social sharing:" Text="Show social sharing:" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" ResourceKey="lblVideoGalleryShowSocialSharing" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowSocialSharing" runat="server" autopostback="True" oncheckedchanged="cbVideoGallery3ShowSocialSharing_CheckedChanged" />
						<asp:panel id="pnlVideoGallery3SocialSharingOptions" runat="server">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVideoGallery2SSOptions0" runat="server" HelpText="Open/Close sharing on button click:" Text="Open on button click:" HelpKey="lblVideoGallerySSOptions.HelpText" ResourceKey="lblVideoGallerySSOptions" />
									</td>
									<td>
										<asp:checkbox id="cbVG3SSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style59">
						<dnn:Label ID="lblVideoGallery2ShowSocialSharing1" runat="server" HelpText="Show textbox that contains media link:" Text="Show media link:" HelpKey="lblVideoGalleryShowBackLink.HelpText" ResourceKey="lblVideoGalleryShowBackLink" />
					</td>
					<td class="style60" colspan="3">
						<asp:checkbox id="cbVideoGallery3ShowMediaLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style59">
						&nbsp;
					</td>
					<td class="style60" colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
						<asp:label id="lblVideoGallery3Status" runat="server" resourcekey="lblVideoGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td class="style53" colspan="2">
						<asp:button id="btnVideoGallery3SaveSettings" runat="server" onclick="btnVideoGallery3SaveSettings_Click" resourcekey="btnVideoGallerySaveSettingsResource1" style="height: 26px" text="Save settings" validationgroup="vgVG3Settings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btnVideoGallery3SaveClose" runat="server" onclick="btnVideoGallery3SaveClose_Click" resourcekey="btnVideoGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgVG3Settings" width="140px" />
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style71">
						&nbsp;
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlSSthumbs" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlSSthumbsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblSlideShowThumbnailsDisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Slideshow with thumbnails display settings" resourcekey="lblSlideShowThumbnailsDisplaySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSSthumbnailsTemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblLightboxTemplateSelect" Text="Select template:" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlSSThumbnailsTemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlSSThumbnailsTemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:label id="lblSSthumbnailsTemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsShowTitle" ResourceKey="lblSlideShowThumbnailsShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblSlideShowThumbnailsShowTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsShowTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsShowDescription" ResourceKey="lblSlideShowThumbnailsShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblSlideShowThumbnailsShowDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsShowDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsShowMediaTitle" ResourceKey="lblSlideShowThumbnailsShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblSlideShowThumbnailsShowMediaTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsShowMediaTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsShowMediaDescription" ResourceKey="lblSlideShowThumbnailsShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblSlideShowThumbnailsShowMediaDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsShowMediaDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblSlideShowThumbnailsShowLightboxDescription" ResourceKey="lblSlideShowThumbnailsShowLightboxDescription" runat="server" HelpText="Show media description in lightbox:" Text="Show media description in lightbox:" HelpKey="lblSlideShowThumbnailsShowLightboxDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsShowLightBoxDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowLightBoxDescriptionResource1" autopostback="True" oncheckedchanged="cbSlideShowThumbnailsShowLightBoxDescription_CheckedChanged" />
						<br />
						<asp:panel id="pnlSlideShowTNTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblSlideShowTNToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowLightboxShowTooltips0" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbSSTNShowToolTips" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNTargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTNTargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNTooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTNTooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTNShoweffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTNTooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth16" runat="server" controltovalidate="tbSlideShowTNTooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTNSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth16" runat="server" controltovalidate="tbSlideShowTNTooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTNSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTNHideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNHideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTNTooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth17" runat="server" controltovalidate="tbSlideShowTNTooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTNSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth17" runat="server" controltovalidate="tbSlideShowTNTooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTNSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNTooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTNTooltipBorder" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth18" runat="server" controltovalidate="tbSlideShowTNTooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage" setfocusonerror="True"
											validationgroup="vgSSSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth18" runat="server" controltovalidate="tbSlideShowTNTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTNSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNTooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTNTooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth19" runat="server" controltovalidate="tbSlideShowTNTooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTNSettings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth19" runat="server" controltovalidate="tbSlideShowTNTooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTNTooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTNTooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOpenMediaUrl" ResourceKey="lblSlideShowThumbnailsOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblSlideShowThumbnailsOpenMediaUrl.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsOpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbSSTNOpenMediaUrl_CheckedChanged" resourcekey="cbSlideShowThumbnailsOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOpenMediaUrlNewWindow" ResourceKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSSTNOpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbSSTNOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsImageWidth" ResourceKey="lblSlideShowThumbnailsImageWidth" runat="server" ControlName="tbSSTBWidth" HelpText="Set the width of main image panel:" Text="Image width:" HelpKey="lblSlideShowThumbnailsImageWidth.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBWidth" runat="server" validationgroup="vgSSTNSettings" width="55px" resourcekey="tbSSTBWidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsImageWidth" runat="server" controltovalidate="tbSSTBWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSSTNWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsImageWidth" runat="server" controltovalidate="tbSSTBWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsImageHeight" ResourceKey="lblSlideShowThumbnailsImageHeight" runat="server" Text="Image height:" ControlName="tbSSTHHeight" HelpText="Set the height of main image panel:" HelpKey="lblSlideShowThumbnailsImageHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTHHeight" runat="server" validationgroup="vgSSTNSettings" width="55px" resourcekey="tbSSTHHeightResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsImageHeight" runat="server" controltovalidate="tbSSTHHeight" errormessage="This field is required." validationgroup="vgSSTNSettings" display="Dynamic" resourcekey="rfvSSTNHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsImageHeight" runat="server" controltovalidate="tbSSTHHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsThumbWidth" ResourceKey="lblSlideShowThumbnailsThumbWidth" runat="server" Text="Thumbnail width:" HelpText="Set the width of thumbnail image in filmstrip:" ControlName="tbSSTHumbwidth" HelpKey="lblSlideShowThumbnailsThumbWidth.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTHumbwidth" runat="server" validationgroup="vgSSTNSettings" width="55px" resourcekey="tbSSTHumbwidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsThumbWidth" runat="server" controltovalidate="tbSSTHumbwidth" errormessage="This field is required." validationgroup="vgSSTNSettings" display="Dynamic" resourcekey="rfvSlideShowThumbnailsThumbWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsThumbWidth" runat="server" controltovalidate="tbSSTHumbwidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsThumbWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsThumbHeight" ResourceKey="lblSlideShowThumbnailsThumbHeight" runat="server" Text="Thumbnail height:" ControlName="tbSSTHumbHeight" HelpText="Set the height of thumbnail image in filmstrip:" HelpKey="lblSlideShowThumbnailsThumbHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTHumbHeight" runat="server" validationgroup="vgSSTNSettings" width="55px" resourcekey="tbSSTHumbHeightResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsThumnHeight" runat="server" controltovalidate="tbSSTHumbHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsThumnHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsThumbHeight" runat="server" controltovalidate="tbSSTHumbHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsThumbHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsProportionalImages" ResourceKey="lblSlideShowThumbnailsProportionalImages" runat="server" ControlName="tbSSTHumbHeight" HelpText="Proportionally resize images:" Text="Proportionally resize images:" HelpKey="lblSlideShowThumbnailsProportionalImages.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsProportionalImages" runat="server" resourcekey="cbSlideShowThumbnailsProportionalImagesResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOvlerlayPosition" ResourceKey="lblSlideShowThumbnailsOvlerlayPosition" runat="server" Text="Overlay position:" ControlName="rblSSTBOverlayPosition" HelpText="Set the position of overlay for title and description:"
							HelpKey="lblSlideShowThumbnailsOvlerlayPosition.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblSlideShowThumbnailsOverlayPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsOverlayPositionResource1">
							<asp:listitem selected="True" value="top" resourcekey="ListItemResource32">Top</asp:listitem>
							<asp:listitem value="bottom" resourcekey="ListItemResource33">Bottom</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOverlaySize" ResourceKey="lblSlideShowThumbnailsOverlaySize" runat="server" Text="Overlay size (px):" ControlName="tbSSTBOverlaySize" HelpText="Set the size of overlay in pixels:" HelpKey="lblSlideShowThumbnailsOverlaySize.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBOverlaySize" runat="server" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTBOverlaySizeResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlaySize" runat="server" controltovalidate="tbSSTBOverlaySize" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsOverlaySize" runat="server" controltovalidate="tbSSTBOverlaySize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOverlayOpacity" ResourceKey="lblSlideShowThumbnailsOverlayOpacity" runat="server" Text="Overlay opacity (0-100):" ControlName="tbSSTBOveryOpacity" HelpText="Set the percentage of overlay opacity. Values between 0 and 100."
							HelpKey="lblSlideShowThumbnailsOverlayOpacity.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBOveryOpacity" runat="server" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTBOveryOpacityResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayOpacity" runat="server" controltovalidate="tbSSTBOveryOpacity" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvSlideShowThumbnailsOverlayOpacity" runat="server" controltovalidate="tbSSTBOveryOpacity" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" type="Integer" validationgroup="vgSSTNSettings"
							resourcekey="rvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOverlayTextColor" ResourceKey="lblSlideShowThumbnailsOverlayTextColor" runat="server" Text="Overlay text color (hex value RRGGBB):" ControlName="tbSSTBOverlayTextColor" HelpText="Set the color of ovarlay text in rgb format with hex values:"
							HelpKey="lblSlideShowThumbnailsOverlayTextColor.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBOverlayTextColor" runat="server" maxlength="6" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTBOverlayTextColorResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayTextColor" runat="server" controltovalidate="tbSSTBOverlayTextColor" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsOverlayTextColor" runat="server" controltovalidate="tbSSTBOverlayTextColor" errormessage="Please eneter hexadecimal color value." validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$"
							validationgroup="vgSSTNSettings" resourcekey="revSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage">
						</asp:regularexpressionvalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsOverlayColor" ResourceKey="lblSlideShowThumbnailsOverlayColor" runat="server" ControlName="tbSSTBOverlayColor" HelpText="Set the color of overlay in rgb format with hex values:" Text="Overlay color (hex value RRGGBB):"
							HelpKey="lblSlideShowThumbnailsOverlayColor.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBOverlayColor" runat="server" maxlength="6" width="50px" resourcekey="tbSSTBOverlayColorResource1">eeeeee</asp:textbox>
						<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayColor" runat="server" controltovalidate="tbSSTBOverlayColor" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsOverlayColorResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsOverlayColor" runat="server" controltovalidate="tbSSTBOverlayColor" errormessage="Please eneter hexadecimal color value." validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$"
							validationgroup="vgSSTNSettings" resourcekey="revSlideShowThumbnailsOverlayColorResource1.ErrorMessage">
						</asp:regularexpressionvalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsThumbPosition" ResourceKey="lblSlideShowThumbnailsThumbPosition" runat="server" Text="Thumbnail position:" ControlName="rblSSTBThumbNailPosition" HelpText="Set the position of filmstrip with thumbnails:" HelpKey="lblSlideShowThumbnailsThumbPosition.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblSlideShowThumbnailsThumbnailPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsThumbnailPositionResource1">
							<asp:listitem selected="True" value="top" resourcekey="ListItemResource34">Top</asp:listitem>
							<asp:listitem value="bottom" resourcekey="ListItemResource35">Bottom</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsTransparentThumbnails" ResourceKey="lblSlideShowThumbnailsTransparentThumbnails" runat="server" ControlName="rblSSTBThumbNailPosition" HelpText="Transparent thumbnail navigation:" Text="Transparent thumbnail navigation:"
							HelpKey="lblSlideShowThumbnailsTransparentThumbnails.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsTransparentThumbnails" runat="server" autopostback="True" oncheckedchanged="cbSSTBTransparentThumbnails_CheckedChanged" resourcekey="cbSlideShowThumbnailsTransparentThumbnailsResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsTransitionTime" ResourceKey="lblSlideShowThumbnailsTransitionTime" runat="server" Text="Transition interval (ms):" ControlName="tbSSTBTransition" HelpText="Set the pause time between image transition in miliseconds:"
							HelpKey="lblSlideShowThumbnailsTransitionTime.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBTransition" runat="server" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTBTransitionResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsTransitionTime" runat="server" controltovalidate="tbSSTBTransition" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsTransitionTime" runat="server" controltovalidate="tbSSTBTransition" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsTransitionSpeed" ResourceKey="lblSlideShowThumbnailsTransitionSpeed" runat="server" ControlName="tbSSTBTransitionSpeed" HelpText="Set the transition time in miliseconds:" Text="Transition speed (ms):" HelpKey="lblSlideShowThumbnailsTransitionSpeed.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBTransitionSpeed" runat="server" width="50px" resourcekey="tbSSTBTransitionSpeedResource1">800</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsTransitionSpeed" runat="server" controltovalidate="tbSSTBTransitionSpeed" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsTransitionSpeed" runat="server" controltovalidate="tbSSTBTransitionSpeed" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings"
							resourcekey="cvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsShowPanel" ResourceKey="lblSlideShowThumbnailsShowPanel" runat="server" Text="Show main panel:" ControlName="cbSSTNMainPanel" HelpText="Set to show or hide main image panel:" HelpKey="lblSlideShowThumbnailsShowPanel.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsMainPanel" runat="server" oncheckedchanged="cbSSTNMainPanel_CheckedChanged" autopostback="True" resourcekey="cbSlideShowThumbnailsMainPanelResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsFilmstrip" ResourceKey="lblSlideShowThumbnailsFilmstrip" runat="server" Text="Show filmstrip:" ControlName="cbSSTNFilmStrip" HelpText="Set to show or hide filmstrip:" HelpKey="lblSlideShowThumbnailsFilmstrip.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsFilmStrip" runat="server" oncheckedchanged="cbSSTNFilmStrip_CheckedChanged" resourcekey="cbSlideShowThumbnailsFilmStripResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsFilmStripSize" ResourceKey="lblSlideShowThumbnailsFilmStripSize" runat="server" ControlName="tbSSTNFilmStripSize" HelpText="Set the number of images in filmstrip:" Text="Number of images in filmstrip:" HelpKey="lblSlideShowThumbnailsFilmStripSize.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTNFilmStripSize" runat="server" enabled="False" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTNFilmStripSizeResource1">4</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsFilmStripSize" runat="server" controltovalidate="tbSSTNFilmStripSize" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsFilmStripSize" runat="server" controltovalidate="tbSSTNFilmStripSize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings" resourcekey="cvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsDisplayBorder" ResourceKey="lblSlideShowThumbnailsDisplayBorder" runat="server" ControlName="tbSSTNBorderSize" HelpText="Display border:" Text="Display border:" HelpKey="lblSlideShowThumbnailsDisplayBorder.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsDisplayBorder" runat="server" resourcekey="cbSlideShowThumbnailsDisplayBorderResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsBorderColor" ResourceKey="lblSlideShowThumbnailsBorderColor" runat="server" ControlName="tbSSTNBorderSize" HelpText="Set the border color in rgb format with hex values:" Text="Border color (hex value RRGGBB):" HelpKey="lblSlideShowThumbnailsBorderColor.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTBBorderColor" runat="server" maxlength="6" validationgroup="vgSSTNSettings" width="55px" resourcekey="tbSSTBBorderColorResource1">222222</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsBorderColor" runat="server" controltovalidate="tbSSTBBorderColor" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings" resourcekey="rfvSlideShowThumbnailsBorderColorResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsBorderColor" runat="server" controltovalidate="tbSSTBBorderColor" errormessage="Please eneter hexadecimal color value." validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$"
							validationgroup="vgSSTNSettings" resourcekey="revSlideShowThumbnailsBorderColorResource1.ErrorMessage">
						</asp:regularexpressionvalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsRandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnailsRandomizeMedia" runat="server" oncheckedchanged="cbSlideShowThumbnailsRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label3" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlSSTNMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblSSTNMediaSort" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsFilmstripColor" runat="server" ControlName="tbSSTNBorderSize" HelpText="Set the filmstrip background color in rgb format with hex values:" Text="Filmstrip background color (hex value RRGGBB):" HelpKey="lblSlideShowThumbnailsFilmstripColor.HelpText"
							ResourceKey="lblSlideShowThumbnailsFilmstripColor" />
					</td>
					<td class="style91">
						<asp:textbox id="tbSSTBFilmstripBackColor" runat="server" maxlength="6" resourcekey="tbSSTBBorderColorResource1" validationgroup="vgSSTNSettings" width="55px">000000</asp:textbox>
						<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsBorderColor1" runat="server" controltovalidate="tbSSTBFilmstripBackColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsBorderColorResource1.ErrorMessage"
							validationgroup="vgSSTNSettings">
						</asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsBorderColor1" runat="server" controltovalidate="tbSSTBFilmstripBackColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsBorderColorResource1.ErrorMessage"
							validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTNSettings">
						</asp:regularexpressionvalidator>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowMainPAnelBackColor" runat="server" ControlName="tbSSTNBorderSize" HelpText="Set the main panel background color in rgb format with hex values:" Text="Main panel background color (hex value RRGGBB):" HelpKey="lblSlideShowMainPAnelBackColor.HelpText"
							ResourceKey="lblSlideShowMainPAnelBackColor" />
					</td>
					<td class="style91">
						<asp:textbox id="tbSSTBMainPAnelBackColor" runat="server" maxlength="6" resourcekey="tbSSTBBorderColorResource1" validationgroup="vgSSTNSettings" width="55px">FFFFFF</asp:textbox>
						<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsBorderColor2" runat="server" controltovalidate="tbSSTBMainPAnelBackColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsBorderColorResource1.ErrorMessage"
							validationgroup="vgSSTNSettings">
						</asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsBorderColor2" runat="server" controltovalidate="tbSSTBMainPAnelBackColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsBorderColorResource1.ErrorMessage"
							validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTNSettings">
						</asp:regularexpressionvalidator>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style48">
						<asp:button id="btnSlideShowThumbnailsSave" runat="server" onclick="btnSaveSSthumbSet_Click" text="Save settings" validationgroup="vgSSTNSettings" resourcekey="btnSlideShowThumbnailsSaveResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnSlideShowThumbnailsSaveClose" runat="server" onclick="btnSSTNSaveClose_Click" text="Save &amp; Close" validationgroup="vgSSTNSettings" resourcekey="btnSlideShowThumbnailsSaveCloseResource1" />
					</td>
					<td>
						<asp:label id="lblSlideShowThumbnailsStatus" runat="server" width="120px" resourcekey="lblSlideShowThumbnailsStatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlSSthumbs4" runat="server" backcolor="#EFEFEF" resourcekey="pnlSSthumbsResource1" visible="False">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblSlideShowThumbnails4DisplaySettings" runat="server" cssclass="settingsdetailtitle" text="Slideshow with thumbnails 4 display settings"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSSthumbnails4TemplateSelect" runat="server" ControlName="ddlSSThemeSelect" HelpKey="lblLightboxTemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblLightboxTemplateSelect" Text="Select template:" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlSSThumbnails4TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlSSThumbnailsTemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSSthumbnails4ThemeSelect" runat="server" ControlName="ddlSSThemeSelect" HelpText="Select CSS theme:" Text="Select CSS theme:" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlSSTN4SelectCSS" runat="server" resourcekey="ddlVGSelectCSSResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:label id="lblSSthumbnails4TemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ShowTitle" ResourceKey="lblSlideShowThumbnailsShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblSlideShowThumbnailsShowTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ShowTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ShowDescription" ResourceKey="lblSlideShowThumbnailsShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblSlideShowThumbnailsShowDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ShowDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ShowMediaTitle" ResourceKey="lblSlideShowThumbnailsShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblSlideShowThumbnailsShowMediaTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ShowMediaTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ShowMediaDescription" ResourceKey="lblSlideShowThumbnailsShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblSlideShowThumbnailsShowMediaDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ShowMediaDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4TitleDescriptionPosition" runat="server" HelpText="Title and description position:" Text="Title and description position:" />
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblSlideShowThumbnails4TitlePosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsOverlayPositionResource1">
							<asp:listitem resourcekey="ListItemResource32" selected="True" value="top">Top</asp:listitem>
							<asp:listitem resourcekey="ListItemResource33" value="bottom">Bottom</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4TitleSize" runat="server" ControlName="tbSSTBOverlaySize" HelpText="Title and description size (px):" Text="Title and description size (px):" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTB4OverlaySize" runat="server" resourcekey="tbSSTBOverlaySizeResource1" validationgroup="vgSSTNSettings4" width="55px">200</asp:textbox>
						<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlaySize0" runat="server" controltovalidate="tbSSTB4OverlaySize" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage" validationgroup="vgSSTNSettings4">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsOverlaySize0" runat="server" controltovalidate="tbSSTB4OverlaySize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage"
							type="Integer" validationgroup="vgSSTNSettings4">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70" valign="top">
						<dnn:Label ID="lblSlideShowThumbnails4ShowLightboxDescription1" ResourceKey="lblSlideShowThumbnailsShowLightboxDescription" runat="server" HelpText="Show media description in lightbox:" Text="Show media description in lightbox:" HelpKey="lblSlideShowThumbnailsShowLightboxDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ShowLightBoxDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowLightBoxDescriptionResource1" autopostback="True" oncheckedchanged="cbSlideShowThumbnails4ShowLightBoxDescription_CheckedChanged" />
						<br />
						<asp:panel id="pnlSlideShow4TNTipOptions" runat="server" backcolor="#CBEEF8" bordercolor="#65CDEB" borderstyle="Solid" borderwidth="2px" visible="False">
							<table class="style66">
								<tr>
									<td class="style85">
										&nbsp;
									</td>
									<td>
										<asp:label id="lblSlideShow4TNToolTipOptions" runat="server" font-bold="True" resourcekey="lblLightBoxToolTipOptions" text="Tooltip options"></asp:label>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowtLightboxShowTooltips" runat="server" resourcekey="lblLightboxShowToolTips" text="Show Tooltips:"></asp:label>
									</td>
									<td>
										<asp:checkbox id="cbSSTN4ShowToolTips" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4TargetPosition" runat="server" resourcekey="lblLightboxTargetPosition" text="Target position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTN4TargetPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle" selected="True">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" value="bottomMiddle">Bottom middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4TooltipPosition" runat="server" resourcekey="lblLightboxTooltipPosition" text="Tooltip position:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTN4TooltipPosition" runat="server">
											<asp:listitem resourcekey="topLeft" value="topLeft">Top left</asp:listitem>
											<asp:listitem resourcekey="topMiddle" value="topMiddle">Top middle</asp:listitem>
											<asp:listitem resourcekey="topRight" value="topRight">Top right</asp:listitem>
											<asp:listitem resourcekey="leftTop" value="leftTop">Left top</asp:listitem>
											<asp:listitem resourcekey="leftMiddle" value="leftMiddle">Left middle</asp:listitem>
											<asp:listitem resourcekey="leftBottom" value="leftBottom">Left bottom</asp:listitem>
											<asp:listitem resourcekey="center" value="center">Center</asp:listitem>
											<asp:listitem resourcekey="rightTop" value="rightTop">Right top</asp:listitem>
											<asp:listitem resourcekey="rightMiddle" value="rightMiddle">Right middle</asp:listitem>
											<asp:listitem resourcekey="rightBottom" value="rightBottom">Right bottom</asp:listitem>
											<asp:listitem resourcekey="bottomLeft" value="bottomLeft">Bottom left</asp:listitem>
											<asp:listitem resourcekey="bottomMiddle" selected="True" value="bottomMiddle">Bottom 
											middle</asp:listitem>
											<asp:listitem resourcekey="bottomRight" value="bottomRight">Bottom right</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4ShowEffect" runat="server" resourcekey="lblLightboxShowEffect" text="Show effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTN4Showeffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4ShowEffectDuration" runat="server" resourcekey="lblLightboxShowEffectDuration" text="Show effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTN4TooltipShowDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth20" runat="server" controltovalidate="tbSlideShowTN4TooltipShowDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTN4Settings"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth20" runat="server" controltovalidate="tbSlideShowTN4TooltipShowDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTN4Settings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4ShowHideEffect" runat="server" resourcekey="lblLightboxShowHideEffect" text="Hide effect:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTN4HideEffect" runat="server">
											<asp:listitem resourcekey="fade" value="fade">Fade</asp:listitem>
											<asp:listitem resourcekey="slide" value="slide">Slide</asp:listitem>
											<asp:listitem resourcekey="grow" value="grow">Grow</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4HideEffectDuration" runat="server" resourcekey="lblLightboxHideEffectDuration" text="Hide effect duration (ms):"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTN4TooltipHideDuration" runat="server" width="53px">500</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth21" runat="server" controltovalidate="tbSlideShowTN4TooltipHideDuration" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTNSettings4"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth21" runat="server" controltovalidate="tbSlideShowTN4TooltipHideDuration" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTNSettings4">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4TooltipBorder" runat="server" resourcekey="lblLightboxTooltipBorder" text="Border:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTN4TooltipBorder" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth22" runat="server" controltovalidate="tbSlideShowTN4TooltipBorder" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSSettings4"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth22" runat="server" controltovalidate="tbSlideShowTN4TooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSTNSettings4">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4TooltipCornerRadius" runat="server" resourcekey="lblLightboxTooltipCornerRadius" text="Corner radius:"></asp:label>
									</td>
									<td>
										<asp:textbox id="tbSlideShowTN4TooltipCornerRadius" runat="server" width="53px">5</asp:textbox>
										&nbsp;<asp:requiredfieldvalidator id="rfvImageCarouselImageWidth23" runat="server" controltovalidate="tbSlideShowTN4TooltipCornerRadius" display="Dynamic" errormessage="This field is required." resourcekey="rfvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" validationgroup="vgSSTNSettings4"></asp:requiredfieldvalidator>
										<asp:comparevalidator id="cvImageCarouselImageWidth23" runat="server" controltovalidate="tbSlideShowTN4TooltipCornerRadius" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvImageCarouselImageWidthResource1.ErrorMessage"
											setfocusonerror="True" type="Integer" validationgroup="vgSSSettings">
										</asp:comparevalidator>
									</td>
								</tr>
								<tr>
									<td class="style85">
										<asp:label id="lblSlideShowTN4TooltipTheme" runat="server" resourcekey="lblLightboxTooltipTheme" text="Select theme:"></asp:label>
									</td>
									<td>
										<asp:dropdownlist id="ddlSlideShowTN4TooltipTheme" runat="server">
											<asp:listitem resourcekey="cream" value="cream">Yellow</asp:listitem>
											<asp:listitem resourcekey="dark" value="dark">Dark</asp:listitem>
											<asp:listitem resourcekey="green" value="green">Green</asp:listitem>
											<asp:listitem resourcekey="light" value="light">Light</asp:listitem>
											<asp:listitem resourcekey="red" value="red">Red</asp:listitem>
											<asp:listitem resourcekey="blue" value="blue">Blue</asp:listitem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4OpenMediaUrl" ResourceKey="lblSlideShowThumbnailsOpenMediaUrl" runat="server" HelpText="On image click dont open image in lightbox, but open Media Url link." Text="On click go to Media Url:" HelpKey="lblSlideShowThumbnailsOpenMediaUrl.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4OpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbSlideShowThumbnails4OpenMediaUrl_CheckedChanged" resourcekey="cbSlideShowThumbnailsOpenMediaUrlResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4OpenMediaUrlNewWindow" ResourceKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow" runat="server" HelpText="Open link in new window:" Text="Open link in new window:" HelpKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSSTN4OpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbSSTNOpenMediaUrlNewWindowResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ImageWidth" ResourceKey="lblSlideShowThumbnailsImageWidth" runat="server" ControlName="tbSSTBWidth" HelpText="Set the width of main image panel:" Text="Image width:" HelpKey="lblSlideShowThumbnailsImageWidth.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTB4Width" runat="server" validationgroup="vgSSTNSettings4" width="55px" resourcekey="tbSSTBWidthResource1">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsImageWidth0" runat="server" controltovalidate="tbSSTB4Width" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSSTNWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails4ImageWidth" runat="server" controltovalidate="tbSSTB4Width" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4" resourcekey="cvSlideShowThumbnailsImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ImageHeight" ResourceKey="lblSlideShowThumbnailsImageHeight" runat="server" Text="Image height:" ControlName="tbSSTHHeight" HelpText="Set the height of main image panel:" HelpKey="lblSlideShowThumbnailsImageHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTH4Height" runat="server" validationgroup="vgSSTNSettings4" width="55px" resourcekey="tbSSTHHeightResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsImageHeight0" runat="server" controltovalidate="tbSSTH4Height" errormessage="This field is required." validationgroup="vgSSTNSettings4" display="Dynamic" resourcekey="rfvSSTNHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsImageHeight0" runat="server" controltovalidate="tbSSTH4Height" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4" resourcekey="cvSlideShowThumbnailsImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ThumbWidth" ResourceKey="lblSlideShowThumbnailsThumbWidth" runat="server" Text="Thumbnail width:" HelpText="Set the width of thumbnail image in filmstrip:" ControlName="tbSSTHumbwidth" HelpKey="lblSlideShowThumbnailsThumbWidth.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSS4THumbwidth" runat="server" validationgroup="vgSSTNSettings4" width="55px" resourcekey="tbSSTHumbwidthResource1">80</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsThumbWidth0" runat="server" controltovalidate="tbSS4THumbwidth" errormessage="This field is required." validationgroup="vgSSTNSettings4" display="Dynamic" resourcekey="rfvSlideShowThumbnailsThumbWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsThumbWidth0" runat="server" controltovalidate="tbSS4THumbwidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4" resourcekey="cvSlideShowThumbnailsThumbWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnailsThumbHeight0" ResourceKey="lblSlideShowThumbnailsThumbHeight" runat="server" Text="Thumbnail height:" ControlName="tbSSTHumbHeight" HelpText="Set the height of thumbnail image in filmstrip:" HelpKey="lblSlideShowThumbnailsThumbHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSS4THumbHeight" runat="server" validationgroup="vgSSTNSettings4" width="55px" resourcekey="tbSSTHumbHeightResource1" onprerender="tbSS4THumbHeight_PreRender">80</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails4ThumnHeight" runat="server" controltovalidate="tbSS4THumbHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSlideShowThumbnailsThumnHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsThumbHeight0" runat="server" controltovalidate="tbSS4THumbHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4" resourcekey="cvSlideShowThumbnailsThumbHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ProportionalImages" ResourceKey="lblSlideShowThumbnailsProportionalImages" runat="server" ControlName="tbSSTHumbHeight" HelpText="Proportionally resize images:" Text="Proportionally resize images:" HelpKey="lblSlideShowThumbnailsProportionalImages.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4ProportionalImages" runat="server" resourcekey="cbSlideShowThumbnailsProportionalImagesResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ThumbPosition" ResourceKey="lblSlideShowThumbnailsThumbPosition" runat="server" Text="Thumbnail position:" ControlName="rblSSTBThumbNailPosition" HelpText="Set the position of filmstrip with thumbnails:" HelpKey="lblSlideShowThumbnailsThumbPosition.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:radiobuttonlist id="rblSlideShowThumbnails4ThumbnailPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsThumbnailPositionResource1">
							<asp:listitem selected="True" value="top" resourcekey="ListItemResource34">Top</asp:listitem>
							<asp:listitem value="bottom" resourcekey="ListItemResource35">Bottom</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4TransparentThumbnails" ResourceKey="lblSlideShowThumbnailsTransparentThumbnails" runat="server" ControlName="rblSSTBThumbNailPosition" HelpText="Transparent thumbnail navigation:" Text="Transparent thumbnail navigation:"
							HelpKey="lblSlideShowThumbnailsTransparentThumbnails.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4TransparentThumbnails" runat="server" autopostback="True" oncheckedchanged="cbSlideShowThumbnails4TransparentThumbnails_CheckedChanged" resourcekey="cbSlideShowThumbnailsTransparentThumbnailsResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4TransitionTime" ResourceKey="lblSlideShowThumbnailsTransitionTime" runat="server" Text="Transition interval (ms):" ControlName="tbSSTBTransition" HelpText="Set the pause time between image transition in miliseconds:"
							HelpKey="lblSlideShowThumbnailsTransitionTime.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTB4Transition" runat="server" width="55px" validationgroup="vgSSTNSettings4" resourcekey="tbSSTBTransitionResource1">5000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsTransitionTime0" runat="server" controltovalidate="tbSSTB4Transition" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsTransitionTime0" runat="server" controltovalidate="tbSSTB4Transition" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4" resourcekey="cvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4TransitionSpeed" ResourceKey="lblSlideShowThumbnailsTransitionSpeed" runat="server" ControlName="tbSSTBTransitionSpeed" HelpText="Set the transition time in miliseconds:" Text="Transition speed (ms):" HelpKey="lblSlideShowThumbnailsTransitionSpeed.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTB4TransitionSpeed" runat="server" width="50px" resourcekey="tbSSTBTransitionSpeedResource1">800</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsTransitionSpeed0" runat="server" controltovalidate="tbSSTB4TransitionSpeed" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsTransitionSpeed0" runat="server" controltovalidate="tbSSTB4TransitionSpeed" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4"
							resourcekey="cvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4ShowPanel" ResourceKey="lblSlideShowThumbnailsShowPanel" runat="server" Text="Show main panel:" ControlName="cbSSTNMainPanel" HelpText="Set to show or hide main image panel:" HelpKey="lblSlideShowThumbnailsShowPanel.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4MainPanel" runat="server" oncheckedchanged="cbSlideShowThumbnails4MainPanel_CheckedChanged" autopostback="True" resourcekey="cbSlideShowThumbnailsMainPanelResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4Filmstrip" ResourceKey="lblSlideShowThumbnailsFilmstrip" runat="server" Text="Show filmstrip:" ControlName="cbSSTNFilmStrip" HelpText="Set to show or hide filmstrip:" HelpKey="lblSlideShowThumbnailsFilmstrip.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4FilmStrip" runat="server" oncheckedchanged="cbSSTNFilmStrip_CheckedChanged" resourcekey="cbSlideShowThumbnailsFilmStripResource1" checked="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4FilmStripSize" ResourceKey="lblSlideShowThumbnailsFilmStripSize" runat="server" ControlName="tbSSTNFilmStripSize" HelpText="Set the number of images in filmstrip:" Text="Number of images in filmstrip:" HelpKey="lblSlideShowThumbnailsFilmStripSize.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTN4FilmStripSize" runat="server" enabled="False" width="55px" validationgroup="vgSSTNSettings" resourcekey="tbSSTNFilmStripSizeResource1">4</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsFilmStripSize0" runat="server" controltovalidate="tbSSTN4FilmStripSize" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnailsFilmStripSize0" runat="server" controltovalidate="tbSSTN4FilmStripSize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTNSettings4"
							resourcekey="cvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4DisplayBorder" ResourceKey="lblSlideShowThumbnailsDisplayBorder" runat="server" ControlName="tbSSTNBorderSize" HelpText="Display border:" Text="Display border:" HelpKey="lblSlideShowThumbnailsDisplayBorder.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4DisplayBorder" runat="server" resourcekey="cbSlideShowThumbnailsDisplayBorderResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4BorderColor" ResourceKey="lblSlideShowThumbnailsBorderColor" runat="server" ControlName="tbSSTNBorderSize" HelpText="Set the border color in rgb format with hex values:" Text="Border color (hex value RRGGBB):" HelpKey="lblSlideShowThumbnailsBorderColor.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbSSTB4BorderColor" runat="server" maxlength="6" validationgroup="vgSSTNSettings4" width="55px" resourcekey="tbSSTBBorderColorResource1">222222</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsBorderColor0" runat="server" controltovalidate="tbSSTB4BorderColor" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTNSettings4" resourcekey="rfvSlideShowThumbnailsBorderColorResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:regularexpressionvalidator id="revSlideShowThumbnailsBorderColor0" runat="server" controltovalidate="tbSSTB4BorderColor" errormessage="Please eneter hexadecimal color value." validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$"
							validationgroup="vgSSTNSettings4" resourcekey="revSlideShowThumbnailsBorderColorResource1.ErrorMessage">
						</asp:regularexpressionvalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails4RandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbSlideShowThumbnails4RandomizeMedia" runat="server" oncheckedchanged="cbSlideShowThumbnails4RandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label15" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlSSTN4MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblSSTN4MediaSort" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style48">
						<asp:button id="btnSlideShowThumbnails4Save" runat="server" onclick="btnSlideShowThumbnails4Save_Click" text="Save settings" validationgroup="vgSSTNSettings4" resourcekey="btnSlideShowThumbnailsSaveResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnSlideShowThumbnails4SaveClose" runat="server" onclick="btnSlideShowThumbnails4SaveClose_Click" text="Save &amp; Close" validationgroup="vgSSTNSettings4" resourcekey="btnSlideShowThumbnailsSaveCloseResource1" />
					</td>
					<td>
						<asp:label id="lblSlideShowThumbnails4Status" runat="server" width="120px" resourcekey="lblSlideShowThumbnailsStatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:panel id="pnlSSTN4Hidden" runat="server" enabled="False" visible="False">
							<asp:textbox id="tbSSTB4OveryOpacity" runat="server" resourcekey="tbSSTBOveryOpacityResource1" validationgroup="vgSSTNSettings4" width="55px">50</asp:textbox>
							<dnn:Label ID="lblSlideShowThumbnails4OverlayOpacity" runat="server" ControlName="tbSSTBOveryOpacity" HelpKey="lblSlideShowThumbnailsOverlayOpacity.HelpText" HelpText="Set the percentage of overlay opacity. Values between 0 and 100." ResourceKey="lblSlideShowThumbnailsOverlayOpacity"
								Text="Overlay opacity (0-100):" />
							<asp:rangevalidator id="rvSlideShowThumbnailsOverlayOpacity0" runat="server" controltovalidate="tbSSTB4OveryOpacity" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" resourcekey="rvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage"
								type="Integer" validationgroup="vgSSTNSettings4">
							</asp:rangevalidator>
							<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayOpacity0" runat="server" controltovalidate="tbSSTB4OveryOpacity" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage"
								validationgroup="vgSSTNSettings4">
							</asp:requiredfieldvalidator>
							<br />
							<dnn:Label ID="lblSlideShowThumbnails4OverlayTextColor" runat="server" ControlName="tbSSTBOverlayTextColor" HelpKey="lblSlideShowThumbnailsOverlayTextColor.HelpText" HelpText="Set the color of ovarlay text in rgb format with hex values:" ResourceKey="lblSlideShowThumbnailsOverlayTextColor"
								Text="Overlay text color (hex value RRGGBB):" />
							<asp:regularexpressionvalidator id="revSlideShowThumbnailsOverlayTextColor0" runat="server" controltovalidate="tbSSTB4OverlayTextColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage"
								validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTNSettings4">
							</asp:regularexpressionvalidator>
							<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayTextColor0" runat="server" controltovalidate="tbSSTB4OverlayTextColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage"
								validationgroup="vgSSTNSettings4">
							</asp:requiredfieldvalidator>
							<asp:textbox id="tbSSTB4OverlayTextColor" runat="server" maxlength="6" resourcekey="tbSSTBOverlayTextColorResource1" validationgroup="vgSSTNSettings" width="55px">111111</asp:textbox>
							<br />
							<dnn:Label ID="lblSlideShowThumbnails4OverlayColor" runat="server" ControlName="tbSSTBOverlayColor" HelpKey="lblSlideShowThumbnailsOverlayColor.HelpText" HelpText="Set the color of overlay in rgb format with hex values:" ResourceKey="lblSlideShowThumbnailsOverlayColor"
								Text="Overlay color (hex value RRGGBB):" />
							<asp:regularexpressionvalidator id="revSlideShowThumbnailsOverlayColor0" runat="server" controltovalidate="tbSSTB4OverlayColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
								validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTNSettings4">
							</asp:regularexpressionvalidator>
							<asp:requiredfieldvalidator id="rfvSlideShowThumbnailsOverlayColor0" runat="server" controltovalidate="tbSSTB4OverlayColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
								validationgroup="vgSSTNSettings4">
							</asp:requiredfieldvalidator>
							<asp:textbox id="tbSSTB4OverlayColor" runat="server" maxlength="6" resourcekey="tbSSTBOverlayColorResource1" width="50px">eeeeee</asp:textbox>
							<br />
							<dnn:Label ID="lblSlideShowThumbnails4OvlerlayPosition" runat="server" ControlName="rblSSTBOverlayPosition" HelpKey="lblSlideShowThumbnailsOvlerlayPosition.HelpText" HelpText="Set the position of overlay for title and description:" ResourceKey="lblSlideShowThumbnailsOvlerlayPosition"
								Text="Overlay position:" />
							<asp:radiobuttonlist id="rblSlideShowThumbnails4OverlayPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsOverlayPositionResource1">
								<asp:listitem resourcekey="ListItemResource32" selected="True" value="top">Top</asp:listitem>
								<asp:listitem resourcekey="ListItemResource33" value="bottom">Bottom</asp:listitem>
							</asp:radiobuttonlist>
						</asp:panel>
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlSSthumbs2" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlSSthumbsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblSlideshowWithThumbnails2" resourcekey="lblSlideshowWithThumbnails2" runat="server" cssclass="settingsdetailtitle" text="Slideshow with thumbnails 2"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSSthumbnails2TemplateSelect" runat="server" ResourceKey="lblSSthumbnails2TemplateSelect" HelpText="Select the control viewer template:" Text="Select template:" HelpKey="lblSSthumbnails2TemplateSelect.HelpText" />
					</td>
					<td>
						<asp:dropdownlist id="ddlSSThumbnails2TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlSSThumbnails2TemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSSthumbnails2ThemeSelect" runat="server" HelpKey="lblSSthumbnails2ThemeSelect.HelpText" HelpText="Select CSS theme:" ResourceKey="lblSSthumbnails2ThemeSelect" Text="Sleect theme:" />
					</td>
					<td>
						<asp:dropdownlist id="ddlSSTN2ThemeSelect" runat="server" resourcekey="ddlSSThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						<asp:label id="lblSSthumbnails2TemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ShowTitle" ResourceKey="lblSlideShowThumbnails2ShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblSlideShowThumbnails2ShowTitle.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2ShowTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ShowDescription" ResourceKey="lblSlideShowThumbnails2ShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblSlideShowThumbnails2ShowDescription.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2ShowDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ShowMediaTitle" ResourceKey="lblSlideShowThumbnails2ShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblSlideShowThumbnails2ShowMediaTitle.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2ShowMediaTitle" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ShowMediaDescription" ResourceKey="lblSlideShowThumbnails2ShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblSlideShowThumbnails2ShowMediaDescription.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2ShowMediaDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowMediaDescriptionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ImageWidth" ResourceKey="lblSlideShowThumbnails2ImageWidth" runat="server" Text="Image width:" ControlName="tbSSTBWidth" HelpText="Set the width of main image panel:" HelpKey="lblSlideShowThumbnails2ImageWidth.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbSSTB2Width" runat="server" validationgroup="vgSSTN2Settings" width="55px" resourcekey="tbSSTBWidthResource1">500</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2ImageWidth" runat="server" controltovalidate="tbSSTB2Width" errormessage="This field is required." validationgroup="vgSSTN2Settings" display="Dynamic" resourcekey="rfvSSTNWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2ImageWidth" runat="server" controltovalidate="tbSSTB2Width" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTN2Settings" resourcekey="cvSlideShowThumbnailsImageWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ImageHeight" ResourceKey="lblSlideShowThumbnails2ImageHeight" runat="server" Text="Image height:" HelpText="Set the height of main image panel:" ControlName="tbSSTHHeight" HelpKey="lblSlideShowThumbnails2ImageHeight.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbSSTH2Height" runat="server" validationgroup="vgSSTN2Settings" width="55px" resourcekey="tbSSTHHeightResource1">500</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2ImageHeight" runat="server" controltovalidate="tbSSTH2Height" errormessage="This field is required." validationgroup="vgSSTN2Settings" display="Dynamic" resourcekey="rfvSSTNHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2ImageHeight" runat="server" controltovalidate="tbSSTH2Height" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTN2Settings" resourcekey="cvSlideShowThumbnailsImageHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ThumbWidth" ResourceKey="lblSlideShowThumbnails2ThumbWidth" runat="server" Text="Thumbnail width:" ControlName="tbSSTHumbwidth" HelpText="Set the width of thumbnail image in filmstrip:" HelpKey="lblSlideShowThumbnails2ThumbWidth.HelpText"></dnn:Label>
					</td>
					<td>
						<asp:textbox id="tbSS2THumbwidth" runat="server" validationgroup="vgSSTN2Settings" width="55px" resourcekey="tbSSTHumbwidthResource1">75</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2ThumbWidth" runat="server" controltovalidate="tbSS2THumbwidth" display="Dynamic" errormessage="This field is required." validationgroup="vgSSTN2Settings" resourcekey="rfvSlideShowThumbnailsThumbWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2ThumbWidth" runat="server" controltovalidate="tbSS2THumbwidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSSTN2Settings" resourcekey="cvSlideShowThumbnailsThumbWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ThumbHeight" ResourceKey="lblSlideShowThumbnails2ThumbHeight" runat="server" ControlName="tbSSTHumbHeight" HelpText="Set the height of thumbnail image:" Text="Thumbnail height:" HelpKey="lblSlideShowThumbnails2ThumbHeight.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbSS2THumbHeight" runat="server" resourcekey="tbSSTHumbHeightResource1" validationgroup="vgSSTN2Settings" width="55px">75</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2ThumnHeight" runat="server" controltovalidate="tbSS2THumbHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsThumnHeightResource1.ErrorMessage"
							validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2ThumbHeight" runat="server" controltovalidate="tbSS2THumbHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsThumbHeightResource1.ErrorMessage"
							type="Integer" validationgroup="vgSSTN2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ProportionalImages" runat="server" ControlName="tbSSTHumbHeight" HelpKey="lblSlideShowThumbnails2ProportionalImages.HelpText" HelpText="Proportionally resize images:" ResourceKey="lblSlideShowThumbnails2ProportionalImages"
							Text="Proportionally resize images:" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2ProportionalImages" runat="server" resourcekey="cbSlideShowThumbnailsProportionalImagesResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2FilmStripSize" runat="server" HelpKey="lblSlideShowThumbnails2FilmStripSize.HelpText" HelpText="Set the number of thumbnails per page:" ResourceKey="lblSlideShowThumbnails2FilmStripSize" Text="Number of thumbnails:"
							ControlName="tbSSTNFilmStripSize" />
					</td>
					<td>
						<asp:textbox id="tbSSTN2FilmStripSize" runat="server" resourcekey="tbSSTNFilmStripSizeResource1" validationgroup="vgSSTN2Settings" width="55px">9</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2FilmStripSize" runat="server" controltovalidate="tbSSTNFilmStripSize" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage"
							validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2FilmStripSize" runat="server" controltovalidate="tbSSTNFilmStripSize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsFilmStripSizeResource1.ErrorMessage"
							type="Integer" validationgroup="vgSSTN2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2TransitionTime" runat="server" HelpKey="lblSlideShowThumbnailsTransitionTime.HelpText" HelpText="Set the pause time between image transition in miliseconds:" ResourceKey="lblSlideShowThumbnailsTransitionTime" Text="Transition interval (ms):" />
					</td>
					<td>
						<asp:textbox id="tbSSTB2Transition" runat="server" resourcekey="tbSSTBTransitionResource1" validationgroup="vgSSTN2Settings" width="55px">2000</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2TransitionTime" runat="server" controltovalidate="tbSSTB2Transition" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage"
							validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2TransitionTime" runat="server" controltovalidate="tbSSTB2Transition" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsTransitionTimeResource1.ErrorMessage"
							type="Integer" validationgroup="vgSSTN2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2TransitionSpeed" runat="server" ControlName="tbSSTBTransitionSpeed" HelpKey="lblSlideShowThumbnails2TransitionSpeed.HelpText" HelpText="Set the transition time in miliseconds:" ResourceKey="lblSlideShowThumbnails2TransitionSpeed"
							Text="Transition speed (ms):" />
					</td>
					<td>
						<asp:textbox id="tbSSTB2TransitionSpeed" runat="server" resourcekey="tbSSTBTransitionSpeedResource1" validationgroup="vgSSTN2Settings" width="50px">800</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2TransitionSpeed" runat="server" controltovalidate="tbSSTB2TransitionSpeed" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage"
							validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvSlideShowThumbnails2TransitionSpeed" runat="server" controltovalidate="tbSSTB2TransitionSpeed" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsTransitionSpeedResource1.ErrorMessage"
							type="Integer" validationgroup="vgSSTN2Settings">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2ThumbPosition" runat="server" ControlName="rblSSTBThumbNailPosition" HelpKey="lblSlideShowThumbnails2ThumbPosition.HelpText" HelpText="Set the position of thumbnail paging:" Text="Thumbnail paging position:" ResourceKey="lblSlideShowThumbnails2ThumbPosition" />
					</td>
					<td>
						<asp:radiobuttonlist id="rblSlideShowThumbnails2ThumbnailPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsThumbnailPositionResource1">
							<asp:listitem resourcekey="ListItemResource34" selected="True" value="top">Top</asp:listitem>
							<asp:listitem resourcekey="ListItemResource35" value="bottom">Bottom</asp:listitem>
							<asp:listitem resourcekey="ListItemResourceTaB" value="tab">Top and bottom</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblSlideShowThumbnails2RandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td>
						<asp:checkbox id="cbSlideShowThumbnails2RandomizeMedia" runat="server" oncheckedchanged="cbSlideShowThumbnails2RandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="Label4" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style91">
						<asp:dropdownlist id="ddlSSTN2MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblSSTN2MediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td>
						<asp:button id="btnSlideShowThumbnails2Save" runat="server" onclick="btnSlideShowThumbnails2Save_Click" resourcekey="btnSlideShowThumbnailsSaveResource1" text="Save settings" validationgroup="vgSSTN2Settings" />
						&nbsp;<asp:button id="btnSlideShowThumbnails2SaveClose" runat="server" onclick="btnSlideShowThumbnails2SaveClose_Click" resourcekey="btnSlideShowThumbnailsSaveCloseResource1" text="Save &amp; Close" validationgroup="vgSSTN2Settings" />
						&nbsp;<asp:label id="lblSlideShowThumbnails2Status" runat="server" resourcekey="lblSlideShowThumbnailsStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
			</table>
			<asp:panel id="pnlSSsettings" runat="server" visible="False">
				<table align="center" cellpadding="2" cellspacing="2" width="80%">
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOvlerlayPosition0" runat="server" ControlName="rblSSTBOverlayPosition" HelpKey="lblSlideShowThumbnailsOvlerlayPosition.HelpText" HelpText="Set the position of overlay for title and description:" ResourceKey="lblSlideShowThumbnailsOvlerlayPosition"
								Text="Overlay position:" />
						</td>
						<td colspan="2">
							<asp:radiobuttonlist id="rblSlideShowThumbnails2OverlayPosition" runat="server" repeatdirection="Horizontal" resourcekey="rblSlideShowThumbnailsOverlayPositionResource1">
								<asp:listitem resourcekey="ListItemResource32" selected="True" value="top">Top</asp:listitem>
								<asp:listitem resourcekey="ListItemResource33" value="bottom">Bottom</asp:listitem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOverlaySize0" runat="server" ControlName="tbSSTBOverlaySize" HelpKey="lblSlideShowThumbnailsOverlaySize.HelpText" HelpText="Set the size of overlay in pixels:" ResourceKey="lblSlideShowThumbnailsOverlaySize" Text="Overlay size (px):" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbSSTB2OverlaySize" runat="server" resourcekey="tbSSTBOverlaySizeResource1" validationgroup="vgSSTN2Settings" width="55px">20</asp:textbox>
							&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2OverlaySize" runat="server" controltovalidate="tbSSTB2OverlaySize" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage"
								validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
							<asp:comparevalidator id="cvSlideShowThumbnails2OverlaySize" runat="server" controltovalidate="tbSSTB2OverlaySize" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvSlideShowThumbnailsOverlaySizeResource1.ErrorMessage"
								type="Integer" validationgroup="vgSSTN2Settings">
							</asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOverlayOpacity0" runat="server" ControlName="tbSSTBOveryOpacity" HelpKey="lblSlideShowThumbnailsOverlayOpacity.HelpText" HelpText="Set the percentage of overlay opacity. Values between 0 and 100." ResourceKey="lblSlideShowThumbnailsOverlayOpacity"
								Text="Overlay opacity (0-100):" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbSSTB2OveryOpacity" runat="server" resourcekey="tbSSTBOveryOpacityResource1" validationgroup="vgSSTN2Settings" width="55px">20</asp:textbox>
							&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2OverlayOpacity" runat="server" controltovalidate="tbSSTB2OveryOpacity" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage"
								validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
							<asp:rangevalidator id="rvSlideShowThumbnails2OverlayOpacity" runat="server" controltovalidate="tbSSTB2OveryOpacity" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" resourcekey="rvSlideShowThumbnailsOverlayOpacityResource1.ErrorMessage"
								type="Integer" validationgroup="vgSSTN2Settings">
							</asp:rangevalidator>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOverlayTextColor0" runat="server" ControlName="tbSSTBOverlayTextColor" HelpKey="lblSlideShowThumbnailsOverlayTextColor.HelpText" HelpText="Set the color of ovarlay text in rgb format with hex values:" ResourceKey="lblSlideShowThumbnailsOverlayTextColor"
								Text="Overlay text color (hex value RRGGBB):" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbSSTB2OverlayTextColor" runat="server" maxlength="6" resourcekey="tbSSTBOverlayTextColorResource1" validationgroup="vgSSTN2Settings" width="55px">20</asp:textbox>
							&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2OverlayTextColor" runat="server" controltovalidate="tbSSTBOverlayTextColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage"
								validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="revSlideShowThumbnails2OverlayTextColor" runat="server" controltovalidate="tbSSTBOverlayTextColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsOverlayTextColorResource1.ErrorMessage"
								validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTN2Settings">
							</asp:regularexpressionvalidator>
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOverlayColor0" runat="server" ControlName="tbSSTBOverlayColor" HelpKey="lblSlideShowThumbnailsOverlayColor.HelpText" HelpText="Set the color of overlay in rgb format with hex values:" ResourceKey="lblSlideShowThumbnailsOverlayColor"
								Text="Overlay color (hex value RRGGBB):" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbSSTB2OverlayColor" runat="server" maxlength="6" resourcekey="tbSSTBOverlayColorResource1" validationgroup="vgSSTN2Settings" width="50px">eeeeee</asp:textbox>
							<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2OverlayColor" runat="server" controltovalidate="tbSSTBOverlayColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
								validationgroup="vgSSTN2Settings">
							</asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="revSlideShowThumbnails2OverlayColor" runat="server" controltovalidate="tbSSTBOverlayColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsOverlayColorResource1.ErrorMessage"
								validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$" validationgroup="vgSSTN2Settings">
							</asp:regularexpressionvalidator>
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsTransparentThumbnails0" runat="server" ControlName="rblSSTBThumbNailPosition" HelpKey="lblSlideShowThumbnailsTransparentThumbnails.HelpText" HelpText="Transparent thumbnail navigation:" ResourceKey="lblSlideShowThumbnailsTransparentThumbnails"
								Text="Transparent thumbnail navigation:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2TransparentThumbnails" runat="server" autopostback="True" oncheckedchanged="cbSSTBTransparentThumbnails_CheckedChanged" resourcekey="cbSlideShowThumbnailsTransparentThumbnailsResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsShowPanel0" runat="server" ControlName="cbSSTNMainPanel" HelpKey="lblSlideShowThumbnailsShowPanel.HelpText" HelpText="Set to show or hide main image panel:" ResourceKey="lblSlideShowThumbnailsShowPanel" Text="Show main panel:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2MainPanel" runat="server" autopostback="True" oncheckedchanged="cbSSTNMainPanel_CheckedChanged" resourcekey="cbSlideShowThumbnailsMainPanelResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsFilmstrip0" runat="server" ControlName="cbSSTNFilmStrip" HelpKey="lblSlideShowThumbnailsFilmstrip.HelpText" HelpText="Set to show or hide filmstrip:" ResourceKey="lblSlideShowThumbnailsFilmstrip" Text="Show filmstrip:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2FilmStrip" runat="server" oncheckedchanged="cbSSTNFilmStrip_CheckedChanged" resourcekey="cbSlideShowThumbnailsFilmStripResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsDisplayBorder0" runat="server" ControlName="tbSSTNBorderSize" HelpKey="lblSlideShowThumbnailsDisplayBorder.HelpText" HelpText="Display border:" ResourceKey="lblSlideShowThumbnailsDisplayBorder" Text="Display border:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2DisplayBorder" runat="server" resourcekey="cbSlideShowThumbnailsDisplayBorderResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsBorderColor0" runat="server" ControlName="tbSSTNBorderSize" HelpKey="lblSlideShowThumbnailsBorderColor.HelpText" HelpText="Set the border color in rgb format with hex values:" ResourceKey="lblSlideShowThumbnailsBorderColor"
								Text="Border color (hex value RRGGBB):" />
						</td>
						<td colspan="2">
							<asp:textbox id="tbSSTB2BorderColor" runat="server" maxlength="6" resourcekey="tbSSTBBorderColorResource1" validationgroup="vgSSTN2Settings" width="55px">222222</asp:textbox>
							&nbsp;<asp:requiredfieldvalidator id="rfvSlideShowThumbnails2BorderColor" runat="server" controltovalidate="tbSSTBBorderColor" display="Dynamic" errormessage="This field is required." resourcekey="rfvSlideShowThumbnailsBorderColorResource1.ErrorMessage"
								validationgroup="vgSSTN2Settings"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="revSlideShowThumbnails2BorderColor" runat="server" controltovalidate="tbSSTBBorderColor" errormessage="Please eneter hexadecimal color value." resourcekey="revSlideShowThumbnailsBorderColorResource1.ErrorMessage" validationexpression="^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$"
								validationgroup="vgSSTN2Settings">
							</asp:regularexpressionvalidator>
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOpenMediaUrlNewWindow0" runat="server" HelpKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow.HelpText" HelpText="Open link in new window:" ResourceKey="lblSlideShowThumbnailsOpenMediaUrlNewWindow" Text="Open link in new window:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSSTN2OpenMediaUrlNewWindow" runat="server" enabled="False" resourcekey="cbSSTNOpenMediaUrlNewWindowResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							<dnn:Label ID="lblSlideShowThumbnailsOpenMediaUrl0" runat="server" HelpKey="lblSlideShowThumbnailsOpenMediaUrl.HelpText" HelpText="On image click dont open image in lightbox, but open Media Url link." ResourceKey="lblSlideShowThumbnailsOpenMediaUrl" Text="On click go to Media Url:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2OpenMediaUrl" runat="server" autopostback="True" oncheckedchanged="cbSlideShowThumbnails2OpenMediaUrl_CheckedChanged" resourcekey="cbSlideShowThumbnailsOpenMediaUrlResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;<dnn:Label ID="lblSlideShowThumbnailsShowLightboxDescription0" runat="server" HelpKey="lblSlideShowThumbnailsShowLightboxDescription.HelpText" HelpText="Show media description in lightbox:" ResourceKey="lblSlideShowThumbnailsShowLightboxDescription"
								Text="Show media description in lightbox:" />
						</td>
						<td colspan="2">
							<asp:checkbox id="cbSlideShowThumbnails2ShowLightBoxDescription" runat="server" resourcekey="cbSlideShowThumbnailsShowLightBoxDescriptionResource1" />
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td class="style48">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style70">
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
				</table>
			</asp:panel>
		</div>
	</asp:panel>
	<asp:panel id="pnlFlashGalSettings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlFlashGalSettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblFlashTabGallerySettings" runat="server" cssclass="settingsdetailtitle" text="Flash Tab Gallery display settings" resourcekey="lblFlashTabGallerySettingsResource1"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlCategorySelect" runat="server" autopostback="True" datasourceid="odsGetCategories" datatextfield="CategoryName" datavaluefield="CategoryID" visible="False" resourcekey="ddlCategorySelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabSelectCategory" ResourceKey="lblFlashTabSelectCategory" runat="server" Text="Display category:" ControlName="ddlCategorySelect" HelpText="Select to display category or to display just one gallery:" HelpKey="lblFlashTabSelectCategory.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbFlashTabSelectCategory" runat="server" resourcekey="cbFlashTabSelectCategoryResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabGalleryWidth" ResourceKey="lblFlashTabGalleryWidth" runat="server" Text="Gallery width:" ControlName="tbPanelImageWidth" HelpText="Set the width of flash gallery. Recommended width is 800 px:" HelpKey="lblFlashTabGalleryWidth.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbPanelImageWidth" runat="server" validationgroup="vgFlashGallery" width="50px" resourcekey="tbPanelImageWidthResource1">
						</asp:textbox>
						&nbsp;
						<asp:requiredfieldvalidator id="rfvFlashTabGalleryWidth" runat="server" controltovalidate="tbPanelImageWidth" errormessage="This filed is required." validationgroup="vgFlashGallery" display="Dynamic" resourcekey="rfvFlashTabGalleryWidthResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvFlashTabGalleryWidth" runat="server" controltovalidate="tbPanelImageWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSlider" resourcekey="cvFlashTabGalleryWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabGalleryHeight" ResourceKey="lblFlashTabGalleryHeight" runat="server" Text="Gallery height:" ControlName="tbPanelImageHeight" HelpText="Set the height of flash gallery:" HelpKey="lblFlashTabGalleryHeight.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbPanelImageHeight" runat="server" width="50px" validationgroup="vgFlashGallery" resourcekey="tbPanelImageHeightResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvFlashTabGalleryHeight" runat="server" controltovalidate="tbPanelImageHeight" display="Dynamic" errormessage="This filed is required." validationgroup="vgFlashGallery" resourcekey="rfvFlashTabGalleryHeightResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvFlashTabGalleryHeight" runat="server" controltovalidate="tbPanelImageHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgSlider" resourcekey="cvFlashTabGalleryHeightResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabGalleryTheme" ResourceKey="lblFlashTabGalleryTheme" runat="server" HelpText="Select Flash Tab Gallery theme:" Text="Select theme:" HelpKey="lblFlashTabGalleryTheme.HelpText" />
					</td>
					<td colspan="2">
						<asp:dropdownlist id="ddlFlashGalTheme" runat="server" resourcekey="ddlFlashGalThemeResource1">
							<asp:listitem value="gallery_black.swf" resourcekey="ListItemResource36">Black</asp:listitem>
							<asp:listitem value="gallery_white.swf" resourcekey="ListItemResource37">White</asp:listitem>
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabLinkText" ResourceKey="lblFlashTabLinkText" runat="server" Text="Flash link text:" ControlName="tbFlashLinkText" HelpText="Set the text for link to open flash gallery:" HelpKey="lblFlashTabLinkText.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:textbox id="tbFlashLinkText" runat="server" width="400px" resourcekey="tbFlashLinkTextResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabEmbedFlash" ResourceKey="lblFlashTabEmbedFlash" runat="server" Text="Embed flash:" ControlName="cbFlashEmbedInPage" HelpText="Set this if you want the flash gallery to be embeded in page:" HelpKey="lblFlashTabEmbedFlash.HelpText"></dnn:Label>
					</td>
					<td colspan="2">
						<asp:checkbox id="cbFlashTabEmbedInPage" runat="server" checked="True" resourcekey="cbFlashTabEmbedInPageResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabGeteranteLink" ResourceKey="lblFlashTabGeteranteLink" runat="server" ControlName="cbFlashGenerateLinkCode" HelpText="Set this if you want link generated to be embeded in html:" Text="Generate link code:" HelpKey="lblFlashTabGeteranteLink.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbFlashTabGenerateLinkCode" runat="server" resourcekey="cbFlashTabGenerateLinkCodeResource1" />
					</td>
				</tr>
				<tr>
					<td class="style70">
						<dnn:Label ID="lblFlashTabDontShow" ResourceKey="lblFlashTabDontShow" runat="server" ControlName="cbFlashDontShowGallery" HelpText="This will not show main gallery. Use this if you have link embeded in html:" Text="Do not show main gallery: " HelpKey="lblFlashTabDontShow.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbFlashTabDontShowGallery" runat="server" resourcekey="cbFlashTabDontShowGalleryResource1" />
					</td>
				</tr>
				<tr>
					<td class="style24">
					</td>
					<td class="style25" colspan="2">
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						<asp:textbox id="tbFlashGenereteLink" runat="server" height="150px" textmode="MultiLine" width="400px" resourcekey="tbFlashGenereteLinkResource1">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td class="style54">
						<asp:button id="btnFlashTabSaveSettings" runat="server" onclick="btnFlashSettings_Click" text="Save settings" validationgroup="vgFlashGallery" width="140px" resourcekey="btnFlashTabSaveSettingsResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnFlashTabSaveClose" runat="server" onclick="btnFGSaveClose_Click" text="Save &amp; Close" width="140px" validationgroup="vgFlashGallery" resourcekey="btnFlashTabSaveCloseResource1" />
					</td>
					<td>
						<asp:label id="lblFlashTabStatus" runat="server" width="120px" resourcekey="lblFlashTabStatusResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style70">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlAudioGallerySettings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlAudioGallerySettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblAudioGalleryDisplaySettins" resourcekey="AudioGalleryTitle" runat="server" text="Audio gallery display settings" cssclass="settingsdetailtitle"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style104">
						&nbsp;
					</td>
					<td class="style46" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryThemeSelect" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblAudioGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblAudioGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style46" colspan="2">
						<asp:dropdownlist id="ddlAGThemeSelect" runat="server" resourcekey="ddlAGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryShowTitle" runat="server" HelpKey="lblAudioGalleryShowTitle.HelpText" HelpText="Show gallery title:" ResourceKey="lblAudioGalleryShowTitle" Text="Show gallery title:" />
					</td>
					<td class="style46" colspan="2">
						<asp:checkbox id="cbAudioGalleryShowTitle" runat="server" resourcekey="cbAudioGalleryShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryShowDescription" ResourceKey="lblAudioGalleryShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblAudioGalleryShowDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGalleryShowDescrition" runat="server" resourcekey="cbAudioGalleryShowDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryShowMediaTitle" ResourceKey="lblAudioGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblAudioGalleryShowMediaTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGalleryShowMediaTitle" runat="server" resourcekey="cbAudioGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryShowMediaDescription" ResourceKey="lblAudioGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblAudioGalleryShowMediaDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGalleryShowMediaDescrition" runat="server" resourcekey="cbAudioGalleryShowMediaDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryPlayOnLoad" ResourceKey="lblAudioGalleryPlayOnLoad" runat="server" HelpText="Start playing audio file on page load:" Text="Play on load:" HelpKey="lblAudioGalleryPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGalleryPlayOnLoad" runat="server" resourcekey="cbAudioGalleryPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryItemsPrePage" ResourceKey="lblAudioGalleryItemsPrePage" runat="server" ControlName="tbAGSNumberOfItems" HelpText="Set the number of items per page:" Text="Number of items per page:" HelpKey="lblAudioGalleryItemsPrePage.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAGSNumberOfItems" runat="server" validationgroup="vgAGS" width="50px" resourcekey="tbAGSNumberOfItemsResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGalleryItemsPerPage" runat="server" controltovalidate="tbAGSNumberOfItems" display="Dynamic" errormessage="This field is required." validationgroup="vgAGS" resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGalleryItemsPerPage" runat="server" controltovalidate="tbAGSNumberOfItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAGS" resourcekey="cvAudioGalleryItemsPerPageResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryColumns" ResourceKey="lblAudioGalleryColumns" runat="server" ControlName="tbAGSNumberOfItems" HelpText="Set the number of columns:" Text="Number of columns:" HelpKey="lblAudioGalleryColumns.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAGSNumberOfColumns" runat="server" validationgroup="vgAGS" width="50px" resourcekey="tbAGSNumberOfColumnsResource1">1</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGalleryColumns" runat="server" controltovalidate="tbAGSNumberOfColumns" display="Dynamic" errormessage="This field is required." validationgroup="vgAGS" resourcekey="rfvAudioGalleryColumnsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGalleryColumns" runat="server" controltovalidate="tbAGSNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAGS" resourcekey="cvAudioGalleryColumnsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryPlayerWidth" ResourceKey="lblAudioGalleryPlayerWidth" runat="server" ControlName="tbAGSPlayerWidth" HelpText="Set the width of audio player in pixels. Minimum value is 300." Text="Player width (px):" HelpKey="lblAudioGalleryPlayerWidth.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAGSPlayerWidth" runat="server" validationgroup="vgAGS" width="50px" resourcekey="tbAGSPlayerWidthResource1">
						</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGalleryPlayerWidth" runat="server" controltovalidate="tbAGSPlayerWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgAGS" resourcekey="rfvAudioGalleryPlayerWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAudioGalleryPlayerWidth" runat="server" controltovalidate="tbAGSPlayerWidth" display="Dynamic" errormessage="Minimum player width is 90px." maximumvalue="10000" minimumvalue="90" type="Integer" validationgroup="vgAGS" resourcekey="rvAudioGalleryPlayerWidthResource1.ErrorMessage">
						</asp:rangevalidator>
						<asp:comparevalidator id="cvAudioGalleryPlayerWidth" runat="server" controltovalidate="tbAGSPlayerWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAGS" resourcekey="cvAudioGalleryPlayerWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryVolume" ResourceKey="lblAudioGalleryVolume" runat="server" ControlName="tbAudioGalleryPlayerVolume" HelpText="Audio volume:" Text="Audio volume:" HelpKey="lblAudioGalleryVolume.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAudioGalleryPlayerVolume" runat="server" validationgroup="vgAGS" width="50px" resourcekey="tbAudioGalleryPlayerVolumeResource1">100</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGalleryPlayerVolume" runat="server" controltovalidate="tbAudioGalleryPlayerVolume" display="Dynamic" errormessage="This field is required." validationgroup="vgAGS" resourcekey="rfvAudioGalleryPlayerVolumeResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAudioGalleryVolume" runat="server" controltovalidate="tbAudioGalleryPlayerVolume" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" type="Integer" validationgroup="vgAGS" resourcekey="rvAudioGalleryVolumeResource1.ErrorMessage">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryRandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGalleryRandomizeMedia" runat="server" oncheckedchanged="cbAudioGalleryRandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style104">
						<dnn:Label ID="Label13" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style103">
						<asp:dropdownlist id="ddlAudioGalleryMediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblAudioGalleryMediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style104">
						<dnn:Label ID="lblAudioShowDownloadLink" ResourceKey="lblAudioShowDownloadLink" runat="server" HelpText="Show download link:" Text="Show download link:" HelpKey="lblAudioShowDownloadLink.HelpText" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudioShowDownloadLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style104" valign="top">
						<dnn:Label ID="lblAudioGalleryShowSocialSharing" runat="server" HelpText="Show social sharing:" Text="Show social sharing:" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" ResourceKey="lblVideoGalleryShowSocialSharing" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudioGalleryShowSocialSharing" runat="server" autopostback="True" oncheckedchanged="cbAudioGalleryShowSocialSharing_CheckedChanged" />
						<asp:panel id="pnlAudioGallerySocialSharingOptions" runat="server">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVideoGallery2SSOptions1" runat="server" HelpText="Open/Close sharing on button click:" Text="Open on button click:" HelpKey="lblVideoGallerySSOptions.HelpText" ResourceKey="lblVideoGallerySSOptions" />
									</td>
									<td>
										<asp:checkbox id="cbAGSSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style104">
						<dnn:Label ID="lblAudioGalleryShowSocialSharing4" runat="server" HelpText="Show textbox that contains media link:" Text="Show media link:" HelpKey="lblVideoGalleryShowBackLink.HelpText" ResourceKey="lblVideoGalleryShowBackLink" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudioGalleryShowMediaLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
						<asp:label id="lblAudioGalleryStatus" runat="server" resourcekey="lblAudioGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td class="style51" colspan="2">
						<asp:button id="btnAudioGallerySave" runat="server" onclick="btnAGSSave_Click" text="Save settings" width="140px" validationgroup="vgAGS" resourcekey="btnAudioGallerySaveResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnAudioGallerySaveClose" runat="server" onclick="Button1_Click6" text="Save &amp; Close" width="140px" validationgroup="vgAGS" resourcekey="btnAudioGallerySaveCloseResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlStremingGallerySettings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlAudioGallerySettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblStremingGalleryDisplaySettins" resourcekey="lblStremingGalleryDisplaySettins" runat="server" text="Streaming gallery display settings" cssclass="settingsdetailtitle"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style104">
						&nbsp;
					</td>
					<td class="style46">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style104">
						<dnn:Label ID="lblStreamingTemplateSelect" runat="server" HelpKey="lblSSthumbnails2TemplateSelect.HelpText" HelpText="Select the control viewer template:" ResourceKey="lblSSthumbnails2TemplateSelect" Text="Select template:" />
					</td>
					<td class="style46">
						<asp:dropdownlist id="ddlSTreamingTemplateSelect" runat="server" onselectedindexchanged="ddlSSThumbnailsTemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblAudioGalleryThemeSelect0" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblAudioGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblAudioGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style46">
						<asp:dropdownlist id="ddlStreamingThemeSelect" runat="server" resourcekey="ddlAGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td class="style46">
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamingServerURL" runat="server" HelpText="Streaming RTMP server url:" Text="Streaming RTMP server url:" HelpKey="lblStreamingServerURL.HelpText" ResourceKey="lblStreamingServerURL" />
					</td>
					<td class="style46">
						<asp:textbox id="tbStreanigVideoRTMPurl" runat="server" width="500px">
						</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGalleryItemsPerPage1" runat="server" controltovalidate="tbStreanigVideoRTMPurl" display="Dynamic" errormessage="This field is required." resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage" validationgroup="vgstreamingSettings">
						</asp:requiredfieldvalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamingServerVideo" runat="server" HelpText="Streaming video:" Text="Streaming video:" HelpKey="lblStreamingServerVideo.HelpText" ResourceKey="lblStreamingServerVideo" />
					</td>
					<td class="style46">
						<asp:textbox id="tbStreanigVideoURL" runat="server" width="500px">
						</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGalleryItemsPerPage2" runat="server" controltovalidate="tbStreanigVideoURL" display="Dynamic" errormessage="This field is required." resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage" validationgroup="vgstreamingSettings">
						</asp:requiredfieldvalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblVideoStreamingEnterTitle" runat="server" HelpKey="lblVideoStreamingEnterTitle.HelpText" HelpText="Enter title:" Text="Enter title:" ResourceKey="lblVideoStreamingEnterTitle" />
					</td>
					<td class="style46">
						<asp:textbox id="tbRTMPTitle" runat="server" width="500px">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamingEnterDescription" runat="server" HelpText="Enter description:" Text="Enter description:" HelpKey="lblStreamingEnterDescription.HelpText" ResourceKey="lblStreamingEnterDescription" />
					</td>
					<td>
						<asp:textbox id="tbRTMPtDescription" runat="server" width="500px">
						</asp:textbox>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamingShowTitle" ResourceKey="lblAudioGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblAudioGalleryShowMediaTitle.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbStreamingShowMediaTitle" runat="server" resourcekey="cbAudioGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStremingShowDescription" ResourceKey="lblAudioGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblAudioGalleryShowMediaDescription.HelpText" />
					</td>
					<td>
						<asp:checkbox id="cbStreamingShowMediaDescrition" runat="server" resourcekey="cbAudioGalleryShowMediaDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamigVideoWidth" runat="server" HelpText="Streaming video width:" Text="Streaming video width:" HelpKey="lblStreamigVideoWidth.HelpText" ResourceKey="lblStreamigVideoWidth" />
					</td>
					<td>
						<asp:textbox id="tbStreamingWith" runat="server" validationgroup="vgstreamingSettings" width="50px" resourcekey="tbAGSNumberOfItemsResource1">600</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGalleryItemsPerPage0" runat="server" controltovalidate="tbStreamingWith" display="Dynamic" errormessage="This field is required." validationgroup="vgstreamingSettings" resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGalleryItemsPerPage0" runat="server" controltovalidate="tbStreamingWith" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgstreamingSettings" resourcekey="cvAudioGalleryItemsPerPageResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style105">
						<dnn:Label ID="lblStreamingHeight" runat="server" ControlName="tbAGSNumberOfItems" HelpText="Streaming video height:" Text="Streaming video height:" HelpKey="lblStreamingHeight.HelpText" ResourceKey="lblStreamingHeight" />
					</td>
					<td>
						<asp:textbox id="tbStreamingHeight" runat="server" validationgroup="vgstreamingSettings" width="50px" resourcekey="tbAGSNumberOfColumnsResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGalleryColumns0" runat="server" controltovalidate="tbStreamingHeight" display="Dynamic" errormessage="This field is required." validationgroup="vgstreamingSettings" resourcekey="rfvAudioGalleryColumnsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGalleryColumns0" runat="server" controltovalidate="tbStreamingHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgstreamingSettings" resourcekey="cvAudioGalleryColumnsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style107" valign="top">
						<dnn:Label ID="lblStremingShowSocialSharing" runat="server" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" HelpText="Show social sharing:" ResourceKey="lblVideoGalleryShowSocialSharing" Text="Show social sharing:" Visible="False" />
					</td>
					<td class="style108">
						<asp:checkbox id="cbStreamingShowSocialSharing" runat="server" oncheckedchanged="cbStreamingShowSocialSharing_CheckedChanged" autopostback="True" visible="False" />
						<asp:panel id="pnlStreamigSocialSharingOptions" runat="server" visible="False">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVideoGallery2SSOptions3" runat="server" HelpKey="lblVideoGallerySSOptions.HelpText" HelpText="Open/Close sharing on button click:" ResourceKey="lblVideoGallerySSOptions" Text="Open on button click:" />
									</td>
									<td>
										<asp:checkbox id="cbStreamigSSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td>
						<asp:label id="lblStreamingVideoStatus" runat="server" resourcekey="lblAudioGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td class="style51">
						<asp:button id="btnStreamingGallerySave" runat="server" onclick="btnStreamingGallerySave_Click" resourcekey="btnAudioGallerySaveResource1" text="Save settings" validationgroup="vgstreamingSettings" width="140px" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnStreamingGallerySaveClose" runat="server" onclick="btnStreamingGallerySaveClose_Click" resourcekey="btnAudioGallerySaveCloseResource1" text="Save &amp; Close" validationgroup="vgstreamingSettings" width="140px" />
					</td>
				</tr>
				<tr>
					<td class="style105">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlAudioGallery2Settings" runat="server" visible="False" backcolor="#EFEFEF" resourcekey="pnlAudioGallerySettingsResource1">
		<table cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div class="settingsdetailleft">
					</div>
				</td>
				<td style="background-color: #0ba2ce">
					<asp:label id="lblAudioGallery2DisplaySettins" runat="server" text="Audio gallery 2 display settings" cssclass="settingsdetailtitle" resourcekey="lblAudioGallery2DisplaySettins"></asp:label>
				</td>
				<td>
					<div class="settingsdetailright">
					</div>
				</td>
			</tr>
		</table>
		<div class="settingsdetailbgrd">
		</div>
		<div class="settingsdetailtable">
			<table cellpadding="2" cellspacing="2" align="center" width="80%">
				<tr>
					<td class="style99">
						&nbsp;
					</td>
					<td class="style46" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style99">
						<dnn:Label ID="lblAudioGallery2TemplateSelect" runat="server" HelpText="Select control template:" Text="Select control template:" HelpKey="lblAudioGallery2TemplateSelect.Text" ResourceKey="lblAudioGallery2TemplateSelect" />
					</td>
					<td class="style46" colspan="2">
						<asp:dropdownlist id="ddlAudioGallery2TemplateSelect" runat="server" autopostback="True" onselectedindexchanged="ddlAudioGallery2TemplateSelect_SelectedIndexChanged" resourcekey="ddlICThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style99">
						<dnn:Label ID="lblAudioGallery2ThemeSelect" runat="server" ControlName="ddlTGThemeSelect" HelpKey="lblAudioGalleryThemeSelect.HelpText" HelpText="Select the CSS theme file:" ResourceKey="lblAudioGalleryThemeSelect" Text="Select CSS:" />
					</td>
					<td class="style46" colspan="2">
						<asp:dropdownlist id="ddlAG2ThemeSelect" runat="server" resourcekey="ddlAGThemeSelectResource1">
						</asp:dropdownlist>
					</td>
				</tr>
				<tr>
					<td class="style99">
						&nbsp;
					</td>
					<td class="style46" colspan="2">
						<asp:label id="lblAudioGallery2TemplateInfo" runat="server"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowTitle" ResourceKey="lblAudioGalleryShowTitle" runat="server" HelpText="Show gallery title:" Text="Show gallery title:" HelpKey="lblAudioGalleryShowTitle.HelpText" />
					</td>
					<td class="style46" colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowTitle" runat="server" resourcekey="cbAudioGalleryShowTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowDescription" ResourceKey="lblAudioGalleryShowDescription" runat="server" HelpText="Show gallery description:" Text="Show gallery description:" HelpKey="lblAudioGalleryShowDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowDescrition" runat="server" resourcekey="cbAudioGalleryShowDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowMediaTitle" ResourceKey="lblAudioGalleryShowMediaTitle" runat="server" HelpText="Show media title:" Text="Show media title:" HelpKey="lblAudioGalleryShowMediaTitle.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowMediaTitle" runat="server" resourcekey="cbAudioGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowMediaDescription" ResourceKey="lblAudioGalleryShowMediaDescription" runat="server" HelpText="Show media description:" Text="Show media description:" HelpKey="lblAudioGalleryShowMediaDescription.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowMediaDescrition" runat="server" resourcekey="cbAudioGalleryShowMediaDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowMediaTitleThumnbail" runat="server" HelpText="Show media title in thumbnail:" Text="Show media title in thumbnail:" HelpKey="lblAudioGallery2ShowMediaTitleThumnbail.HelpText" ResourceKey="lblAudioGallery2ShowMediaTitleThumnbail" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowMediaTitleThumbnail" runat="server" resourcekey="cbAudioGalleryShowMediaTitleResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ShowMediaDescriptionThumbnail" runat="server" HelpText="Show media description in thumbnail:" Text="Show media description in thumbnail:" HelpKey="lblAudioGallery2ShowMediaDescriptionThumbnail.HelpText" ResourceKey="lblAudioGallery2ShowMediaDescriptionThumbnail" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowMediaDescritionThumbnail" runat="server" resourcekey="cbAudioGalleryShowMediaDescritionResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2PlayOnLoad" ResourceKey="lblAudioGalleryPlayOnLoad" runat="server" HelpText="Start playing audio file on page load:" Text="Play on load:" HelpKey="lblAudioGalleryPlayOnLoad.HelpText" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2PlayOnLoad" runat="server" resourcekey="cbAudioGalleryPlayOnLoadResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ItemsPrePage" ResourceKey="lblAudioGalleryItemsPrePage" runat="server" ControlName="tbAGSNumberOfItems" HelpText="Set the number of items per page:" Text="Number of items per page:" HelpKey="lblAudioGalleryItemsPrePage.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAG2SNumberOfItems" runat="server" validationgroup="vgAG2S" width="50px" resourcekey="tbAGSNumberOfItemsResource1">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGallery2ItemsPerPage" runat="server" controltovalidate="tbAG2SNumberOfItems" display="Dynamic" errormessage="This field is required." validationgroup="vgAG2S" resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGallery2ItemsPerPage" runat="server" controltovalidate="tbAG2SNumberOfItems" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAG2S" resourcekey="cvAudioGalleryItemsPerPageResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2Columns" ResourceKey="lblAudioGalleryColumns" runat="server" ControlName="tbAGSNumberOfItems" HelpText="Set the number of columns:" Text="Number of columns:" HelpKey="lblAudioGalleryColumns.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAG2SNumberOfColumns" runat="server" validationgroup="vgAG2S" width="50px" resourcekey="tbAGSNumberOfColumnsResource1">5</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGallery2Columns" runat="server" controltovalidate="tbAG2SNumberOfColumns" display="Dynamic" errormessage="This field is required." validationgroup="vgAG2S" resourcekey="rfvAudioGalleryColumnsResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGallery2Columns" runat="server" controltovalidate="tbAG2SNumberOfColumns" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAG2S" resourcekey="cvAudioGalleryColumnsResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2PlayerWidth" ResourceKey="lblAudioGalleryPlayerWidth" runat="server" ControlName="tbAGSPlayerWidth" HelpText="Set the width of audio player in pixels. Minimum value is 300." Text="Player width (px):" HelpKey="lblAudioGalleryPlayerWidth.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAG2SPlayerWidth" runat="server" validationgroup="vgAG2S" width="50px" resourcekey="tbAGSPlayerWidthResource1">400</asp:textbox>
						&nbsp;<asp:requiredfieldvalidator id="rfvAudioGallery2PlayerWidth" runat="server" controltovalidate="tbAG2SPlayerWidth" display="Dynamic" errormessage="This field is required." validationgroup="vgAG2S" resourcekey="rfvAudioGalleryPlayerWidthResource1.ErrorMessage"></asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAudioGallery2PlayerWidth" runat="server" controltovalidate="tbAG2SPlayerWidth" display="Dynamic" errormessage="Minimum player width is 90px." maximumvalue="10000" minimumvalue="90" type="Integer" validationgroup="vgAG2S" resourcekey="rvAudioGalleryPlayerWidthResource1.ErrorMessage">
						</asp:rangevalidator>
						<asp:comparevalidator id="cvAudioGallery2PlayerWidth" runat="server" controltovalidate="tbAG2SPlayerWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" type="Integer" validationgroup="vgAG2S" resourcekey="cvAudioGalleryPlayerWidthResource1.ErrorMessage">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2Volume" ResourceKey="lblAudioGalleryVolume" runat="server" ControlName="tbAudioGalleryPlayerVolume" HelpText="Audio volume:" Text="Audio volume:" HelpKey="lblAudioGalleryVolume.HelpText" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAudioGallery2PlayerVolume" runat="server" validationgroup="vgAG2S" width="50px" resourcekey="tbAudioGalleryPlayerVolumeResource1">100</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGallery2PlayerVolume" runat="server" controltovalidate="tbAudioGallery2PlayerVolume" display="Dynamic" errormessage="This field is required." validationgroup="vgAG2S" resourcekey="rfvAudioGalleryPlayerVolumeResource1.ErrorMessage">
						</asp:requiredfieldvalidator>
						<asp:rangevalidator id="rvAudioGallery2Volume" runat="server" controltovalidate="tbAudioGallery2PlayerVolume" display="Dynamic" errormessage="Enter value between 0-100." maximumvalue="100" minimumvalue="0" type="Integer" validationgroup="vgAG2S" resourcekey="rvAudioGalleryVolumeResource1.ErrorMessage">
						</asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ThumbWidth" runat="server" HelpText="Thumb width:" Text="Thumb width:" HelpKey="lblAudioGallery2ThumbWidth.HelpText" ResourceKey="lblAudioGallery2ThumbWidth" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAG2SThumbWidth" runat="server" resourcekey="tbAGSPlayerWidthResource1" validationgroup="vgAGS" width="50px">100</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGallery2ThumbsWidth" runat="server" controltovalidate="tbAG2SThumbWidth" display="Dynamic" errormessage="This field is required." resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage" validationgroup="vgAG2S">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGallery2ThumbsWidth" runat="server" controltovalidate="tbAG2SThumbWidth" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvAudioGalleryItemsPerPageResource1.ErrorMessage"
							type="Integer" validationgroup="vgAG2S">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2ThumbHeight" runat="server" HelpText="Thumb height:" Text="Thumb height:" HelpKey="lblAudioGallery2ThumbHeight.HelpText" ResourceKey="lblAudioGallery2ThumbHeight" />
					</td>
					<td colspan="2">
						<asp:textbox id="tbAG2SThumbHeight" runat="server" resourcekey="tbAGSPlayerWidthResource1" validationgroup="vgAG2S" width="50px">100</asp:textbox>
						<asp:requiredfieldvalidator id="rfvAudioGallery2ThumbsHeight" runat="server" controltovalidate="tbAG2SThumbHeight" display="Dynamic" errormessage="This field is required." resourcekey="rfvAudioGalleryItemsPerPageResource1.ErrorMessage" validationgroup="vgAG2S">
						</asp:requiredfieldvalidator>
						<asp:comparevalidator id="cvAudioGallery2ThumbsHeight" runat="server" controltovalidate="tbAG2SThumbHeight" display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck" resourcekey="cvAudioGalleryItemsPerPageResource1.ErrorMessage"
							type="Integer" validationgroup="vgAG2S">
						</asp:comparevalidator>
					</td>
				</tr>
				<tr>
					<td class="style100">
						<dnn:Label ID="lblAudioGallery2RandomizeMedia" runat="server" HelpKey="lblLightBoxRandomizeMedia.HelpText" HelpText="Randomize media positions on every page load:" ResourceKey="lblLightBoxRandomizeMedia" Text="Randomize media positions:" />
					</td>
					<td colspan="2">
						<asp:checkbox id="cbAudioGallery2RandomizeMedia" runat="server" oncheckedchanged="cbAudioGallery2RandomizeMedia_CheckedChanged" resourcekey="cbLightBoxGallerySmartCropVerticalResource1" autopostback="True" />
					</td>
				</tr>
				<tr>
					<td class="style99">
						<dnn:Label ID="Label14" runat="server" HelpText="Select media sorting options:" Text="Media sorting:" HelpKey="lblLightBoxMediaSorting.HelpText" ResourceKey="lblLightBoxMediaSorting" />
					</td>
					<td class="style102">
						<asp:dropdownlist id="ddlAudioGallery2MediaSort" runat="server">
							<asp:listitem resourcekey="liPosition" value="Position">Position</asp:listitem>
							<asp:listitem resourcekey="liDateUploaded" value="DateUploaded">Date uploaded</asp:listitem>
							<asp:listitem resourcekey="liFileName" value="FileName">Filename</asp:listitem>
							<asp:listitem resourcekey="liTitle">Title</asp:listitem>
						</asp:dropdownlist>
						&nbsp;
					</td>
					<td>
						<asp:radiobuttonlist id="rblAudioGallery2MediaSortType" runat="server" repeatdirection="Horizontal">
							<asp:listitem resourcekey="liAscending" selected="True" value="ASC">Ascending</asp:listitem>
							<asp:listitem resourcekey="liDescending" value="DESC">Descending</asp:listitem>
						</asp:radiobuttonlist>
					</td>
				</tr>
				<tr>
					<td class="style99">
						<dnn:Label ID="lblAudio2ShowDownloadLink" runat="server" HelpText="Show download link:" Text="Show download link:" HelpKey="lblAudio2ShowDownloadLink.HelpText" ResourceKey="lblAudio2ShowDownloadLink" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudio2ShowDownloadLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style99" valign="top">
						<dnn:Label ID="lblAudioGalleryShowSocialSharing5" runat="server" HelpText="Show social sharing:" Text="Show social sharing:" HelpKey="lblVideoGalleryShowSocialSharing.HelpText" ResourceKey="lblVideoGalleryShowSocialSharing" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowSocialSharing" runat="server" autopostback="True" oncheckedchanged="cbAudioGallery2ShowSocialSharing_CheckedChanged" />
						<asp:panel id="pnlAudioGallery2SocialSharingOptions" runat="server">
							<table class="style66">
								<tr>
									<td class="style98">
										<dnn:Label ID="lblVideoGallery2SSOptions2" runat="server" HelpText="Open/Close sharing on button click:" Text="Open on button click:" HelpKey="lblVideoGallerySSOptions.HelpText" ResourceKey="lblVideoGallerySSOptions" />
									</td>
									<td>
										<asp:checkbox id="cbAG2SSOpenOnButton" runat="server" />
									</td>
								</tr>
							</table>
						</asp:panel>
					</td>
				</tr>
				<tr>
					<td class="style99">
						<dnn:Label ID="lblAudioGalleryShowSocialSharing6" runat="server" HelpText="Show textbox that contains media link:" Text="Show media link:" HelpKey="lblVideoGalleryShowBackLink.HelpText" ResourceKey="lblVideoGalleryShowBackLink" />
					</td>
					<td class="style91" colspan="2">
						<asp:checkbox id="cbAudioGallery2ShowMediaLink" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
						<asp:label id="lblAudioGallery2Status" runat="server" resourcekey="lblAudioGalleryStatusResource1" width="120px"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style100">
						&nbsp;
					</td>
					<td class="style101" colspan="2">
						<asp:button id="btnAudioGallery2Save" runat="server" onclick="btnAudioGallery2Save_Click" text="Save settings" width="140px" validationgroup="vgAG2S" resourcekey="btnAudioGallerySaveResource1" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btnAudioGallery2SaveClose" runat="server" onclick="btnAudioGallery2SaveClose_Click" text="Save &amp; Close" width="140px" validationgroup="vgAG2S" resourcekey="btnAudioGallerySaveCloseResource1" />
					</td>
				</tr>
				<tr>
					<td class="style100">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</asp:panel>
	<asp:panel id="pnlLoadSaveSettings" runat="server" backcolor="#EFEFEF" resourcekey="pnlLoadSaveSettingsResource1">
		<table align="center" width="80%">
			<tr>
				<td class="style65">
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style65">
					&nbsp;
				</td>
				<td>
					<asp:checkbox id="cbSaveLoadSettingsToFile" runat="server" autopostback="True" font-bold="True" oncheckedchanged="cbSettingsToFile_CheckedChanged" text="Save or load settings to another file or module" resourcekey="cbSaveLoadSettingsToFileResource1" />
				</td>
			</tr>
		</table>
		<asp:panel id="pnlSaveLoadSettings" runat="server" visible="False" resourcekey="pnlSaveLoadSettingsResource1">
			<table align="center" width="80%">
				<tr>
					<td class="style64">
					</td>
					<td class="style46">
					</td>
				</tr>
				<tr>
					<td class="style65">
						<dnn:Label ID="lblSaveSettingstoFile" ResourceKey="lblSaveSettingstoFile" runat="server" HelpText="Enter filename to save settings to:" Text="Filename:" HelpKey="lblSaveSettingstoFile.HelpText" />
					</td>
					<td>
						<asp:textbox id="tbSettingsFile" runat="server" enabled="False" width="250px" resourcekey="tbSettingsFileResource1">
						</asp:textbox>
						&nbsp;<asp:button id="btnSaveSettingsToFile" runat="server" enabled="False" onclick="btnSaveSettingsToFile_Click" resourcekey="btnSaveSettingsToFileResource1" text="Save settings" width="120px" />
						&nbsp;<asp:label id="lblSettingsFilenameError" runat="server" forecolor="Red" text="Please enter filename." visible="False" resourcekey="lblSettingsFilenameErrorResource1"></asp:label>
					</td>
				</tr>
				<tr>
					<td class="style65">
						<dnn:Label ID="lblLoadSettingsFromFile" ResourceKey="lblLoadSettingsFromFile" runat="server" HelpText="Select module number or settings file to load settings from:" Text="Select settings:" HelpKey="lblLoadSettingsFromFile.HelpText" />
					</td>
					<td>
						<asp:dropdownlist id="ddlSettingsList" runat="server" resourcekey="ddlSettingsListResource1">
						</asp:dropdownlist>
						&nbsp;<asp:button id="btnLoadSettingsFromFile" runat="server" onclick="btnLoadSettings_Click" text="Load settings" width="120px" validationgroup="vvNema" resourcekey="btnLoadSettingsFromFileResource1" />
					</td>
				</tr>
				<tr>
					<td class="style65">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</asp:panel>
		<br />
	</asp:panel>
	<br />
	<div align="right" style="padding-top: 10px;">
		<asp:button id="btnCloseDown" runat="server" onclick="btnGSCLose_Click" text="Close" resourcekey="btnCloseDown" cssclass="btnclose" tabindex="4" /></div>
</div>
</div>
<asp:objectdatasource id="odsGetCategories" runat="server" typename="DataAcess" selectmethod="GetCategories" oldvaluesparameterformatstring="{0}">
	<selectparameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGetGalleryImages" runat="server" typename="DataAcess" selectmethod="GetOnlyImagesFromGallery" oldvaluesparameterformatstring="original_{0}">
	<selectparameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGetGalleryImagesAndFlv" runat="server" typename="DataAcess" selectmethod="GetImagesAndFLVFromGallery" oldvaluesparameterformatstring="original_{0}">
	<selectparameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGetGalleriesInCat" runat="server" typename="DataAcess" selectmethod="GetCatGalleries" oldvaluesparameterformatstring="original_{0}">
	<selectparameters>
		<asp:ControlParameter ControlID="ddlMainCatSelect" Name="CategoryID" PropertyName="SelectedValue"
			Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGetOneGalFromCat" typename="DataAcess" runat="server" oldvaluesparameterformatstring="original_{0}" selectmethod="GetOneGallery">
	<selectparameters>
		<asp:Parameter DefaultValue="0" Name="GalleryID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
<asp:objectdatasource id="odsGetImages" runat="server" selectmethod="GetImagesFromGallery" typename="DataAcess" oldvaluesparameterformatstring="original_{0}">
	<selectparameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
