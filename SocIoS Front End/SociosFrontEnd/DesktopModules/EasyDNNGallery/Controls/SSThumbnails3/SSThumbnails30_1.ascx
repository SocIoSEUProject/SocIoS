<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SSThumbnails3Control, App_Web_ssthumbnails30_1.ascx.b927f30d" %>
<link href="<%=ModulePath.Replace("Controls/SSThumbnails3/","")%>css/galleria.<%=ViewState["GalleriaTheme"]%>.css"
	rel="stylesheet" type="text/css" />

<script src="<%=ModulePath.Replace("Controls/SSThumbnails3/","")%>js/galleria.js" type="text/javascript"></script>

<style type="text/css">
	.contentgalleria
	{
		color: #eee;
		font: 14px/1.4 "helvetica neue" , arial,sans-serif;
		width: <%=ViewState[ "SliderWidth" ]%>px;
		margin: 20px auto;
	}
	.galleria-container
	{
		position: relative;
		overflow: hidden;
		background: #<%=ViewState[ "BorderColor" ]%>;
	}
	.fullscreenLink
	{
		background: #<%=ViewState[ "BorderColor" ]%>;
	}
	h1
	{
		line-height: 1.1;
		letter-spacing: -1px;
	}
	a
	{
		color: #fff;
	}
	#galleria
	{
		height: <%=ViewState[ "SliderHeight" ]%>px;
	}
</style>

	<table cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<div id="SlideShowThumbnails" runat="server">
					<div class="contentgalleria">
						<div id="galleria">
							<asp:Repeater ID="repImageSlider" runat="server" DataSourceID="odsGetOnlyImages"
								EnableTheming="True">
								<ItemTemplate>
									<img id="imgImageSlider" runat="server" alt='' src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
										title='<%#ImageSliderTD(Eval("Title"),Eval("Description"),Eval("PictureID")) %>' />
								</ItemTemplate>
							</asp:Repeater>
						</div>
						<div id="GalleriaFullscreen" runat="server" class="fullscreenLink" style="padding: 5px;">
							<asp:Panel ID="pnlFullscreen" runat="server">
								<img id="imgFullScreen" alt='<%#Eval("Title")%>' src='<%=ModulePath.Replace("Controls/SSThumbnails3/","images/")%>fullscreen.png' />
								<a id="g_fullscreen" href="#">
									<%=ViewState["FullScreen"]%></a>
							</asp:Panel>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
					<%=ViewState["jQuery"]%>(document).ready(function() {
					  Galleria.loadTheme('<%=ModulePath.Replace("Controls/SSThumbnails3/","")%>js/galleria.<%=ViewState["GalleriaTheme"]%>.js');
						<%=ViewState["jQuery"]%>('#galleria').galleria({
								transition: '<%=ViewState["SliderEffect"]%>',
								transition_speed: <%=ViewState["SlidePause"]%>,
								image_crop: '<%=ViewState["Crop"]%>',
								height: <%=ViewState["SliderHeight"]%>,
								width:<%=ViewState["SliderWidth"]%>,
								autoplay: <%=ViewState["SSAutoSlide"]%>,
								keepSource: true,
								extend: function() { 
										var mygallery = this;
										<%=ViewState["jQuery"]%>('#g_fullscreen').click(function()
										{
											mygallery.enterFullscreen();
										});
										}
							});
					});
	</script>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" SelectMethod="GetOnlyRandomImagesFromGallerySorting"
	TypeName="DataAcess">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
		<asp:Parameter Name="SortMethod" Type="String" />
		<asp:Parameter Name="SortType" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>
