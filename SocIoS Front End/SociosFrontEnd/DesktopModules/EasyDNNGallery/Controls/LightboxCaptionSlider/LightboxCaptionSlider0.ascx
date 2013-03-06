<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_LightboxCaptionSlideControl, App_Web_lightboxcaptionslider0.ascx.2bf93430" debug="True" %>
<style type="text/css">
	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%> .EDGboxslide
	{
		width: <%=ViewState["TGImageWidth"]%>px;
		height: <%=ViewState["TGImageHeight"]%>px;
	}

	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%> .EDGboxcaption
	{ 
		height: <%=ViewState["TGImageHeight"]%>px; 
		width: <%=ViewState["TGImageWidth"]%>px;
	}
	 
	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%> .EDGdesccaption .EDGboxcaption
	{
		top: <%=ViewState["TGImageHeight30"]%>px;
		left: 0;
		white-space:normal;
	}

	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%> .EDGboxcaption .EDGbgrdtext
	{
		width: <%=ViewState["TGImageWidth"]%>px;
		height: <%=ViewState["TGImageHeight"]%>px; 
	}
	   /*nested*/           
	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%>n .EDGboxslide
	{
		width: <%=ViewState["NGThumbWidth"]%>px;
		height: <%=ViewState["NGThumbHeight"]%>px;
	}

	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%>n .EDGboxcaption
	{
		height: <%=ViewState["NGThumbHeight"]%>px; 
		width: <%=ViewState["NGThumbWidth"]%>px;
	}
	 
	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%>n .EDGdesccaption .EDGboxcaption
	{
		top: <%=ViewState["NGThumbHeight30"]%>px;
		left: 0;
		white-space:normal;
	}

	#<%=ViewState["CssClass"]%> .<%=ViewState["ModulNr"]%>n .EDGboxcaption .EDGbgrdtext
	{
		width: <%=ViewState["NGThumbWidth"]%>px;
		height: <%=ViewState["NGThumbHeight"]%>px;
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
	<%=ViewState["jQuery"]%>(document).ready(function () {
		<%=ViewState["jQuery"]%>('.<%=ViewState["ModulNr"]%>.EDGboxslide.EDGdesccaption').hover(function () {
			<%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '0px' }, { queue: false, duration: 360 });
		}, function () {
			<%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '<%=ViewState["TGImageHeight30"]%>px' }, { queue: false, duration: 360 });
	});
	<%=ViewState["jQuery"]%>('.<%=ViewState["ModulNr"]%>n.EDGboxslide.EDGdesccaption').hover(function () {
	<%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '0px' }, { queue: false, duration: 360 });
	}, function () {
	<%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '<%=ViewState["NGThumbHeight30"]%>px' }, { queue: false, duration: 360 });
	});
	if('<%=ViewState["ShowToolTips"]%>'=='True')
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
		   
			function pageLoad(sender, args) {
			if (args.get_isPartialLoad()) {
			<%=ViewState["jQuery"]%>(document).ready(function() {            
			<%=ViewState["jQuery"]%>('.<%=ViewState["ModulNr"]%>.EDGboxslide.EDGdesccaption').hover(function () {
						 <%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '0px' }, { queue: false, duration: 360 });
					 }, function () {
						 <%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '<%=ViewState["TGImageHeight30"]%>px' }, { queue: false, duration: 360 });
					 });

						   <%=ViewState["jQuery"]%>('.<%=ViewState["ModulNr"]%>n.EDGboxslide.EDGdesccaption').hover(function () {
						 <%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '0px' }, { queue: false, duration: 360 });
					 }, function () {
						 <%=ViewState["jQuery"]%>(".EDGslide", this).stop().animate({ top: '<%=ViewState["NGThumbHeight30"]%>px' }, { queue: false, duration: 360 });
					 });
					 
	var showtips= '<%=ViewState["ShowToolTips"] %>';
	 
	<%=ViewState["jQuery"]%>('a[rel^="prettyPhoto"], a[rel^="slP"]').each(function(){
	if(<%=ViewState["jQuery"]%>(this).attr("title")!== undefined)
		{
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("pptitle", <%=ViewState["jQuery"]%>(this).attr("title"));
	if (showtips =='False')
	{
	
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("title","");
	}
	}
	}
	}
	});
	
