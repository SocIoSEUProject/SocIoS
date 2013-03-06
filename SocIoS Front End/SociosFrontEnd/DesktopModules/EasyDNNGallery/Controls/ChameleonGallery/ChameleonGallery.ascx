<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_ChameleonGallery, App_Web_chameleongallery.ascx.88d657a2" %>

<script type="text/javascript">
	eds1_8(document).ready(function($) {
		$('#eds_slider<%=ModulNr%>').chameleonSlider_1_4({
			content_source: '<%=ModulePath.Replace("Controls/ChameleonGallery/","")%>ChameleonGalleryService.ashx?tabid=<%=TabId%>&fullscreen=false',
			flowplayer_src: '<%=ModulePath.Replace("Controls/ChameleonGallery/", "")%>js/flowplayer/flowplayer.swf',
			container_dimensions: {
				width: <%=myappSettings.SSImageWidth%>,
				height: <%=myappSettings.SSImageHeight%>,
				w_as_ratio: <%=myappSettings.SSImageWidthResponsive%>
			},
			main_panel: {
				display: true,
				fill_panel: true,
				stretch_small_image: <%=stretchsmallimage%>,
				drag_navigation: <%=myappSettings.ChameleonEnableDragging.ToLower()%>,
				top_left_align: <%=myappSettings.ImageStretch%>,
				dimensions: {
					width: <%=myappSettings.ImapgePanelWidth%>,
					height: <%=myappSettings.ImapgePanelHeight%>,
					w_as_ratio: <%=myappSettings.ImapgePanelWidthResponsive%>,
					h_as_ratio: <%=myappSettings.ImapgePanelHeightResponsive%>,
				},
				position: {
					vertical: 'top',
					horizontal: 'left',
					h_offset: <%=myappSettings.ImapgePanelTopX%>,
					v_offset: <%=myappSettings.ImapgePanelTopY%>
				},
				transition: {
					duration: <%=myappSettings.ASSInterval%>,
					effects: [
						<%=myappSettings.SliderEffect%>
					]
				}
			},
			pagination: {
				display: false
			},
			buttons: {
				email: {
					display: <%=myappSettings.NGShowdescription.ToLower()%> ,
					position: {
						vertical: 'top',
						horizontal: 'right',
						h_offset: <%=emailPositionX.ToString()%>,
						v_offset: <%=emailPositionY.ToString()%>
					},
					email_subject: '<%=EmailText%>'
				},
				download: {
					display: <%=myappSettings.NGShowName.ToLower()%>,
					position: {
						vertical: 'top',
						horizontal: 'right',
						h_offset: <%=downloadPositionX.ToString()%>,
						v_offset: <%=downloadPositionY.ToString()%>
					}
				},
				fullscreen: {
					display: <%=myappSettings.ChameleonFullscreen%>,
					position: {
						vertical: 'top',
						horizontal: 'right',
						h_offset: <%=fullscreenPositionX.ToString()%>,
						v_offset: <%=fullscreenPositionY.ToString()%>
					}
				}
			},
			thumbs: {
				display: true,
				auto_hide: false,
				hide_speed: 250,
				display_item_types: true,
				width: <%=myappSettings.TGImageWidth%>,
				height: <%=myappSettings.TGImageHeight%>,
				captions: <%=myappSettings.ShowMediaTitleThumbnail.ToLower()%>,
				pagination: {
					direction: '<%=myappSettings.ThumbDirection%>',
					duration: 250,
					easing: 'swing'
				},
				tooltips: {
					enabled: <%=myappSettings.Qtip2Show.ToLower()%>,
					title: <%=myappSettings.Qtip2ShowTitle.ToLower()%>,
					description: <%=myappSettings.Qtip2ShowDescription.ToLower()%>,
					position: {
						my: '<%=Qtip2ShowPositionMy%> center',
						at: '<%=myappSettings.Qtip2ShowPosition%> center'
					},
					classes: 'jtools <%=myappSettings.Qtip2ShowStlye%>'
				},
				container: {
					dimensions: {
						width: <%=myappSettings.ThumbPanelWidth%>,
						height: <%=myappSettings.ThumbPanelHeight%>,
						w_as_ratio: <%=myappSettings.ThumbPanelWidthResponsive%>,
						h_as_ratio: <%=myappSettings.ThumbPanelHeightResponsive%>
					},
					position: {
						vertical: 'top',
						horizontal: 'left',
						h_offset: <%=myappSettings.ThumbPanelX%>,
						v_offset: <%=myappSettings.ThumbPanelY%>,
						h_as_ratio: <%=myappSettings.ThumbPanelXResponsive%>,
						w_as_ratio: <%=myappSettings.ThumbPanelYResponsive%>
					}
				}
			},
			scrollable_boxes: {
				item_info: {
					display: <%=myappSettings.ShowMediaDescription.ToLower()%>,
					container: {
						dimensions: {
							width: <%=myappSettings.CaptionWidth%>,
							height: <%=myappSettings.CaptionHeight%>,
							w_as_ratio: <%=myappSettings.CaptionWidthResponsive%>,
							h_as_ratio: <%=myappSettings.CaptionHeightResponsive%>
							
						},
						resize_to_content: false,
						position: {
							vertical: '<%=myappSettings.CaptionLRTB.ToLower()%>',
							horizontal: 'left',
							h_offset: <%=myappSettings.CaptionX%>,
							v_offset: <%=myappSettings.CaptionY%>,
							h_as_ratio: <%=myappSettings.CaptionXResponsive%>,
							w_as_ratio: <%=myappSettings.CaptionXResponsive%>
						}
					}
				},
				gallery_info: {
					display: <%=myappSettings.ShowGalleryDescription.ToLower()%>,
					container: {
						dimensions: {
							height: <%=myappSettings.GalleryCaptionHeight%>,
							width: <%=myappSettings.GalleryCaptionWidth%>,
							h_as_ratio: <%=myappSettings.GalleryCaptionHeightResponsive%>,
							w_as_ratio: <%=myappSettings.GalleryCaptionWidthResponsive%>
						},
						resize_to_content: false,
						position: {
							vertical: '<%=myappSettings.GalleryCaptionLRTB.ToLower()%>',
							horizontal: 'left',
							h_offset: <%=myappSettings.GalleryCaptionX%>,
							v_offset: <%=myappSettings.GalleryCaptionY%>,
							h_as_ratio: <%=myappSettings.GalleryCaptionXResponsive%>,
							w_as_ratio: <%=myappSettings.GalleryCaptionXResponsive%>
						}
					}
				}
			},
			arrows: {
				display: <%=myappSettings.ShowNavigation.ToLower()%>,
				auto_hide: true,
				hide_speed: 250,
				prev: {
					position: {
						vertical: 'top',
						horizontal: 'left',
						h_offset: <%=arrowPositionXleft.ToString()%>,
						v_offset: <%=ViewState["arrowPositionY"]%>
					}
				},
				next: {
					position: {
						vertical: 'top',
						horizontal: 'right',
						h_offset: <%=arrowPositionXright.ToString()%>,
						v_offset: <%=ViewState["arrowPositionY"]%>
					}
				}
			},
			autoplay: {
				enable: <%=myappSettings.ShowPlayPause.ToLower()%>,
				interval: <%=myappSettings.SSAutoSlidePause%>,
				pause_on_hover: true,
				indicator: {
					display: false
				}
			},
			autoplay_toggle: {
				display: false
			},
			social_buttons: {
				display: <%=myappSettings.SocialSharingButtons.ToLower()%>,
				direction: 'vertical',
				load_after_effect: true,
				position: {
					vertical: 'top',
					horizontal: 'right',
					h_offset: <%=sharingPositionX.ToString()%>,
					v_offset: <%=sharingPositionY.ToString()%>
				},
				buttons: {
					facebook: {
						display: <%=myappSettings.ShowFacebook.ToLower()%>,
						html: '<iframe src="http://www.facebook.com/plugins/like.php?href={location_href_encoded}&amp;layout=button_count&amp;show_faces=true&amp;action=like&amp;font&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:20px; width: 100px;" allowTransparency="true"></iframe>'
					},
					google: {
						display: <%=myappSettings.ShowGooglePlus.ToLower()%>,
						html: '<g:plusone size="medium" href="{location_href}" annotation="bubble"></g:plusone><script type="text/javascript">gapi.plusone.go();</' + 'script>'
					},
					twitter: {
						display: <%=myappSettings.ShowTwitter.ToLower()%>,
						html: '<a href="http://twitter.com/share" class="twitter-share-button" data-url="{location_href}" data-count="horizontal">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></' + 'script>'
					}
				},
				hideable: true,
				container: {
					width: 100,
					height: 100
				}
			},
			categories: {
				display: <%=myappSettings.DisplayNestedGalleries.ToLower()%>,
				auto_hide: false,
				hide_speed: 250,
				width: <%=myappSettings.NGThumbWidth%>,
				height: <%=myappSettings.NGThumbHeight%>,
				pagination: {
					direction: '<%=myappSettings.CategoryDirection%>',
					duration: 250,
					easing: 'swing'
				},
				container: {
					dimensions: {
						height: <%=myappSettings.CategoryHeight%>,
						width: <%=myappSettings.CategoryWidth%>,
						h_as_ratio: <%=myappSettings.CategoryHeightResponsive%>,
						w_as_ratio: <%=myappSettings.CategoryWidthResponsive%>
					},
					position: {
						vertical: 'top',
						horizontal: '<%=myappSettings.CategoryLRTB%>',
						h_offset: <%=myappSettings.CategoryX%>,
						v_offset: <%=myappSettings.CategoryY%>,
						h_as_ratio: <%=myappSettings.CategoryXResponsive%>,
						w_as_ratio: <%=myappSettings.CategoryYResponsive%>
					}
				}
			},
			title_boxes: {
				current_item: {
					display: <%=myappSettings.ShowMediaTitle.ToLower()%>,
					height: 35,
					position: {
						vertical: '<%=myappSettings.CaptionLRTB.ToLower()%>',
						horizontal: 'left',
						h_offset: <%=myappSettings.CaptionX%>,
						v_offset: <%=sbPositionY%>
					}
				},
				current_gallery: {
					display: <%=myappSettings.ShowGalleryTitle.ToLower()%>,
					height: 35,
					position: {
						vertical: '<%=myappSettings.GalleryCaptionLRTB.ToLower()%>',
						horizontal: 'left',
						h_offset: <%=myappSettings.GalleryCaptionX%>,
						v_offset: <%=GalleryCaptionTitleY%>
					}
				}
			},
			redirect_on_click: <%= myappSettings.OpenMediaUrl.ToLower()%>,
			redirect_on_click_target: '<%=myappSettings.NewWindow%>',
			lightbox_on_click: <%=myappSettings.NothngOnClick.ToLower()%>,
			module_id:<%=ModuleId%>,
			portal_path:'<%=PortalSettings.HomeDirectory%>',
			locale: '<%=mainlocalecode%>',
			portal_id: <%=PortalId%>,
			lightbox_title:<%=myappSettings.LightboxTitle%>,
			lightbox_description:<%=myappSettings.LightboxDescription%>,
			pretty_photo_options: {
				theme: '<%=myappSettings.LightboxType %>',
				print_image_text: '<%=PrintImageText%>',
				item_emailing_text: '<%=EmailText%>',
				item_emailing_subject: '<%=EmailTextSubject%>',
				allow_image_printing:<%=myappSettings.LightboxShowPrint.ToLower()%>,
				enable_item_emailing:<%=myappSettings.LightboxShowEmail.ToLower()%>,
				show_social_sharing:<%=myappSettings.LightboxSocialSharing.ToLower()%>,
				overlay_gallery: <%=myappSettings.OverlayGallery%>
			},
			<%=GalleryPos%>
			fullscreen_options: {
				content_source: '<%=ModulePath.Replace("Controls/ChameleonGallery/","")%>ChameleonGalleryService.ashx?tabid=<%=TabId%>&fullscreen=true',
				module_id: <%=ModuleId%>,
				portal_path: '<%=PortalSettings.HomeDirectory%>',
				locale: '<%=mainlocalecode%>',
				flowplayer_src: '<%=ModulePath.Replace("Controls/ChameleonGallery/", "")%>js/flowplayer/flowplayer.swf',
				portal_id: <%=PortalId%>,
				main_panel: {
					display: true,
					top_left_align: <%=myappSettings.ImageStretch%>,
					fill_panel: true,
					dimensions: {
						width: 1,
						height: 1,
						h_as_ratio: true,
						w_as_ratio: true
					},
					position: {
						vertical: 'top',
						horizontal: 'left',
						h_offset: 0,
						v_offset: 0
					},
					transition: {
						duration: 800,
						effects: [
							'fade'
						]
					}
				},
				autoplay: {
					enable: true,
					interval: 8000,
					pause_on_hover: false,
					indicator: {
						display: false
					}
				},
				autoplay_toggle: {
					display: false
				},
				thumbs: {
					display: true,
					auto_hide: false,
					hide_speed: 250,
					width: <%=myappSettings.TGImageWidth%>,
					height: <%=myappSettings.TGImageHeight%>,
					captions: <%=myappSettings.ShowMediaTitleThumbnail.ToLower()%>,
					pagination: {
						direction: 'horizontal',
						duration: 250,
						easing: 'swing'
					},
					container: {
						transparent: true,
						dimensions: {
							height: 110,
							width: 1,
							h_as_ratio: false,
							w_as_ratio: true
						},
						position: {
							vertical: 'bottom',
							horizontal: 'left',
							h_offset: 0,
							v_offset: 0
						}
					}
				},
				categories: {
					display: <%=myappSettings.DisplayNestedGalleries.ToLower()%>,
					auto_hide: false,
					hide_speed: 250,
					width: 120,
					height: 45,
					pagination: {
						direction: 'horizontal',
						duration: 250,
						easing: 'swing'
					},
					container: {
						dimensions: {
							height: 45,
							width: 1,
							h_as_ratio: false,
							w_as_ratio: true
						},
						position: {
							vertical: 'bottom',
							horizontal: 'left',
							h_offset: 0,
							v_offset: 110,
							h_as_ratio: false,
							v_as_ratio: false
						}
					}
				},
				pagination: {
					display: false
				},
				scrollable_boxes: {
					item_info: {
						display: <%=myappSettings.ShowMediaDescription.ToLower()%>,
						container: {
							dimensions: {
								height: 150,
								width: 450,
								h_as_ratio: false,
								w_as_ratio: false
							},
							resize_to_content: true,
							position: {
								vertical: 'top',
								horizontal: 'left',
								h_offset: 0,
								v_offset: 35,
								h_as_ratio: false,
								v_as_ratio: false
							}
						}
					},
					gallery_info: {
						display: false
					}
				},
				title_boxes: {
					current_item: {
						display: <%=myappSettings.ShowMediaTitle.ToLower()%>,
						height: 35,
						position: {
							vertical: 'top',
							horizontal: 'left',
							h_offset: 0,
							v_offset: 0,
							h_as_ratio: false,
							v_as_ratio: false
						}
					},
					current_gallery: {
						display: false
					}
				},
				arrows: {
					display: true,
					auto_hide: true,
					hide_speed: 250,
					prev: {
						position: {
							vertical: 'top',
							horizontal: 'left',
							h_offset: 0,
							v_offset: .5,
							h_as_ratio: false,
							v_as_ratio: true
						}
					},
					next: {
						position: {
							vertical: 'top',
							horizontal: 'right',
							h_offset: 0,
							v_offset: .5,
							h_as_ratio: false,
							v_as_ratio: true
						}
					}
				},
				social_buttons: {
					display: false
				},
				buttons: {
					email: {
						display: false
					},
					download: {
						display: false
					},
					fullscreen: {
						display: false
					},
					exit_fullscreen: {
						display: true,
						position: {
							vertical: 'top',
							horizontal: 'right',
							h_offset: 20,
							v_offset: 20,
							h_as_ratio: false,
							v_as_ratio: false
						}
					}
				},
				cycle_current_category: false,
				theme: '<%=ViewState["CSSThemeDisplayStyle"]%>',
			}
		});
	});
</script>

<div id="ChameleonGallery" runat="server" enableviewstate="false">
	<div id="eds_slider<%=ModulNr%>" class="chameleon_slider <%=ViewState["CSSThemeDisplayStyle"]%>"></div>
</div>
