<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.ViewEasyDNNGallery, App_Web_vieweasydnngallery.ascx.af09375b" autoeventwireup="true" %>

<script type="text/javascript">
//v4.8.9
	if (typeof jQuery != 'undefined') {
		if ('<%=ViewState["jQuery"]%>'=='jQuery')
			jQuery.noConflict();

		if('<%=loadScripts%>' == "True")
		{
			jQuery(document).ready(function($) {
				var showtips= '<%=ViewState["ShowToolTips"] %>';
			 
				$('a[rel^="prettyPhoto"], a[rel^="slP"]').each(function()
				{
				if($(this).attr("title"))
				{
					if($(this).attr("title").length>0)
					{
						$(this).attr("pptitle", $(this).attr("title"));
						if (showtips =='False')
						{
						  if($(this).attr("title").length>0)
						  {
							$(this).attr("title","");
						  }
						}
					 }
					 }
				});
				  $('a[rel^="prettyPhoto"], a[rel^="slP"]').prettyPhoto({
						animationSpeed: '<%=ViewState["AnimSpeed"]%>',
						slideshow: <%=ViewState["LightBoxSlideShow"]%>,
						autoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>, 
						padding: 40, 
						opacity: 0.8,
						showTitle: true, 
						allowresize: true,
						hideflash: true, 
						downloadText:'<%=ViewState["DownloadText"]%>',
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
				});
		}
	}
</script>

<div itemscope="" itemtype="http://schema.org/Product">
	<asp:Image itemprop="image" ID="imgItepProp" runat="server" Style="display: none;"
		Visible="False" />
	<asp:Label ID="lblMainMessage" runat="server" Text="Please add some images then setup gallery."
		Visible="False" resourcekey="lblMainMessageResource1"></asp:Label>
    <asp:Label ID="lblDemo" runat="server" Text=""    Visible="False"></asp:Label><br />
<asp:HyperLink ID="hlFullVersion" runat="server" Visible="False">EasyDNNSoulutions</asp:HyperLink>  
	<div id="<%=ViewState["ModulNr"]%>EasyDNNGallery">
		<asp:PlaceHolder ID="plhContent" runat="server"></asp:PlaceHolder>
	</div>
	<div>
		<a id="hlUploadQuerstr" runat="server" visible="false">
			<asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/image_add.png" />
			<%=ViewState["strUserUpload"]%>
		</a><a id="hlApproveMedia" runat="server" visible="false">
			<asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/note_accept.png" />
			<%=ViewState["strApprove"]%>
		</a>
	</div>
<br />
<asp:Label ID="lblDemoTrial" runat="server" Text="This is 15 day trial version."></asp:Label>
</div>
