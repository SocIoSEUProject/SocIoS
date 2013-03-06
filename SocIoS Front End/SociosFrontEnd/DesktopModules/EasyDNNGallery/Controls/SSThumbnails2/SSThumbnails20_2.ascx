<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SSThumbnails2Control, App_Web_ssthumbnails20_2.ascx.b928f30d" %>

<script src="<%=ModulePath.Replace("Controls/SSThumbnails2/","")%>js/jquery.timers-1.1.2.js"
	type="text/javascript"></script>

<script type="text/javascript" src="<%=ModulePath.Replace("Controls/SSThumbnails2/","")%>js/jquery.galleriffic.js"></script>

<script type="text/javascript" src="<%=ModulePath.Replace("Controls/SSThumbnails2/","")%>js/jquery.opacityrollover.js"></script>
<link rel="stylesheet" href="<%=ModulePath%>Themes/<%=ViewState["Cssfile"] %>" type="text/css" />


<script type="text/javascript">
	document.write('<style>.noscript { display: none; }</style>');
</script>

<style type="text/css">
	#<%=ViewState["CssClass"]%> div.content
		{   
		display: none;
		width: <%=ViewState["SSTHwidth"]%>px;
	}
	#<%=ViewState["CssClass"]%> div.content a, div.navigation a
	{
		text-decoration: none;
	  
	}
	 #<%=ViewState["CssClass"]%> div.content a:focus, div.content a:hover, div.content a:active
	{
		text-decoration: underline;
	}
   #<%=ViewState["CssClass"]%> div.controls
	{
		margin-top: 20px;
		height: 23px;
	}
   #<%=ViewState["CssClass"]%> div.controls a
	{
		padding: 5px;
	}
   #<%=ViewState["CssClass"]%> div.ss-controls
	{
		float: left;
	}
   #<%=ViewState["CssClass"]%> div.nav-controls
	{
		float: right;
	}
   #<%=ViewState["CssClass"]%> div.slideshow-container
	{
		position: relative;
		clear: both;
	   height: <%=ViewState["SSTHheight"]%>px; /* This should be set to be at least the height of the largest image in the slideshow */
		text-align:center;
		display:block;
	   
	}
   #<%=ViewState["CssClass"]%> div.loader
	{
		position: absolute;
		top: 0;
		left: 0;
		background-image: url('<%=ModulePath.Replace("Controls/SSThumbnails2/","")%>images/loader.gif');
		background-repeat: no-repeat;
		background-position: center;
		width: <%=ViewState["SSTHwidth"]%>px;
		height: <%=ViewState["SSTHheight"]%>px; /* This should be set to be at least the height of the largest image in the slideshow */
	}
   #<%=ViewState["CssClass"]%> div.slideshow
	{
		text-align:center;
	}
 
	
   #<%=ViewState["CssClass"]%> div.slideshow span.image-wrapper
	{
		display: block;
	 position:absolute;
	 margin-left:auto;
	 margin-right:auto;
	 height: <%=ViewState["SSTHheight10"]%>px;
	 width: <%=ViewState["SSTHwidth10"]%>px;
	 
	}
	
   #<%=ViewState["CssClass"]%> div.slideshow a.advance-link
	{
		display: block;
		/*width: <%=ViewState["SSTHwidth"]%>px;*/
	  /* height: <%=ViewState["SSTHheight"]%>px; /* This should be set to be at least the height of the largest image in the slideshow */
		/*line-height: <%=ViewState["SSTHheight"]%>px; /* This should be set to be at least the height of the largest image in the slideshow */
		text-align: center;

	   
	   
	}
	
 /* #EDG_7_round0 .EDGmain .EDGimage div.slideshow a img
   {
	float:none;
	
	}*/
	
   #<%=ViewState["CssClass"]%> div.slideshow a.advance-link:hover, #EDG_8_cut_corners_wh_bg div.slideshow a.advance-link:active,#EDG_8_cut_corners_wh_bg div.slideshow a.advance-link:visited
	{
		text-decoration: none;
	}
  /*  #EDG_7_round0 div.slideshow img
	{
		vertical-align: middle;
		border: 1px solid #ccc;
	}*/
   #<%=ViewState["CssClass"]%> div.download
	{
		float: right;
	}
	#<%=ViewState["CssClass"]%> div.caption-container
	{
	  position: relative;
		clear: left;
		height: 75px;
	}
	#<%=ViewState["CssClass"]%> span.image-caption
	{
		display: block;
		
		width: <%=ViewState["SSTHwidth"]%>px;
	 
		/*
		top: 0;
		left: 0;*/
		position: absolute;
	}
   #<%=ViewState["CssClass"]%> div.caption
	{
		padding-top:35px;
		display:block;
		/*float:left;*/
 
		
	}
   #<%=ViewState["CssClass"]%> div.image-title
	{
		font-weight: bold;
		font-size: 1.4em;
	}
   #<%=ViewState["CssClass"]%> div.image-desc
	{
		line-height: 1.3em;
		padding-top: 12px;
	}
   #<%=ViewState["CssClass"]%> div.navigation
	{
		/* The navigation style is set using jQuery so that the javascript specific styles won't be applied unless javascript is enabled. */
	}
  #<%=ViewState["CssClass"]%> ul.thumbs
	{
		clear: both;
		margin: 0;
		padding: 0;
	}
   #<%=ViewState["CssClass"]%> ul.thumbs li
	{
		float: left;
		padding: 0;
		margin: 5px 10px 5px 0;
		list-style: none;
	}
 /*  #EDG_7_round0 a.thumb
   {
	 
		display: block;
  
	}
	   #EDG_7_round0 ul.thumbs img
	{
		border: none;
		display: block;
	}
	
	
	
	*/
   #<%=ViewState["CssClass"]%> ul.thumbs li.selected a.thumb
	{
		
	}
   #<%=ViewState["CssClass"]%> a.thumb:focus
	{
		outline: none;
	}

   #<%=ViewState["CssClass"]%> div.pagination
	{
		clear: both;
	}
	
	
	   #<%=ViewState["CssClass"]%> div.pagination a
	{
	   color:#000;
	}
	
   #<%=ViewState["CssClass"]%> div.navigation div.top
	{
		margin-bottom: 12px;
		height: 11px;
	}
   #<%=ViewState["CssClass"]%> div.navigation div.bottom
	{
		margin-top: 20px;
	}
  #<%=ViewState["CssClass"]%>  div.pagination a, div.pagination span.current, div.pagination span.ellipsis
	{
		display: block;
		float: left;
		margin-right: 2px;
		padding: 4px 7px 2px 7px;
		border: 1px solid #ccc;
		background-color: #fff;
	}
   #<%=ViewState["CssClass"]%> div.pagination a:hover
	{
		background-color: #eee;
		text-decoration: none;
	}
  #<%=ViewState["CssClass"]%>  div.pagination span.current
	{
		font-weight: bold;
		background-color: #ccc;
		border-color: #ccc;
		color: #fff;
	}
   #<%=ViewState["CssClass"]%> div.pagination span.ellipsis
	{
		border: none;
		padding: 5px 0 3px 2px;
		background: 
	}
