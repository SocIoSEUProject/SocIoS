<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SlideShow, App_Web_slideshow.ascx.dc9a219e" %>

<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>"
	rel="stylesheet" type="text/css" media="screen" />
<script src="<%=ModulePath.Replace("Controls/","")%>js/jquery.qtip-1.0.0.js" type="text/javascript"></script>

<style type="text/css">
.SlideshowThumbDescription
	{
		font-family: Verdana, Arial, Helvetica, sans-serif;
		font-size: 12px;
		font-weight: normal;
		text-align: center;
		margin-top: 10px;
		margin-bottom: 10px;
		color: #333333;
	}
	.SlideshowThumbTitle
	{
		text-align: center;
		font-family: Times new roman, Helvetica, sans-serif;
		font-size: 24px;
		color: #333333;
		font-weight: normal;
		font-style: normal;
		font-variant: normal;
		text-transform: uppercase;
	}
</style>

<script type="text/javascript">

<%=ViewState["jQuery"]%>(document).ready(function() 
{
   var showtips= '<%=ViewState["ShowToolTips"] %>';
	 
	<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>SlideShow .EDGimage a').each(function(){
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("pptitle", <%=ViewState["jQuery"]%>(this).attr("title"));
	if (showtips =='False')
	{
	<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>SlideShow .EDGimage a').each(function(){
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("title","");
	}    
	});
}  
}
});

   if('<%=ViewState["ShowToolTips"]%>'=='True')
   {
   if('<%=ViewState["LightboxDescription"] %>'=='True')
   {
	<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGimage a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() 
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
<%=ViewState["jQuery"]%>(document).ready(function() 
{ 
var showtips= '<%=ViewState["ShowToolTips"] %>';
	 
	<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>SlideShow .EDGimage a').each(function(){
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("pptitle", <%=ViewState["jQuery"]%>(this).attr("title"));
	if (showtips =='False')
	{
	
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("title","");
	}

}
}
});
	
<%=ViewState["jQuery"]%>("a[rel^='prettyPhoto']").prettyPhoto({            
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

	if('<%=ViewState["ShowToolTips"]%>'=='True')
		{
			<%=ViewState["jQuery"]%>(' .EDGimage a[title], .EDGvideo a[title], .EDGaudio a[title]').each(function()
			{
			if(<%=ViewState["jQuery"]%>(this).attr("title").length>0)
			{
				<%=ViewState["jQuery"]%>(this).qtip({
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
<asp:Literal ID="ltOpenImage" runat="server" EnableViewState="False"></asp:Literal>
<div id="<%=ViewState["ModulNr"]%>SlideShow">
	<asp:UpdatePanel ID="upSlideShow" runat="server">
		<ContentTemplate>
			<div id="<%=ViewState["CssClass"]%>">
				<div class="EDGbackground">
					<div class="EDGcontentbgrd">
						<div class="EDGcornerbotleft">
							<div class="EDGcornerbotright">
								<div class="EDGcornertopleft">
									<div class="EDGcornertopright">
										<div class="EDGcontent">
											<div class="EDGTitle">
												<asp:Label ID="lblSSTitle" runat="server" CssClass="EDGTitleText"></asp:Label>
												<br />
												<asp:Label ID="lblSSTDescription" runat="server" CssClass="SlideshowDescription"></asp:Label></div>
											<asp:DetailsView ID="dvImageSlideShow" runat="server" AllowPaging="True" AutoGenerateRows="False"
												DataKeyNames="PictureID" DataSourceID="odsGetOnlyImages" GridLines="None" OnDataBound="dvImageSlideShow_DataBound"
												OnItemCreated="dvImageSlideShow_ItemCreated" PagerStyle-CssClass="EDGpager" RowStyle-HorizontalAlign="Center"
												HorizontalAlign="Center" PagerStyle-HorizontalAlign="Center">
												<RowStyle HorizontalAlign="Center" />
												<PagerStyle CssClass="EDGpager" HorizontalAlign="Center" />
												<Fields>
													<asp:TemplateField ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<table cellpadding="0" cellspacing="0" align="center">
																<tr>
																	<td>
																		<div class="EDGSlide">
																			<div class="EDGimage">
																				<a edgpid='<%#Eval("PictureID")%>' edgmid='<%=ViewState["ModuleIDNR"]%>'   href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>' target="<%#TargetWin()%>"
																					title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																					rel="<%=RelLink()%>">
																					<img id="Image1" runat="server" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' />
																					<span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
																					<span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
																						<asp:Label ID="lblSSMediaTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
																						<asp:Label ID="lblSSMediaDescription" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																							CssClass="Description" Style="display: block"></asp:Label>
																					</span></a>
																			</div>
																		</div>
																	</td>
																</tr>
															</table>
														</ItemTemplate>
														<ItemStyle HorizontalAlign="Center" />
													</asp:TemplateField>
												</Fields>
											</asp:DetailsView>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick" Enabled="False">
			</asp:Timer>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" TypeName="DataAcess" 
	SelectMethod="GetOnlyRandomImagesFromGallerySorting">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
		<asp:Parameter Name="SortMethod" Type="String" />
		<asp:Parameter Name="SortType" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>
