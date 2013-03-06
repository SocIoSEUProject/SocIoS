/**
 * jQuery Galleriffic plugin
 *
 * Copyright (c) 2008 Trent Foley (http://trentacular.com)
 * Licensed under the MIT License:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Much thanks to primary contributer Ponticlaro (http://www.ponticlaro.com)
 */
(function(e){var k={},p=0;e.galleriffic={version:"2.0.1",normalizeHash:function(e){return e.replace(/^.*#/,"").replace(/\?.*$/,"")},getImage:function(h){if(h)return h=e.galleriffic.normalizeHash(h),k[h]},gotoImage:function(h){h=e.galleriffic.getImage(h);if(!h)return!1;h.gallery.gotoImage(h);return!0},removeImageByHash:function(h,j){var k=e.galleriffic.getImage(h);if(!k)return!1;var a=k.gallery;return j&&j!=a?!1:a.removeImageByIndex(k.index)}};var r={delay:3E3,numThumbs:20,preloadAhead:40,enableTopPager:!1,
enableBottomPager:!0,maxPagesToShow:7,imageContainerSel:"",captionContainerSel:"",controlsContainerSel:"",loadingContainerSel:"",renderSSControls:!0,renderNavControls:!0,playLinkText:"Play",pauseLinkText:"Pause",prevLinkText:"Previous",nextLinkText:"Next",nextPageLinkText:"Next &rsaquo;",prevPageLinkText:"&lsaquo; Prev",enableHistory:!1,enableKeyboardNavigation:!0,autoStart:!1,syncTransitions:!1,defaultTransitionDuration:1E3,defaultTransitionDuration:1E3,onSlideChangeOut:void 0,onSlideChangeIn:void 0,
onTransitionOut:void 0,onPageTransitionOut:void 0,onPageTransitionIn:void 0,onImageAdded:void 0,onImageRemoved:void 0};e.fn.galleriffic=function(h){e.extend(this,{version:e.galleriffic.version,isSlideshowRunning:!1,slideshowTimeout:void 0,clickHandler:function(a,b){this.pause();if(!this.enableHistory){var c=e.galleriffic.normalizeHash(e(b).attr("href"));e.galleriffic.gotoImage(c);a.preventDefault()}},appendImage:function(a){this.addImage(a,!1,!1);return this},insertImage:function(a,b){this.addImage(a,
!1,!0,b);return this},addImage:function(a,b,c,d){var f="string"===typeof a?e(a):a,a=f.find("a.thumb"),h=a.attr("href"),g=a.attr("title"),j=f.find(".caption").remove(),l=a.attr("name");p++;if(!l||k[""+l])l=p;c||(d=this.data.length);var m={title:g,slideUrl:h,caption:j,hash:l,gallery:this,index:d};c?(this.data.splice(d,0,m),this.updateIndices(d)):this.data.push(m);var n=this;b||this.updateThumbs(function(){var a=n.find("ul.thumbs");c?a.children(":eq("+d+")").before(f):a.append(f);if(n.onImageAdded)n.onImageAdded(m,
f)});k[""+l]=m;a.attr("rel","history").attr("href","#"+l).removeAttr("name").click(function(a){n.clickHandler(a,this)});return this},removeImageByIndex:function(a){if(0>a||a>=this.data.length)return!1;a=this.data[a];if(!a)return!1;this.removeImage(a);return!0},removeImageByHash:function(a){return e.galleriffic.removeImageByHash(a,this)},removeImage:function(a){var b=a.index;this.data.splice(b,1);delete k[""+a.hash];this.updateThumbs(function(){var c=j.find("ul.thumbs").children(":eq("+b+")").remove();
if(j.onImageRemoved)j.onImageRemoved(a,c)});this.updateIndices(b);return this},updateIndices:function(a){for(i=a;i<this.data.length;i++)this.data[i].index=i;return this},initializeThumbs:function(){this.data=[];var a=this;this.find("ul.thumbs > li").each(function(){a.addImage(e(this),!0,!1)});return this},isPreloadComplete:!1,preloadInit:function(){if(0==this.preloadAhead)return this;this.preloadStartIndex=this.currentImage.index;var a=this.getNextIndex(this.preloadStartIndex);return this.preloadRecursive(this.preloadStartIndex,
a)},preloadRelocate:function(a){this.preloadStartIndex=a;return this},preloadRecursive:function(a,b){if(a!=this.preloadStartIndex){var c=this.getNextIndex(this.preloadStartIndex);return this.preloadRecursive(this.preloadStartIndex,c)}var d=this,c=b-a;0>c&&(c=this.data.length-1-a+b);if(0<=this.preloadAhead&&c>this.preloadAhead)return setTimeout(function(){d.preloadRecursive(a,b)},500),this;var f=this.data[b];if(!f)return this;if(f.image)return this.preloadNext(a,b);c=new Image;c.onload=function(){f.image=
this;d.preloadNext(a,b)};c.alt=f.title;c.src=f.slideUrl;return this},preloadNext:function(a,b){var c=this.getNextIndex(b);if(c==a)this.isPreloadComplete=!0;else{var d=this;setTimeout(function(){d.preloadRecursive(a,c)},100)}return this},getNextIndex:function(a){a+=1;a>=this.data.length&&(a=0);return a},getPrevIndex:function(a){a-=1;0>a&&(a=this.data.length-1);return a},pause:function(){this.isSlideshowRunning=!1;this.slideshowTimeout&&(clearTimeout(this.slideshowTimeout),this.slideshowTimeout=void 0);
this.$controlsContainer&&this.$controlsContainer.find("div.ss-controls a").removeClass().addClass("play").attr("title",this.playLinkText).attr("href","#play").html(this.playLinkText);return this},play:function(){this.isSlideshowRunning=!0;this.$controlsContainer&&this.$controlsContainer.find("div.ss-controls a").removeClass().addClass("pause").attr("title",this.pauseLinkText).attr("href","#pause").html(this.pauseLinkText);if(!this.slideshowTimeout){var a=this;this.slideshowTimeout=setTimeout(function(){a.ssAdvance()},
this.delay)}return this},toggleSlideshow:function(){this.isSlideshowRunning?this.pause():this.play();return this},ssAdvance:function(){this.isSlideshowRunning&&this.next(!0);return this},next:function(a,b){this.gotoIndex(this.getNextIndex(this.currentImage.index),a,b);return this},previous:function(a,b){this.gotoIndex(this.getPrevIndex(this.currentImage.index),a,b);return this},nextPage:function(a,b){var c=this.getCurrentPage(),d=this.getNumPages()-1;c<d&&this.gotoIndex(c*this.numThumbs+this.numThumbs,
a,b);return this},previousPage:function(a,b){var c=this.getCurrentPage();0<c&&this.gotoIndex(c*this.numThumbs-this.numThumbs,a,b);return this},gotoIndex:function(a,b,c){b||this.pause();0>a?a=0:a>=this.data.length&&(a=this.data.length-1);a=this.data[a];!c&&this.enableHistory?e.historyLoad(String(a.hash)):this.gotoImage(a);return this},gotoImage:function(a){var b=a.index,c=b%this.numThumbs,c=(c=c<=this.numThumbs&&0<=c)&&Math.floor(b/this.numThumbs)==Math.floor(this.currentImage.index/this.numThumbs);
if(this.onSlideChangeOut)this.onSlideChangeOut(this.currentImage.index);this.currentImage=a;this.preloadRelocate(b);this.refresh();if(this.onSlideChangeIn)if(c)this.onSlideChangeIn(this.currentImage.index);else this.find("ul.thumbs").children().eq(this.currentImage.index).css({opacity:1});return this},getDefaultTransitionDuration:function(a){return a?this.defaultTransitionDuration:this.defaultTransitionDuration/2},refresh:function(){var a=this.currentImage;if(!a)return this;var b=a.index;this.$controlsContainer&&
this.$controlsContainer.find("div.nav-controls a.prev").attr("href","#"+this.data[this.getPrevIndex(b)].hash).end().find("div.nav-controls a.next").attr("href","#"+this.data[this.getNextIndex(b)].hash);var c=this.$imageContainer.find("span.current").addClass("previous").removeClass("current"),d=0;this.$captionContainer&&(d=this.$captionContainer.find("span.current").addClass("previous").removeClass("current"));var f=this.syncTransitions&&a.image,e=!0,g=this,b=function(){e=!1;c.remove();d&&d.remove();
f||(a.image&&a.hash==g.data[g.currentImage.index].hash?g.buildImage(a,f):g.$loadingContainer&&g.$loadingContainer.show())};if(0==c.length)b();else if(this.onTransitionOut)this.onTransitionOut(c,d,f,b);else c.fadeTo(this.getDefaultTransitionDuration(f),0,b),d&&d.fadeTo(this.getDefaultTransitionDuration(f),0);f&&this.buildImage(a,f);a.image||(b=new Image,b.onload=function(){a.image=this;!e&&a.hash==g.data[g.currentImage.index].hash&&g.buildImage(a,f)},b.alt=a.title,b.src=a.slideUrl);this.relocatePreload=
!0;return this.syncThumbs()},buildImage:function(a,b){var c=this,d=this.getNextIndex(a.index),d=this.$imageContainer.append('<span class="image-wrapper current"><a class="advance-link" rel="history" href="#'+this.data[d].hash+'" title="'+a.title+'">&nbsp;</a></span>').find("span.current").css("opacity","0");d.find("a").append(a.image).click(function(a){c.clickHandler(a,this)});var f=0;this.$captionContainer&&(f=this.$captionContainer.append('<span class="image-caption current"></span>').find("span.current").css("opacity",
"0").append(a.caption));this.$loadingContainer&&this.$loadingContainer.hide();if(this.onTransitionIn)this.onTransitionIn(d,f,b);else d.fadeTo(this.getDefaultTransitionDuration(b),1),f&&f.fadeTo(this.getDefaultTransitionDuration(b),1);this.isSlideshowRunning&&(this.slideshowTimeout&&clearTimeout(this.slideshowTimeout),this.slideshowTimeout=setTimeout(function(){c.ssAdvance()},this.delay));return this},getCurrentPage:function(){return Math.floor(this.currentImage.index/this.numThumbs)},syncThumbs:function(){this.getCurrentPage()!=
this.displayedPage&&this.updateThumbs();var a=this.find("ul.thumbs").children();a.filter(".selected").removeClass("selected");a.eq(this.currentImage.index).addClass("selected");return this},updateThumbs:function(a){var b=this,c=function(){a&&a();b.rebuildThumbs();if(b.onPageTransitionIn)b.onPageTransitionIn();else b.show()};if(this.onPageTransitionOut)this.onPageTransitionOut(c);else this.hide(),c();return this},rebuildThumbs:function(){var a=this.data.length>this.numThumbs;if(this.enableTopPager){var b=
this.find("div.top");0==b.length?b=this.prepend('<div class="top pagination"></div>').find("div.top"):b.empty();a&&this.buildPager(b)}this.enableBottomPager&&(b=this.find("div.bottom"),0==b.length?b=this.append('<div class="bottom pagination"></div>').find("div.bottom"):b.empty(),a&&this.buildPager(b));var a=this.getCurrentPage(),c=a*this.numThumbs,d=c+this.numThumbs-1;d>=this.data.length&&(d=this.data.length-1);b=this.find("ul.thumbs");b.find("li").each(function(a){var b=e(this);a>=c&&a<=d?b.show():
b.hide()});this.displayedPage=a;b.removeClass("noscript");return this},getNumPages:function(){return Math.ceil(this.data.length/this.numThumbs)},buildPager:function(a){var b=this,c=this.getNumPages(),d=this.getCurrentPage(),f=d*this.numThumbs,e=this.maxPagesToShow-1,g=d-Math.floor((this.maxPagesToShow-1)/2)+1;if(0<g){var h=c-g;h<e&&(g-=e-h)}0>g&&(g=0);0<d&&a.append('<a rel="history" href="#'+this.data[f-this.numThumbs].hash+'" title="'+this.prevPageLinkText+'">'+this.prevPageLinkText+"</a>");0<g&&
(this.buildPageLink(a,0,c),1<g&&a.append('<span class="ellipsis">&hellip;</span>'),e--);for(;0<e;)this.buildPageLink(a,g,c),e--,g++;g<c&&(d=c-1,g<d&&a.append('<span class="ellipsis">&hellip;</span>'),this.buildPageLink(a,d,c));c=f+this.numThumbs;c<this.data.length&&a.append('<a rel="history" href="#'+this.data[c].hash+'" title="'+this.nextPageLinkText+'">'+this.nextPageLinkText+"</a>");a.find("a").click(function(a){b.clickHandler(a,this)});return this},buildPageLink:function(a,b,c){var d=b+1,e=this.getCurrentPage();
b==e?a.append('<span class="current">'+d+"</span>"):b<c&&a.append('<a rel="history" href="#'+this.data[b*this.numThumbs].hash+'" title="'+d+'">'+d+"</a>");return this}});e.extend(this,r,h);this.enableHistory&&!e.historyInit&&(this.enableHistory=!1);this.imageContainerSel&&(this.$imageContainer=e(this.imageContainerSel));this.captionContainerSel&&(this.$captionContainer=e(this.captionContainerSel));this.loadingContainerSel&&(this.$loadingContainer=e(this.loadingContainerSel));this.initializeThumbs();
3>this.maxPagesToShow&&(this.maxPagesToShow=3);this.displayedPage=-1;this.currentImage=this.data[0];var j=this;this.$loadingContainer&&this.$loadingContainer.hide();this.controlsContainerSel&&(this.$controlsContainer=e(this.controlsContainerSel).empty(),this.renderSSControls&&(this.autoStart?this.$controlsContainer.append('<div class="ss-controls"><a href="#pause" class="pause" title="'+this.pauseLinkText+'">'+this.pauseLinkText+"</a></div>"):this.$controlsContainer.append('<div class="ss-controls"><a href="#play" class="play" title="'+
this.playLinkText+'">'+this.playLinkText+"</a></div>"),this.$controlsContainer.find("div.ss-controls a").click(function(a){j.toggleSlideshow();a.preventDefault();return!1})),this.renderNavControls&&this.$controlsContainer.append('<div class="nav-controls"><a class="prev" rel="history" title="'+this.prevLinkText+'">'+this.prevLinkText+'</a><a class="next" rel="history" title="'+this.nextLinkText+'">'+this.nextLinkText+"</a></div>").find("div.nav-controls a").click(function(a){j.clickHandler(a,this)}));
h=!this.enableHistory||!location.hash;if(this.enableHistory&&location.hash){var q=e.galleriffic.normalizeHash(location.hash);k[q]||(h=!0)}h&&this.gotoIndex(0,!1,!0);this.enableKeyboardNavigation&&e(document).keydown(function(a){switch(a.charCode?a.charCode:a.keyCode?a.keyCode:0){case 32:j.next();a.preventDefault();break;case 33:j.previousPage();a.preventDefault();break;case 34:j.nextPage();a.preventDefault();break;case 35:j.gotoIndex(j.data.length-1);a.preventDefault();break;case 36:j.gotoIndex(0);
a.preventDefault();break;case 37:j.previous();a.preventDefault();break;case 39:j.next(),a.preventDefault()}});this.autoStart&&this.play();setTimeout(function(){j.preloadInit()},1E3);return this}})(jQuery);