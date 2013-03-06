<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_PortfolioControl, App_Web_lightboxportfolio.ascx.b5be42b4" %>

<script type="text/javascript">
  <%=ViewState["jQuery"]%>(document).ready(function() {
		<%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>portfolio').portfolioSetter({
		ppgroup:'<%=ViewState["ModulNr"]%>',
		pptheme:'<%=ViewState["LightboxType"] %>',
		ppanimationSpeed: '<%=ViewState["AnimSpeed"]%>',
		ppoverlay_gallery: <%=ViewState["OverlayGallery2"]%>,
		ppslideshow: <%=ViewState["LightBoxSlideShow2"]%>,
		ppautoplay_slideshow: <%=ViewState["LightBoxSlideShowAP"]%>,
		showCategories: <%=ViewState["NastedGals"]%>,
		pageWidth: <%=ViewState["NGThumbWidth"]%>,
		pageHeight:<%=ViewState["NGThumbHeight"]%>,
		ppLightboxTitle:'<%=ViewState["LightboxTitle"]%>',
		ppLightboxDescription:'<%=ViewState["LightboxDescription"]%>',
		ppMediaTitle:'<%=ViewState["ShowMediaTitle"]%>',
		ppMediaDescription:'<%=ViewState["ShowMediaDescription"]%>',
		pfqtip:'<%=ViewState["LightboxDescription"] %>',
		pfShowQtip:'<%=ViewState["ShowToolTips"]%>',
		pfdiv:'<%=ViewState["ModulNr"]%>EasyDNNGallery',
		pfShowEffect:'<%=ViewState["ShowEffect"]%>',
		pfHideEffect:'<%=ViewState["HideEffect"]%>',
		pfShowDuration: '<%=ViewState["ShowEffectDuration"]%>',
		pfHideDuration: '<%=ViewState["HideEffectDuration"]%>',
		pfTargetPos: '<%=ViewState["TargetPosition"]%>',
		pfTooltipPos:'<%=ViewState["TooltipPosition"]%>',
		pfTheme:'<%=ViewState["TooltipTheme"]%>',
		pfcorner: <%=ViewState["TooltipBorder"]%>,
		pfradius: <%=ViewState["TooltipRadius"]%>,
		pfOpenMediaUrl :'<%=ViewState["OpenMediaUrl"]%>',
		pfOpenMediaTarget : '<%=ViewState["NewWindow"]%>',
		itemMargin: 11,
		allText: '<%=ViewState["strAll"]%>',
		easing: '<%=ViewState["Easing"]%>',
		animationSpeed: <%=ViewState["Duration"]%>,
		itemsPerPage: <%=ViewState["SesItemsPerPage"]%>,
		wavyAnimation: false, 
		myshowCategories:<%=ViewState["DisplayControl"]%>,
		navButtonWidth:21, 
		categorySelector: '<%=ViewState["PortfolioMenuType"]%>',
		showNavigationArrows : <%=ViewState["PortfolioShowArrows"]%>,
		hidableNavigationArrows: <%=ViewState["PortfolioAutoHideArrows"]%>,
		customTitle: '<%=ViewState["PortfolioDisplayTitle"]%>',
		navigationId: 'EDG_portfolio_pagination<%=ViewState["ModulNr"]%>',
		categoriesId: 'EDG_portfolio_categories<%=ViewState["ModulNr"]%>',
		navArrowsFile: '<%=ViewState["PortfolioArrowFile"]%>',
		navDDMFile:'<%=ViewState["ProtfolioDDMFile"]%>',
		ppprint_image_text: '<%=ViewState["PrintImageText"]%>',
		ppitem_emailing_text: '<%=ViewState["EmailText"]%>',
		ppitem_emailing_subject: '<%=ViewState["EmailTextSubject"]%>',
		ppallow_image_printing:<%=ViewState["ShowPrintButton"]%>,
		ppenable_item_emailing:<%=ViewState["ShowEmailButton"]%>,
		ppshow_social_sharing:<%=ViewState["ShowSocial"]%>,
		ppdownload_handler_url:'<%=ViewState["ShowDownloadLinkLightbox"]%>',
		downloadItemText:'<%=ViewState["strDownloadImage"]%>',
		showAllBtn:<%=ViewState["PortfolioShowAllButton"]%>,
		categorySelectorSlideable:<%=ViewState["SlideTitles"]%>,
		sidewayCatsWidth:<%=ViewState["PortfolioMenuWidth"]%>,
		// XML request parameters
		xmlRequestParams: {
			GalleryType: '<%=ViewState["GalleryType"]%>',
			ModuleID: '<%=ViewState["ModuleID"]%>',
			ModulePath:'<%=ViewState["ModulePath"]%>',
			PortalHome: '<%=ViewState["PortalHome"]%>',
			PortalID: '<%=ViewState["PortalID"] %>',
			LocaleCode: '<%=ViewState["localecode"] %>',
			ShowDownloadLink: '<%=ViewState["ShowDownloadLink"]%>',
			UseViewAsDownload: '<%=ViewState["UseViewAsDownload"]%>',
			DownHandlerURL : '<%=ViewState["DownHandlerURL"]%>',
			SettingCheck: '<%=ViewState["PortfolioRandomNumber"]%>'
		},
		showSharingButtons: {
				facebook: <%=ViewState["ShowFacebook"]%>,
				twitter: <%=ViewState["ShowTwitter"]%>,
				gplus: <%=ViewState["ShowGooglePlus"]%>
			},
		itemToOpen : <%=ViewState["itemToOpen"] %>,
		maxImgWidth: <%=ViewState["TGImageWidth"]%>,
		maxImgHeight: <%=ViewState["TGImageHeight"]%>,
		containerWidth: <%=ViewState["NGThumbWidth"]%>,
		containerHeight: <%=ViewState["NGThumbHeight"]%>,
		smartResize: <%=ViewState["SmartResize"]%>,
		moduleCssId: '<%=ViewState["CssClass"]%>',
		fullscreenable: <%=ViewState["PortfolioShowFullscreen"]%>,
		fullscreenButtonText: '<%=ViewState["ShowFullscreen"]%>',
		fullscreenCssId: '<%=ViewState["FullscreenTheme"]%>',	
		//xmlSource:'<%=ModulePath.Replace("Controls/Portfolio/","")+ ModuleId.ToString()%>PortofolioData.xml?<%=ViewState["myRandom"]%>'
		xmlSource: '<%=ModulePath.Replace("Controls/Portfolio/","")%>PortfolioHandler.ashx?tabid=<%=ViewState["TabId"]%>'
		});	
  });
</script>

<table cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<div id="PortfolioGallery">
				<div id="<%=ViewState["CssClass"]%>">
					<div class="EDGbackground">
						<div class="EDGcontentbgrd">
							<div class="EDGcornerbotleft">
								<div class="EDGcornerbotright">
									<div class="EDGcornertopleft">
										<div class="EDGcornertopright">
											<div class="EDGcontent">
												<div id="<%=ViewState["ModulNr"]%>portfolio" style="position: relative;">
												</div>
											</div>
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
