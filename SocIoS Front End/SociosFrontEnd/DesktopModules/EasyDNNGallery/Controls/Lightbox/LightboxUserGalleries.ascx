<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_LightboxUserGalleries, App_Web_lightboxusergalleries.ascx.c5ff317f" %>
<style type="text/css">
	#LightBoxGallery .user_dashboard
	{
		background: url(<%=ModulePath.Replace("Controls/Lightbox/","")%>images/silver_gradient_bg_dash.png) repeat-x #ebebeb;
		border: 1px solid #e4e4e4;
		padding: 4px 6px;
		margin: 0 0 20px;
		overflow: hidden;
		width: 105px;
	}
	#LightBoxGallery .user_dashboard a
	{
		display: block;
		float: left;
		color: #363636;
		font: 11px Arial, Helvetica, sans-serif;
		font-weight: bold;
		padding: 5px 0 0 35px;
		height: 18px;
		margin: 0 10px 0 0;
	}
	#LightBoxGallery .user_dashboard a.my_gallery
	{
		background: url(<%=ModulePath.Replace("Controls/Lightbox/","")%>images/gallery_edit.png) no-repeat;
		padding-left: 25px;
	}
	#LightBoxGallery table.EDGlightbox.EDGresponsive
	{
		width: 100%;
		max-width: <%=maxWidth%>px;
	}
	#LightBoxGallery table.EDGlightboxNested.EDGresponsive
	{
		width: 100%;
		max-width: <%=nestedMaxWdth%>px;
	}
	#LightBoxGallery .EDGlightbox.EDGresponsive td
	{
		display: inline-block;
		width: <%=percentWidth%>%;
	}
	
	#LightBoxGallery .EDGlightboxNested.EDGresponsive td
	{
		display: inline-block;
		width: <%=NGThumbWidthPercent%>%;
	}
	#LightBoxGallery .EDGresponsive a, 
	#LightBoxGallery .EDGresponsive .titleempty
	{
		width: 100%;
	}

	#LightBoxGallery .EDGresponsive .EDGmain .EDGimage a .title, 
	#LightBoxGallery .EDGresponsive .EDGmain .EDGimage a .title span
	{
	    width: 100%;
	    max-width: 100%;
	    padding: 2px 0;
	  }
	#LightBoxGallery .EDGresponsive .EDGmain .EDGimage a .Description
	{
	    max-width: 100%;
	}	
	#LightBoxGallery .EDGresponsive .EDGmain
	{
		max-width: <%=myappSettings.TGImageWidth%>px;
	}	
	#LightBoxGallery .EDGlightboxNested.EDGresponsive .EDGmain
	{
		max-width: <%=myappSettings.NGThumbWidth%>px;
	}	
	#LightBoxGallery .EDGresponsive .EDGimage, 
	#LightBoxGallery .EDGresponsive .EDGvideo, 
	#LightBoxGallery .EDGresponsive .EDGaudio
	{
		max-width: 100%;
	}	
	#LightBoxGallery .EDGresponsive img
	{
		max-width: <%=myappSettings.TGImageWidth%>px;
		width: 100%;
	}	
	#LightBoxGallery .EDGresponsive input
	{
		width: 100%;
		max-width: <%=myappSettings.NGThumbWidth%>px;
	}
	#LightBoxGallery .EDGresponsive .EDGimage a img, 
	#LightBoxGallery .EDGresponsive .EDGimage a,
	#LightBoxGallery .EDGresponsive .EDGimage a input,  
	#LightBoxGallery .EDGresponsive .EDGmain 
	{
	    float:none;
	}
    #LightBoxGallery .EDGresponsive .EDGvideo a img, 
	#LightBoxGallery .EDGresponsive .EDGvideo a, 
	#LightBoxGallery .EDGresponsive .EDGmain 
	{
	    float:none;
	}
	#LightBoxGallery .EDGresponsive .EDGaudio a img, 
	#LightBoxGallery .EDGresponsive .EDGaudio a, 
	#LightBoxGallery .EDGresponsive .EDGmain 
	{
	    float:none;
	} 

    #LightBoxGallery .EDGresponsive .EDGimage a:hover img,
    #LightBoxGallery .EDGresponsive .EDGvideo a:hover img,
    #LightBoxGallery .EDGresponsive .EDGaudio a:hover img,
    #LightBoxGallery .EDGresponsive .EDGimage a:hover input
    {
        float:none;
    }

</style>
<div id="edsUserDisplayMain" runat="server">
<script type="text/javascript">

function sGoogle()
{
	var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	po.src = 'https://apis.google.com/js/plusone.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	
	var potw = document.createElement('script'); potw.type = 'text/javascript';
	potw.src = 'http://platform.twitter.com/widgets.js';
	var stw = document.getElementsByTagName('script')[0]; stw.parentNode.insertBefore(potw, stw);
}