</style>


<div id="ssthumbs2">
				<div id="<%=ViewState["CssClass"]%>">
				<div class="EDGbackground">
					<div class="EDGcontentbgrd">
						<div class="EDGcornerbotleft">
							<div class="EDGcornerbotright">
								<div class="EDGcornertopleft">
									<div class="EDGcornertopright">
										<div class="EDGcontent">
									   <div class="EDGmain">
										<div class="EDGimage">

				<asp:Panel ID="pnlSSthumbs" runat="server"><div style="text-align: center;">
							<asp:Label ID="lblSSTBGalleryTitle" runat="server" CssClass="EDGTitleText"></asp:Label>
							<asp:Label ID="lblSSTBGalleryDescription" runat="server" CssClass="GalleryDescription"></asp:Label>
						</div>
					 <div id="container">
					<table cellpadding="0" cellspacing="0" width="100%"><tr><td align="center"> 
						 <div id="thumbs" class="navigation">
							<ul class="thumbs noscript">
								<asp:Repeater ID="repGallerific" runat="server" DataSourceID="odsGetOnlyImages" OnItemCreated="repGallerific_ItemCreated">
									<ItemTemplate>
										<li>
										<a class="thumb" href='<%#GetThumbPathMain(DataBinder.Eval(Container.DataItem, "GallerificThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
											title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
											<img src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
											 alt="<%#GetAlt(Eval("Title"),Eval("PictureID"))%>" />
										</a>
											<div class="caption">
												<div class="Slideshow2Title">
													<asp:Label ID="lblSSTNMediaTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
												</div>
												<div class="Slideshow2Description">
													<asp:Label ID="lblSSTNMediaDescription" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
												</div>
											</div>
										</li>
									</ItemTemplate>
								</asp:Repeater>
							</ul>
						</div>
						<div style="clear: both;"></div>
						</td>
					   
					
					<td align="center" style="padding-right:20px; padding-bottom:35px;">
			   <!-- Start Advanced Gallery Html Containers -->
						<div id="gallery" class="content">
						 <div class="slideshow-container">
							  <div id="loading" class="loader">
								</div>

								 <div id="controls" class="controls">
							</div>
							<table cellpadding="0" cellspacing="0" align="center" width="100%"><tr><td align="center"><div id="slideshow" class="slideshow"></div></td></tr></table>
								
							</div>
							<table cellpadding="0" cellspacing="0" align="center" width="100%"><tr><td align="center"><div id="caption" class="caption-container"></div></td></tr></table>                   
						</div>    
					
					</td></tr></table></div>
				</asp:Panel>
				</div></div></div></div></div></div></div></div></div></div>
