<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_ImageCarouselControl, App_Web_imagecarousel0.ascx.ae0fbc37" %>
	
	<style type="text/css">
		.image_carousel
		{
			padding: 15px 0px 15px 0px;
			position: relative;
		}
		.image_carousel img {
			border: 1px solid #ccc;
			background-color: white;
			padding: 0px;
			margin: 0px;
			display: block;
			float: left;
		}
		a.prev<%=ViewState["ModulNr"]%>, a.next<%=ViewState["ModulNr"]%> {
			background: url(<%=ModulePath.Replace("Controls/ImageCarousel/","")%><%=ViewState["ICASpriteURL"]%>) 0 0 no-repeat transparent;
			width: <%=ViewState["ICAPrevNextWidth"]%>px;
			height: <%=ViewState["ICAPrevNextHeight"]%>px;
			display: block;
			position: absolute;
			top: <%=ViewState["intmiddle"]%>px;
			z-index: 150;
		}
		a.prev<%=ViewState["ModulNr"]%> 
			{
				left: -22px;
			}
		a.prev<%=ViewState["ModulNr"]%>:hover
			{
				background-position: <%=ViewState["ICAPrevBackgroundPositionHover"]%>;
			}
		a.next<%=ViewState["ModulNr"]%> 
			{
				right: -12px;
				background-position: <%=ViewState["ICANextBackgroundPosition"]%>;
			}
		a.next<%=ViewState["ModulNr"]%>:hover 
			{
				background-position: <%=ViewState["ICANextBackgroundPositionHover"]%>;
			}
		a.prev<%=ViewState["ModulNr"]%> span, a.next<%=ViewState["ModulNr"]%> span
			{
				display: none;
			}
		.pagination<%=ViewState["ModulNr"]%> 
			{
				text-align: center;
			}
		.pagination<%=ViewState["ModulNr"]%> a 
			{
				background: url(<%=ModulePath.Replace("Controls/ImageCarousel/","")%>css/images/miscellaneous_sprite.png) 0 -100px no-repeat transparent;
				width: 15px;
				height: 15px;
				margin: 0 5px 0 0;
				display: inline-block;
			}
		.pagination<%=ViewState["ModulNr"]%> a.selected 
			{
				background-position: -25px -100px;
				cursor: default;
			}
		.pagination<%=ViewState["ModulNr"]%> a span 
			{
				display: none;
			}
		.clearfix
			{
				float: none;
				clear: both;
			}
		#IC<%=ViewState["ModulNr"]%>
		{
			overflow: hidden;
		}
			
		#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain
		{
			visibility:hidden;
		}
		
		.image_carousel
		{
			height:0px;
			overflow:hidden;
		}
		
		.titleempty
		{
			display:none;
		}
	</style>

	<script type="text/javascript">
		<%=ViewState["jQuery"]%>(document).ready(function() {
		<%=ViewState["jQuery"]%>.each(<%=ViewState["jQuery"]%>.browser, function (i) {
		if (<%=ViewState["jQuery"]%>.browser.msie && <%=ViewState["jQuery"]%>.browser.version < "8.0") {
			<%=ViewState["jQuery"]%>('#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain').css('visibility', 'visible');
			<%=ViewState["jQuery"]%>('.image_carousel').css('overflow', 'visible');
			<%=ViewState["jQuery"]%>('.image_carousel').css('height', 'auto');}
		
		});
	});
	
		<%=ViewState["jQuery"]%>(document).ready(function() {
			<%=ViewState["jQuery"]%>('#IC<%=ViewState["ModulNr"]%>').carouFredSel({
				auto : <%=ViewState["SSAutoSlideRandom"]%>,
				auto : {
						play:<%=ViewState["SSAutoSlideRandom"]%>,
						pauseDuration	: <%=ViewState["SlidePause"]%>,
						pauseOnHover	: true
						},
				items	: <%=ViewState["SliderTransition"]%>,
				scroll	: {
							 items: <%=ViewState["SSAutoStartRandom"]%>
						},
				prev : {	
						button	: '#foo2_prev<%=ViewState["ModulNr"]%>',
						key		: "left"
					},
				next : { 
						button	: '#foo2_next<%=ViewState["ModulNr"]%>',
						key		: "right"
					},
				pagination	: '#<%=ViewState["PagingVisible"]%>'
				});
				<%=ViewState["jQuery"]%>('#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain').css('visibility', 'visible');
				<%=ViewState["jQuery"]%>('.image_carousel').css('overflow', 'visible');
				<%=ViewState["jQuery"]%>('.image_carousel').css('height', 'auto');
			}); 
	</script>

