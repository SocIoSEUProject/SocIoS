<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_ImageSliderOneControl, App_Web_imagesliderone1.ascx.57dab40b" %>
<link href="<%=ModulePath.Replace("Controls/ImageSlider/","")%>css/nivo-slider.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	#<%=ViewState["ModulNr"]%>
	{
		background:#202834 url(<%=ModulePath.Replace("Controls/ImageSlider/","")%>css/images/loading.gif) no-repeat scroll 50% 50%;
		margin:5px 5px 10px;
		position:relative;
	}
	
	#<%=ViewState["ModulNr"]%> img 
	{
		display:none;
		left:0;
		position:absolute;
		top:0;
	}
	#<%=ViewState["ModulNr"]%> a 
	{
		border:0 none;
		display:block;
	} 
</style>

<script src="<%=ModulePath.Replace("Controls/ImageSlider/","")%>js/jquery.nivo.slider.js" type="text/javascript"></script>

<div id="ImageSliderOne" runat="server">
 <script type="text/javascript">
				<%=ViewState["jQuery"]%>(window).load(function() {
					<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>').nivoSlider({
						effect:'<%=ViewState["SliderEffect"]%>', 
						animSpeed:<%=ViewState["SliderTransition"]%>,
						pauseTime:<%=ViewState["SlidePause"]%>,
						startSlide:<%=ViewState["SliderStart"]%>, 
						directionNav:true, 
						directionNavHide:true, 
						controlNav:<%=ViewState["PagingVisible"]%>, 
						controlNavThumbs:false, 
						controlNavThumbsFromRel:false,
						keyboardNav:true, 
						pauseOnHover:true, 
						manualAdvance:false, 
						captionOpacity:0.8 
					});
				});
			</script>
	  <script type="text/javascript">

<%=ViewState["jQuery"]%>(document).ready(function() 
{
<%=ViewState["jQuery"]%>("a[rel^='prettyPhoto']").each(function(){
	if(<%=ViewState["jQuery"]%>(this).attr("title").length){
	<%=ViewState["jQuery"]%>(this).attr("pptitle", <%=ViewState["jQuery"]%>(this).attr("title"));
	}
	});

   if('<%=ViewState["LightboxDescription"] %>'=='True')
   {
	<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%> a, #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() 
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
});

</script>
<asp:Literal ID="ltOpenImage" runat="server" EnableViewState="False"></asp:Literal>
	<table align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				<div class="sliderborder">
					<div class="sliderborder2">
						<div id='<%=ViewState["ModulNr"]%>' style='width: <%=ViewState["SliderWidth"]%>px;
							height: <%= ViewState["SliderHeight"]%>px'>
							<asp:Repeater ID="repImageSlider" runat="server" DataSourceID="odsGetOnlyImages">
								<ItemTemplate>
								<img id="imgImageSlider" runat="server" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
								title='<%#ImageSliderTD(Eval("Title"),Eval("Description"),Eval("PictureID")) %>' />
								</ItemTemplate>
							</asp:Repeater>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" SelectMethod="GetOnlyRandomImagesFromGallerySorting"
	TypeName="DataAcess" OldValuesParameterFormatString="original_{0}">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
		<asp:Parameter Name="SortMethod" Type="String" />
		<asp:Parameter Name="SortType" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>