</div>

<script type="text/javascript">

			<%=ViewState["jQuery"]%>(document).ready(function() {
				// We only want these styles applied when javascript is enabled
				<%=ViewState["jQuery"]%>('div.navigation').css({'float' : 'left'});
				<%=ViewState["jQuery"]%>('div.content').css('display', 'block');

				var onMouseOutOpacity = 0.57;
				<%=ViewState["jQuery"]%>('#thumbs ul.thumbs li').opacityrollover({
					mouseOutOpacity:   onMouseOutOpacity,
					mouseOverOpacity:  1.0,
					fadeSpeed:         'fast',
					exemptionSelector: '.selected'
				});
				var gallery = <%=ViewState["jQuery"]%>('#thumbs').galleriffic({
					delay:                     <%=ViewState["TransitionInterval"]%>,
					numThumbs:                 <%=ViewState["FilmStripSize"]%>,
					preloadAhead:              10,
					enableTopPager:            <%=ViewState["toppager"]%>,
					enableBottomPager:         <%=ViewState["bottompager"]%>,
					maxPagesToShow:            99,
					imageContainerSel:         '#slideshow',
					controlsContainerSel:      '#controls',
					captionContainerSel:       '#caption',
					loadingContainerSel:       '#loading',
					renderSSControls:          true,
					renderNavControls:         true,
					playLinkText:              '<%=playLinkText%>',
					pauseLinkText:             '<%=pauseLinkText%>',
					prevLinkText:              '<%=prevLinkText%>',
					nextLinkText:              '<%=nextLinkText%>',
					nextPageLinkText:          '<%=nextPageLinkText%>',
					prevPageLinkText:          '<%=prevPageLinkText%>',
					enableHistory:             false,
					autoStart:                 false,
					syncTransitions:           true,
					defaultTransitionDuration: <%=ViewState["TransitionSpeed"]%>,
				onSlideChangeOut:             function(prevIndex) {
						// 'this' refers to the gallery, which is an extension of $('#thumbs')
						this.find('ul.thumbs').children().eq(prevIndex).fadeTo('fast', onMouseOutOpacity);
					},
					onSlideChangeIn:              function(nextIndex) {
						this.find('ul.thumbs').children().eq(nextIndex).fadeTo('fast', 1.0);
					},
					onPageTransitionOut:       function(callback) {
						this.fadeTo('fast', 0.0, callback);
					},
					onPageTransitionIn:        function() {
						this.fadeTo('fast', 1.0);
					}
				});
			});
		<%=ViewState["jQuery"]%>.each(jQuery.browser, function (i) {
		if (<%=ViewState["jQuery"]%>.browser.msie && <%=ViewState["jQuery"]%>.browser.version < "8.0") {
			<%=ViewState["jQuery"]%>("#<%=ViewState["CssClass"]%> div.slideshow").css("float", "left");
		}
	});
</script>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" TypeName="DataAcess" 
	SelectMethod="GetOnlyRandomImagesFromGallerySorting">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
		<asp:Parameter Name="SortMethod" Type="String" />
		<asp:Parameter Name="SortType" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>
