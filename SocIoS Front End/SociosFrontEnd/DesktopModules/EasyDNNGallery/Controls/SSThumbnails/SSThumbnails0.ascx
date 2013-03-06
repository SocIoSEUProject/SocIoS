<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SSThumbnailsControl, App_Web_ssthumbnails0.ascx.b91af30d" %>

<script type="text/javascript">

<%=ViewState["jQuery"]%>(document).ready(function() 
{
	if('<%=ViewState["ShowToolTips"]%>'=='True')
	{
		if('<%=ViewState["LightboxDescription"] %>'=='True')
		{
		<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>EasyDNNGallery .panel a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() // Select all elements with the "tooltip" attribute
		{
			if(<%=ViewState["jQuery"]%>(this).attr("title").length>0)
			{
				<%=ViewState["jQuery"]%>(this).qtip({
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
<div id="SSThumbnails">
	<asp:Panel ID="pnlSSthumbs" runat="server">
		<script type="text/javascript">
		<%=ViewState["jQuery"]%>(document).ready(function() {
			<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"] %>').galleryView({
				panel_width: <%=ViewState["SSTHwidth"]%>,
				panel_height: <%=ViewState["SSTHheight"]%>,
				frame_width: <%=ViewState["SSTHumbwidth"]%>,
				frame_height: <%=ViewState["SSTHumbheight"]%>,
				overlay_height: <%=ViewState["OverlaySize"]%>,
				overlay_position: '<%=ViewState["OverlayPosition"]%>',
				overlay_opacity: <%=ViewState["OverlayOpacity"]%>,
				overlay_text_color: '#<%=ViewState["OverlayTextColor"]%>',
				overlay_color:'#<%=ViewState["OverlayColor"]%>',
				transition_speed: <%=ViewState["TransitionSpeed"]%>,
				transition_interval: <%=ViewState["TransitionInterval"]%>,
				border: '<%=ViewState["BorderSize"]%>px solid #<%=ViewState["BorderColor"]%>',
				nav_theme: 'light',
				filmstrip_size: <%=ViewState["FilmStripSize"]%>,
				filmstrip_position: '<%=ViewState["ThumbnailPosition"]%>',
				panels_background:'#<%=ViewState["SSTNMainPanelBackColor"]%>',
				background_color:'#<%=ViewState["SSTNFimStripBackColor"]%>',
				ttn: <%=ViewState["TTN"]%>,
				pause_on_hover: true
			});
		});
		</script>

		<table align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<div style="text-align: center;">
						<asp:Label ID="lblSSTBGalleryTitle" runat="server" Visible="False" Style="display: block;
							font-weight: bold; margin-bottom: 5px; font-size: large;"></asp:Label>
						<asp:Label ID="lblSSTBGalleryDescription" runat="server" Style="margin-bottom: 10px;
							display: block; font-size: medium;"></asp:Label>
					</div>
					<div id='<%=ViewState["ModulNr"] %>' align="center" class="galleryview">
						<asp:Repeater ID="Repeater2" runat="server" OnItemCreated="Repeater2_ItemCreated"
							Visible="<%# ToDisplaySSBN() %>">
							<ItemTemplate>
								<div class="panel" style="background-color: #000000">
									<a edgpid='<%#Eval("PictureID")%>' href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID"))%>'
										rel="<%#RelLink()%>" target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
										<asp:Image ID="imgSlideImage" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>'
											runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ShortEmbedUrl")) %>' />
									</a>
									<div class="panel-overlay" style="display: <%#IsOverlayVisible(Eval("Title"),Eval("Description"))%>">
										<b>
											<asp:Label ID="lblSSTNMediaTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
										</b>
										<br />
										<asp:Label ID="lblSSTNMediaDescription" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
									</div>
								</div>
							</ItemTemplate>
						</asp:Repeater>
						<ul id='FS<%=ViewState["ModulNr"]%>' class="filmstrip">
							<asp:Repeater ID="repThumbs" runat="server" Visible="<%# ToDisplayFilmStrip() %>">
								<ItemTemplate>
									<li>
										<asp:Image ID="imgThumbImage" runat="server" alt='<%#Eval("Title")%>' ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' />
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
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
<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" TypeName="DataAcess" SelectMethod="GetOnlyRandomImagesFromGallery"
	OldValuesParameterFormatString="{0}">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
	</SelectParameters>
</asp:ObjectDataSource>
