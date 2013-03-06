<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_LightboxControl, App_Web_lightbox1.ascx.c5ff317f" %>
<style type="text/css">
	#LightBoxGallery table.EDGlightbox.EDGresponsive
	{
		width: 100%;
		max-width: <%=ViewState["maxwidth"]%>px;
	}
	
	#LightBoxGallery table.EDGlightboxNested.EDGresponsive
	{
		width: 100%;
		max-width: <%=ViewState["nestedmaxwidth"]%>px;
	}
	
	#LightBoxGallery .EDGlightbox.EDGresponsive td
	{
		display: inline-block;
		width: <%=ViewState["percentWidth"]%>%;
	}
	
	#LightBoxGallery .EDGlightboxNested.EDGresponsive td
	{
		display: inline-block;
		width: <%=ViewState["NGThumbWidthPercent"]%>%;
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
		max-width: <%=ViewState["TGImageWidth"]%>px;
	}
	
	
	#LightBoxGallery .EDGlightboxNested.EDGresponsive .EDGmain
	{
		max-width: <%=ViewState["NGThumbWidth"]%>px;
	}
	
	#LightBoxGallery .EDGresponsive .EDGimage, 
	#LightBoxGallery .EDGresponsive .EDGvideo, 
	#LightBoxGallery .EDGresponsive .EDGaudio
	{
		max-width: 100%;
	}
	
	#LightBoxGallery .EDGresponsive img
	{
		max-width: <%=ViewState["TGImageWidth"]%>px;
		width: 100%;
	}
	
	#LightBoxGallery .EDGresponsive input
	{
		width: 100%;
		max-width: <%=ViewState["NGThumbWidth"]%>px;
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

<%=ViewState["jQuery"]%>(document).ready(function($){
if('<%=ViewState["ShowToolTips"]%>'=='True'){
	if('<%=ViewState["LightboxDescription"] %>'=='True'){
	$('#<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGimage a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() 	{
		if($(this).attr("title").length>0){
			$(this).qtip({
				show: { effect: {type: '<%=ViewState["ShowEffect"]%>', length: '<%=ViewState["ShowEffectDuration"]%>' } },
				hide: { effect: {type: '<%=ViewState["HideEffect"]%>', length: '<%=ViewState["HideEffectDuration"]%>' } },
				position: { corner: { target: '<%=ViewState["TargetPosition"]%>', tooltip: '<%=ViewState["TooltipPosition"]%>'}},
				style: { name: '<%=ViewState["TooltipTheme"]%>', tip: true ,  border: { width: <%=ViewState["TooltipBorder"]%>, radius: <%=ViewState["TooltipRadius"]%> }} 
			});
		}
	});
	}
	}
});