jQuery(document).ready(function ($) {
  if ('<%=myappSettings.ShowToolTips%>' == 'True') {
	if ('<%=myappSettings.LightboxDescription %>' == 'True') {
	  $('#<%=ModulNr%>EasyDNNGallery .EDGimage a[title], #<%=ModulNr%>EasyDNNGallery .EDGvideo a[title], #<%=ModulNr%>EasyDNNGallery .EDGaudio a[title]').each(function () {
		if ($(this).attr("title").length > 0) {
		  $(this).qtip({
			show: {
			  effect: {
				type: '<%=myappSettings.ShowEffect%>',
				length: '<%=myappSettings.ShowEffectDuration%>'
			  }
			},
			hide: {
			  effect: {
				type: '<%=myappSettings.HideEffect%>',
				length: '<%=myappSettings.HideEffectDuration%>'
			  }
			},
			position: {
			  corner: {
				target: '<%=myappSettings.TargetPosition%>',
				tooltip: '<%=myappSettings.TooltipPosition%>'
			  }
			},
			style: {
			  name: '<%=myappSettings.TooltipTheme%>',
			  tip: true,
			  border: {
				width: <%= myappSettings.TooltipBorder %> ,
				radius: <%= myappSettings.TooltipRadius %>
			  }
			}
		  });
		}
	  });
	}
  }
});
	</script>
	<asp:literal id="ltOpenImage" runat="server" enableviewstate="False"></asp:literal>
	<div id="LightBoxGallery">
		<asp:panel id="pnlUserDashBoard" runat="server" visible="False" cssclass="user_dashboard">
			<asp:linkbutton id="lbMyGalleries" runat="server" cssclass="my_gallery" onclick="lbMyGalleries_Click">
				<%=UserGalleries%>
			</asp:linkbutton>
		</asp:panel>
		<asp:hiddenfield id="hfISnestedOpen" runat="server" value="None" />
		<div id="<%=cssClass%>">
			<div class="EDGbackground">
				<div class="EDGcontentbgrd">
					<div class="EDGcornerbotleft">
						<div class="EDGcornerbotright">
							<div class="EDGcornertopleft">
								<div class="EDGcornertopright">
									<div class="EDGcontent">
										<asp:panel id="pnlBreadCrumb" runat="server" visible="False" cssclass="nestedBreadCrumb">
												<asp:linkbutton id="lbBCTOPGallery" runat="server" onclick="lbBCTOPGallery_Click">
												</asp:linkbutton>
												>
												<asp:hyperlink id="lblBCGallery" runat="server">
												</asp:hyperlink>
											</asp:panel>
										<asp:panel id="pnlNestedGalleries" runat="server" horizontalalign="Center">
											<asp:datalist id="dlNestedCategory" runat="server" datakeyfield="GalleryID" onitemcommand="dlNestedCategory_ItemCommand" CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" RepeatLayout="Table" HorizontalAlign="Center"
													EnableViewState="False" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="False" CssClass="<%#layoutNestedClass%>">
													<AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
												<itemtemplate>
														<div class="EDGmain">
															<div class="EDGimage">
																<asp:HiddenField ID="hfGallID" runat="server" Value='<%#Eval("GalleryID")%>' />
																<a href="" runat="server">
																	<asp:ImageButton ID="ibNestedGallery" runat="server" CommandName="OpenNestedGallery"
																		CommandArgument='<%#Eval("GalleryID")%>' ImageUrl='<%#GetGalleryThumbPath(DataBinder.Eval(Container.DataItem, "GalleryID")) %>' />
																	<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																	<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																	<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																	<span class="round4"></span><span class='<%#NGTitleClass(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryDescription"))%>'>
																		<asp:Label ID="lblTGNGTitle" runat="server" Text='<%#Server.HtmlDecode(ShowNestedGalleryTitle(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																			Visible='<%#NGTitleToDisplay(Eval("GalleryName"))%>'></asp:Label>
																		<asp:Label ID="lblTGNGDescription" runat="server" CssClass="Description" Text='<%#Server.HtmlDecode(ShowNestedGalleryDescription(DataBinder.Eval(Container.DataItem, "GalleryDescription"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																			Visible='<%#NGDescriptionToDisplay(Eval("GalleryDescription"))%>'></asp:Label>
																		<asp:Label ID="lblTGNGalleryOwner" runat="server" CssClass="Description" Text='<%#Server.HtmlDecode(ShowNestedGalleryOwner(DataBinder.Eval(Container.DataItem, "UserID")))%>'
																			Visible='<%#Convert.ToBoolean(myappSettings.ShowGalleryOwner)%>'></asp:Label>
																		<asp:Label ID="lbGalleryLink" runat="server" CssClass="Description" Text='<%#GetMediaInfo(Eval("GalleryID"))%>'
																			Visible='<%#Convert.ToBoolean(myappSettings.SSAutoSlide)%>'></asp:Label>
																	</span></a>
															</div>
														</div>
													</itemtemplate><FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
											</asp:datalist>
											<asp:gridview id="gvNestedPaging" runat="server" allowpaging="True" autogeneratecolumns="False" borderstyle="None" borderwidth="0px" cssclass="pagerbox" horizontalalign="Center" datakeynames="GalleryID" gridlines="None" onpageindexchanging="gvNestedPaging_PageIndexChanging"
												showheader="False" visible="False" showfooter="True">
												<columns>
														<asp:BoundField DataField="GalleryID" Visible="false" />
													</columns>
												<pagerstyle horizontalalign="Center" cssclass="EDGpager" borderwidth="0px" borderstyle="None" />
											</asp:gridview>
										</asp:panel>
										<asp:panel id="pnlTGDisplay" runat="server" horizontalalign="Center">
											<div class="EDGTitle">
												<asp:label id="lblTGTitle" runat="server" cssclass="EDGTitleText"></asp:label>
												<asp:label id="lblTGDescription" runat="server" cssclass="GalleryDescription"></asp:label>
											</div>
											<asp:objectdatasource id="odsTGMedia" runat="server" typename="DataAcess" selectmethod="GetRandomImagesFromGalleryOnlyIdFile" oldvaluesparameterformatstring="{0}">
												<selectparameters>
														<asp:Parameter Name="GalleryID" Type="Int32" />
														<asp:Parameter Name="isRandom" Type="Boolean" />
													</selectparameters>
											</asp:objectdatasource>
											<asp:panel id="pnlTopButton" runat="server">
												<asp:panel id="pnlNestedGalleryBackTop" runat="server" visible="False">
													<div style="overflow: hidden; margin-bottom: 10px;">
														<asp:linkbutton id="btnBackButtonTop" runat="server" onclick="btnBack_Click" cssclass="btnGalleryBack">
														</asp:linkbutton>
													</div>
												</asp:panel>
											</asp:panel>
											<asp:datalist id="dlTableGallery" runat="server" cellpadding="0" repeatdirection="Horizontal" repeatcolumns="4" font-bold="False" font-italic="False" font-overline="False" font-strikeout="False" font-underline="False" datakeyfield="PictureID" onprerender="dlTableGallery_PreRender"
												repeatlayout="Table" horizontalalign="Center" onitemcreated="dlTableGallery_ItemCreated" itemstyle-horizontalalign="Center" onitemcommand="dlTableGallery_ItemCommand" itemstyle-verticalalign="Top" enableviewstate="False" CssClass="<%#layoutClass%>">
												<alternatingitemstyle horizontalalign="Center" />
												<edititemstyle horizontalalign="Center" />
												<itemtemplate>
														<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGimage">
																	<a href='<%#Eval("LinkOrLightbox")%>' downhref='<%#Eval("GetLighboxImageDownURL")%>'
																		target="<%#Eval("TargetWin")%>" lbnestedurl='<%#Eval("GetLighboxNestedURL")%>'
																		edgpid='<%#Eval("PictureID")%>' edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'
																		rel='<%#Eval("RelLink")%>'>
																		<asp:Image ID="DataListImage" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			EnableTheming="True" alt='<%#Eval("GetAlt")%>' ImageAlign="Middle" />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="lblItemTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="lblTGDescription6" runat="server" CssClass="Description" Text='<%#Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label>
																		</span></a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<div style="clear: both; display: block; text-align: center;">
																<asp:HyperLink ID="hlDownloadImage" runat="server" NavigateUrl='<%#Eval("GetImageDownURL")%>'
																	Visible='<%#Eval("GetDownloadVisible")%>' CssClass="downloadlink"><%=downloadText%></asp:HyperLink></div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#Eval("RelLink")%>" edgmid='<%=ModuleId.ToString()%>'
																		edgpid='<%#Eval("PictureID")%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="EmbedImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="EmbedTitleLabel" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="lblTGDescription2" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plHtml5Video" runat="server" Visible='<%#ToDisplayHtml5Video("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>'
																		width='<%=myappSettings.TGImageWidth%>' height='<%=myappSettings.TGImageHeight%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>
																			download the video here.</a>
																		</video>
																	<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																	<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																	<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																	<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label1" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																		<asp:Label ID="Label3" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																			Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Normal")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=myappSettings.PlayOnLoad %>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#Eval("RelLink")%>" edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="FlashImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="FlashTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="lblTGDescription3" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashFlow" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Flow")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%=ModulePath.Replace("Controls/Lightbox/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=myappSettings.PlayOnLoad %>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#Eval("RelLink")%>" edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="Label6" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="Label7" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plMovHtml5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>'
																		width='<%=myappSettings.TGImageWidth%>' height='<%=myappSettings.TGImageHeight%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>
																			download the video here.</a>
																	</video>
																	<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																	<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																	<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																	<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label4" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																		<asp:Label ID="Label5" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																			Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%#Eval("Filename") %>' edgmid='<%=ModuleId.ToString()%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>'
																		edgpid='<%#Eval("PictureID")%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgflasmovthumb" runat="server" ImageUrl='<%#Eval("GetThumbPath") %>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="Label2" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="lblTGDescription4" CssClass="Description" runat="server" Text='<%#Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a href='<%=ModulePath.Replace("Controls/Lightbox/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=myappSettings.AudioPlayOnLoad%>&volume=1&song1url=<%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#Eval("RelLink")%>" edgmid='<%=ModuleId.ToString()%>'
																		edgpid='<%#Eval("PictureID")%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgTGAudio" runat="server" ImageUrl='<%#Eval("GetThumbPath") %>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="lblAudioTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="lblTGDescription5" CssClass="Description" runat="server" Text='<%# Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plHTML5Audio" runat="server" Visible='<%# ShowHTML5Player("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a href='<%#Eval("Filename")%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgmid='<%=ModuleId.ToString()%>'
																		edgpid='<%#Eval("PictureID")%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image4" runat="server" ImageUrl='<%#Eval("GetThumbPath") %>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span><span class='<%#Eval("TitleClass")%>'>
																			<asp:Label ID="Label8" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label><br />
																			<asp:Label ID="Label9" CssClass="Description" runat="server" Text='<%# Eval("ShowDescription")%>'
																				Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></span> </a>
																	<div class="socialSharingContainer" style='<%=SocialSharingButtonsClass%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
													</itemtemplate>
												<footerstyle horizontalalign="Center" />
												<headerstyle horizontalalign="Center" />
												<itemstyle horizontalalign="Center" verticalalign="Middle" wrap="False" />
												<selecteditemstyle horizontalalign="Center" />
												<separatorstyle horizontalalign="Center" />
											</asp:datalist>
											<%=SetupSSValues()%>
											<asp:gridview id="gvTGPagination" runat="server" allowpaging="True" datakeynames="PageID" onpageindexchanged="gvTGPagination_PageIndexChanged" onprerender="gvTGPagination_PreRender" width="28px" horizontalalign="Center" showfooter="True" autogeneratecolumns="False"
												pagesize="1" showheader="False" borderwidth="0px" borderstyle="None" border="0" gridlines="None" cssclass="pagerbox" enableviewstate="False" onpageindexchanging="gvTGPagination_PageIndexChanging" onselectedindexchanged="gvTGPagination_SelectedIndexChanged">
												<columns>
														<asp:BoundField DataField="PageID" Visible="False" />
													</columns>
												<pagerstyle horizontalalign="Center" cssclass="EDGpager" borderwidth="0px" borderstyle="None" />
											</asp:gridview>
											<table cellpadding="0" cellspacing="0" border="0" align="center">
												<tr>
													<td>
														<asp:linkbutton id="btnPrev" runat="server" onclick="btnPrev_Click" cssclass="buttonPrev" style="margin-top: 15px;" />
														<asp:linkbutton id="btnNext" runat="server" onclick="btnNext_Click" cssclass="buttonNext" style="margin-top: 15px;" />
													</td>
												</tr>
											</table>
											<a id="hlUploadQuerstr" runat="server" visible="false">
												<asp:image id="Image1" runat="server" imageurl="~/DesktopModules/EasyDNNgallery/images/image_add.png" />
												<%=UserUpload%>
											</a><a id="hlApproveMedia" runat="server" visible="false">
												<asp:image id="Image2" runat="server" imageurl="~/DesktopModules/EasyDNNgallery/images/note_accept.png" />
												<%=strApprove%>
											</a>
										</asp:panel>
										<div>
											<asp:panel id="pnlNestedGalleryBackBottom" runat="server">
												<asp:panel id="pnlNestedGalleryBack" runat="server" visible="False">
													<div style="float: left;">
														<asp:linkbutton id="btnBack" runat="server" onclick="btnBack_Click" cssclass="btnGalleryBack">
														</asp:linkbutton>
													</div>
												</asp:panel>
											</asp:panel>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="EDGclear">
					&nbsp;</div>
			</div>
		</div>
	</div>
</div>
