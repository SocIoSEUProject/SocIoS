<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_AudioGallery, App_Web_audiogallery.ascx.dc9a219e" %>

<script src="<%=ModulePath.Replace("Controls/","")%>js/swfobject.js" type="text/javascript"></script>

<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>"
	rel="stylesheet" type="text/css" media="screen" />

<style type="text/css">
.titleempty
{
	display:none;
}

</style>

<script type="text/javascript">
	<%=ViewState["jQuery"]%>(document).ready(function($){
		$('#<%=ViewState["CssClass"]%> a.edg_audio_gal_socialsharing_toggle<%=ViewState["ModulNr"]%>').click(function() {
			var $click = $(this);
			$click.parent().siblings('.edg_audio_gal_socialsharing<%=ViewState["ModulNr"]%>').slideToggle(200);
			return false;
		});
		
		$('#<%=ViewState["CssClass"]%> a.edg_audio_gal_permalink_toggle<%=ViewState["ModulNr"]%>').click(function() {
			var $click = $(this);
			$click.parent().parent().siblings('.edg_audio_gal_permalink<%=ViewState["ModulNr"]%>').slideToggle(200);
			return false;
		});
	});
</script>

<div id="AudioGallery">
	<asp:Panel ID="pnlAudioGallery" runat="server">
		<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>--%>
		<div id="<%=ViewState["CssClass"]%>">
			<div class="EDGbackground">
				<div class="EDGcontentbgrd">
					<div class="EDGcornerbotleft">
						<div class="EDGcornerbotright">
							<div class="EDGcornertopleft">
								<div class="EDGcornertopright">
									<div class="EDGcontent" style="text-align: center;">
										<div class="EDGTitle">
											<asp:Label ID="lblAGTitle" runat="server" CssClass="EDGTitleText" Visible="False"></asp:Label>
											<br />
											<asp:Label ID="lblAGDescription" runat="server" CssClass="GalleryDescription" Visible="False"></asp:Label>
										</div>
										<asp:DataList ID="dlAudioGallery" runat="server" Font-Bold="False" Font-Italic="False"
											Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center"
											ItemStyle-VerticalAlign="Top" OnItemCreated="dlAudioGallery_ItemCreated" 
											onitemdatabound="dlAudioGallery_ItemDataBound">
											<EditItemStyle HorizontalAlign="Center" />
											<ItemTemplate>
												<div class="AudioTitle">
													<asp:Label ID="lblAGMediaTitle" runat="server" CssClass="EDGTitleText" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible="True"></asp:Label>
												</div>
												<asp:PlaceHolder ID="plAudioinFlash" runat="server" Visible='<%#ShowFlashPlayer()%>'>
													<div id="<%#Getidname() %>" class="AudioBody">
														You need to upgrade your flash player.
													</div>
													<script type='text/javascript'>
												<%=ViewState["jQuery"]%>(document).ready(function() {
												var flashvars = {};
												var params = {};
												var attributes = {};
												params.codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0';
												params.scale ='noscale';
												params.salign = "middle";
												params.swliveconnect = "true";
												params.allowscriptaccess = "always";
												params.wmode="transparent";
												flashvars.width ='<%=ViewState["AGwidth"]%>';
												flashvars.autoLoad='<%=ViewState["AudioPlayOnLoad"]%>';
												flashvars.autoPlay='<%=ViewState["AudioPlayOnLoad"]%>';
												flashvars.volume='<%=ViewState["AudioVolume"]%>';
												flashvars.song1url='<%#GetAudioFileName(Eval("Filename"))%>';
												attributes.id = 'AudioPlayer';
												swfobject.embedSWF('<%=ModulePath.Replace("Controls/","")%><%=ViewState["Mp3Player"]%>', '<%#Getidname() %>', '<%=ViewState["AGwidth"]%>', '33', '9.0.0', 'js/expressInstall.swf', flashvars, params, attributes);
												});
												
													</script>

												</asp:PlaceHolder>
												<asp:PlaceHolder ID="plHTML5Audio" runat="server" Visible='<%#ShowHTML5Player()%>'>
												<audio controls preload="none" <%=ViewState["AudioPlayOnLoadHTML5"]%>> 
												  <source src='<%#Eval("Filename")%>'>                                             
												</audio>
												</asp:PlaceHolder>
												<div class="AudioDescription">
													<asp:Label ID="lblAGMediaDescription" runat="server" CssClass="EDGTitleText" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
														Visible="True"></asp:Label>
												</div>
												<div style="clear:both; display:block; text-align:center;"><asp:HyperLink ID="hlDownloadImage" runat="server" NavigateUrl='<%#GetImageDownURL(Eval("FileName"))%>' Visible='<%#GetDownloadVisible(Eval("HiResVersion"))%>' CssClass="downloadlink"><%=ViewState["strDownloadImage"]%></asp:HyperLink></div>
												<div class="edg_share_link_wrapper">
												<asp:Panel ID="pnlMediaUrl" runat="server" Visible="False" CssClass="edn_link_and_share_container">
													<a href="#" class="EasyDNNGallery_silver_button edg_audio_gal_permalink_toggle<%=ViewState["ModulNr"]%>"><span><img alt="" class="icon" src="<%=ModulePath.Replace("Controls/","")%>images/icons/grey_link.png"><%=ViewState["LinkThis"]%></span></a>
												</asp:Panel>
												<asp:Panel ID="pnlSocialSharing" runat="server" Visible="False" CssClass="edn_link_and_share_container">
													<a href="#" class="EasyDNNGallery_silver_button edg_audio_gal_socialsharing_toggle<%=ViewState["ModulNr"]%>"><span><img alt="" class="icon" src="<%=ModulePath.Replace("Controls/","")%>images/icons/grey_plus.png"><%=ViewState["ShareThis"]%></span></a>
												</asp:Panel>
												
												<div class="edg_audio_gal_socialsharing<%=ViewState["ModulNr"]%>" style='<%=ViewState["ShowSharingStyle"]%>'>
													<%#GetTwitterButton(Eval("PictureID"))%>
													<%#GetGooglePlusButton(Eval("PictureID"))%>
													<%#GetFacbookIframeLikeButton(Eval("PictureID"))%>
												</div>
												</div>
												<div class="edg_link_container edg_audio_gal_permalink<%=ViewState["ModulNr"]%>" style="display: none;">
													<asp:TextBox ID="tbMediaURL" runat="server" Text='<%#GetMediaURLBackLink(Eval("PictureID"))%>'></asp:TextBox>
												</div>
											</ItemTemplate>
										</asp:DataList>
										<asp:GridView ID="gvAudioGalPagination" runat="server" AllowPaging="True" AutoGenerateColumns="False"
											BorderStyle="None" BorderWidth="0px" DataKeyNames="PictureID" DataSourceID="odsGetAudio"
											GridLines="None" HorizontalAlign="Center" OnPageIndexChanged="gvAudioGalPagination_PageIndexChanged"
											OnSelectedIndexChanged="gvAudioGalPagination_PageIndexChanged" 
											PageSize="1" ShowFooter="True"
											ShowHeader="False" Width="28px">
											<Columns>
												<asp:BoundField DataField="FileName" Visible="False" />
											</Columns>
											<PagerStyle BorderWidth="0px" CssClass="EDGpager" HorizontalAlign="Center" />
										</asp:GridView>
										  <table cellpadding="0" cellspacing="0" border="0" align="center"><tr><td>
											   <asp:LinkButton ID="btnAGPrev" runat="server" CssClass="buttonPrev" OnClick="btnAGPrev_Click" />
											   <asp:LinkButton ID="btnAGNext" runat="server" CssClass="buttonNext" OnClick="btnAGNext_Click" />
												</td></tr></table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="EDGclear">
					&nbsp;</div>
			</div>
		</div>
		<%--</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="btnAGNext" EventName="Click" />
				<asp:AsyncPostBackTrigger ControlID="btnAGPrev" EventName="Click" />
			</Triggers>
		</asp:UpdatePanel>--%>
	</asp:Panel>
</div>
<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
	<SelectParameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsGetAudio" TypeName="DataAcess" runat="server" 
	SelectMethod="GetRandomAudioFromGallery" 
	OldValuesParameterFormatString="original_{0}">
	<SelectParameters>
		<asp:Parameter Name="GalleryID" Type="Int32" />
		<asp:Parameter DefaultValue="True" Name="isRandom" Type="Boolean" />
	</SelectParameters>
</asp:ObjectDataSource>