<%=ViewState["jQuery"]%>("a[rel^='prettyPhoto'], a[rel^='slP']").prettyPhoto({
			animationSpeed: '<%=ViewState["AnimSpeed"]%>',
			slideshow: <%=ViewState["LightBoxSlideShow"]%>,
			autoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>, 
			padding: 40, 
			opacity: 0.8,
			showTitle: true, 
			allowresize: true,
			hideflash: true, 
			wmode: 'opaque',
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

			   
//  if('<%=ViewState["LightboxDescription"] %>'=='True')
//   {
if('<%=ViewState["ShowToolTips"] %>'=='True')
   {
	<%=ViewState["jQuery"]%>(' .EDGimage a[title], .EDGvideo a[title], .EDGaudio a[title]').each(function()
	{
		if(<%=ViewState["jQuery"]%>(this).attr("title").length>0)
		{
			<%=ViewState["jQuery"]%>(this).qtip(
			{
				show: { effect: {type: '<%=ViewState["ShowEffect"]%>', length: '<%=ViewState["ShowEffectDuration"]%>' } },
				hide: { effect: {type: '<%=ViewState["HideEffect"]%>', length: '<%=ViewState["HideEffectDuration"]%>' } },
				position: { corner: { target: '<%=ViewState["TargetPosition"]%>', tooltip: '<%=ViewState["TooltipPosition"]%>'}},
				style: { name: '<%=ViewState["TooltipTheme"]%>', tip: true,  border: { width: <%=ViewState["TooltipBorder"]%>, radius: <%=ViewState["TooltipRadius"]%>  } } 
			});
		}
	});
	
	}
  //  }
	
});
			}
			}
