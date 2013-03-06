<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_AdvancedSlideShow, App_Web_advancedslideshow.ascx.fd2419f4" debug="True" %>
<script type="text/javascript">

jQuery(document).ready(function($) 
{
$('.<%=ViewState["ModulNr"]%>container').wtGridGallery({
			num_col:<%=ViewState["SesKolona"]%>,
			num_row:<%=ViewState["SesItemsPerPage"]%>,
			screen_width:<%=ViewState["SSImageWidth"]%>,
			screen_height:<%=ViewState["SSImageHeight"]%>,
			item_width:<%=ViewState["TGImageWidth"]%>,
			item_height:<%=ViewState["TGImageHeight"]%>,
			item_margin:5,
			display_number:<%=ViewState["ShowTitle"]%>,
			display_playbutton:<%=ViewState["ShowDescription"]%>,
			display_dbuttons:true,
			display_advbuttons:false,
			display_textbutton:<%=ViewState["NGShowDescription"]%>,
			display_downloadbutton:<%=ViewState["NGShowTitle"]%>,
			display_tooltip:true,
			display_caption:true,
			display_timer:<%=ViewState["GalleryInfo"]%>,
			display_gallery_info:true,
			effect:'<%=ViewState["SliderEffect"]%>',
			transition_speed:<%=ViewState["LightBoxSlideShowAP"]%>,
			text_effect:'<%=ViewState["SSAutoSlideRandom"]%>',
			text_sync:<%=ViewState["SyncEffects"]%>,
			cpanel_float:<%=ViewState["Floating"]%>,
			cpanel_mouseover:<%=ViewState["ShowOnMouseOver"]%>,
			auto_scale:true,
			cont_nav:true,
			auto_rotate:true,
			delay:<%=ViewState["EffectInt"]%>,
			initial_open:<%=ViewState["InitalOpen"]%>,
			selected_category:1,
			selected_image:1
	});
});

  
</script>
<div id="AdvancedSlideShow" runat="server">
	<div id="EDSGASS" class="EDSGASS">
		<div class='<%=ViewState["ModulNr"]%>container'>
			<div class="ASSgallery">
				<div class="screen">
					<noscript>
						Turn on JavaScript</noscript>
				</div>
				<div class="items">
					<asp:repeater id="repGalleries" runat="server" onitemdatabound="repGalleries_ItemDataBound1">
						<itemtemplate> 
						<ul title="<%#Eval("GalleryName")%>">
							<asp:Repeater ID="repGalleryImages" runat="server">
								<ItemTemplate>
									<li >
									<a href='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ShortEmbedUrl")) %>' >
									 <img src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' alt='<%#Eval("Title")%>' /></a>
										<a href='<%#Eval("ImageUrl")%>' runat="server" target='<%#ViewState["NewWindow"]%>' Visible='<%#Convert.ToBoolean(ViewState["OpenMediaUrl"])%>' id="ImageUrl"></a>
										<div id="DescDIV" style='<%#ViewState["TTTop"]%>' runat="server" Visible='<%#Convert.ToBoolean(ViewState["ShowMediInfo"])%>'>
											<asp:Label ID="lblTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Visible='<%#Convert.ToBoolean(ViewState["ShowMediaTitle"])%>'></asp:Label>  
											<asp:Label ID="lblDescription" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>' Visible='<%#Convert.ToBoolean(ViewState["ShowMediaDescription"])%>'></asp:Label>
										</div>
									</li>  
								</ItemTemplate>
							</asp:Repeater> 
						</ul>
						</itemtemplate>
					</asp:repeater>
				</div>
			</div>
		</div>
	</div>
</div>
<asp:objectdatasource id="odsIntegrate" typename="DataAcess" runat="server" selectmethod="GetIntegration">
	<selectparameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
