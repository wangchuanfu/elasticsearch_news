// $(function(){
//  //当鼠标滑入时将div的class换成divOver
//  $('.j1recommendation-left').hover(function(){
//    $(this).addClass('j1recommendation-leftover');  
//   },function(){
//    //鼠标离开时移除divOver样式
//    $(this).removeClass('j1recommendation-leftover'); 
//   }
//  );
// });
// $(function(){
//  //当鼠标滑入时将div的class换成divOver
//  $('.j1recommendation-right1').hover(function(){
//    $(this).addClass('j1recommendation-right1over');  
//   },function(){
//    //鼠标离开时移除divOver样式
//    $(this).removeClass('j1recommendation-right1over'); 
//   }
//  );
// });
//$(function() {
//	var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
//	var len = $("#focus ul li").length; //获取焦点图个数
//	var index = 0;
//	var picTimer;
//	
//	//以下代码添加数字按钮和按钮后的半透明长条
//	var btn = "<div class='btnBg'></div><div class='btn'>";
//	for(var i=0; i < len; i++) {
//		btn += "<span>" + (i+1) + "</span>";
//	}
//	btn += "</div>";
//	$("#focus").append(btn);
//	$("#focus .btnBg").css("opacity",0.5);
//	
//	//为数字按钮添加鼠标滑入事件，以显示相应的内容
//	$("#focus .btn span").mouseenter(function() {
//		index = $("#focus .btn span").index(this);
//		showPics(index);
//	}).eq(0).trigger("mouseenter");
//	
//	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
//	$("#focus ul").css("width",sWidth * (len + 1));
//	
//	//鼠标滑入某li中的某div里，调整其同辈div元素的透明度，由于li的背景为黑色，所以会有变暗的效果
//	$("#focus ul li div").hover(function() {
//		$(this).siblings().css("opacity",0.7);
//	},function() {
//		$("#focus ul li div").css("opacity",1);
//	});
//	
//	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
//	$("#focus").hover(function() {
//		clearInterval(picTimer);
//	},function() {
//		picTimer = setInterval(function() {
//			if(index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic()，然后将索引值清零
//				showFirPic();
//				index = 0;
//			} else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics()
//				showPics(index);
//			}
//			index++;
//		},5000); //此3000代表自动播放的间隔，单位：毫秒
//	}).trigger("mouseleave");
//	
//	//显示图片函数，根据接收的index值显示相应的内容
//	function showPics(index) { //普通切换
//		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
//		$("#focus ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
//		$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
//	}
//	
//	function showFirPic() { //最后一张图自动切换到第一张图时专用
//		$("#focus ul").append($("#focus ul li:first").clone());
//		var nowLeft = -len*sWidth; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
//		$("#focus ul").stop(true,false).animate({"left":nowLeft},500,function() {
//			//通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
//			$("#focus ul").css("left","0");
//			$("#focus ul li:last").remove();
//		}); 
//		$("#focus .btn span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
//	}
//});

/*tab*/

/*顶部下拉*/
      function settab(name,cursel,n)
          {
              for(i=1;i<= n;i++)
              {
            	var menu=document.getElementById(name+i);
          		var con=document.getElementById("con_"+name+"_"+i);
          		menu.className=i==cursel?"hover":"";
          		con.style.display=i==cursel?"block":"none";
              }
          }

(function(a){
	a.fn.hoverClass=function(b){
		var a=this;
		a.each(function(c){
			a.eq(c).hover(function(){
				$(this).addClass(b);
			},function(){
				$(this).removeClass(b);
			});
		});
		return a;
	};
})(jQuery);
$(function(){
	$("#j11308_navbox").hoverClass("current");
});
$(function(){
	$("#j11308_login").hoverClass("current1");
});
/**/
function listShow1()
{
	var obj=document.getElementById("about_list1");
	obj.style.display="block";
}
function loops1()
{
		var obj=document.getElementById("about_list1");
		obj.style.display="none";
}

/*鼠标经过变色*/
 $(function(){
  //当鼠标滑入时将div的class换成divOver
  $('.j11308_main_floor1').hover(function(){
    $(this).addClass('j11308_main_floor1_over');  
   },function(){
    //鼠标离开时移除divOver样式
    $(this).removeClass('j11308_main_floor1_over'); 
   }
  );
 });