</script>
<asp:Literal ID="ltOpenImage" runat="server" EnableViewState="False"></asp:Literal>
<div id="LightBoxGallery" runat="server">
	<asp:Panel ID="pnlTableGallery" runat="server">    
	<asp:UpdatePanel ID="upTableGallery" runat="server" UpdateMode="Always">
		<ContentTemplate>
			<div id="<%=ViewState["CssClass"]%>" >
				<div class="EDGbackground">
					<div class="EDGcontentbgrd">
						<div class="EDGcornerbotleft">
							<div class="EDGcornerbotright">
								<div class="EDGcornertopleft">
									<div class="EDGcornertopright">
										<div class="EDGcontent">
											<asp:Panel ID="pnlBreadCrumb" runat="server" Visible="True" CssClass="nestedBreadCrumb">
												<asp:LinkButton ID="lbBCTOPGallery" runat="server" OnClick="lbBCTOPGallery_Click"></asp:LinkButton> > 
												<%--<asp:LinkButton ID="lblBCGallery" runat="server"></asp:LinkButton>--%>
												<asp:HyperLink ID="lblBCGallery" runat="server"></asp:HyperLink>
											</asp:Panel>
											<asp:Panel ID="pnlNestedGalleries" runat="server" HorizontalAlign="Center">
												<asp:DataList ID="dlNestedCategory" runat="server" DataKeyField="GalleryID" OnItemCommand="dlNestedCategory_ItemCommand"
													HorizontalAlign="Center" RepeatDirection="Horizontal">
													<ItemTemplate>
													<asp:HiddenField ID="hfGallID" runat="server" Value='<%#Eval("GalleryID")%>' />
														<div class="EDGmain">
															<div class="<%=ViewState["ModulNr"]%>n">
																<div class="EDGimage">
																	<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																	<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																	<span class="round3"></span><span class="round4"></span>
																	<div class="shadowborder">
																		<div class="<%=ViewState["ModulNr"]%>n EDGboxslide EDGdesccaption">
																			<asp:Image ID="DataListImage" runat="server" ImageUrl='<%#GetGalleryThumbPath(DataBinder.Eval(Container.DataItem, "GalleryID")) %>'
																				EnableTheming="True" ImageAlign="Middle" /><span class="zborder"></span>
																			<div class="<%=ViewState["ModulNr"]%>n EDGslide EDGboxcaption">
																				<div class="EDGbgrdtext">
																				</div>
																				<div class="EDGslidetext">
																					<h3>
																						<asp:LinkButton ID="LinkButton1" runat="server" CommandName="OpenNestedGallery" Visible='<%#NGTitleToDisplay(Eval("GalleryName"))%>'
																							CommandArgument='<%#Eval("GalleryID")%>'><%#Server.HtmlDecode(ShowNestedGalleryTitle(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryID")))%></asp:LinkButton>
																					</h3>
																					<p>
																						<asp:Label ID="NGDescription" runat="server" Text='<%#Server.HtmlDecode(ShowNestedGalleryDescription(DataBinder.Eval(Container.DataItem, "GalleryDescription"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																							Visible='<%#NGDescriptionToDisplay(Eval("GalleryDescription"))%>'></asp:Label>
																					</p>
																					<asp:LinkButton CssClass="btnslide" ID="btnslide2" runat="server" CommandName="OpenNestedGallery"
																						CommandArgument='<%#Eval("GalleryID")%>'><%=ViewState["strOpenMedia"]%></asp:LinkButton>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</ItemTemplate>
												</asp:DataList>
												<asp:GridView ID="gvNestedPaging" runat="server" AllowPaging="True" 
													AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" 
													CssClass="pagerbox" DataKeyNames="GalleryID" GridLines="None" 
													onpageindexchanging="gvNestedPaging_PageIndexChanging" 
													ShowHeader="False" Visible="False" ShowFooter="True" HorizontalAlign="Center">
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
											<asp:ObjectDataSource ID="odsTGMedia" runat="server" TypeName="DataAcess" 
													SelectMethod="GetRandomImagesFromGallery" 
													OldValuesParameterFormatString="original_{0}">
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
													RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False"
													Font-Strikeout="False" Font-Underline="False" DataKeyField="PictureID" OnPreRender="dlTableGallery_PreRender"
													RepeatLayout="Table" HorizontalAlign="Center" OnItemCreated="dlTableGallery_ItemCreated"
													ItemStyle-HorizontalAlign="Center">
													<AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
													<ItemTemplate>
														<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="DataListImage" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))  %>'
																					EnableTheming="True" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' ImageAlign="Middle" /><span
																						class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>'
																								edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								lbnestedurl='<%#GetLighboxNestedURL()%>' downhref='<%#GetLighboxImageDownURL(Eval("HiResVersion"),Eval("FileName"))%>'
																								rel="<%#RelLink()%>">
																								<asp:Label ID="lblItemTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label>
																							</a>
																						</h3>
																						<p>
																							<asp:Label ID="lblTGDescription6" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide" href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>'
																							lbnestedurl='<%#GetLighboxNestedURL()%>' downhref='<%#GetLighboxImageDownURL(Eval("HiResVersion"),Eval("FileName"))%>'
																							target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							rel="<%#RelLink2()%>">
																							<%=ViewState["strOpenMedia"]%></a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
															<div style="clear: both; display: block; text-align: center;">
																<asp:HyperLink ID="hlDownloadImage" runat="server" NavigateUrl='<%#GetImageDownURL(Eval("HiResVersion"),Eval("FileName"))%>'
																	Visible='<%#GetDownloadVisible(Eval("HiResVersion"))%>' CssClass="downloadlink"><%=ViewState["strDownloadImage"]%></asp:HyperLink></div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="EmbedImageThumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																								rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<asp:Label ID="EmbedTitleLabel" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label>
																							</a>
																						</h3>
																						<p>
																							<asp:Label ID="lblTGDescription2" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label>
																						</p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																							rel="<%#RelLink2()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Normal")%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="FlashImageThumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																								rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<asp:Label ID="FlashTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label></a></h3>
																						<p>
																							<asp:Label ID="lblTGDescription3" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																							rel="<%#RelLink2()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a></div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashFlow" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Flow")%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="Image3" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																								rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<asp:Label ID="Label6" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label></a></h3>
																						<p>
																							<asp:Label ID="Label7" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																							rel="<%#RelLink2()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a></div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<div class="EDGslidetext">
																					<asp:Image ID="imgflasmovthumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
																						alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																					<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																						<div class="EDGbgrdtext">
																						</div>
																						<div class="EDGslidetext">
																							<h3>
																								<a lbnestedurl='<%#GetLighboxNestedURL()%>' href='<%#Eval("Filename") %>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'  
																									rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																									<asp:Label ID="Label2" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																										Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label></a></h3>
																							<p>
																								<asp:Label ID="lblTGDescription4" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' class="btnslide" edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'  
																								href='<%#Eval("Filename") %>' rel="<%#RelLink2()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<%=ViewState["strOpenMedia"]%></a></div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="imgTGAudio" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																								rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<asp:Label ID="lblAudioTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label></a></h3>
																						<p>
																							<asp:Label ID="lblTGDescription5" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																							rel="<%#RelLink2()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a></div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plHTML5Audio" runat="server" Visible='<%# ShowHTML5Player("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="Image4" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%#Eval("Filename")%>'
																								title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<asp:Label ID="Label8" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label></a></h3>
																						<p>
																							<asp:Label ID="Label9" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%#Eval("Filename")%>' title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a></div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<div class="EDGslidetext">
																					<asp:Image ID="Image2" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
																						alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																					<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																						<div class="EDGbgrdtext">
																						</div>
																						<div class="EDGslidetext">
																							<h3>
																							<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																							Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																							</video>
																							</h3>
																							<p>
																								<asp:Label ID="Label5" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																									Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																							<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																								href='<%#Eval("Filename") %>' rel="" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																								<%=ViewState["strOpenMedia"]%></a></div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlash5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="<%=ViewState["ModulNr"]%>">
																	<div class="EDGimage">
																		<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span>
																		<span class="topsh"></span><span class="round1"></span><span class="round2"></span>
																		<span class="round3"></span><span class="round4"></span>
																		<div class="shadowborder">
																			<div class="<%=ViewState["ModulNr"]%> EDGboxslide EDGdesccaption">
																				<asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																					alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' /><span class="zborder"></span>
																				<div class="<%=ViewState["ModulNr"]%> EDGslide EDGboxcaption">
																					<div class="EDGbgrdtext">
																					</div>
																					<div class="EDGslidetext">
																						<h3>
																							<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=ViewState["TGImageWidth"]%>' height='<%=ViewState["TGImageHeight"]%>'>
																							Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																							</video>
																						</h3>
																						<p>
																							<asp:Label ID="Label3" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></p>
																						<a lbnestedurl='<%#GetLighboxNestedURL()%>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   class="btnslide"
																							href='<%#Eval("FileName")%>' rel="" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<%=ViewState["strOpenMedia"]%></a></div>
																				</div>
																			</div>
																		</div>
																		<div class="socialSharingContainer" style='<%=ViewState["ShowSharingButtons"]%>'>
																		<div class="buttons">
																			<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
																			<%#GetGooglePlusButton(Eval("PictureID"))%>
																			<%#GetTwitterButton(Eval("PictureID"))%>
																		</div>
																	</div>
																	</div>
																</div>
															</div>
														</asp:PlaceHolder>
														<%--</div>--%>
													</ItemTemplate>
													<FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
												</asp:DataList>
												<%=SetupSSValues()%>
												<asp:GridView ID="gvTGPagination" runat="server" AllowPaging="True" DataKeyNames="PictureID"
													DataSourceID="odsTGMedia" OnPageIndexChanged="GridView1_PageIndexChanged" OnPreRender="gvTGPagination_PreRender"
													Width="28px" HorizontalAlign="Center" ShowFooter="True" AutoGenerateColumns="False"
													PageSize="1" ShowHeader="False" BorderWidth="0" BorderStyle="None" Border="0"
													GridLines="None" CssClass="pagerbox" >
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
												</a>
												<a id="hlApproveMedia" runat="server" visible="false">
												<asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/note_accept.png" />
												<%=ViewState["strApprove"]%>
												</a>
											</asp:Panel>
											<%--<asp:UpdateProgress ID="upLighbox" runat="server" AssociatedUpdatePanelID="upTableGallery">
											   <ProgressTemplate>
												<div class='<%=ViewState["PreloaderBackground"]%>'></div>
												<table cellpadding="0" cellspacing="0" align="center" style="margin-top:10px;"><tr><td>
												<div class='<%=ViewState["PreloaderClass"]%>'>
													<img id='preloader' src='<%=ModulePath.Replace("Controls/LightboxCaptionSlider/","")%>images/<%=ViewState["PreloaderImage"]%>' />                        
														</div></td></tr></table>
												</ProgressTemplate>
												</asp:UpdateProgress>--%>
											<div>
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
												<%=ViewState["jQuery"]%>(document).ready(function() 
												{
													jQuery('#<%=upTableGallery.ClientID%>').delegate('a#lnkFS<%=ViewState["ModulNr"]%>', 'click', function() {
														jQuery().fullscreenPortfolioGallery({
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
																GalleryType: '<%=ViewState["GalleryType"]%>',
																ModuleID: '<%=ViewState["ModuleID"]%>',
																ModulePath: '<%=ViewState["ModulePath"]%>',
																PortalHome: '<%=ViewState["PortalHome"]%>',
																PortalID: '<%=ViewState["PortalID"] %>',
																LocaleCode: '<%=ViewState["localecode"] %>',
																SettingCheck: '65756793'
															},
															maxImgWidth: <%=ViewState["TGImageWidth"]%>,
															maxImgHeight: <%=ViewState["TGImageHeight"]%>,
															smartResize: <%=ViewState["SmartResize"]%>,
															fullscreenCssId: '<%=ViewState["LightboxFullscreenTheme"]%>',
															fullscreenable: true,
															xmlSource: '/DesktopModules/EasyDnnGallery/PortfolioHandler.ashx'
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
					</div>
					<div class="EDGclear">
						&nbsp;
						
					</div>
				</div>
			</div>
	</ContentTemplate>
	</asp:UpdatePanel>
	</asp:Panel>
</div>
<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>