function pageLoad(sender, args) {
	if (args.get_isPartialLoad()) {
	<%=ViewState["jQuery"]%>(document).ready(function($) {
		var showtips= '<%=ViewState["ShowToolTips"] %>';
		$('a[rel^="prettyPhoto"], a[rel^="slP"]').each(function(){
			if($(this).attr("title").length){
				$(this).attr("pptitle", $(this).attr("title"));
				if (showtips =='False')
				{
					if($(this).attr("title").length){
					$(this).attr("title","");
				}
		}
	}
	});
	
$("a[rel^='prettyPhoto'], a[rel^='slP']").prettyPhoto({
			animationSpeed: '<%=ViewState["AnimSpeed"]%>',
			slideshow: <%=ViewState["LightBoxSlideShow"]%>,
			autoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>, 
			padding: 40, 
			opacity: 0.8,
			showTitle: true, 
			allowresize: true,
			hideflash: true, 
			wmode: 'opaque',
			 downloadText:'<%=ViewState["strDownloadImage"]%>',
			autoplay: <%=ViewState["PlayOnLoadLB"]%>, 
			modal: false,    
			overlay_gallery: <%=ViewState["OverlayGallery"]%>,
			counter_separator_label: '/', 
			print_image_text: '<%=ViewState["PrintImageText"]%>',
			item_emailing_text: '<%=ViewState["EmailText"]%>',
			item_emailing_subject: '<%=ViewState["EmailTextSubject"]%>',
			allow_image_printing:<%=ViewState["ShowPrintButton"]%>,
			enable_item_emailing:<%=ViewState["ShowEmailButton"]%>,
			show_social_sharing:<%=ViewState["ShowSocial"]%>,
			download_handler_url:'<%=ViewState["ShowDownloadLinkLightbox"] %>',
			theme: '<%=ViewState["LightboxType"] %>', 
			callback: function() { }
				});

if('<%=ViewState["ShowToolTips"]%>'=='True')
   {
	$(' .EDGimage a[title], .EDGvideo a[title], .EDGaudio a[title]').each(function()
	{
		if($(this).attr("title").length>0)
		{
			$(this).qtip(
			{
				show: { effect: {type: '<%=ViewState["ShowEffect"]%>', length: '<%=ViewState["ShowEffectDuration"]%>' } },
				hide: { effect: {type: '<%=ViewState["HideEffect"]%>', length: '<%=ViewState["HideEffectDuration"]%>' } },
				position: { corner: { target: '<%=ViewState["TargetPosition"]%>', tooltip: '<%=ViewState["TooltipPosition"]%>'}},
				style: { name: '<%=ViewState["TooltipTheme"]%>', tip: true,  border: { width: <%=ViewState["TooltipBorder"]%>, radius: <%=ViewState["TooltipRadius"]%>  } } 
			});
		}
	});
	}
});
}
}
</script>
<asp:literal id="ltOpenImage" runat="server" enableviewstate="False"></asp:literal>
<div id="LightBoxGallery">
	<asp:updatepanel id="upTableGallery" runat="server" updatemode="Always" enableviewstate="False">
		<contenttemplate>
			<div id="<%=ViewState["CssClass"]%>">
				<div class="EDGbackground">
					<div class="EDGcontentbgrd">
						<div class="EDGcornerbotleft">
							<div class="EDGcornerbotright">
								<div class="EDGcornertopleft">
									<div class="EDGcornertopright">
										<div class="EDGcontent">
											<asp:Panel ID="pnlBreadCrumb" runat="server" Visible="True" CssClass="nestedBreadCrumb">
												<asp:LinkButton ID="lbBCTOPGallery" runat="server" OnClick="lbBCTOPGallery_Click"></asp:LinkButton>
												>
												<asp:HyperLink ID="lblBCGallery" runat="server"></asp:HyperLink>
											</asp:Panel>
											<asp:Panel ID="pnlNestedGalleries" runat="server" HorizontalAlign="Center">
											<asp:DataList ID="dlNestedCategory" runat="server" DataKeyField="GalleryID" OnItemCommand="dlNestedCategory_ItemCommand"
													CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" RepeatLayout="Table" HorizontalAlign="Center"
                                                    EnableViewState="False" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" CssClass='<%#ViewState["FixedResponsiveNestedClass"]%>' ItemStyle-Wrap="False">
                                                    <AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
													<ItemTemplate>
														<div class="EDGmain">
															<div class="EDGimage">
																<asp:HiddenField ID="hfGallID" runat="server" Value='<%#Eval("GalleryID")%>' />
																<a href="" runat="server">
																	<asp:ImageButton ID="ibNestedGallery" runat="server" CommandName="OpenNestedGallery"
																		CommandArgument='<%#Eval("GalleryID")%>' ImageUrl='<%#GetGalleryThumbPath(DataBinder.Eval(Container.DataItem, "GalleryID")) %>' />
																	<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																	<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																	<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																	<span class="round4"></span></a>
															</div>
														</div>
														<div class="titleimage" style='max-width: <%=ViewState["NGThumbWidth"]%>px;'>
															<div class='<%#NGTitleClass(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryDescription"))%>'>
																<asp:Label ID="lblTGNGTitle" runat="server" Text='<%#Server.HtmlDecode(ShowNestedGalleryTitle(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																	Visible='<%#NGTitleToDisplay(Eval("GalleryName"))%>'></asp:Label></div>
														</div>
														<div style='max-width: <%=ViewState["NGThumbWidth"]%>px;'>
															<asp:Label ID="lblTGNGDescription" runat="server" CssClass="DescriptionImage" Text='<%#Server.HtmlDecode(ShowNestedGalleryDescription(DataBinder.Eval(Container.DataItem, "GalleryDescription"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																Visible='<%#NGDescriptionToDisplay(Eval("GalleryDescription"))%>'></asp:Label>
															<asp:Label ID="lbGalleryLink" runat="server" CssClass="NestedInfo" Text='<%#GetMediaInfo(Eval("GalleryID"))%>'
																Visible='<%#Convert.ToBoolean(ViewState["GalleryInfo"])%>'></asp:Label></div>
													</ItemTemplate><FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
												</asp:DataList>
												<asp:GridView ID="gvNestedPaging" runat="server" AllowPaging="True" AutoGenerateColumns="False"
													BorderStyle="None" BorderWidth="0px" CssClass="pagerbox" DataKeyNames="GalleryID"
													GridLines="None" HorizontalAlign="Center" OnPageIndexChanging="gvNestedPaging_PageIndexChanging"
													ShowHeader="False" Visible="False" ShowFooter="True">
													<Columns>
														<asp:BoundField DataField="GalleryID" Visible="false" />
													</Columns>
													<PagerStyle HorizontalAlign="Center" CssClass="EDGpager" BorderWidth="0px" BorderStyle="None" />
												</asp:GridView>
											</asp:Panel>
											<asp:Panel ID="pnlTGDisplay" runat="server" HorizontalAlign="Center">
												<div class="EDGTitle">
													<asp:Label ID="lblTGTitle" runat="server" CssClass="EDGTitleText"></asp:Label>
													<asp:Label ID="lblTGDescription" runat="server" CssClass="GalleryDescription"></asp:Label>
												</div>
												<asp:ObjectDataSource ID="odsTGMedia" runat="server" TypeName="DataAcess" SelectMethod="GetRandomImagesFromGalleryOnlyIdFile"
													OldValuesParameterFormatString="{0}">
													<SelectParameters>
														<asp:Parameter Name="GalleryID" Type="Int32" />
														<asp:Parameter Name="isRandom" Type="Boolean" />
													</SelectParameters>
												</asp:ObjectDataSource>
												<asp:Panel ID="pnlTopButton" runat="server">
													<asp:Panel ID="pnlNestedGalleryBackTop" runat="server" Visible="False">
														<div style="overflow: hidden; margin-bottom: 10px;">
															<asp:LinkButton ID="btnBackButtonTop" runat="server" OnClick="btnBack_Click" CssClass="btnGalleryBack">
															</asp:LinkButton>
														</div>
													</asp:Panel>
												</asp:Panel>
												<asp:DataList ID="dlTableGallery" runat="server" CellPadding="0" RepeatDirection="Horizontal"
													RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" CssClass='<%#ViewState["FixedResponsiveClass"]%>'
													Font-Strikeout="False" Font-Underline="False" DataKeyField="PictureID" OnPreRender="dlTableGallery_PreRender"
													RepeatLayout="Table" HorizontalAlign="Center" OnItemCreated="dlTableGallery_ItemCreated"
													ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" EditItemStyle-VerticalAlign="Top"
													SelectedItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top" HeaderStyle-VerticalAlign="Top"
													EnableViewState="False">
													<AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
													<ItemTemplate>
														<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGimage">
																	<a href='<%#Eval("LinkOrLightbox")%>' downhref='<%#Eval("GetLighboxImageDownURL")%>'
																		target="<%#Eval("TargetWin")%>" lbnestedurl='<%#Eval("GetLighboxNestedURL")%>'
																		edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>'
																		rel="<%#Eval("RelLink")%>">
																		<asp:Image ID="DataListImage" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			EnableTheming="True" alt='<%#Eval("GetAlt")%>' ImageAlign="Middle" />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("LinkOrLightbox")%>' target="<%#Eval("TargetWin")%>" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>' rel="<%#RelLink2()%>">
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="lblItemTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="lblTGDescription6" runat="server" CssClass="DescriptionImage" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a>
															<div style="clear: both; display: block; text-align: center;">
																<asp:HyperLink ID="hlDownloadImage" runat="server" NavigateUrl='<%#Eval("GetImageDownURL")%>'
																	Visible='<%#Eval("GetDownloadVisible")%>' CssClass="downloadlink"><%=ViewState["strDownloadImage"]%></asp:HyperLink></div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="EmbedImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="EmbedTitleLabel" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="lblTGDescription2" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Normal")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="FlashImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="FlashTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="lblTGDescription3" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashFlow" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Flow")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/Lightbox/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image4" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#RelLink2()%>" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label4" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="Label5" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plflash5" runat="server" Visible='<%#ToDisplayHtml5Video("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																		</video>
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' rel="" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label6" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="Label7" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																		</video>
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("Filename") %>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'
																rel="" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label1" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="Label3" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgflasmovthumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label2" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="lblTGDescription4" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a href='<%=ModulePath.Replace("Controls/Lightbox/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgTGAudio" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%=ModulePath.Replace("Controls/Lightbox/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="lblAudioTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="lblTGDescription5" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plaHTNL5Audio" runat="server" Visible='<%# ShowHTML5Player("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a href='<%#Eval("Filename")%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image5" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("Filename")%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ViewState["ModuleIDNR"]%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label8" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=ViewState["TGImageWidth"]%>px;'>
																	<asp:Label ID="Label9" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<%--</div>--%>
													</ItemTemplate>
													<FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
												</asp:DataList>
												<%=SetupSSValues()%>
												<asp:GridView ID="gvTGPagination" runat="server" AllowPaging="True" DataKeyNames="PictureID"
													DataSourceID="odsTGMedia" OnPageIndexChanged="GridView1_PageIndexChanged" OnPreRender="gvTGPagination_PreRender"
													Width="28px" HorizontalAlign="Center" ShowFooter="True" AutoGenerateColumns="False"
													PageSize="1" ShowHeader="False" BorderWidth="0" BorderStyle="None" Border="0"
													GridLines="None" CssClass="pagerbox">
													<Columns>
														<asp:BoundField DataField="FileName" Visible="False" />
													</Columns>
													<PagerStyle HorizontalAlign="Center" CssClass="EDGpager" BorderWidth="0px" BorderStyle="None" />
												</asp:GridView>
												<table cellpadding="0" cellspacing="0" border="0" align="center">
													<tr>
														<td>
															<asp:LinkButton ID="btnPrev" runat="server" OnClick="btnPrev_Click" CssClass="buttonPrev"
																Style="margin-top: 15px;" />
															<asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="buttonNext"
																Style="margin-top: 15px;" />
														</td>
													</tr>
												</table>
												<a id="hlUploadQuerstr" runat="server" visible="false">
													<asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/image_add.png" />
													<%=ViewState["strUserUpload"]%>
												</a><a id="hlApproveMedia" runat="server" visible="false">
													<asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/note_accept.png" />
													<%=ViewState["strApprove"]%>
												</a>
											</asp:Panel>
											<asp:UpdateProgress ID="upLighbox" runat="server" AssociatedUpdatePanelID="upTableGallery">
												<ProgressTemplate>
													<div class='<%=ViewState["PreloaderBackground"]%>'>
													</div>
													<table cellpadding="0" cellspacing="0" align="center" style="margin-top: 10px;">
														<tr>
															<td>
																<div class='<%=ViewState["PreloaderClass"]%>'>
																	<img id='preloader' src='<%=ModulePath.Replace("Controls/Lightbox/","")%>images/<%=ViewState["PreloaderImage"]%>' />
																</div>
															</td>
														</tr>
													</table>
												</ProgressTemplate>
											</asp:UpdateProgress>
											<asp:Panel ID="pnlNestedGalleryBackBottom" runat="server">
												<asp:Panel ID="pnlNestedGalleryBack" runat="server" Visible="False">
													<div style="float: left;">
														<asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="btnGalleryBack">
													   
														</asp:LinkButton>
													</div>
												</asp:Panel>
											</asp:Panel>
											<asp:Panel ID="pnlFullscreenlink" runat="server">

												<script type="text/javascript">
												<%=ViewState["jQuery"]%>(document).ready(function($) 
												{
													$('#<%=upTableGallery.ClientID%>').delegate('a#lnkFS<%=ViewState["ModulNr"]%>', 'click', function() {
														$().fullscreenPortfolioGallery({
															ppgroup: '<%=ViewState["ModulNr"]%>',
															pptheme: '<%=ViewState["LightboxType"] %>',
															ppanimationSpeed: '<%=ViewState["AnimSpeed"]%>',
															ppoverlay_gallery: <%=ViewState["OverlayGallery2"]%>,
															ppslideshow: <%=ViewState["LightBoxSlideShow"]%>,
															ppautoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>,
															showCategories: <%=ViewState["NastedGals"]%>,
															ppLightboxTitle: '<%=ViewState["LightboxTitle"]%>',
															ppLightboxDescription: '<%=ViewState["LightboxDescription"]%>',
															ppMediaTitle: '<%=ViewState["ShowMediaTitle"]%>',
															ppMediaDescription: '<%=ViewState["ShowMediaDescription"]%>',
															pfqtip: '<%=ViewState["LightboxDescription"]%>',
															pfShowQtip: '<%=ViewState["ShowToolTips"]%>',
															pfdiv: '<%=ViewState["ModulNr"]%>EasyDNNGallery',
															pfShowEffect: '<%=ViewState["ShowEffect"]%>',
															pfHideEffect: '<%=ViewState["HideEffect"]%>',
															pfShowDuration: '<%=ViewState["ShowEffectDuration"]%>',
															pfHideDuration: '<%=ViewState["HideEffectDuration"]%>',
															pfTargetPos: '<%=ViewState["TargetPosition"]%>',
															pfTooltipPos: '<%=ViewState["TooltipPosition"]%>',
															pfTheme: '<%=ViewState["TooltipTheme"]%>',
															pfcorner: <%=ViewState["TooltipBorder"]%>,
															pfradius: <%=ViewState["TooltipRadius"]%>,
															pfOpenMediaUrl: '<%=ViewState["OpenMediaUrl"]%>',
															pfOpenMediaTarget: '<%=ViewState["NewWindow"]%>',
															itemMargin: 11,
															allText: '<%=ViewState["strAll"]%>',
															easing: 'easeOutExpo',
															animationSpeed: 1500,
															itemsPerPage: 0,
															wavyAnimation: false,
															myshowCategories: <%=ViewState["LightboxFullscreenShowNavigation"]%>,
															navButtonWidth: 21,
															categorySelector: '<%=ViewState["PortfolioMenuType"]%>',
															showNavigationArrows: <%=ViewState["PortfolioShowArrows"]%>,
															hidableNavigationArrows: <%=ViewState["PortfolioAutoHideArrows"]%>,
															customTitle: '<%=ViewState["PortfolioDisplayTitle"]%>',
															navigationId: 'EDG_portfolio_pagination<%=ViewState["ModulNr"]%>',
															categoriesId: 'EDG_portfolio_categories<%=ViewState["ModulNr"]%>',
															navArrowsFile: '<%=ViewState["PortfolioArrowFile"]%>',
															navDDMFile: '<%=ViewState["ProtfolioDDMFile"]%>',
															ppprint_image_text: '<%=ViewState["PrintImageText"]%>',                              
															ppitem_emailing_text: '<%=ViewState["EmailText"]%>',
															ppitem_emailing_subject: '<%=ViewState["EmailTextSubject"]%>',
															ppallow_image_printing:<%=ViewState["ShowPrintButton"]%>,
															ppenable_item_emailing:<%=ViewState["ShowEmailButton"]%>,
															ppshow_social_sharing:<%=ViewState["ShowSocial"]%>,
															ppdownload_handler_url:'<%=ViewState["ShowDownloadLinkLightbox"] %>',
															xmlRequestParams: {
																GalleryType: 'tablegallery',
																ModuleID: '<%=ViewState["ModuleID"]%>',
																ModulePath: '<%=ViewState["ModulePath"]%>',
																PortalHome: '<%=ViewState["PortalHome"]%>',
																PortalID: '<%=ViewState["PortalID"] %>',
																LocaleCode: '<%=ViewState["localecode"] %>',
																SettingCheck: '4535793'
															},
															maxImgWidth: <%=ViewState["TGImageWidth"]%>,
															maxImgHeight: <%=ViewState["TGImageHeight"]%>,
															smartResize: <%=ViewState["SmartResize"]%>,
															fullscreenCssId: '<%=ViewState["LightboxFullscreenTheme"]%>',
															fullscreenable: true,
															xmlSource: '/DesktopModules/EasyDnnGallery/PortfolioHandler.ashx?tabid=<%=ViewState["TabId"]%>'
														});
														return false;
													});
												});
												</script>

												<div style="padding: 3px 3px 0; overflow: hidden; display: inline; float: left; margin-left: 20px;">
													<a id='lnkFS<%=ViewState["ModulNr"]%>' class="EasyDNNGallery_fullscreen_btn" href="#">
														<span class="icon"></span><span class="text">
															<%=ViewState["ShowFullscreen"]%></span></a>
												</div>
											</asp:Panel>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="EDGclear">
						&nbsp;
					</div>
				</div>
			</div>
		</contenttemplate>
	</asp:updatepanel>
</div>
<asp:objectdatasource id="odsIntegrate" typename="DataAcess" runat="server" selectmethod="GetIntegration" enableviewstate="False">
	<selectparameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