/*收藏*/
//加入收藏<a href="javascript:AddFavorite('','汽车分站');">加入收藏</a>
function AddFavorite(sURL, sTitle){
	try{
        window.external.addFavorite(sURL, sTitle);
    }catch (e){
        try{
            window.sidebar.addPanel(sTitle, sURL, "");
        }catch (e){
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
/*banner*/
jQuery(function ($) {
    if ($(".slide_pic").length > 0) {
        var defaultOpts = { interval: 5000, fadeInTime: 300, fadeOutTime: 200 };
        var _titles = $("ul.slide_txt li");
        var _titles_bg = $("ul.op li");
        var _bodies = $("ul.slide_pic li");
        var _count = _titles.length;
        var _current = 0;
        var _intervalID = null;
        var stop = function () { window.clearInterval(_intervalID); };
        var slide = function (opts) {
            if (opts) {
                _current = opts.current || 0;
            } else {
                _current = (_current >= (_count - 1)) ? 0 : (++_current);
            };
            _bodies.filter(":visible").fadeOut(defaultOpts.fadeOutTime, function () {
                _bodies.eq(_current).fadeIn(defaultOpts.fadeInTime);
                _bodies.removeClass("cur").eq(_current).addClass("cur");
            });
            _titles.removeClass("cur").eq(_current).addClass("cur");
            _titles_bg.removeClass("cur").eq(_current).addClass("cur");
        };
        var go = function () {
            stop();
            _intervalID = window.setInterval(function () { slide(); }, defaultOpts.interval);
        };
        var itemMouseOver = function (target, items) {
            stop();
            var i = $.inArray(target, items);
            slide({ current: i });
        };
        _titles.hover(function () { if ($(this).attr('class') != 'cur') { itemMouseOver(this, _titles); } else { stop(); } }, go);
        _bodies.hover(stop, go);
        go();
    }
});

(function($){
	$.fn.slide=function(options){
		$.fn.slide.deflunt={
		effect : "fade", //效果 || fade：渐显； || top：上滚动；|| left：左滚动；|| topLoop：上循环滚动；|| leftLoop：左循环滚动；|| topMarquee：上无缝循环滚动；|| leftMarquee：左无缝循环滚动；
		autoPlay:false, //自动运行
		delayTime : 500, //效果持续时间
		interTime : 2500,//自动运行间隔。当effect为无缝滚动的时候，相当于运行速度。
		defaultIndex : 0,//默认的当前位置索引。0是第一个
		titCell:".hd li",//导航元素
		mainCell:".bd",//内容元素的父层对象
		trigger: "mouseover",//触发方式 || mouseover：鼠标移过触发；|| click：鼠标点击触发；
		scroll:1,//每次滚动个数。
		vis:1,//visible，可视范围个数，当内容个数少于可视个数的时候，不执行效果。
		titOnClassName:"on_hover",//当前位置自动增加的class名称
		autoPage:false,//系统自动分页，当为true时，titCell则为导航元素父层对象，同时系统会在titCell里面自动插入分页li元素(1.2版本新增)
		prevCell:".prev",//前一个按钮元素。
		nextCell:".next"//后一个按钮元素。
		};

		return this.each(function() {
			var opts = $.extend({},$.fn.slide.deflunt,options);
			var index=opts.defaultIndex;
			var prevBtn = $(opts.prevCell, $(this));
			var nextBtn = $(opts.nextCell, $(this));
			var navObj = $(opts.titCell, $(this));//导航子元素结合
			var navObjSize = navObj.size();
			var conBox = $(opts.mainCell , $(this));//内容元素父层对象
			var conBoxSize=conBox.children().size();
			var slideH=0;
			var slideW=0;
			var selfW=0;
			var selfH=0;
			var autoPlay = opts.autoPlay;
			var inter=null;//setInterval名称 
			var oldIndex = index;

			if(conBoxSize<opts.vis) return; //当内容个数少于可视个数，不执行效果。

			//处理分页
			if( navObjSize==0 )navObjSize=conBoxSize;
			if( opts.autoPage ){
				var tempS = conBoxSize-opts.vis;
				navObjSize=1+parseInt(tempS%opts.scroll!=0?(tempS/opts.scroll+1):(tempS/opts.scroll)); 
				navObj.html(""); 
				for( var i=0; i<navObjSize; i++ ){ navObj.append("<li>"+(i+1)+"</li>") }
				var navObj = $("li", navObj);//重置导航子元素对象
			}

			conBox.children().each(function(){ //取最大值
				if( $(this).width()>selfW ){ selfW=$(this).width(); slideW=$(this).outerWidth(true);  }
				if( $(this).height()>selfH ){ selfH=$(this).height(); slideH=$(this).outerHeight(true);  }
			});

			switch(opts.effect)
			{
				case "top": conBox.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; height:'+opts.vis*slideH+'px"></div>').css( { "position":"relative","padding":"0","margin":"0"}).children().css( {"height":selfH} ); break;
				case "left": conBox.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; width:'+opts.vis*slideW+'px"></div>').css( { "width":conBoxSize*slideW,"position":"relative","overflow":"hidden","padding":"0","margin":"0"}).children().css( {"float":"left","width":selfW} ); break;
				case "leftLoop":
				case "leftMarquee":
					conBox.children().clone().appendTo(conBox).clone().prependTo(conBox); 
					conBox.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; width:'+opts.vis*slideW+'px"></div>').css( { "width":conBoxSize*slideW*3,"position":"relative","overflow":"hidden","padding":"0","margin":"0","left":-conBoxSize*slideW}).children().css( {"float":"left","width":selfW}  ); break;
				case "topLoop":
				case "topMarquee":
					conBox.children().clone().appendTo(conBox).clone().prependTo(conBox); 
					conBox.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; height:'+opts.vis*slideH+'px"></div>').css( { "height":conBoxSize*slideH*3,"position":"relative","padding":"0","margin":"0","top":-conBoxSize*slideH}).children().css( {"height":selfH} ); break;
			}

			//效果函数
			var doPlay=function(){
				switch(opts.effect)
				{
					case "fade": case "top": case "left": if ( index >= navObjSize) { index = 0; } else if( index < 0) { index = navObjSize-1; } break;
					case "leftMarquee":case "topMarquee": if ( index>= 2) { index=1; } else if( index<0) { index = 0; } break;
					case "leftLoop": case "topLoop":
						var tempNum = index - oldIndex; 
						if( navObjSize>2 && tempNum==-(navObjSize-1) ) tempNum=1;
						if( navObjSize>2 && tempNum==(navObjSize-1) ) tempNum=-1;
						var scrollNum = Math.abs( tempNum*opts.scroll );
						if ( index >= navObjSize) { index = 0; } else if( index < 0) { index = navObjSize-1; }
					break;
				}
				switch (opts.effect)
				{
					case "fade":conBox.children().stop(true,true).eq(index).fadeIn(opts.delayTime).siblings().hide();break;
					case "top":conBox.stop(true,true).animate({"top":-index*opts.scroll*slideH},opts.delayTime);break;
					case "left":conBox.stop(true,true).animate({"left":-index*opts.scroll*slideW},opts.delayTime);break;
					case "leftLoop":
						if(tempNum<0 ){
								conBox.stop(true,true).animate({"left":-(conBoxSize-scrollNum )*slideW},opts.delayTime,function(){
								for(var i=0;i<scrollNum;i++){ conBox.children().last().prependTo(conBox); }
								conBox.css("left",-conBoxSize*slideW);
							});
						}
						else{
							conBox.stop(true,true).animate({"left":-( conBoxSize + scrollNum)*slideW},opts.delayTime,function(){
								for(var i=0;i<scrollNum;i++){ conBox.children().first().appendTo(conBox); }
								conBox.css("left",-conBoxSize*slideW);
							});
						}break;// leftLoop end

					case "topLoop":
						if(tempNum<0 ){
								conBox.stop(true,true).animate({"top":-(conBoxSize-scrollNum )*slideH},opts.delayTime,function(){
								for(var i=0;i<scrollNum;i++){ conBox.children().last().prependTo(conBox); }
								conBox.css("top",-conBoxSize*slideH);
							});
						}
						else{
							conBox.stop(true,true).animate({"top":-( conBoxSize + scrollNum)*slideH},opts.delayTime,function(){
								for(var i=0;i<scrollNum;i++){ conBox.children().first().appendTo(conBox); }
								conBox.css("top",-conBoxSize*slideH);
							});
						}break;//topLoop end

					case "leftMarquee":
						var tempLeft = conBox.css("left").replace("px",""); 

						if(index==0 ){
								conBox.animate({"left":++tempLeft},0,function(){
									if( conBox.css("left").replace("px","")>= 0){ for(var i=0;i<conBoxSize;i++){ conBox.children().last().prependTo(conBox); }conBox.css("left",-conBoxSize*slideW);}
								});
						}
						else{
								conBox.animate({"left":--tempLeft},0,function(){
									if(  conBox.css("left").replace("px","")<= -conBoxSize*slideW*2){ for(var i=0;i<conBoxSize;i++){ conBox.children().first().appendTo(conBox); }conBox.css("left",-conBoxSize*slideW);}
								});
						}break;// leftMarquee end

						case "topMarquee":
						var tempTop = conBox.css("top").replace("px",""); 
							if(index==0 ){
									conBox.animate({"top":++tempTop},0,function(){
										if( conBox.css("top").replace("px","") >= 0){ for(var i=0;i<conBoxSize;i++){ conBox.children().last().prependTo(conBox); }conBox.css("top",-conBoxSize*slideH);}
									});
							}
							else{
									conBox.animate({"top":--tempTop},0,function(){
										if( conBox.css("top").replace("px","")<= -conBoxSize*slideH*2){ for(var i=0;i<conBoxSize;i++){ conBox.children().first().appendTo(conBox); }conBox.css("top",-conBoxSize*slideH);}
									});
							}break;// topMarquee end


				}//switch end
					navObj.removeClass(opts.titOnClassName).eq(index).addClass(opts.titOnClassName);
					oldIndex=index;
			};
			//初始化执行
			doPlay();

			//自动播放
			if (autoPlay) {
					if( opts.effect=="leftMarquee" || opts.effect=="topMarquee"  ){
						index++; inter = setInterval(doPlay, opts.interTime);
						conBox.hover(function(){if(autoPlay){clearInterval(inter); }},function(){if(autoPlay){clearInterval(inter);inter = setInterval(doPlay, opts.interTime);}});
					}else{
						 inter=setInterval(function(){index++; doPlay() }, opts.interTime); 
						$(this).hover(function(){if(autoPlay){clearInterval(inter); }},function(){if(autoPlay){clearInterval(inter); inter=setInterval(function(){index++; doPlay() }, opts.interTime); }});
					}
			}

			//鼠标事件
			var mst;
			if(opts.trigger=="mouseover"){
				navObj.hover(function(){ clearTimeout(mst); index=navObj.index(this); mst = window.setTimeout(doPlay,200); }, function(){ if(!mst)clearTimeout(mst); });
			}else{ navObj.click(function(){index=navObj.index(this);  doPlay(); })  }
			nextBtn.click(function(){ index++; doPlay(); });
			prevBtn.click(function(){  index--; doPlay(); });

    	});//each End

	};//slide End

})(jQuery);

/*!
* jQuery blockUI plugin
* Version 2.31 (06-JAN-2010)
* @requires jQuery v1.2.3 or later
*
* Examples at: http://malsup.com/jquery/block/
* Copyright (c) 2007-2008 M. Alsup
* Dual licensed under the MIT and GPL licenses:
* http://www.opensource.org/licenses/mit-license.php
* http://www.gnu.org/licenses/gpl.html
*
* Thanks to Amir-Hossein Sobhi for some excellent contributions!
*/

; (function($) {

    if (/1\.(0|1|2)\.(0|1|2)/.test($.fn.jquery) || /^1.1/.test($.fn.jquery)) {
        alert('blockUI requires jQuery v1.2.3 or later!  You are using v' + $.fn.jquery);
        return;
    }

    $.fn._fadeIn = $.fn.fadeIn;

    var noOp = function() { };

    // this bit is to ensure we don't call setExpression when we shouldn't (with extra muscle to handle
    // retarded userAgent strings on Vista)
    var mode = document.documentMode || 0;
    var setExpr = $.browser.msie && (($.browser.version < 8 && !mode) || mode < 8);
    var ie6 = $.browser.msie && /MSIE 6.0/.test(navigator.userAgent) && !mode;

    // global $ methods for blocking/unblocking the entire page
    $.blockUI = function(opts) { install(window, opts); };
    $.unblockUI = function(opts) { remove(window, opts); };

    // convenience method for quick growl-like notifications  (http://www.google.com/search?q=growl)
    $.growlUI = function(title, message, timeout, onClose) {
        var $m = $('<div class="growlUI"></div>');
        if (title) $m.append('<h1>' + title + '</h1>');
        if (message) $m.append('<h2>' + message + '</h2>');
        if (timeout == undefined) timeout = 3000;
        $.blockUI({
            message: $m, fadeIn: 700, fadeOut: 1000, centerY: false,
            timeout: timeout, showOverlay: false,
            onUnblock: onClose,
            css: $.blockUI.defaults.growlCSS
        });
    };

    // plugin method for blocking element content
    $.fn.block = function(opts) {
        return this.unblock({ fadeOut: 0 }).each(function() {
            if ($.css(this, 'position') == 'static')
                this.style.position = 'relative';
            if ($.browser.msie)
                this.style.zoom = 1; // force 'hasLayout'
            install(this, opts);
        });
    };

    // plugin method for unblocking element content
    $.fn.unblock = function(opts) {
        return this.each(function() {
            remove(this, opts);
        });
    };

    $.blockUI.version = 2.31; // 2nd generation blocking at no extra cost!

    // override these in your code to change the default behavior and style
    $.blockUI.defaults = {
        // message displayed when blocking (use null for no message)
        message: '<h1>Please wait...</h1>',

        title: null,   // title string; only used when theme == true
        draggable: true,  // only used when theme == true (requires jquery-ui.js to be loaded)

        theme: false, // set to true to use with jQuery UI themes

        // styles for the message when blocking; if you wish to disable
        // these and use an external stylesheet then do this in your code:
        // $.blockUI.defaults.css = {};
        css: {
            padding: 0,
            margin: 0,
            width: '30%',
            top: '40%',
            left: '35%',
            textAlign: 'center',
            //color: '#000',
            border: '3px solid #aaa',
            backgroundColor: '#fff'
           // cursor: 'wait'  zx修改
        },

        // minimal style set used when themes are used
        themedCSS: {
            width: '30%',
            top: '40%',
            left: '35%'
        },

        // styles for the overlay
        overlayCSS: {
            backgroundColor: '#000',
            opacity: 0.8
            //cursor: 'wait'  zx修改
        },

        // styles applied when using $.growlUI
        growlCSS: {
            width: '350px',
            top: '10px',
            left: '',
            right: '10px',
            border: 'none',
            padding: '5px',
            opacity: 0.6,
            cursor: 'default',
            color: '#fff',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px'
        },

        // IE issues: 'about:blank' fails on HTTPS and javascript:false is s-l-o-w
        // (hat tip to Jorge H. N. de Vasconcelos)
        iframeSrc: /^https/i.test(window.location.href || '') ? 'javascript:false' : 'about:blank',

        // force usage of iframe in non-IE browsers (handy for blocking applets)
        forceIframe: false,

        // z-index for the blocking overlay
        baseZ: 1000,

        // set these to true to have the message automatically centered
        centerX: true, // <-- only effects element blocking (page block controlled via css above)
        centerY: true,

        // allow body element to be stetched in ie6; this makes blocking look better
        // on "short" pages.  disable if you wish to prevent changes to the body height
        allowBodyStretch: true,

        // enable if you want key and mouse events to be disabled for content that is blocked
        bindEvents: true,

        // be default blockUI will supress tab navigation from leaving blocking content
        // (if bindEvents is true)
        constrainTabKey: true,

        // fadeIn time in millis; set to 0 to disable fadeIn on block
        fadeIn: 200,

        // fadeOut time in millis; set to 0 to disable fadeOut on unblock
        fadeOut: 400,

        // time in millis to wait before auto-unblocking; set to 0 to disable auto-unblock
        timeout: 0,

        // disable if you don't want to show the overlay
        showOverlay: true,

        // if true, focus will be placed in the first available input field when
        // page blocking
        focusInput: true,

        // suppresses the use of overlay styles on FF/Linux (due to performance issues with opacity)
        applyPlatformOpacityRules: true,

        // callback method invoked when fadeIn has completed and blocking message is visible
        onBlock: null,

        // callback method invoked when unblocking has completed; the callback is
        // passed the element that has been unblocked (which is the window object for page
        // blocks) and the options that were passed to the unblock call:
        //	 onUnblock(element, options)
        onUnblock: null,

        // don't ask; if you really must know: http://groups.google.com/group/jquery-en/browse_thread/thread/36640a8730503595/2f6a79a77a78e493#2f6a79a77a78e493
        quirksmodeOffsetHack: 4
    };

    // private data and functions follow...

    var pageBlock = null;
    var pageBlockEls = [];

    function install(el, opts) {
        var full = (el == window);
        var msg = opts && opts.message !== undefined ? opts.message : undefined;
        opts = $.extend({}, $.blockUI.defaults, opts || {});
        opts.overlayCSS = $.extend({}, $.blockUI.defaults.overlayCSS, opts.overlayCSS || {});
        var css = $.extend({}, $.blockUI.defaults.css, opts.css || {});
        var themedCSS = $.extend({}, $.blockUI.defaults.themedCSS, opts.themedCSS || {});
        msg = msg === undefined ? opts.message : msg;

        // remove the current block (if there is one)
        if (full && pageBlock)
            remove(window, { fadeOut: 0 });

        // if an existing element is being used as the blocking content then we capture
        // its current place in the DOM (and current display style) so we can restore
        // it when we unblock
        if (msg && typeof msg != 'string' && (msg.parentNode || msg.jquery)) {
            var node = msg.jquery ? msg[0] : msg;
            var data = {};
            $(el).data('blockUI.history', data);
            data.el = node;
            data.parent = node.parentNode;
            data.display = node.style.display;
            data.position = node.style.position;
            if (data.parent)
                data.parent.removeChild(node);
        }

        var z = opts.baseZ;

        // blockUI uses 3 layers for blocking, for simplicity they are all used on every platform;
        // layer1 is the iframe layer which is used to supress bleed through of underlying content
        // layer2 is the overlay layer which has opacity and a wait cursor (by default)
        // layer3 is the message content that is displayed while blocking

        var lyr1 = ($.browser.msie || opts.forceIframe)
		? $('<iframe class="blockUI" style="z-index:' + (z++) + ';display:none;border:none;margin:0;padding:0;position:absolute;width:100%;height:100%;top:0;left:0" src="' + opts.iframeSrc + '"></iframe>')
		: $('<div class="blockUI" style="display:none"></div>');
        var lyr2 = $('<div class="blockUI blockOverlay" style="z-index:' + (z++) + ';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>');

        var lyr3;
        if (opts.theme && full) {
            var s = '<div class="blockUI blockMsg blockPage ui-dialog ui-widget ui-corner-all" style="z-index:' + z + ';display:none;position:fixed">' +
					'<div class="ui-widget-header ui-dialog-titlebar blockTitle">' + (opts.title || '&nbsp;') + '</div>' +
					'<div class="ui-widget-content ui-dialog-content"></div>' +
				'</div>';
            lyr3 = $(s);
        }
        else {
            lyr3 = full ? $('<div class="blockUI blockMsg blockPage" style="z-index:' + z + ';display:none;position:fixed"></div>')
					: $('<div class="blockUI blockMsg blockElement" style="z-index:' + z + ';display:none;position:absolute"></div>');
        }

        // if we have a message, style it
        if (msg) {
            if (opts.theme) {
                lyr3.css(themedCSS);
                lyr3.addClass('ui-widget-content');
            }
            else
                lyr3.css(css);
        }

        // style the overlay
        if (!opts.applyPlatformOpacityRules || !($.browser.mozilla && /Linux/.test(navigator.platform)))
            lyr2.css(opts.overlayCSS);
        lyr2.css('position', full ? 'fixed' : 'absolute');

        // make iframe layer transparent in IE
        if ($.browser.msie || opts.forceIframe)
            lyr1.css('opacity', 0.0);

        //$([lyr1[0],lyr2[0],lyr3[0]]).appendTo(full ? 'body' : el);
        var layers = [lyr1, lyr2, lyr3], $par = full ? $('body') : $(el);
        $.each(layers, function() {
            this.appendTo($par);
        });

        if (opts.theme && opts.draggable && $.fn.draggable) {
            lyr3.draggable({
                handle: '.ui-dialog-titlebar',
                cancel: 'li'
            });
        }

        // ie7 must use absolute positioning in quirks mode and to account for activex issues (when scrolling)
        var expr = setExpr && (!$.boxModel || $('object,embed', full ? null : el).length > 0);
        if (ie6 || expr) {
            // give body 100% height
            if (full && opts.allowBodyStretch && $.boxModel)
                $('html,body').css('height', '100%');

            // fix ie6 issue when blocked element has a border width
            if ((ie6 || !$.boxModel) && !full) {
                var t = sz(el, 'borderTopWidth'), l = sz(el, 'borderLeftWidth');
                var fixT = t ? '(0 - ' + t + ')' : 0;
                var fixL = l ? '(0 - ' + l + ')' : 0;
            }

            // simulate fixed position
            $.each([lyr1, lyr2, lyr3], function(i, o) {
                var s = o[0].style;
                s.position = 'absolute';
                if (i < 2) {
                    full ? s.setExpression('height', 'Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.boxModel?0:' + opts.quirksmodeOffsetHack + ') + "px"')
					 : s.setExpression('height', 'this.parentNode.offsetHeight + "px"');
                    full ? s.setExpression('width', 'jQuery.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"')
					 : s.setExpression('width', 'this.parentNode.offsetWidth + "px"');
                    if (fixL) s.setExpression('left', fixL);
                    if (fixT) s.setExpression('top', fixT);
                }
                else if (opts.centerY) {
                    if (full) s.setExpression('top', '(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"');
                    s.marginTop = 0;
                }
                else if (!opts.centerY && full) {
                    var top = (opts.css && opts.css.top) ? parseInt(opts.css.top) : 0;
                    var expression = '((document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + ' + top + ') + "px"';
                    s.setExpression('top', expression);
                }
            });
        }

        // show the message
        if (msg) {
            if (opts.theme)
                lyr3.find('.ui-widget-content').append(msg);
            else
                lyr3.append(msg);
            if (msg.jquery || msg.nodeType)
                $(msg).show();
        }

        if (($.browser.msie || opts.forceIframe) && opts.showOverlay)
            lyr1.show(); // opacity is zero
        if (opts.fadeIn) {
            var cb = opts.onBlock ? opts.onBlock : noOp;
            var cb1 = (opts.showOverlay && !msg) ? cb : noOp;
            var cb2 = msg ? cb : noOp;
            if (opts.showOverlay)
                lyr2._fadeIn(opts.fadeIn, cb1);
            if (msg)
                lyr3._fadeIn(opts.fadeIn, cb2);
        }
        else {
            if (opts.showOverlay)
                lyr2.show();
            if (msg)
                lyr3.show();
            if (opts.onBlock)
                opts.onBlock();
        }

        // bind key and mouse events
        bind(1, el, opts);

        if (full) {
            pageBlock = lyr3[0];
            pageBlockEls = $(':input:enabled:visible', pageBlock);
            if (opts.focusInput)
                setTimeout(focus, 20);
        }
        else
            center(lyr3[0], opts.centerX, opts.centerY);

        if (opts.timeout) {
            // auto-unblock
            var to = setTimeout(function() {
                full ? $.unblockUI(opts) : $(el).unblock(opts);
            }, opts.timeout);
            $(el).data('blockUI.timeout', to);
        }
    };

    // remove the block
    function remove(el, opts) {
        var full = (el == window);
        var $el = $(el);
        var data = $el.data('blockUI.history');
        var to = $el.data('blockUI.timeout');
        if (to) {
            clearTimeout(to);
            $el.removeData('blockUI.timeout');
        }
        opts = $.extend({}, $.blockUI.defaults, opts || {});
        bind(0, el, opts); // unbind events

        var els;
        if (full) // crazy selector to handle odd field errors in ie6/7
            els = $('body').children().filter('.blockUI').add('body > .blockUI');
        else
            els = $('.blockUI', el);

        if (full)
            pageBlock = pageBlockEls = null;

        if (opts.fadeOut) {
            els.fadeOut(opts.fadeOut);
            setTimeout(function() { reset(els, data, opts, el); }, opts.fadeOut);
        }
        else
            reset(els, data, opts, el);
    };

    // move blocking element back into the DOM where it started
    function reset(els, data, opts, el) {
        els.each(function(i, o) {
            // remove via DOM calls so we don't lose event handlers
            if (this.parentNode)
                this.parentNode.removeChild(this);
        });

        if (data && data.el) {
            data.el.style.display = data.display;
            data.el.style.position = data.position;
            if (data.parent)
                data.parent.appendChild(data.el);
            $(el).removeData('blockUI.history');
        }

        if (typeof opts.onUnblock == 'function')
            opts.onUnblock(el, opts);
    };

    // bind/unbind the handler
    function bind(b, el, opts) {
        var full = el == window, $el = $(el);

        // don't bother unbinding if there is nothing to unbind
        if (!b && (full && !pageBlock || !full && !$el.data('blockUI.isBlocked')))
            return;
        if (!full)
            $el.data('blockUI.isBlocked', b);

        // don't bind events when overlay is not in use or if bindEvents is false
        if (!opts.bindEvents || (b && !opts.showOverlay))
            return;

        // bind anchors and inputs for mouse and key events
        var events = 'mousedown mouseup keydown keypress';
        b ? $(document).bind(events, opts, handler) : $(document).unbind(events, handler);

        // former impl...
        //	   var $e = $('a,:input');
        //	   b ? $e.bind(events, opts, handler) : $e.unbind(events, handler);
    };

    // event handler to suppress keyboard/mouse events when blocking
    function handler(e) {
        // allow tab navigation (conditionally)
        if (e.keyCode && e.keyCode == 9) {
            if (pageBlock && e.data.constrainTabKey) {
                var els = pageBlockEls;
                var fwd = !e.shiftKey && e.target == els[els.length - 1];
                var back = e.shiftKey && e.target == els[0];
                if (fwd || back) {
                    setTimeout(function() { focus(back) }, 10);
                    return false;
                }
            }
        }
        // allow events within the message content
        if ($(e.target).parents('div.blockMsg').length > 0)
            return true;

        // allow events for content that is not being blocked
        return $(e.target).parents().children().filter('div.blockUI').length == 0;
    };

    function focus(back) {
        if (!pageBlockEls)
            return;
        var e = pageBlockEls[back === true ? pageBlockEls.length - 1 : 0];
        if (e)
            e.focus();
    };

    function center(el, x, y) {
        var p = el.parentNode, s = el.style;
        var l = ((p.offsetWidth - el.offsetWidth) / 2) - sz(p, 'borderLeftWidth');
        var t = ((p.offsetHeight - el.offsetHeight) / 2) - sz(p, 'borderTopWidth');
        if (x) s.left = l > 0 ? (l + 'px') : '0';
        if (y) s.top = t > 0 ? (t + 'px') : '0';
    };

    function sz(el, p) {
        return parseInt($.css(el, p)) || 0;
    };

    
    
})(jQuery);




//新版客服
$(function(){

		$(".top").click(function(){
			$("body,html").animate({scrollTop:0},200);
			return false;
		});

		$(".kf_con").hover(function(){
			$(".morekfs").show();
			$("#btm_zn").addClass("current");

		},function(){
			$(".morekfs").hide();
			$("#btm_zn").removeClass("current");
		});
});


