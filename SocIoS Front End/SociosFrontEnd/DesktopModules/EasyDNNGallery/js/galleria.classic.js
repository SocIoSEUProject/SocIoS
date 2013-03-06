/*
 * Galleria Classic Theme v. 1.5 2010-10-28
 * http://galleria.aino.se
 *
 * Copyright (c) 2010, Aino
 * Licensed under the MIT license.
 */
(function(a){Galleria.addTheme({name:"classic",author:"Galleria",version:"1.5",defaults:{transition:"slide",thumb_crop:"height",_toggle_info:!0},init:function(d){this.addElement("info-link","info-close");this.append({info:["info-link","info-close"]});this.$("image-nav-left,image-nav-right,counter");var c=this.$("info-link,info-close,info-text"),e=Galleria.TOUCH?"touchstart":"click";this.$("loader,counter").show().css("opacity",0.4);Galleria.TOUCH||(this.$("thumbnails").children().hover(function(){a(this).not(".active").children().stop().fadeTo(100,
1)},function(){a(this).not(".active").children().stop().fadeTo(400,0.6)}),this.addIdleState(this.get("image-nav-left"),{left:-50}),this.addIdleState(this.get("image-nav-right"),{right:-50}),this.addIdleState(this.get("counter"),{opacity:0}));d._toggle_info&&c.bind(e,function(){c.toggle()});this.bind(Galleria.THUMBNAIL,function(b){a(b.thumbTarget).parent(":not(.active)").children().css("opacity",0.6)});this.bind(Galleria.LOADSTART,function(b){b.cached||this.$("loader").show().fadeTo(200,0.4);this.$("info").toggle(this.hasInfo());
a(b.thumbTarget).css("opacity",1).parent().siblings().children().css("opacity",0.6)});this.bind(Galleria.LOADFINISH,function(){this.$("loader").fadeOut(200)})}})})(jQuery);