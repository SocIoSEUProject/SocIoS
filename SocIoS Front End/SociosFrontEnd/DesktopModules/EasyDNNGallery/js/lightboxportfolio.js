﻿(function(d){d.fn.portfolioSetter=function(a){function w(a){var d=f.find("ul li.selected");if(d[0]){var e=d.find("div.port_cat").html();d.html(e);d.removeClass("selected")}d=a.html();a.html('<div class="port_cat_active"><div class="port_cat_l"></div><div class="port_cat">'+d+'</div><div class="port_cat_r"></div> </div>');a.addClass("selected")}function l(b){j.html("").animate({marginLeft:0}).width(1);s=[];var f=h.length,e=null,g=null,l=0;!0!=c.valuesInitialized&&(c.valuesInitialized=!0,h[0].obj.css("visibility",
"hidden"),j.append(h[0].obj),e=j.find(".EDGmain"),c.itemContainerWidth=a.maxImgWidth+(e.outerWidth(!0)-e.find("img").width()),c.itemContainerHeight=a.maxImgHeight+(e.outerHeight(!0)-e.find("img").height())+(c.hasDownloadableItems?17:0),c.itemTopSpace=parseInt(e.css("borderTopWidth"))+parseInt(e.css("paddingTop"))+parseInt(e.css("marginTop")),c.itemLeftSpace=parseInt(e.css("borderLeftWidth"))+parseInt(e.css("paddingLeft"))+parseInt(e.css("marginLeft")),e=null,j.html(""),h[0].obj.css("visibility",""),
c.maxItemsPerRow=Math.floor(a.containerWidth/c.itemContainerWidth+0.05),c.pageWidth=c.maxItemsPerRow*c.itemContainerWidth,a.containerHeight||(a.itemsPerPage?(a.containerHeight=Math.ceil(a.itemsPerPage/c.maxItemsPerRow)*c.itemContainerHeight,j.height(a.containerHeight)):a.containerHeight=410),c.maxRowCount=Math.floor(a.containerHeight/c.itemContainerHeight+0.15),c.itemsPerPage=0==a.itemsPerPage?c.maxRowCount*c.maxItemsPerRow:a.itemsPerPage,c.pageHeight=c.maxRowCount*c.itemContainerHeight);a.fullscreenMode?
c.pageWidth<a.containerWidth&&(c.pageWidth=a.containerWidth):a.spaceOutPage&&c.pageWidth<a.containerWidth&&(c.pageRightPadding=a.containerWidth-c.pageWidth);for(var i=0;i<f;i++)if(void 0==b||b&&array_contains(h[i].category,b))0===l%c.itemsPerPage&&(g=d("<div />").css({"float":"left",overflow:"hidden",width:c.pageWidth,height:c.pageHeight,display:"none",paddingRight:c.pageRightPadding}),s.push(g),j.width(j.width()+c.pageWidth+c.pageRightPadding),j.append(g),g.fadeIn().animate({opacity:1},0),a.fullscreenMode&&
a.spaceOutPage&&(g=d("<div />").css({margin:"auto",overflow:"hidden",width:c.maxItemsPerRow*c.itemContainerWidth}),s[s.length-1].append(g))),A&&(h[i].obj=v(h[i].data)),g.append(h[i].obj),0==h[i].obj.find("video").length&&h[i].obj.width(c.itemContainerWidth).height(c.itemContainerHeight),l++,a.smartResize||(e=h[i].obj.children(".EDGmain"),1<c.itemContainerHeight-e.outerHeight(!0)&&e.css({position:"relative",top:"50%",marginTop:-Math.floor(e.find("img").height()/2)}),1<c.itemContainerWidth-e.outerWidth(!0)&&
e.css({position:"relative",left:"50%",marginLeft:-Math.floor(e.find("img").width()/2)}));j.width(j.width()-1);c.pageCount=s.length;d(document).ready(function(){d('a[rel="prettyPhoto_'+a.ppgroup+'"]').prettyPhoto({animationSpeed:"options.ppanimationSpeed",slideshow:a.ppslideshow,overlay_gallery:a.ppoverlay_gallery,autoplay_slideshow:a.ppautoplay_slideshow,hideflash:!1,showTitle:!0,print_image_text:a.ppprint_image_text,item_emailing_text:a.ppitem_emailing_text,item_emailing_subject:a.ppitem_emailing_subject,
allow_image_printing:a.ppallow_image_printing,enable_item_emailing:a.ppenable_item_emailing,show_social_sharing:a.ppshow_social_sharing,download_handler_url:a.ppdownload_handler_url,theme:a.pptheme});"True"==a.pfShowQtip?d("#"+a.pfdiv+" .EDGcontent a[title]").each(function(){0<d(this).attr("title").length&&d(this).qtip({show:{effect:{type:a.pfShowEffect,length:a.pfShowDuration}},hide:{effect:{type:a.pfHideEffect,length:a.pfHideDuration}},position:{corner:{target:a.pfTargetPos,tooltip:a.pfTooltipPos}},
style:{name:a.pfTheme,tip:!0,border:{width:a.pfcorner,radius:a.pfradius}}})}):d("#"+a.pfdiv+" .EDGcontent a[title]").each(function(){0<d(this).attr("title").length&&d(this).attr("title","")})});var k=j.siblings("#"+a.navigationId).find("ul");k.html("");q.children("div.portfolio_navigation_arrows_container").remove();if(1<c.pageCount){for(b=0;b<c.pageCount;b++)k.append("<li></li>");k.delegate("li","click",function(){y(d(this).index())});k.find("li:first").addClass("selected");a.showNavigationArrows&&
(r.after('<div class="portfolio_navigation_arrows_container"><a href="#" class="portfolio_paggination_arrow left"></a><a href="#" class="portfolio_paggination_arrow right"></a></div>'),m=q.find("div.portfolio_navigation_arrows_container > a.portfolio_paggination_arrow.left"),n=q.find("div.portfolio_navigation_arrows_container > a.portfolio_paggination_arrow.right"),a.navArrowsFile&&(m.css("background-image",'url("'+a.navArrowsFile+'")'),n.css("background-image",'url("'+a.navArrowsFile+'")')),a.hidableNavigationArrows&&
(m.hide(),n.hide(),q.mouseenter(function(){var b=k.find("li.selected").index(),d=k.children().length;(!a.hideNavigationArrowsOnEnds||a.hideNavigationArrowsOnEnds&&0!=b)&&m.fadeIn(250);(!a.hideNavigationArrowsOnEnds||a.hideNavigationArrowsOnEnds&&b!=d-1)&&n.fadeIn(250)}).mouseleave(function(){var b=k.find("li.selected").index(),d=k.children().length;(!a.hideNavigationArrowsOnEnds||a.hideNavigationArrowsOnEnds&&0!=b)&&m.stop(!1,!0).fadeOut(250);(!a.hideNavigationArrowsOnEnds||a.hideNavigationArrowsOnEnds&&
b!=d-1)&&n.stop(!1,!0).fadeOut(250)}).mousemove(function(){d(this).unbind("mousemove");n.fadeIn(250)})),a.hideNavigationArrowsOnEnds&&m.hide(),b=-(Math.round(a.containerHeight/2)+63),m.css("top",b),n.css("top",b),a.fullscreenMode&&(m.css("left",-10),n.css("right",-10)),m.click(function(){z();return!1}),n.click(function(){u();return!1}));j.siblings("#"+a.navigationId).find("ul").css({marginLeft:a.containerWidth/2-c.pageCount*a.navButtonWidth/2})}d(".portfolio_item").hover(function(){d(this).stop().animate({opacity:0.8},
300)},function(){d(this).stop().animate({opacity:1},300)});!1!==a.itemToOpen&&!c.initialItemOpened&&(b=j.find('a[rel="prettyPhoto_'+a.ppgroup+'"][edgpid="'+a.itemToOpen+'"]'),c.initialItemOpened=!0,b.click(),y(Math.floor((b.parents(".EDGmainContainer").index()+b.parents(".EDGmainContainer").parent().index()*c.itemsPerPage)/c.itemsPerPage)))}function z(){var b=d("#"+a.navigationId).find("ul").children("li.selected").index();y(b-1)}function u(){var b=d("#"+a.navigationId).find("ul").children("li.selected").index();
y(b+1)}function y(b){var d=j.siblings("#"+a.navigationId).find("ul"),e=d.children().length;d.children("li.selected").index();if(0>b||b>e-1)return!1;a.showNavigationArrows&&a.hideNavigationArrowsOnEnds&&(0==b&&m.stop(!1,!0).fadeOut(250),0!=b&&m.fadeIn(250),b==e-1&&n.stop(!1,!0).fadeOut(250),b!=e-1&&n.fadeIn(250));e=b*(c.pageWidth+c.pageRightPadding);j.stop(!0,!1).animate({marginLeft:[-e,a.easing]},a.animationSpeed);d.find("li.selected").removeClass("selected");d.children().eq(b).addClass("selected")}
function v(b){var c="",e;if(a.showSharingButtons.facebook||a.showSharingButtons.twitter||a.showSharingButtons.gplus)e=-1!=location.href.indexOf("?")?location.href.substring(0,location.href.indexOf("?")):location.href,e+="?edgpid="+b.edgpid+"&edgmid="+b.ppgroup.substr(1)+"#!"+b.relTag+"_"+b.ppgroup+"/id"+b.edgpid+"/",c='<div class="socialSharingContainer"><div class="buttons">',a.showSharingButtons.facebook&&(c+='<iframe src="http://www.facebook.com/plugins/like.php?href='+encodeURIComponent(e)+'&amp;layout=button_count&amp;show_faces=true&amp;action=like&amp;font&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:20px; width: 100px;" allowTransparency="true"></iframe>'),
a.showSharingButtons.gplus&&(c+='<g:plusone size="medium" href="'+e+'" annotation="bubble"></g:plusone><script type="text/javascript">gapi.plusone.go();<\/script>'),a.showSharingButtons.twitter&&(c+='<a href="http://twitter.com/share" class="twitter-share-button" data-url="'+e+'" data-count="horizontal">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"><\/script>'),c+="</div></div>";e="True"==a.xmlRequestParams.Html5Video&&b.html5_video?'<video controls="true" src="'+
b.html5_video+'" preview="'+b.thum+'" style="width: '+a.maxImgWidth+"px; height: "+a.maxImgHeight+'px;">Your browser doesn\'t support the video tag. You can <a href="'+b.html5_video+'">download the video here.</a></video>':"True"==a.xmlRequestParams.Html5Audio&&b.html5_audio?'<a href="'+b.html5_audio+'"><img alt="'+b.imgalt+'" src="'+b.thum+'" /> <span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span><span class="'+
b.cssClass+'"><span style="display:block">'+b.imgtitle+'</span><span class="Description">'+d("<div />").html(b.desc).text()+"</span></span></a>":'<a rel="'+b.relTag+"_"+b.ppgroup+'"'+("false"==b.downloadItemUrl?"":' downhref="'+b.downloadItemUrl+'"')+' href="'+b.prev+'" lbnestedurl="'+b.lbnestedurl+'" edgpid="'+b.edgpid+'" title="'+b.imgdesc+'" pptitle="'+b.imgdesc+'" target="'+b.medTarget+'"><img alt="'+b.imgalt+'" src="'+b.thum+'" /> <span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span><span class="'+
b.cssClass+'"><span style="display:block">'+b.imgtitle+'</span><span class="Description">'+d("<div />").html(b.desc).text()+"</span></span></a>";return d('<div class="EDGmainContainer"><div class="EDGmain"><div class="'+b.itemClass+'">'+e+"</div>"+c+"</div>"+("false"!=b.downloadItemUrl?'<div style="clear: both; display: block; text-align: center;"><a href="'+b.downloadItemUrl+'" class="downloadlink">'+a.downloadItemText+"</a></div>":"")+"</div>")}var a=d.extend({ppanimationSpeed:!1,ppgroup:"M300",
pptheme:"dark_rounded",ppslideshow:!1,ppautoplay_slideshow:!1,ppoverlay_gallery:!1,ppLightboxTitle:"False",ppLightboxDescription:"False",ppMediaTitle:"False",ppMediaDescription:"False",pfqtip:"False",pfShowQtip:"False",pfdiv:"EasyDNNGallery",pfShowEffect:"slide",pfHideEffect:"slide",pfShowDuration:"300",pfHideDuration:"300",pfTargetPos:"topMiddle",pfTooltipPos:"topMiddle",pfTheme:"cream",pfcorner:5,pfradius:5,pfOpenMediaUrl:"False",pfOpenMediaTarget:"_self",ppprint_image_text:"Print image",ppitem_emailing_text:"Email link",
ppitem_emailing_subject:"Email subject",ppallow_image_printing:!1,ppenable_item_emailing:!1,ppshow_social_sharing:!1,ppdownload_handler_url:"false",itemMargin:10,showCategories:!0,myshowCategories:!0,allText:"ALL",showAllBtn:!0,easing:"easeOutExpo",animationSpeed:800,navButtonWidth:21,xmlSource:"portfolio.xml",navigationId:"portfolio_pagination",categoriesId:"portfolio_categories",itemClass:"EDGimage",itemsPerPage:0,downloadItemText:"Download",categorySelector:"classic",categorySelectorSlideable:!1,
sidewayCatsWidth:200,showNavigationArrows:!0,hidableNavigationArrows:!0,hideNavigationArrowsOnEnds:!1,customTitle:!1,fullscreenable:!0,fullscreenButtonText:"Show fullscreen",moduleCssId:"EDG_0_Shadow",fullscreenCssId:"EDG_0_Shadow",scrollableContent:!1,navDDMFile:!1,navArrowsFile:!1,xmlRequestParams:{GalleryType:"portfolio",ModuleID:0,ModulePath:"/DesktopModules/EasyDNNGallery/",PortalHome:"/Portals/0/",PortalID:0,LocaleCode:"False",Html5Video:"False",Html5Audio:"False"},maxImgWidth:150,maxImgHeight:150,
containerWidth:710,containerHeight:410,smartResize:!0,spaceOutPage:!0,fullscreenMode:!1,showSharingButtons:{facebook:!1,twitter:!1,gplus:!1},itemToOpen:!1},a),g=[],h=[],s=[],i=0,A=!1,f,j=d("<div />"),r=d(this),q=r.parent(),C,k,D=null,m,n,c={itemContainerWidth:0,itemContainerHeight:0,itemTopSpace:0,itemLeftSpace:0,itemsPerPage:0,maxItemsPerRow:0,maxRowCount:0,pageCount:0,pageRightPadding:0,pageWidth:0,pageHeight:0,valuesInitialized:!1,innitialCategory:null,hasDownloadableItems:!1,sidewayCategories:"left"==
a.categorySelector||"right"==a.categorySelector?!0:!1,initialItemOpened:!1};c.sidewayCategories&&(a.containerWidth-=a.sidewayCatsWidth);j.css({width:a.containerWidth,height:a.containerHeight,"float":"left"});a.fullscreenMode&&(a.ppgroup+="_fullscreen",a.navigationId+="_fullscreen",a.categoriesId+="_fullscreen");r.css({width:a.containerWidth,height:"auto",overflow:"hidden"}).append(j);q.addClass("portfolio_gallery_container").css({width:a.containerWidth});c.sidewayCategories&&("left"==a.categorySelector?
q.css({marginLeft:a.sidewayCatsWidth}):q.css({marginRight:a.sidewayCatsWidth}));r.append('<div class="loading"></div>');if(navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPod/i)||navigator.userAgent.match(/iPad/i))a.xmlRequestParams.Html5Video="True",a.xmlRequestParams.Html5Audio="True";d.ajax({type:"POST",url:a.xmlSource,dataType:"xml",data:a.xmlRequestParams,cache:!1,success:function(b){a.myshowCategories&&(!a.showAllBtn||a.showCategories)&&d(b).find("categories").eq(0).find("category").each(function(){var a=
d(this),a={id:a.attr("id"),name:a.text()};g.push(a)});d(b).find("item").each(function(){var b=d(this),e=b.find("thumbnail:first").text().replace("\\","/"),f=b.find("preview:first").text(),g=b.find("category:first").text().split(","),i=b.find("description:first").text(),j=b.find("title:first").text(),k=b.find("title:first").text(),l=b.find("description:first").text(),m=b.find("mediaURL:first").text(),n=b.find("mediatype:first").text(),p=b.find("downhref:first").text(),r=b.find("edgpid:first").text(),
s=b.find("lbnestedurl:first").text(),t=b.find("html5_video:first").text(),b=b.find("html5_audio:first").text(),q="empty";"false"!=p&&(c.hasDownloadableItems=!0);0<j.length&&"True"==a.ppMediaTitle&&(q="title");0<i.length&&"True"==a.ppMediaDescription&&(q="title");"False"==a.ppLightboxTitle&&(k="");"False"==a.ppLightboxDescription&&(l="");"False"==a.ppMediaTitle&&(j="");"False"==a.ppMediaDescription&&(i="");medTarget=a.pfOpenMediaTarget;relTag="prettyPhoto";"True"==a.pfOpenMediaUrl&&"Image"==n?(f=m,
relTag=""):medTarget="";f={itemClass:a.itemClass,relTag:relTag,ppgroup:a.ppgroup,prev:f,imgdesc:l,medTarget:medTarget,imgalt:k,thum:e,cssClass:q,imgtitle:j,desc:i,downloadItemUrl:p,edgpid:r,lbnestedurl:s,html5_video:t,html5_audio:b};e={thumbnail:e,category:g,data:f,obj:v(f)};h.push(e)});d.browser.msie&&(A=!0);j.siblings(".loading").remove();j.after('<div id="'+a.navigationId+'" class="EDG_portfolio_pagination"><ul></ul></div>');a.fullscreenMode&&(r.before('<a href="#" class="closeFullscreenBtn '+
a.categorySelector+'"></a>'),B.trigger("fullscreen_close_btn_initialized"));if(a.myshowCategories)switch(a.categorySelector){case "dropdown":f=d('<div class="portfolio_gallery_categories_dropdown" class="portfolio_gallery_category_selector"></div>');f.append('<a href="#" class="portfolio_categories_dropdown_selector"><span></span></a><div class="portfolio_categories_dropdown_container"><ul></ul></div>');r.before(f);b=f.find("ul");f.find(".portfolio_categories_dropdown_selector").children("span:first").text(a.showAllBtn?
a.allText:g[0].name).click(function(){return!1});a.showAllBtn?b.append('<li><a href="#">'+a.allText+'</a><span class="id">0</span></li>'):c.innitialCategory=g[0].id;for(var p=g.length,e=0;e<p;e++)b.append('<li><a href="#">'+g[e].name+'</a><span class="id">'+g[e].id+"</span></li>");q.children(".portfolio_gallery_categories_dropdown");C=q.find(".portfolio_categories_dropdown_selector");k=q.find(".portfolio_categories_dropdown_container");a.navDDMFile&&(C.css("background-image",'url("'+a.navDDMFile+
'")'),k.find("a").css("background-image",'url("'+a.navDDMFile+'")'));(new Image).src=a.xmlRequestParams.ModulePath+"Themes/portfolio/bgrd_gray_tr.png";k.data("closable",!0).delegate("a","click",function(){var a=d(this);C.find("span:first").text(a.text());k.hide();a=a.parent().children("span.id").text();"0"==a?l():l(a);return!1}).mouseover(function(){clearTimeout(D);k.data("closable",!1)}).mouseout(function(){k.data("closable",!0);D=setTimeout(function(){k.data("closable")&&k.hide()},150)});C.mouseover(function(){k.data("closable",
!1);k.show()}).mouseout(function(){k.data("closable",!0);D=setTimeout(function(){k.data("closable")&&k.hide()},150)});break;case "left":case "right":var b=g.length,p=0,e="",t,m;f=d('<div id="'+a.categoriesId+'" class="portfolio_gallery_categories_sideways '+a.categorySelector+'">'+(a.customTitle?"<h1><span>"+a.customTitle+"</span></h1>":"")+"<ul></ul></div>");m=f.find("> ul");r.before(f);t={height:a.containerHeight-(f.outerHeight(!0)-f.height()),width:a.sidewayCatsWidth-(f.outerWidth(!0)-f.width())};
"left"==a.categorySelector?t.marginLeft=-a.sidewayCatsWidth:t.marginRight=-a.sidewayCatsWidth;for(f.css(t);p<b;p++)e+='<li><a href="#">'+g[p].name+'</a><span class="id">'+g[p].id+"</span></li>";m.append(e);a.showAllBtn?m.prepend('<li class="selected"><a href="#">'+a.allText+'</a><span class="id">0</span></li>'):(m.find("> li").eq(0).addClass("selected"),c.innitialCategory=g[0].id);m.delegate("a","click",function(){var a=d(this),b=a.siblings("span.id").text();a.parent().addClass("selected").siblings().removeClass("selected");
"0"==b?l():l(b);return!1});break;default:f=d('<div id="'+a.categoriesId+'" class="EDG_portfolio_categories_classic"></div>');a.categorySelectorSlideable?(f.css({visibility:"hidden"}).append('<div class="EDG_portfolio_categories_classic_left"></div><div class="EDG_portfolio_categories_classic_arrow left"></div><div class="EDG_portfolio_categories_classic_wrapper" style="float: left; position: relative; top: 0; left: 0; margin: 0 15px; padding: 0; overflow: hidden;"><ul style="padding: 0;"></ul></div><div class="EDG_portfolio_categories_classic_right"></div><div class="EDG_portfolio_categories_classic_arrow right"></div>'),
f.find("> .EDG_portfolio_categories_classic_arrow").click(function(){var a=d(this),b=a.parent().find("ul"),c;c=parseInt(b.css("left"));a.hasClass("left")?(c+=40,0<c&&(c=0)):(c-=40,a=-(b.outerWidth(!0)-40),c<a&&(c=a));b.css("left",c);return!1})):f.append('<div class="EDG_portfolio_categories_classic_left"></div><ul></ul><div class="EDG_portfolio_categories_classic_right"></div>');j.before(f);var n=f.find("ul"),p=f.find("> .EDG_portfolio_categories_classic_wrapper"),b=0;a.categorySelectorSlideable&&
(e=f.width()-30-f.find("> .EDG_portfolio_categories_classic_left").outerWidth(!0),e-=f.find("> .EDG_portfolio_categories_classic_arrow.left").outerWidth(!0),e-=f.find("> .EDG_portfolio_categories_classic_arrow.right").outerWidth(!0),e-=f.find("> .EDG_portfolio_categories_classic_right").outerWidth(!0),p.width(e),f.css("visibility",""),n.width(5E4));a.showAllBtn?(p=d("<li>"+a.allText+"</li>"),n.append(p),w(p),p.bind({click:function(){l();w(d(this));return!1},mouseover:function(){d(this).css({cursor:"pointer"})}})):
c.innitialCategory=g[0].id;e=g.length;for(t=0;t<e;t++)(function(b){var c=d("<li>"+g[b].name+"</li>");n.append(c);!a.showAllBtn&&0===b&&w(c);c.bind({click:function(){l(g[b].id);w(d(this));return!1},mouseover:function(){d(this).css({cursor:"pointer"})}})})(t);if(a.categorySelectorSlideable){p=n.find("> li");a.showAllBtn&&(e+=1);for(t=0;t<e;t++)b+=p.eq(t).outerWidth(!0);n.width(b)}}a.customTitle?("dropdown"==a.categorySelector||"classic"==a.categorySelector)&&r.before('<h1 class="portfolio_custom_title">'+
a.customTitle+"</h1>"):"dropdown"==a.categorySelector&&r.before('<h1 class="portfolio_custom_title">&nbsp;</h1>');var u=h.length,s;for(s in h)h.hasOwnProperty(s)&&(b=new Image,d(b).load(function(){i++;i===u&&l(c.innitialCategory)}).attr("src",h[s].thumbnail))}});if(a.fullscreenMode){var B=q.parent(),E=B.parent(),x;B.bind("resize_gallery",function(){a.containerWidth=B.width();c.sidewayCategories&&(a.containerWidth-=a.sidewayCatsWidth);a.containerHeight=E.height()-B.data("initialOuterHeight")-("classic"==
a.categorySelector?a.customTitle?135:107:70);j.height(a.containerHeight);r.width(a.containerWidth);q.width(a.containerWidth);"classic"==a.categorySelector&&a.categorySelectorSlideable&&(x=f.width()-30-f.find("> .EDG_portfolio_categories_classic_left").outerWidth(!0),x-=f.find("> .EDG_portfolio_categories_classic_arrow.left").outerWidth(!0),x-=f.find("> .EDG_portfolio_categories_classic_arrow.right").outerWidth(!0),x-=f.find("> .EDG_portfolio_categories_classic_right").outerWidth(!0),f.find("> .EDG_portfolio_categories_classic_wrapper").width(x));
l()}).bind("toNextPage",function(){u()}).bind("toPrevPage",function(){z()})}else a.fullscreenable&&r.after('<div class="EasyDNNGallery_fullscreen_btn_container"><a class="EasyDNNGallery_fullscreen_btn" href="#" onclick="jQuery().fullscreenPortfolioGallery(\''+r.attr("id")+"'); return false;\">"+a.fullscreenButtonText+"</a></div>");if(a.fullscreenMode||a.scrollableContent)(a.fullscreenMode?E:j).bind("mousewheel.EasyDNNGallery_portfolio_mousewheel",function(a,c){0<c?z():u();return!1});a.fullscreenMode||
r.data("EasyDNNGallery.portfolio.options",a)}})(jQuery);array_contains=function(d,a){for(var w=d.length,l=0;l<w;l++)if(d[l]===a)return!0;return!1};
(function(d){d.fn.fullscreenPortfolioGallery=function(a){function w(){g.width(u.width()-8-parseInt(g.css("border-left-width"),10)-parseInt(g.css("border-right-width"),10)).height(u.height()-8-parseInt(g.css("border-top-width"),10)-parseInt(g.css("border-bottom-width"),10)).css("top",Math.round((u.height()-g.outerHeight())/2))}function l(){A.css({left:"auto",right:"right"==i.categorySelector?-(i.sidewayCatsWidth+10):-10})}function z(){d(document).unbind("keydown.EasyDNNGallery_fullscreen");y.css({overflow:""});
v.fadeOut(200,function(){v.remove()})}var u=d(window),y=d("body"),v,g,h,s,i,A;"string"==typeof a?(a=d("#"+a),i=d.extend(!0,{},a.data("EasyDNNGallery.portfolio.options"))):"object"==typeof a&&(i=a);v=d('<div class="portfolio_gallery_fullscreen_container" id="'+i.fullscreenCssId+'"></div>');v.css("top",u.scrollTop());y.append(v).css({overflow:"hidden"});g=d('<div class="portfolio_gallery_fullscreen_wrapper"></div>');v.append(g);g.bind("reposition",function(){w();l();h.trigger("resize_gallery")});h=
d('<div class="portfolio_gallery_fullscreen_main"><div style="position: relative;"><div class="portfolio_gallery_fullscreen_inner"></div></div></div>');g.append(h);h.data("initialOuterHeight",h.outerHeight(!0));w();u.scroll(function(){v.css("top",u.scrollTop())}).resize(function(){clearTimeout(s);s=setTimeout(function(){g.trigger("reposition")},50)});d(document).bind("keydown.EasyDNNGallery_fullscreen",function(a){if(0==d("body > .pp_overlay").length)switch(a.keyCode){case 27:z();break;case 39:h.trigger("toNextPage");
break;case 37:h.trigger("toPrevPage")}});i=d.extend(i,{containerWidth:h.width(),containerHeight:g.height()-h.data("initialOuterHeight"),fullscreenMode:!0,fullscreenable:!1,itemsPerPage:0,spaceOutPage:!0,scrollableContent:!0,hideNavigationArrowsOnEnds:!0});i.containerHeight-="classic"==i.categorySelector?i.customTitle?135:107:70;h.find("div.portfolio_gallery_fullscreen_inner").portfolioSetter(i);h.delegate(".closeFullscreenBtn","click",function(){z();return!1}).bind("fullscreen_close_btn_initialized",
function(){A=h.find(".closeFullscreenBtn");l()})}})(jQuery);