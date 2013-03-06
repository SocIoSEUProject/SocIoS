<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_VideoGallery3Control, App_Web_videogallery3-0.ascx.e651496d" %>

<style type="text/css">
	.titleempty
	{
		display:none;
	}
	.image_carousel
	{
		padding: 5px 0px 15px 0px;
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
		background: url(<%=ModulePath.Replace("Controls/VideoGallery3/","")%><%=ViewState["ICASpriteURL"]%>) 0 0 no-repeat transparent;
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
		background: url(<%=ModulePath.Replace("Controls/VideoGallery3/","")%>css/images/miscellaneous_sprite.png) 0 -100px no-repeat transparent;
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
</style>
<script type="text/javascript">
	<%=ViewState["jQuery"]%>(document).ready(function($){
		$('#<%=ViewState["CssClass"]%> a.edg_video_gal_socialsharing_toggle<%=ViewState["ModulNr"]%>').click(function() {
			var $click = $(this);
			$click.parent().siblings('.edg_video_gal_socialsharing<%=ViewState["ModulNr"]%>').slideToggle(200);
			return false;
		});
		
		$('#<%=ViewState["CssClass"]%> a.edg_video_gal_permalink_toggle<%=ViewState["ModulNr"]%>').click(function() {
			var $click = $(this);
			$click.parent().parent().siblings('.edg_video_gal_permalink<%=ViewState["ModulNr"]%>').slideToggle(200);
			return false;
		});
	});
</script>
<script type="text/javascript">
		var edgcar = null;
		var itmposorg = 0;
		<%=ViewState["jQuery"]%>(document).ready(function() {
			var hiddenControl = '<%= HiddenField1.ClientID %>';
			itmposorg = document.getElementById(hiddenControl).value;
			<%=ViewState["jQuery"]%>.each(<%=ViewState["jQuery"]%>.browser, function (i) {
				if (<%=ViewState["jQuery"]%>.browser.msie && <%=ViewState["jQuery"]%>.browser.version < "8.0") {
					<%=ViewState["jQuery"]%>('#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain').css('visibility', 'visible');
					<%=ViewState["jQuery"]%>('.image_carousel').css('overflow', 'visible');
					<%=ViewState["jQuery"]%>('.image_carousel').css('height', 'auto');
					}
			});
		});
		<%=ViewState["jQuery"]%>(window).load(function() {
			edgcar =  <%=ViewState["jQuery"]%>('#IC<%=ViewState["ModulNr"]%>').carouFredSel({
			auto : <%=ViewState["SSAutoSlideRandom"]%>,
			auto : {
					play:<%=ViewState["SSAutoSlide"]%>,
					pauseDuration	:<%=ViewState["SSAutoSlidePause"]%>,
					pauseOnHover	: true
					},
			items	:  {
					visible:<%=ViewState["SliderTransition"]%>,
					start : itmposorg
					},
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
			<%=ViewState["jQuery"]%>('#IC<%=ViewState["ModulNr"]%>').trigger("slideTo", itmposorg);
		});
			
		function SetHfValue()
		{
			 var myhiddenControl = '<%= HiddenField1.ClientID %>';                 
			document.getElementById(myhiddenControl).value= edgcar.current_position(); 
		}
</script>
	
<div id="VideoGallery">
	<asp:Panel ID="pnlVideoGallery" runat="server" Visible="False">
		<asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
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
													<asp:Label ID="lblVGTitle" runat="server" CssClass="EDGTitleText" Visible="False"></asp:Label>
													<br />
													<asp:Label ID="lblVGDescription" runat="server" CssClass="GalleryDescription" Visible="False"></asp:Label>
												</div>
												<asp:DataList ID="dlVideos"  runat="server" Font-Bold="False" Font-Italic="False"
												Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center"
												OnItemCreated="dlVideos_ItemCreated" RepeatColumns="1" onitemdatabound="dlVideos_ItemDataBound" >
												<EditItemStyle HorizontalAlign="Center" />
												<ItemTemplate>
													<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplayImage("Image",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info")) %>'>
														<div id="Div2" style="z-index: 0">
															<div class="VideoTitle">
																<asp:Label ID="Label5" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																	CssClass="EDGTitleText"></asp:Label></div>
															<div class="VideoBodyEmbed">
																<asp:Image ID="imgSlideImage" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>'
																	runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ShortEmbedUrl")) %>' />
															</div>
															<div class="VideoDescription">
																<asp:Label ID="Label6" CssClass="EDGTitleText" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label></div>
														</div>
													</asp:PlaceHolder>
													<asp:PlaceHolder ID="plhBitsOnTheRun" runat="server" Visible='<%# ToDisplayBits("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info")) %>'>
														<div id="Div1" style="z-index: 0">
															<div class="VideoTitle">
																<asp:Label ID="Label2" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																	CssClass="EDGTitleText"></asp:Label></div>
															<div class="VideoBodyEmbed">
																<script src="<%#(Eval("ShortEmbedUrl")).ToString()%>" type="text/javascript"></script>
															</div>
															<div class="VideoDescription">
																<asp:Label ID="Label3" CssClass="EDGTitleText" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label></div>
														</div>
													</asp:PlaceHolder>
													<asp:PlaceHolder ID="phVGEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info")) %>'>
														<div id="embedvideo" style="z-index: 0">
															<div class="VideoTitle">
																<asp:Label ID="lblVGEVMediaTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																	CssClass="EDGTitleText"></asp:Label></div>
															<div class="VideoBodyEmbed">
																<%#Eval("FileName") %></div>
															<div class="VideoDescription">
																<asp:Label ID="lblVGEVMediaDescription" CssClass="EDGTitleText" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label></div>
														</div>
													</asp:PlaceHolder>
													<asp:PlaceHolder ID="phSWfFlash" runat="server" Visible='<%# ToDisplayVideo("Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileName")) %>'>
														<div class="VideoTitle">
															<asp:Label ID="lblVGEVMediaTitle3" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																CssClass="EDGTitleText"></asp:Label>
														</div>
														<div class="VideoBodySwf">
															<div id="<%# Getidname() %>">
																You need to upgrade your flash player.
															</div>
														</div>
														<div class="VideoDescription">
															<asp:Label ID="lblVGEVMediaDescription3" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
															</asp:Label>
														</div>
														<script type="text/javascript">
															<%=ViewState["jQuery"]%>(document).ready(function() {
															var flashvars = {};
															var params = {};
															params.wmode='transparent';
															var attributes = {};
															swfobject.embedSWF('<%#DataBinder.Eval(Container.DataItem, "FileName")%>', '<%#Getidname() %>', '<%# GetVideoWidth(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>', '<%# GetVideoHeight(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>', "9.0.0",'<%=ModulePath.Replace("Controls/VideoGallery3/","")%>js/expressInstall.swf', flashvars, params, attributes);
														}); 
														</script>
													</asp:PlaceHolder>
													<asp:PlaceHolder ID="phEVVideo" runat="server" Visible='<%# ToDisplayVideo2Flow("Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileName"),"Normal")%>'>
														<div class="VideoTitle">
															<asp:Label ID="lblVGEVMediaTitle2" runat="server" CssClass="EDGTitleText" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label></div>
														<div class="VideoBodyPlayer">
															<div id="<%# Getidname() %>">
																You need to upgrade your flash player.
															</div>
														</div>
														<div class="VideoDescription">
															<asp:Label ID="lblVGEVMediaDescription2" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
															</asp:Label>
														</div>
														<script type='text/javascript'>
														<%=ViewState["jQuery"]%>(document).ready(function() {
															var flashvars = {};
															var params = {};
															var attributes = {};
															params.codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0';
															//params.width='300';
															//params.height='200';
															params.quality='high';
															params.align='middle';
															params.play='true';
															params.loop='true';
															params.scale='showall';
															// params.wmode='window';
															params.devicefont='false';
															params.bgcolor='#2e2e2e',
															params.allowFullScreen='<%=ViewState["AllowFullscren2"]%>';
															params.allowScriptAccess='sameDomain';
															params.salign = 'middle';
															params.wmode='transparent';
															// SETUP
															/* <![CDATA[ */
															flashvars.forcewidth='<%#GetVideoWidth(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>'
															flashvars.forceheight='<%#GetVideoHeight2(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>'
															flashvars.skin= '<% =ViewState["VGTheme"]%>'
															flashvars.fullscreenbutton='<%=ViewState["AllowFullscren"]%>'
															flashvars.infobutton='<%=ViewState["InfoButton"]%>'
															if ('<%=ViewState["StartPhoto"]%>' == 'True') 
															{
															flashvars.startphoto='<%#DataBinder.Eval(Container.DataItem, "ThumbUrl")%>';
															} 
															else
															{
															flashvars.startphoto='';
															}
															flashvars.videopath='<%#DataBinder.Eval(Container.DataItem, "FileName")%>'
															flashvars.playonload='<%=ViewState["PlayOnLoad"]%>'
															flashvars.initialvolume='<%=ViewState["InitialVolume"]%>'
															flashvars.startbufferonload='<%=ViewState["PlayOnLoad"]%>'
															flashvars.defaultstretch = 'zoom to fit'
															flashvars.buffersize='3'
															flashvars.infotext='<%# ShowDescriptionInFlash(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
															attributes.id = 'pp'
															/* ]]> */                
															swfobject.embedSWF('<%=ModulePath.Replace("Controls/VideoGallery3/","")%>preview.swf', '<%#Getidname() %>', '<%#GetVideoWidth(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>', '<%# GetVideoHeight(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>', '9.0.0', '<%=ModulePath.Replace("Controls/VideoGallery3/","")%>js/expressInstall.swf', flashvars, params, attributes);
														  });
														</script>
													</asp:PlaceHolder>
												
													<asp:PlaceHolder ID="phEVVideoFlow" runat="server" Visible='<%# ToDisplayVideo2Flow("Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileName"),"Flow") %>'>
														<div class="VideoTitle">
															<asp:Label ID="Label4" runat="server" CssClass="EDGTitleText" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label></div>
														<div class="VideoBodyPlayer">
															<a href='<%#GetFlowFileName(DataBinder.Eval(Container.DataItem, "FileName"))%>' style='display: block;
																width: <%#GetFlowVideoWidth(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>px;
																height: <%# GetFlowVideoHeight(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>px'
																id='player<%#Eval("PictureID")%>'></a>
															<script type="text/javascript">
																 flowplayer('player<%#Eval("PictureID")%>',{scaling: '<%=ViewState["FlowScaling"]%>', allowfullscreen:<%= ViewState["AllowFullFlow"]%>,src:'<%=ModulePath.Replace("Controls/VideoGallery3/","")%>flowplayer.swf',wmode: "transparent"},{
																 clip: {
																		allowfullscreen: <%= ViewState["AllowFullFlow"]%>, 
																		autoPlay: <%=ViewState["PlayOnLoadFlow"]%>,
																		scaling: '<%=ViewState["FlowScaling"]%>',
																		<%=ViewState["loopFlow"]%>
																		autoBuffering: true 
																  }
																 });
															</script>

														</div>
														<div class="VideoDescription">
															<asp:Label ID="lblVGEVMediaDescription2Flow" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
															</asp:Label>
														</div>
													</asp:PlaceHolder>
													<asp:PlaceHolder ID="phHtml5Video" runat="server" Visible='<%# ToDisplayVideoHtml5("Video",DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileName")) %>'>
														<div class="VideoTitle">
															<asp:Label ID="Label1" runat="server" CssClass="EDGTitleText" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
														</div>
														<div class="VideoDescription">
															<asp:Label ID="lblVGEVMediaDescription5" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
														</div>
														<style type="text/css">
															#Divvideo_player
															{
																width: <%#GetVideoWidth(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>px;
																height: <%#GetVideoHeight2(DataBinder.Eval(Container.DataItem, "MediaType"),DataBinder.Eval(Container.DataItem, "FileName"))%>px;
																background: #000;
															}
														</style>
														<div id="Divvideo_player">
														</div>
														<script type="text/javascript">
													<%=ViewState["jQuery"]%>(document).ready(function(){
														<%=ViewState["jQuery"]%>("#Divvideo_player").H5Video({
														events : {
															pause : function()
															{
																writeMessage("Paused video");
															},
														play : function()
															{
																writeMessage("Playing video");
															},
														end : function()
															{
																writeMessage("End of video");
															}
															},
														animationDuration : 350,
														source : {
															"video/mp4"  : '<%#DataBinder.Eval(Container.DataItem, "FileName")%>',
															},
														loop : false,
														preload: true,
														autoPlay : false,
														poster : '<%#Eval("ThumbUrl")%>',
														supportMessage : "This browser cannot playback HTML5 videos. We encourage you to upgrade your internet browser to one of the following modern browsers:"
															});
														});
														function writeMessage(msg)
														{}
														</script>
													</asp:PlaceHolder>
													<div class="edg_share_link_wrapper">
													<asp:Panel ID="pnlMediaUrl" runat="server" Visible="False" CssClass="edn_link_and_share_container">
														<a href="#" class="EasyDNNGallery_silver_button edg_video_gal_permalink_toggle<%=ViewState["ModulNr"]%>">
															<span>
																<img alt="" class="icon" src="<%=ModulePath.Replace("Controls/VideoGallery3","")%>images/icons/grey_link.png"><%=ViewState["LinkThis"]%></span></a>
													</asp:Panel>
													<asp:Panel ID="pnlSocialSharing" runat="server" Visible="False" CssClass="edn_link_and_share_container">
														<a href="#" class="EasyDNNGallery_silver_button edg_video_gal_socialsharing_toggle<%=ViewState["ModulNr"]%>">
															<span>
																<img alt="" class="icon" src="<%=ModulePath.Replace("Controls/VideoGallery3","")%>images/icons/grey_plus.png"><%=ViewState["ShareThis"]%></span></a>
													</asp:Panel>													
													<div class="edg_video_gal_socialsharing<%=ViewState["ModulNr"]%>" style='<%=ViewState["ShowSharingStyle"]%>'>
														<%#GetTwitterButton(Eval("PictureID"))%>
														<%#GetGooglePlusButton(Eval("PictureID"))%>
														<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
													</div>
													</div>
													<div class="edg_link_container edg_video_gal_permalink<%=ViewState["ModulNr"]%>" style="display: none;">
														<asp:TextBox ID="tbMediaURL" runat="server" Text='<%#GetMediaURLBackLink(Eval("PictureID"))%>'></asp:TextBox>
												</div>
											</ItemTemplate>
										</asp:DataList>
										<br />
												<table cellpadding="0" cellspacing="0" align="center">
													<tr>
														<td>
															<div class="image_carousel">
																<div id='IC<%=ViewState["ModulNr"]%>'>
																	<asp:Repeater ID="repVideoList" runat="server" OnItemCommand="repVideoList_ItemCommand">
																		<ItemTemplate>
																			<div class="EDGmain">
																				<div class="EDGimage">
																					<asp:LinkButton ID="lbVideoThumb2" runat="server" OnClientClick="SetHfValue();" CommandArgument='<%#Eval("PictureID")%>'
																						CommandName="OpenVideo">
																						<asp:Image ID="imgVideoThumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))  %>'
																							EnableTheming="True" alt='' ImageAlign="Middle" />
																						<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																						<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																						<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																						<span class="round4"></span><span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
																							<asp:Label ID="lblItemTitle2" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#TitleToDisplayThumbnail(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
																							<asp:Label ID="lblTGDescription2" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
																								Visible='<%#DescriptionToDisplayThumbnail(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
																					</asp:LinkButton>
																				</div>
																			</div>
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
														</td>
													</tr>
												</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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

<asp:ObjectDataSource ID="odsGetVideos" TypeName="DataAcess" runat="server" 
	SelectMethod="GetRandomVideosFromGallery" 
	OldValuesParameterFormatString="original_{0}">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter Name="isRandom" Type="Boolean" />
	</SelectParameters>
</asp:ObjectDataSource>