<script type="text/javascript">
<%=ViewState["jQuery"]%>(document).ready(function() 
{
if('<%=ViewState["ShowToolTips"] %>'=='True')
	{
	if('<%=ViewState["LightboxDescription"] %>'=='True')
	{
		<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGimage a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() // Select all elements with the "tooltip" attribute
		{
			if(<%=ViewState["jQuery"]%>(this).attr("title").length>0)
		{
			<%=ViewState["jQuery"]%>(this).qtip(
			{
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
</script>
<asp:Literal ID="ltOpenImage" runat="server" EnableViewState="False"></asp:Literal>
<div id="ImageCarousel" runat="server">
	<asp:Panel ID="pnlImageCarousel" runat="server">
		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div id="<%=ViewState["CssClass"]%>">
						<div class="EDGbackground">
							<div class="EDGcontentbgrd">
								<div class="EDGcornerbotleft">
									<div class="EDGcornerbotright">
										<div class="EDGcornertopleft">
											<div class="EDGcornertopright">
												<div class="EDGcontent">
												 <div class="EDGTitle">
													<asp:Label ID="lblTGTitle" runat="server" CssClass="EDGTitleText" Visible="False"></asp:Label>
													<asp:Label ID="lblTGDescription" runat="server" CssClass="GalleryDescription" Visible="False"></asp:Label>
												</div>
													<div class="image_carousel">
														<div id='IC<%=ViewState["ModulNr"]%>'>
															<asp:Repeater ID="repImageCarousel" runat="server" DataSourceID="odsGetOnlyImages" EnableViewState="False">
																<ItemTemplate>
																		<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
																		<div class="EDGmain">
																			<div class="EDGimage">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>' downhref='<%#GetLighboxImageDownURL(Eval("HiResVersion"),Eval("FileName"))%>'
																					rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="imgImageSlider" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="lblTGNGTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="lblTGNGDescription" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
																			<div class="EDGmain">
																			<div class="EDGvideo">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																					rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="Image1" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label1" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label2" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Normal")%>'>
																		<div class="EDGmain">
																			<div class="EDGvideo">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%=ModulePath.Replace("Controls/ImageCarousel/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																					rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="Image2" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label3" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label4" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plFlashFlow" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Flow")%>'>
																			<div class="EDGmain">
																			<div class="EDGvideo">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%=ModulePath.Replace("Controls/ImageCarousel/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																					rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="Image7" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label13" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label14" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
																			<div class="EDGmain">
																			<div class="EDGvideo">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%#Eval("Filename") %>' rel="<%#RelLink()%>"
																					target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="Image3" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label5" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label6" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
																			<div class="EDGmain">
																			<div class="EDGaudio">
																				<a edgpid='<%#Eval("PictureID")%>' href='<%=ModulePath.Replace("Controls/ImageCarousel/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																					rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																					<asp:Image ID="Image4" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>'
																						src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Width="<%#GetImageWidth()%>" Height="<%#GetImageHeight()%>" />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label7" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label8" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																				</a>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plHtml5Video" runat="server" Visible='<%#ToDisplayHtml5Video("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
																			<div class="EDGmain">
																			<div class="EDGvideo">
																				<video controls="true" src='<%#Eval("Filename") %>' poster='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																				Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																				</video>
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label9" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label10" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																		<asp:PlaceHolder ID="plMovHtml5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
																			<div class="EDGmain">
																			<div class="EDGvideo">
																				<video controls="true" src='<%#Eval("Filename") %>' poster='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																				Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																				</video>
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																					<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																					<span class="round3"></span><span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="Label11" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label><br />
																						<asp:Label ID="Label12" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
																			</div>
																			</div>
																		</asp:PlaceHolder>
																</ItemTemplate>
															</asp:Repeater>
														</div>
														<div class="clearfix">
														</div>
														<a class="prev<%=ViewState["ModulNr"]%>" id='foo2_prev<%=ViewState["ModulNr"]%>'
															href="#" style='visibility: <%=ViewState["ShowNavigation"]%>'><span>prev</span></a>
														<a class="next<%=ViewState["ModulNr"]%>" id='foo2_next<%=ViewState["ModulNr"]%>'
															href="#" style='visibility: <%=ViewState["ShowNavigation"]%>'><span>next</span></a>
														<div class="pagination<%=ViewState["ModulNr"]%>" id='foo2_pag<%=ViewState["ModulNr"]%>'>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<asp:Panel ID="pnlFullscreenlink" runat="server">
						<script type="text/javascript">
							<%=ViewState["jQuery"]%>(document).ready(function() 
							{
								jQuery('#lnkFS<%=ViewState["ModulNr"]%>').click(function() {
									jQuery(this).fullscreenPortfolioGallery({
										ppgroup: '<%=ViewState["ModulNr"]%>',
										pptheme: '<%=ViewState["LightboxType"] %>',
										ppanimationSpeed: '<%=ViewState["AnimSpeed"]%>',
										ppoverlay_gallery: <%=ViewState["OverlayGallery2"]%>,
										ppslideshow: <%=ViewState["LightBoxSlideShow"]%>,
										ppautoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>,
										showCategories: false,            
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
										myshowCategories: false,
										navButtonWidth: 21,
										categorySelector: '<%=ViewState["PortfolioMenuType"]%>',
										showNavigationArrows: <%=ViewState["PortfolioShowArrows"]%>,
										hidableNavigationArrows: <%=ViewState["PortfolioAutoHideArrows"]%>,
										customTitle: '<%=ViewState["PortfolioDisplayTitle"]%>',
										navigationId: 'EDG_portfolio_pagination<%=ViewState["ModulNr"]%>',
										categoriesId: 'EDG_portfolio_categories<%=ViewState["ModulNr"]%>',
										navArrowsFile: '<%=ViewState["PortfolioArrowFile"]%>',
										navDDMFile: '<%=ViewState["ProtfolioDDMFile"]%>',
										xmlRequestParams: {
											GalleryType: 'ImageCarousel',
											ModuleID: '<%=ViewState["ModuleID"]%>',
											ModulePath: '<%=ViewState["ModulePath"]%>',
											PortalHome: '<%=ViewState["PortalHome"]%>',
											PortalID: '<%=ViewState["PortalID"] %>',
											LocaleCode: '<%=ViewState["localecode"] %>',
											SettingCheck: '4535793'
										},
										maxImgWidth: <%=ViewState["TGImageWidth"]%>,
										maxImgHeight: <%=ViewState["TGImageHeight"]%>,
										smartResize: true,
										fullscreenCssId: '<%=ViewState["LightboxFullscreenTheme"]%>',
										fullscreenable: true,
										xmlSource: '<%=ModulePath.Replace("Controls/ImageCarousel/","")%>PortfolioHandler.ashx?tabid=<%=ViewState["TabId"]%>'

									});
									return false;
								});
							});
							</script>
						<div style="padding: 3px 3px 0; overflow: hidden; display:inline; float:left; margin-left: 20px;">
							<a id='lnkFS<%=ViewState["ModulNr"]%>' class="EasyDNNGallery_fullscreen_btn" href="#"><span class="icon"></span><span class="text"><%=ViewState["ShowFullscreen"]%></span></a>
						</div>
						</asp:Panel>
					</div>
				</td>
			</tr>
		</table>
		
	</asp:Panel>
</div>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" SelectMethod="GetRandomImagesFromGallerySorting"
	TypeName="DataAcess" OldValuesParameterFormatString="original_{0}">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
		<asp:Parameter Name="SortMethod" Type="String" />
		<asp:Parameter Name="SortType" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>

