<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_VerticalCarouselControl, App_Web_verticalcarousel2.ascx.e03001a3" %>
	
<style type="text/css">
	.image_carousel
	{
		padding: 15px 0px 15px 0px;
		position: relative;
	}
	
	.image_carousel img
	{
		border: 1px solid #ccc;
		background-color: white;
		padding: 0px;
		margin: 0px;
		display: block;
		float: left;
	}
	
	a.prev<%=ViewState["ModulNr"]%>, a.next<%=ViewState["ModulNr"]%> 
	{
		background: url(<%=ModulePath.Replace("Controls/VerticalCarousel/","")%>css/images/miscellaneous_sprite.png) 0 0 no-repeat transparent;
		width: 45px;
		height: 45px;
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
			background-position: 0 -50px;
		}
	
	a.next<%=ViewState["ModulNr"]%> 
		{
			right: -12px;
			background-position: -50px 0;
		}
	a.next<%=ViewState["ModulNr"]%>:hover 
		{
			background-position: -50px -50px;
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
			background: url(<%=ModulePath.Replace("Controls/VerticalCarousel/","")%>css/images/miscellaneous_sprite.png) 0 -100px no-repeat transparent;
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
			
	 .html_carousel<%=ViewState["ModulNr"]%> 
	 {
		padding: 15px 0 15px 40px;
	 }
	 
	.html_carousel<%=ViewState["ModulNr"]%> div.slide 
	{
		width: <%=ViewState["SliderWidth"]%>px;
		height: <%=ViewState["SliderHeight"]%>px;
		position: relative;
	}

	.html_carousel<%=ViewState["ModulNr"]%> div.slide div 
	{
		background-color: #000;
		width: <%=ViewState["SliderWidth"]%>px;
		display: none;
		position: absolute;
		bottom: 0;
			filter:alpha(opacity=65);
		opacity:.8;
		-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=65)";
	}

	.html_carousel<%=ViewState["ModulNr"]%> div.slide h4 
	{
		font-size: 20px!important;
		padding: 20px 0 0 20px;
	}
	.html_carousel<%=ViewState["ModulNr"]%> div.slide p 
	{
		font-size: 16px!important;
		padding: 0 0 20px 20px;
	}
	.html_carousel<%=ViewState["ModulNr"]%> div.slide h4 
	{
		color: white!important;
		margin: 0;
	}
	.html_carousel<%=ViewState["ModulNr"]%> div.slide p 
	{
		color: white!important;
		margin: 0;
	}
	</style>

<script type="text/javascript">
				<%=ViewState["jQuery"]%>(document).ready(function($) {
				$('#IC<%=ViewState["ModulNr"]%>').carouFredSel({  
				direction   : '<%=ViewState["SliderEffect"] %>',
				auto : <%=ViewState["SSAutoSlideRandom"]%>,
				auto : {
								play:<%=ViewState["SSAutoSlideRandom"]%>,
								pauseDuration	: <%=ViewState["SlidePause"]%>,
								pauseOnHover	: true,
				onAfter : function(oldItems, newItems)
					{
						oldItems.find("> div").hide();
						newItems.find("> div").slideDown();
					}
				},

				items	: 1,
				scroll	: {
							items : 1
						  }
				}).find(".slide:first > div").show();
			}); 
</script>

 <script type="text/javascript">

<%=ViewState["jQuery"]%>(document).ready(function($) 
{
if('<%=ViewState["ShowToolTips"] %>'=='True')
   {
   if('<%=ViewState["LightboxDescription"] %>'=='True')
   {
	$('#<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGimage a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() 
	{
		if($(this).attr("title").length>0)
		{
			$(this).qtip(
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
<div id="VerticalCarousel" runat="server">
<asp:Panel ID="pnlVerticalCarousel" runat="server">
	<table align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div class="html_carousel<%=ViewState["ModulNr"]%>">
				<div id='IC<%=ViewState["ModulNr"]%>'>
					<asp:Repeater ID="repImageCarousel" runat="server" DataSourceID="odsGetOnlyImages" EnableViewState="False">
						<ItemTemplate>
									<div class="slide">
										<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
											<a edgpid='<%#Eval("PictureID")%>' href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>'
												rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="imgImageSlider" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
													border="0" /></a>
											<div>
												<h4>
													<asp:Label ID="lblTGNGTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="lblTGNGDescription" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										</asp:PlaceHolder>
										
										<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
											<a edgpid='<%#Eval("PictureID")%>' href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
												rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img1" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
													border="0" />
											</a>
											<div>
												<h4>
													<asp:Label ID="Label1" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label2" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										</asp:PlaceHolder>
										
										<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideo("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
										 <a edgpid='<%#Eval("PictureID")%>' href='<%=ModulePath.Replace("Controls/VerticalCarousel/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
												rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img2" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
													border="0" />
											</a>
											<div>
												<h4>
													<asp:Label ID="Label3" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label4" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										</asp:PlaceHolder>
										
										<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
										<a edgpid='<%#Eval("PictureID")%>' href='<%#Eval("Filename") %>'
												rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img3" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
													border="0" />
											</a>
											<div>
												<h4>
													<asp:Label ID="Label5" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label6" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										
										</asp:PlaceHolder>
										
										<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
										<a edgpid='<%#Eval("PictureID")%>' href='<%=ModulePath.Replace("Controls/VerticalCarousel/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
												rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img4" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
													border="0" />
											</a>
											<div>
												<h4>
													<asp:Label ID="Label7" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label8" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										</asp:PlaceHolder>
										
										<asp:PlaceHolder ID="plHtml5Video" runat="server" Visible='<%#ToDisplayHtml5Video("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
										<a edgpid='<%#Eval("PictureID")%>' href='<%#Eval("Filename") %>'
												 title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img5" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
													border="0" /></a>
											<div>
												<h4>
													<asp:Label ID="Label9" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label10" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										</asp:PlaceHolder>
										
										 <asp:PlaceHolder ID="plMovHtml5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
										  <a edgpid='<%#Eval("PictureID")%>' href='<%#Eval("Filename") %>'
												 title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
												<img id="img6" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' Width="<%#GetImageWidthInt()%>" Height="<%#GetImageHeightInt()%>"
													src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
													border="0" /></a>
											<div>
												<h4>
													<asp:Label ID="Label11" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
												</h4>
												<p>
													<asp:Label ID="Label12" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label>
												</p>
											</div>
										 </asp:PlaceHolder>
										
									</div>
								</ItemTemplate>
					</asp:Repeater>
				</div>
				<div class="clearfix">
				</div>
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
