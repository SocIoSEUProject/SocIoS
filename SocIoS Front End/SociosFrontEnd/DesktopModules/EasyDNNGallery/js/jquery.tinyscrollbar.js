/*
* Tiny Scrollbar
* http://www.baijs.nl/tinyscrollbar/
*
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://www.opensource.org/licenses/mit-license.php
* http://www.opensource.org/licenses/gpl-2.0.php
*
* Date: 13 / 08 / 2012
* @version 1.81
* @author Maarten Baijs
*
*/
(function(){var s=function(b){function s(h,a){var l,p,q;function w(a){b("body").addClass("noSelect");var d=parseInt(f.obj.css(j),10);l=m?a.pageX:a.pageY;p="auto"==d?0:d;t?(document.ontouchmove=function(a){a.preventDefault();r(a.touches[0])},document.ontouchend=n):(b(document).bind("mousemove",r),b(document).bind("mouseup",n),f.obj.bind("mouseup",n))}function u(c){if(1>d.ratio&&(c=c||window.event,e-=(c.wheelDelta?c.wheelDelta/120:-c.detail/3)*a.wheel,e=Math.min(d[a.axis]-i[a.axis],Math.max(0,e)),f.obj.css(j,
e/k.ratio),d.obj.css(j,-e),a.lockscroll||e!==d[a.axis]-i[a.axis]&&0!==e))c=b.event.fix(c),c.preventDefault()}function r(c){1>d.ratio&&(q=a.invertscroll&&t?Math.min(g[a.axis]-f[a.axis],Math.max(0,p+(l-(m?c.pageX:c.pageY)))):Math.min(g[a.axis]-f[a.axis],Math.max(0,p+((m?c.pageX:c.pageY)-l))),e=q*k.ratio,d.obj.css(j,-e),f.obj.css(j,q))}function n(){b("body").removeClass("noSelect");b(document).unbind("mousemove",r);b(document).unbind("mouseup",n);f.obj.unbind("mouseup",n);document.ontouchmove=document.ontouchend=
null}var i={obj:b(".viewport",h)},d={obj:b(".content",h)},k={obj:b(".scrollbar",h)},g={obj:b(".track",k.obj)},f={obj:b(".thumb",k.obj)},m="x"===a.axis,j=m?"left":"top",v=m?"Width":"Height",e=0;q=p=0;l=void 0;var t="ontouchstart"in document.documentElement;this.update=function(c){i[a.axis]=i.obj[0]["offset"+v];d[a.axis]=d.obj[0]["scroll"+v];d.ratio=i[a.axis]/d[a.axis];k.obj.toggleClass("disable",1<=d.ratio);g[a.axis]="auto"===a.size?i[a.axis]:a.size;f[a.axis]=Math.min(g[a.axis],Math.max(0,"auto"===
a.sizethumb?g[a.axis]*d.ratio:a.sizethumb));k.ratio="auto"===a.sizethumb?d[a.axis]/g[a.axis]:(d[a.axis]-i[a.axis])/(g[a.axis]-f[a.axis]);e="relative"===c&&1>=d.ratio?Math.min(d[a.axis]-i[a.axis],Math.max(0,e)):0;e="bottom"===c&&1>=d.ratio?d[a.axis]-i[a.axis]:isNaN(parseInt(c,10))?e:parseInt(c,10);c=v.toLowerCase();f.obj.css(j,e/k.ratio);d.obj.css(j,-e);l=f.obj.offset()[j];k.obj.css(c,g[a.axis]);g.obj.css(c,g[a.axis]);f.obj.css(c,f[a.axis])};this.update();t?i.obj[0].ontouchstart=function(a){1===a.touches.length&&
(w(a.touches[0]),a.stopPropagation())}:(f.obj.bind("mousedown",w),g.obj.bind("mouseup",r));a.scroll&&window.addEventListener?(h[0].addEventListener("DOMMouseScroll",u,!1),h[0].addEventListener("mousewheel",u,!1)):a.scroll&&(h[0].onmousewheel=u);return this}b.tiny=b.tiny||{};b.tiny.scrollbar={options:{axis:"y",wheel:40,scroll:!0,lockscroll:!0,size:"auto",sizethumb:"auto",invertscroll:!1}};b.fn.tinyscrollbar=function(h){var a=b.extend({},b.tiny.scrollbar.options,h);this.each(function(){b(this).data("tsb",
new s(b(this),a))});return this};b.fn.tinyscrollbar_update=function(h){return b(this).data("tsb").update(h)}};"undefined"!==typeof jQuery&&s(jQuery);"undefined"!==typeof eds1_8&&s(eds1_8)})();