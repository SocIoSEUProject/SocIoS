<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_StreamingVideoGallery, App_Web_streamingvideogallery.ascx.625e4e3a" %>

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

<asp:Panel ID="pnlVideoGallery" runat="server" Visible="False">
	<div id="<%=ViewState["CssClass"]%>">
		<div class="EDGbackground">
			<div class="EDGcontentbgrd">
				<div class="EDGcornerbotleft">
					<div class="EDGcornerbotright">
						<div class="EDGcornertopleft">
							<div class="EDGcornertopright">
								<div class="EDGcontent edg_streaming_video">
									<asp:Panel ID="pnlSGTitle" CssClass="video_title" runat="server" Visible="false"><asp:Literal ID="literalVideoTitle" runat="server" /></asp:Panel>
									<div class="video_player_wrapper" style="width: <%=ViewState["VGwidth"]%>px; height: <%=ViewState["VGheight"]%>px;">
										<div class="video_player_container" id="EDGStreamingVideo_<%=ViewState["ModulNr"]%>" style="width: <%=ViewState["VGwidth"]%>px; height: <%=ViewState["VGheight"]%>px;" href="<%=ViewState["RTMPFileURL"]%>">&nbsp;</div>
										<script type="text/javascript">
											$f('EDGStreamingVideo_<%=ViewState["ModulNr"]%>', '<%=ModulePath.Replace("Controls/StreamingVideo/","")%>flowplayer.swf', {
												clip: {
													provider: 'rtmp'
												},
												plugins: {
													rtmp: {
														url: '<%=ModulePath.Replace("Controls/StreamingVideo/","")%>flowplayer.rtmp-3.2.3.swf',
														netConnectionUrl: '<%=ViewState["RTMPServer"]%>'
													}
												}
											});
										</script>
									</div>
									<asp:Panel ID="pnlSGDescription" CssClass="video_description" runat="server" Visible="false"><asp:Literal ID="literalVideoDescription" runat="server" /></asp:Panel>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
</asp:Panel>
