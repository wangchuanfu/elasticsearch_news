$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(jQuery.trim(this.value) || '');
		} else {
			o[this.name] = jQuery.trim(this.value) || '';
		}
	});
	return o;
};

String.prototype.replaceAll = function(str1, str2) {
	var str = this;
	var result = str.replace(eval("/" + str1 + "/gi"), str2);
	return result;
};

/**
 * 判断是否为正整数,零,小数
 * 
 * @author
 * @param {}
 *            number
 * @return {Boolean}
 */
function checkNumber(number) {
	if (!number) {
		return false;
	}
	if (/^[0-9]+\.{0,1}[0-9]{0,2}$/.test(number)) {
		return true;
	} else {
		return false;
	}
}
/**
 * 验证qq号
 * 
 * @param {}
 *            qq
 * @return {Boolean}
 */
function checkQQ(qq) {
	if (!qq) {
		return true;
	}
	if (/^[1-9]\d{4,15}$/.test(qq)) {
		return true;
	} else {
		return false;
	}
}
/**
 * 判断是否为11位手机号码
 * 
 * @param {}
 *            moblie
 * @return {Boolean}
 */
function checkMobile(moblie) {
	if (!moblie) {
		return false;
	}
	if (/^(13|15|18|14)[0-9]{9}$/.test(moblie)) {
		return true;
	} else {
		return false;
	}
}
/**
 * 判断是否为Email地址
 * 
 * @param {}
 *            email
 * @return {Boolean}
 */
function checkEmail(email) {
	if (!email) {
		return true;
	}
	if (email.indexOf("@") < 0) {
		return false;
	}
	return true;
}
/**
 * 判断是否倍数
 * 
 * @param {}
 *            num
 * @param {}
 *            baseNum
 */
function checkMultiples(num, baseNum) {
	if (!num && !baseNum) {
		return true;
	}
	num = Number(num);
	if (isNaN(num)) {
		return false;
	}
	baseNum = Number(baseNum);
	if (isNaN(baseNum)) {
		return false;
	}
	var res = parseInt(num * 1000) % parseInt(baseNum * 1000);
	if (res == 0) {
		return true;
	} else {
		return false;
	}
}
/**
 * 获取字符串的长度，一个汉字为两个字符
 * 
 * @param {}
 *            str
 * @return {}
 */
function getStrLength(str) {
	var re = /^[a-zA-Z0-9\u4E00-\u9FA5_]*$/;
	var len = str.length;
	var num = 0;
	for (i = 0; i <= len; i++) {
		var v = escape(str.charAt(i));
		if (v.indexOf('%') == 0) {
			num = num + 2;
		}
	}
	var a = len - num / 2;
	var b = num + a;
	return b;
}
/**
 * 封装Ajax
 * 
 * @param {}
 *            ajaxArgs
 */
function doAjax(ajaxArgs) {

	if ($.isFunction(ajaxArgs.error)) {
		var oldErrFn = ajaxArgs.error;
	}
	var ajaxData = new Object();
	if (ajaxArgs.data) {
		ajaxData = ajaxArgs.data;
		if (typeof (ajaxArgs.data) == "string") {
			if (jQuery.trim(ajaxArgs.data) != "") {
				ajaxData = ajaxData + "&checkLogin=true";
			} else {
				ajaxData = "checkLogin=true";
			}
		} else {
			ajaxData.checkLogin = "true";
		}
	} else {
		ajaxData.checkLogin = "true";
	}
	ajaxArgs.data = ajaxData;
	ajaxArgs.type = 'post';
	ajaxArgs.error = function(XMLHttpRequest, textStatus, errorThrown) {
		if (XMLHttpRequest.status == 403) {
			// beginloginrove();//openLoginDialog();
		} else if (oldErrFn) {
			oldErrFn(XMLHttpRequest, textStatus, errorThrown);
		}
	}
	$.ajax(ajaxArgs);
}
/**
 * 将文本框值步进相加
 * 
 * @param {}
 *            domId
 * @param {}
 *            step
 * @param {}
 *            max
 */
function stepPlus(domId, step, max) {
	if (typeof (domId) == "undefined") {
		return;
	}
	step = Number(step);
	if (isNaN(step)) {
		step = 1;
	}
	var cuNum = Number(jQuery.trim($("#" + domId).val()));
	var num = step;
	if (!isNaN(cuNum)) {
		num = cuNum.valueOf() + step.valueOf();
	}
	if (!isNaN(Number(max)) && num > max) {
		num = max;
	}
	num = commonShrink(Number(num).toFixed(2));
	$("#" + domId).val(num);
}
/**
 * 将文本框值步进相减
 * 
 * @param {}
 *            domId
 * @param {}
 *            step
 * @param {}
 *            min
 */
function stepMinus(domId, step, min) {
	if (typeof (domId) == "undefined") {
		return;
	}
	step = Number(step);
	if (isNaN(step)) {
		step = 1;
	}
	var cuNum = Number(jQuery.trim($("#" + domId).val()));
	var num = step;
	if (!isNaN(cuNum)) {
		num = cuNum.valueOf() - step.valueOf();
	}
	var minNum = 1;
	if (!isNaN(Number(min))) {
		minNum = min;
	}
	if (num < minNum) {
		num = minNum;
	}
	num = commonShrink(Number(num).toFixed(2));
	$("#" + domId).val(num);
}
/**
 * 用ajax的方式将请求后的页面填充到指定DIV，如果DIV下有节点，则不填充
 * 
 * @param {}
 *            id
 * @param {}
 *            url
 * @param {}
 *            data
 */
function getDivContent(id, url, data) {
	if (typeof (data) == "undefined") {
		data = new Object();
	}
	if ($("#" + id + ":has(*)").length == 0) {
		$.ajax({
			url : url,
			type : 'post',
			data : data,
			success : function(data) {
				$("#" + id).html(data);
			}
		});
	}
}
/**
 * 用Ajax的方式将请求后的页面填充到指定DIV
 * 
 * @param {}
 *            id
 * @param {}
 *            url
 * @param {}
 *            data
 */
function refreshDivContent(id, url, data) {
	if (typeof (data) == "undefined") {
		data = new Object();
	}
	$.ajax({
		url : url,
		type : 'post',
		data : data,
		success : function(data) {
			$("#" + id).empty().html(data);
		}
	});
}
/**
 * 保留2位小数
 */
function toDecimal(x) {
	var f = parseFloat(x);
	if (isNaN(f)) {
		return;
	}
	f = Math.round(x * 100) / 100;
	return f;
}
/**
 * 公共警告框
 * 
 * @param {}
 *            content
 * @param {}
 *            title
 * @param {}
 *            fn：回调函数，会回传一个参数：action action为两个值：ok,close,分别对应 确定，关闭两个按钮
 *            如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showAlert(content, title, fn) {
	if (!content) {
		content = "";
	}
	if (!title) {
		title = "信息提示";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action, val) {
		};
	}

	asyncbox.alert(content, title, fn);
	$("#asyncbox_alert").bgiframe();
}
/**
 * 公共输入确认框
 * 
 * @param {}
 *            title：标题
 * @param {}
 *            tips：输入框上的小提示
 * @param {}
 *            content:默认内容
 * @param {}
 *            textType：输入框类型，支持 text || textarea || password
 * @param {}
 *            fn：回调函数，会回传两个参数：action,val action为三个值：ok,cancel,close，分别对应
 *            确定，取消，关闭三个按钮 val为输入的值 如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showPromte(title, tips, content, textType, fn) {
	if (!title) {
		title = "提示";
	}
	if (!tips) {
		tips = "请输入";
	}
	if (!content) {
		content = "";
	}
	if (!textType) {
		textType = "text";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action, val) {
		}
	}
	asyncbox.prompt(title, tips, content, textType, fn);
}
/**
 * 公共确认框
 * 
 * @param {}
 *            content:默认内容
 * @param {}
 *            title：标题
 * @param {}
 *            fn：回调函数，会回传一个参数：action action为三个值：ok,cancel,close，分别对应
 *            确定，取消，关闭三个按钮 如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showConfirm(content, title, fn) {
	if (!content) {
		content = "";
	}
	if (!title) {
		title = "请确认";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action, val) {
		}
	}
	asyncbox.confirm(content, title, fn);
}
/**
 * 公共显示成功对话框
 * 
 * @param {}
 *            content
 * @param {}
 *            title
 * @param {}
 *            fn：回调函数，会回传一个参数：action action为两个值：ok,close，分别对应 确定，关闭两个按钮
 *            如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showSuccess(content, title, fn) {
	if (!content) {
		content = "";
	}
	if (!title) {
		title = "成功";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action) {
		}
	}
	asyncbox.success(content, title, fn);
}
/**
 * 公共显示失败对话框
 * 
 * @param {}
 *            content
 * @param {}
 *            title
 * @param {}
 *            fn：回调函数，会回传一个参数：action action为两个值：ok,close，分别对应 确定，关闭两个按钮
 *            如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showError(content, title, fn) {
	if (!content) {
		content = "";
	}
	if (!title) {
		title = "失败";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action, val) {
		}
	}
	asyncbox.error(content, title, fn);
}
/**
 * 公共显示提醒对话框
 * 
 * @param {}
 *            content
 * @param {}
 *            title
 * @param {}
 *            fn：回调函数，会回传一个参数：action action为四个值：yes,no,cancel,close,分别对应
 *            是，否，关闭，关闭四个按钮 如需阻止窗口关闭，请在判断 action 值内加入 return false
 */
function showWarning(content, title, fn) {
	if (!content) {
		content = "";
	}
	if (!title) {
		title = "提醒";
	}
	if (!jQuery.isFunction(fn)) {
		fn = function(action, val) {
		}
	}
	asyncbox.warning(content, title, fn);
}
/**
 * 公共显示标签框
 * 
 * @param {}
 *            content
 * @param {}
 *            type 提示类型。alert、success、error 默认 alert
 * @param {}
 *            timer 自动关闭毫秒数。默认 1.5 秒。
 */
function showTips(content, type, timer) {
	if (!content) {
		content = "";
	}
	if (!type) {
		type = "alert";
	}
	if (typeof (timer) != "number") {
		timer = 1.5;
	}
	asyncbox.tips(content, type, timer);
}
/**
 * 图片出错处理 例：onError="dealwithErrImg(event)"
 * 
 * @param {}
 *            event dfPic:想设定的图片路径 需限定图片大小，以免影响页面布局
 */
function dealwithErrImg(e, dfPic) {
	var img = e.srcElement || e.target;
	if (dfPic) {
		img.src = dfPic;
	} else {
		img.src = "https://img01.j1.com/images/default/product_default_list.jpg";
	}
	img.onError = null;
}
/**
 * 给回车键绑定事件
 * 
 * @param {}
 *            e
 * @param {}
 *            fn
 */
function bindEnter(e, fn) {
	if (!jQuery.isFunction(fn)) {
		return;
	}
	var keynum;
	if (window.event) {// IE
		keynum = e.keyCode;
	} else if (e.which) {// Netscape/Firefox/Opera
		keynum = e.which;
	}
	if (keynum == 13) {
		fn();
	}
}
/**
 * 去除数值尾部0
 * 
 * @param {}
 *            value
 * @return {}
 */
function commonShrink(value) {
	var n = parseFloat(value).toFixed(1);
	var nn = parseFloat(value).toFixed(2);
	var f = nn - n;

	if (f == 0) {
		var m = parseFloat(n).toFixed(0);
		var t = m - n;
		if (t == 0) {
			return Number(m);
		} else {
			return Number(n);
		}
	} else {
		return Number(nn);
	}
}
/**
 * 获取当前时间
 * 
 * @returns
 */
function getCurrentTime() {
	var myDate = new Date();
	var mytime = myDate.getTime();
	return mytime;
}
/**
 * 图片出错处理用于促销抢鲜页 例：onError="dealwithErrImgForPromotion(event)"
 * 
 * @param {}
 *            event dfPic:想设定的图片路径 需限定图片大小，以免影响页面布局
 */
function dealwithErrImgForPromotion(e, dfPic, nihao) {
	var img = e.srcElement || e.target;
	if (dfPic) {
		img.src = dfPic;
	} else {
		img.src = "https://img.j1.com/images/default/promotion_loadero_default.jpg";
	}
	img.onError = null;
}
/**
 * 图片出错处理用于处理促销抢先 例：onError="dealwithErrImgForPromotion(event)"
 * 
 * @param {}
 *            event dfPic:想设定的图片路径 需限定图片大小，以免影响页面布局
 */
function dealwithErrImgForPromotion(e, dfPic) {
	var img = e.srcElement || e.target;
	if (dfPic) {
		img.src = dfPic;
	} else {
		img.src = "https://img.j1.com/images/default/promotion_loadero_default.jpg";
	}
	img.onError = null;
}
/**
 * 控制只能输数字
 */
function keyPress() {
	var keyCode = event.keyCode;
	if ((keyCode >= 48 && keyCode <= 57)) {
		event.returnValue = true;
	} else {
		event.returnValue = false;
	}
}
function openNewUrl(url) {
	window.open(url);
}
// >>>>>>>>>>>>>>>>>第三方登入的js 开始 <<<<<<<<<<<<<<<<
// show_sso_login_window.js
/**
 * 打开健康卡窗口
		http://localhost:8080/ec-web/     https://www.j1.com
 */
function openVincceWindow(){
	var sysId = "8359660fd800bac2d1efb0aff54ce72e";
	 $.ajax({
		url : homePath + "/openVincceWindow.html",
		data : {
			sysId : sysId,
			urlValue : window.location.href
		},
		type:"GET",
		dataType : "json",                            
		success : function(data){
			//alert("aa");
			var token = data.token;
			var backUrl = encodeURI(encodeURI("https://www.j1.com/"+sysId+"/"+token+".html"));
			//http://114.80.86.110:16080
			var url = "http://jk.1qianbao.com//authLoginHtml.htm?sysId="+sysId+"&token="+token+"&backUrl="+backUrl;
			window.location.href=url;
		}
	});
}

/**
 * 打开QQ登录窗口
 */
function openQQLoginWindow() {
	debugger;
			$.ajax({
				url : homePath + "/addBackUrl.html",
				data : {
					urlValue : window.location.href
				},
				type : "post",
				success : function(data) {
					var qq_app_id = "100294640";
					// var app_id = "2394707905";
					var redirect_uri = encodeURI(encodeURI("https://www.j1.com/qq_login_redirect.jsp"));
					// var redirect_uri = encodeURI(encodeURI("new.j1.com"));
					var scope = "get_user_info";
					var code = "code";

					// 获取Access Token
					var url = "https://graph.qq.com/oauth2.0/authorize?response_type=token&client_id="
							+ qq_app_id
							+ "&redirect_uri="
							+ redirect_uri
							+ "&scope=" + scope + "&state=" + data;
					window.location.href = url;
				}
			});
}
/**
 * 打开淘宝登录窗口
 */
function openTaoBaoLoginWindow() {
			$.ajax({
				url : homePath + "/addBackUrl.html",
				data : {
					urlValue : window.location.href
				},
				type : "post",
				success : function(data) {
					var taobao_appKey = "12685181";
					// var redirect_uri = encodeURI("https://www.j1.com?");
					var redirect_uri = encodeURI(encodeURI("https://www.j1.com/taobao_login_redirect.jsp?"));
					var url = "https://oauth.taobao.com/authorize?response_type=token&client_id="
							+ taobao_appKey + "&redirect_uri=" + redirect_uri;
					window.location.href = url;
				}
			});
}
/**
 * 打开支付宝登录窗口
 */
function openAlipayLoginWindow() {
	$.ajax({
		url : homePath + "/addBackUrl.html",
		data : {
			urlValue : window.location.href
		},
		type : "post",
		success : function(data) {
			// 合作身份者ID、交易安全检验码在AlipayConfig.java中配置
			var url = homePath + "/jsp/login/alipay_auth_authorize.jsp";
			window.location.href = url;
		}
	});
}
// >>>>>>>>>>>>>>>>>第三方登入的js 结束 <<<<<<<<<<<<<<<<

// &&&&&&&&&&&&&&&&& json 开始&&&&&&&&&&&&&&&&&&&&
/*
 * http://www.JSON.org/json2.js 2008-11-19
 * 
 * Public Domain.
 * 
 * NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.
 * 
 * See http://www.JSON.org/js.html
 * 
 * This file creates a global JSON object containing two methods: stringify and
 * parse.
 * 
 * JSON.stringify(value, replacer, space) value any JavaScript value, usually an
 * object or array.
 * 
 * replacer an optional parameter that determines how object values are
 * stringified for objects. It can be a function or an array of strings.
 * 
 * space an optional parameter that specifies the indentation of nested
 * structures. If it is omitted, the text will be packed without extra
 * whitespace. If it is a number, it will specify the number of spaces to indent
 * at each level. If it is a string (such as '\t' or '&nbsp;'), it contains the
 * characters used to indent at each level.
 * 
 * This method produces a JSON text from a JavaScript value.
 * 
 * When an object value is found, if the object contains a toJSON method, its
 * toJSON method will be called and the result will be stringified. A toJSON
 * method does not serialize: it returns the value represented by the name/value
 * pair that should be serialized, or undefined if nothing should be serialized.
 * The toJSON method will be passed the key associated with the value, and this
 * will be bound to the object holding the key.
 * 
 * For example, this would serialize Dates as ISO strings.
 * 
 * Date.prototype.toJSON = function (key) { function f(n) { // Format integers
 * to have at least two digits. return n < 10 ? '0' + n : n; }
 * 
 * return this.getUTCFullYear() + '-' + f(this.getUTCMonth() + 1) + '-' +
 * f(this.getUTCDate()) + 'T' + f(this.getUTCHours()) + ':' +
 * f(this.getUTCMinutes()) + ':' + f(this.getUTCSeconds()) + 'Z'; };
 * 
 * You can provide an optional replacer method. It will be passed the key and
 * value of each member, with this bound to the containing object. The value
 * that is returned from your method will be serialized. If your method returns
 * undefined, then the member will be excluded from the serialization.
 * 
 * If the replacer parameter is an array of strings, then it will be used to
 * select the members to be serialized. It filters the results such that only
 * members with keys listed in the replacer array are stringified.
 * 
 * Values that do not have JSON representations, such as undefined or functions,
 * will not be serialized. Such values in objects will be dropped; in arrays
 * they will be replaced with null. You can use a replacer function to replace
 * those with JSON values. JSON.stringify(undefined) returns undefined.
 * 
 * The optional space parameter produces a stringification of the value that is
 * filled with line breaks and indentation to make it easier to read.
 * 
 * If the space parameter is a non-empty string, then that string will be used
 * for indentation. If the space parameter is a number, then the indentation
 * will be that many spaces.
 * 
 * Example:
 * 
 * text = JSON.stringify(['e', {pluribus: 'unum'}]); // text is
 * '["e",{"pluribus":"unum"}]'
 * 
 * 
 * text = JSON.stringify(['e', {pluribus: 'unum'}], null, '\t'); // text is
 * '[\n\t"e",\n\t{\n\t\t"pluribus": "unum"\n\t}\n]'
 * 
 * text = JSON.stringify([new Date()], function (key, value) { return this[key]
 * instanceof Date ? 'Date(' + this[key] + ')' : value; }); // text is
 * '["Date(---current time---)"]'
 * 
 * 
 * JSON.parse(text, reviver) This method parses a JSON text to produce an object
 * or array. It can throw a SyntaxError exception.
 * 
 * The optional reviver parameter is a function that can filter and transform
 * the results. It receives each of the keys and values, and its return value is
 * used instead of the original value. If it returns what it received, then the
 * structure is not modified. If it returns undefined then the member is
 * deleted.
 * 
 * Example: // Parse the text. Values that look like ISO date strings will // be
 * converted to Date objects.
 * 
 * myData = JSON.parse(text, function (key, value) { var a; if (typeof value ===
 * 'string') { a =
 * /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)Z$/.exec(value);
 * if (a) { return new Date(Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4], +a[5],
 * +a[6])); } } return value; });
 * 
 * myData = JSON.parse('["Date(09/09/2001)"]', function (key, value) { var d; if
 * (typeof value === 'string' && value.slice(0, 5) === 'Date(' &&
 * value.slice(-1) === ')') { d = new Date(value.slice(5, -1)); if (d) { return
 * d; } } return value; });
 * 
 * 
 * This is a reference implementation. You are free to copy, modify, or
 * redistribute.
 * 
 * This code should be minified before deployment. See
 * http://javascript.crockford.com/jsmin.html
 * 
 * USE YOUR OWN COPY. IT IS EXTREMELY UNWISE TO LOAD CODE FROM SERVERS YOU DO
 * NOT CONTROL.
 */

/* jslint evil: true */

/* global JSON */

/*
 * members "", "\b", "\t", "\n", "\f", "\r", "\"", JSON, "\\", apply, call,
 * charCodeAt, getUTCDate, getUTCFullYear, getUTCHours, getUTCMinutes,
 * getUTCMonth, getUTCSeconds, hasOwnProperty, join, lastIndex, length, parse,
 * prototype, push, replace, slice, stringify, test, toJSON, toString, valueOf
 */

// Create a JSON object only if one does not already exist. We create the
// methods in a closure to avoid creating global variables.
if (!this.JSON) {
	JSON = {};
}
(function() {

	function f(n) {
		// Format integers to have at least two digits.
		return n < 10 ? '0' + n : n;
	}

	if (typeof Date.prototype.toJSON !== 'function') {

		Date.prototype.toJSON = function(key) {

			return this.getUTCFullYear() + '-' + f(this.getUTCMonth() + 1)
					+ '-' + f(this.getUTCDate()) + 'T' + f(this.getUTCHours())
					+ ':' + f(this.getUTCMinutes()) + ':'
					+ f(this.getUTCSeconds()) + 'Z';
		};

		String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function(
				key) {
			return this.valueOf();
		};
	}

	var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, gap, indent, meta = { // table
		// of
		// character
		// substitutions
		'\b' : '\\b',
		'\t' : '\\t',
		'\n' : '\\n',
		'\f' : '\\f',
		'\r' : '\\r',
		'"' : '\\"',
		'\\' : '\\\\'
	}, rep;

	function quote(string) {

		// If the string contains no control characters, no quote characters,
		// and no
		// backslash characters, then we can safely slap some quotes around it.
		// Otherwise we must also replace the offending characters with safe
		// escape
		// sequences.

		escapable.lastIndex = 0;
		return escapable.test(string) ? '"'
				+ string.replace(escapable,
						function(a) {
							var c = meta[a];
							return typeof c === 'string' ? c : '\\u'
									+ ('0000' + a.charCodeAt(0).toString(16))
											.slice(-4);
						}) + '"' : '"' + string + '"';
	}

	function str(key, holder) {

		// Produce a string from holder[key].

		var i, // The loop counter.
		k, // The member key.
		v, // The member value.
		length, mind = gap, partial, value = holder[key];

		// If the value has a toJSON method, call it to obtain a replacement
		// value.

		if (value && typeof value === 'object'
				&& typeof value.toJSON === 'function') {
			value = value.toJSON(key);
		}

		// If we were called with a replacer function, then call the replacer to
		// obtain a replacement value.

		if (typeof rep === 'function') {
			value = rep.call(holder, key, value);
		}

		// What happens next depends on the value's type.

		switch (typeof value) {
		case 'string':
			return quote(value);

		case 'number':

			// JSON numbers must be finite. Encode non-finite numbers as null.

			return isFinite(value) ? String(value) : 'null';

		case 'boolean':
		case 'null':

			// If the value is a boolean or null, convert it to a string. Note:
			// typeof null does not produce 'null'. The case is included here in
			// the remote chance that this gets fixed someday.

			return String(value);

			// If the type is 'object', we might be dealing with an object or an
			// array or
			// null.

		case 'object':

			// Due to a specification blunder in ECMAScript, typeof null is
			// 'object',
			// so watch out for that case.

			if (!value) {
				return 'null';
			}

			// Make an array to hold the partial results of stringifying this
			// object value.

			gap += indent;
			partial = [];

			// Is the value an array?

			if (Object.prototype.toString.apply(value) === '[object Array]') {

				// The value is an array. Stringify every element. Use null as a
				// placeholder
				// for non-JSON values.

				length = value.length;
				for (i = 0; i < length; i += 1) {
					partial[i] = str(i, value) || 'null';
				}

				// Join all of the elements together, separated with commas, and
				// wrap them in
				// brackets.

				v = partial.length === 0 ? '[]' : gap ? '[\n' + gap
						+ partial.join(',\n' + gap) + '\n' + mind + ']' : '['
						+ partial.join(',') + ']';
				gap = mind;
				return v;
			}

			// If the replacer is an array, use it to select the members to be
			// stringified.

			if (rep && typeof rep === 'object') {
				length = rep.length;
				for (i = 0; i < length; i += 1) {
					k = rep[i];
					if (typeof k === 'string') {
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			} else {

				// Otherwise, iterate through all of the keys in the object.

				for (k in value) {
					if (Object.hasOwnProperty.call(value, k)) {
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			}

			// Join all of the member texts together, separated with commas,
			// and wrap them in braces.

			v = partial.length === 0 ? '{}' : gap ? '{\n' + gap
					+ partial.join(',\n' + gap) + '\n' + mind + '}' : '{'
					+ partial.join(',') + '}';
			gap = mind;
			return v;
		}
	}

	// If the JSON object does not yet have a stringify method, give it one.

	if (typeof JSON.stringify !== 'function') {
		JSON.stringify = function(value, replacer, space) {

			// The stringify method takes a value and an optional replacer, and
			// an optional
			// space parameter, and returns a JSON text. The replacer can be a
			// function
			// that can replace values, or an array of strings that will select
			// the keys.
			// A default replacer method can be provided. Use of the space
			// parameter can
			// produce text that is more easily readable.

			var i;
			gap = '';
			indent = '';

			// If the space parameter is a number, make an indent string
			// containing that
			// many spaces.

			if (typeof space === 'number') {
				for (i = 0; i < space; i += 1) {
					indent += ' ';
				}

				// If the space parameter is a string, it will be used as the
				// indent string.

			} else if (typeof space === 'string') {
				indent = space;
			}

			// If there is a replacer, it must be a function or an array.
			// Otherwise, throw an error.

			rep = replacer;
			if (replacer
					&& typeof replacer !== 'function'
					&& (typeof replacer !== 'object' || typeof replacer.length !== 'number')) {
				throw new Error('JSON.stringify');
			}

			// Make a fake root object containing our value under the key of ''.
			// Return the result of stringifying the value.

			return str('', {
				'' : value
			});
		};
	}

	// If the JSON object does not yet have a parse method, give it one.

	if (typeof JSON.parse !== 'function') {
		JSON.parse = function(text, reviver) {

			// The parse method takes a text and an optional reviver function,
			// and returns
			// a JavaScript value if the text is a valid JSON text.

			var j;

			function walk(holder, key) {

				// The walk method is used to recursively walk the resulting
				// structure so
				// that modifications can be made.

				var k, v, value = holder[key];
				if (value && typeof value === 'object') {
					for (k in value) {
						if (Object.hasOwnProperty.call(value, k)) {
							v = walk(value, k);
							if (v !== undefined) {
								value[k] = v;
							} else {
								delete value[k];
							}
						}
					}
				}
				return reviver.call(holder, key, value);
			}

			// Parsing happens in four stages. In the first stage, we replace
			// certain
			// Unicode characters with escape sequences. JavaScript handles many
			// characters
			// incorrectly, either silently deleting them, or treating them as
			// line endings.

			cx.lastIndex = 0;
			if (cx.test(text)) {
				text = text.replace(cx,
						function(a) {
							return '\\u'
									+ ('0000' + a.charCodeAt(0).toString(16))
											.slice(-4);
						});
			}

			// In the second stage, we run the text against regular expressions
			// that look
			// for non-JSON patterns. We are especially concerned with '()' and
			// 'new'
			// because they can cause invocation, and '=' because it can cause
			// mutation.
			// But just to be safe, we want to reject all unexpected forms.

			// We split the second stage into 4 regexp operations in order to
			// work around
			// crippling inefficiencies in IE's and Safari's regexp engines.
			// First we
			// replace the JSON backslash pairs with '@' (a non-JSON character).
			// Second, we
			// replace all simple value tokens with ']' characters. Third, we
			// delete all
			// open brackets that follow a colon or comma or that begin the
			// text. Finally,
			// we look to see that the remaining characters are only whitespace
			// or ']' or
			// ',' or ':' or '{' or '}'. If that is so, then the text is safe
			// for eval.

			if (/^[\],:{}\s]*$/
					.test(text
							.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
							.replace(
									/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
									']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

				// In the third stage we use the eval function to compile the
				// text into a
				// JavaScript structure. The '{' operator is subject to a
				// syntactic ambiguity
				// in JavaScript: it can begin a block or an object literal. We
				// wrap the text
				// in parens to eliminate the ambiguity.

				j = eval('(' + text + ')');

				// In the optional fourth stage, we recursively walk the new
				// structure, passing
				// each name/value pair to a reviver function for possible
				// transformation.

				return typeof reviver === 'function' ? walk({
					'' : j
				}, '') : j;
			}

			// If the text is not JSON parseable, then a SyntaxError is thrown.

			throw new SyntaxError('JSON.parse');
		};
	}
})();
// &&&&&&&&&&&&&&&&& json 开始&&&&&&&&&&&&&&&&&&&&

// j1j1j1j1j1j1j1j1j1 业务处理 开始 j1j1j1j1j1j1j1j1j1
$(function() {
	$('.sidelist').mousemove(function() {
		$(this).find('.i-list').show();
		$(this).find('h3').addClass('hover');
	});
	$('.sidelist').mouseleave(function() {
		$(this).find('.i-list').hide();
		$(this).find('h3').removeClass('hover');
	});
	$(".divAd div").hover(function() {
		$(this).siblings().css("opacity", 0.7);
	}, function() {
		$(".divAd div").css("opacity", 1);
	});
	$("#cartSpan").hover(function() {
		if ($.cookie("shopcart")) {
			$("#cartDiv").show();
			getDivContent("cartDiv", homePath + "/cartGoods.html");
		}
	}, function() {
	});
	$("#cartDiv").hover(function() {
	}, function() {
		$("#cartDiv").hide();
	});
	cartCount();
});
function cartCount() {
	var n = 0;
	if ($.cookie("shopcart") && $.cookie("shopcart").indexOf(",") >= 0) {
		n = $.cookie("shopcart").split("-").length;
	}
	$("#cartCount").text(n);
}
/**
 * 加入购物车(一次加入一个或多个商品) 格式"10001,1-10002,2-..."
 */
function addMultiCart(skuString) {
	var sku = skuString.split(",");
	if (sku.length == 2) {
		skuString = skuString + ",0";
	}
	$("#cartDiv").empty();
	var url=shopcarPath + '/myec/orderShoppingCart/addMulti.html';
	$.ajax({
		url :url ,
		data : {
			"skuContent" : skuString
		},
		cache : false,
		type : "post",
		success : function(data) {
			if (data == "ok") {
				window.location.href = shopcarPath + "/shopcart.html?time="
						+ getCurrentTime();
			} else {
				showError("系统错误，请与管理员联系！");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			showError("系统错误，请与管理员联系！");
		}
	});
}
function deleteCartGoods(goodsId) {
	showConfirm("确定要删除该商品吗", "请确认", function(action) {
		if (action == "ok") {
			$.ajax({
				url : homePath + '/myec/orderShoppingCart/deleteGoods.html',
				data : {
					"skuId" : goodsId
				},
				cache : false,
				type : "post",
				success : function(data) {
					if (window.location.href.indexOf("shopcart.html") >= 0) {
						window.location.reload();
					} else {
						cartCount();
						$("#cartDiv").empty();
					}
				}
			});
		}
	});
}
/**
 * 判断可用库存是否有贷 加入购物车(一次加入一个或多个商品) 格式"10001,1-10002,2-..."
 */
function addMultiCartIStock(id) {
	$.ajax({
		url : homePath + '/myec/getAvaiableStock.html',
		data : {
			"goodsId" : id
		},
		cache : false,
		type : "post",
		success : function(data) {
			var skuString = id + "," + 1;
			if (Number(data) > Number(0)) {
				addMultiCart(skuString);
			} else {
				showAlert("可用库存不足！");
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			showError("系统错误，请与管理员联系！");
		}
	});
}


function goodsNotice(goodsId, dom) {
	
	alert('aaaa');
	if (!goodsId || !dom) {
		return;
	}
	var me = $(dom);
	if (me.attr("noticeId") != undefined) {
		showTips("通知已经发出，请勿重复添加！", "alert", 1500);
	} else {
		$("#backURL").val(location.href);
		var url=homePath + '/product/addNotice.html';
		doAjax({
			url : url,
			data : "goodsId=" + goodsId,
			type : "post",
			success : function(data) {
				me.attr("noticeId", data);
				showSuccess("您好，当该货品到达后，我们会第一时间通知你！", "操作成功");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				showError("系统错误，请与管理员联系！");
			}
		});
	}
}
$(function() {
	$("#searchInput").autopoint({
		url : homePath + "/PortalSearchKeyword/findSearchPromotList.html"
	});
	if ($("#pageType") != null && $("#pageType").val() == "index") {
		if (screen.width >= 1200) {
			$("#screenWidthLink").attr("href",
					homePath + "/css/home_v1/index1300.css");
		}
	} else {
		$("#cataLogMapDiv a").attr("rel", "external nofollow");
	}
});

function setKeyword(keyword) {
	$("#searchInput").val(keyword);
	search();
}
function clearValue() {
	var word = $('#searchInput').attr("value");
	if (word == "请输入关键字:商品名或症状或疾病名") {
		$('#searchInput').attr('value', '');
	}
}
function search() {
	var keyword = $.trim($("#searchInput").val().replaceAll('<', '〈')
			.replaceAll('>', '〉'));
	if (keyword == "" || keyword == "请输入关键字:商品名或症状或疾病名") {
		try {
			showAlert("请输入您要查找的关键词!");
		} catch (e) {
			alert("请输入您要查找的关键词!");
		}
		return;
	} else {
		$("#keywordHid").attr("value", keyword);
		window.location.href = "http://localhost:8082/j1search" + "/s/"
				+ (encodeURIComponent(encodeURIComponent(keyword)))
				+ "/1/1-0-0-1/ss.html";
	}
}
function hideautopoint() {
	if (state == 0) {
		$("#tie").hide();
	}
}

function addfavorite() {
	var url = "https://www.j1.com";
	var title = "健一网";
	if (document.all) { // ie
		window.external.AddFavorite(url, title);
	} else if (window.sidebar) { // firefox
		try {
			window.sidebar.addPanel(title, url, "");
		} catch (e) {
			alert("加入收藏失败，请使用Ctrl+D进行添加");
		}
	} else if (window.opera && window.print) { // opera
		var elem = document.createElement('a');
		elem.setAttribute('href', url);
		elem.setAttribute('title', title);
		elem.setAttribute('rel', 'sidebar');
		elem.click(); // this.title=document.title;
	} else {
		alert("加入收藏失败，请使用Ctrl+D进行添加");
	}
}

var isIE = (document.all) ? true : false;

// var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);

var _$ = function(id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};
var Class = {
	create : function() {
		return function() {
			this.initialize.apply(this, arguments);
		};
	}
};
var Extend = function(destination, source) {
	for ( var property in source) {
		destination[property] = source[property];
	}
};
var Bind = function(object, fun) {
	return function() {
		return fun.apply(object, arguments);
	};
};
var Each = function(list, fun) {
	for ( var i = 0, len = list.length; i < len; i++) {
		fun(list[i], i);
	}
};
var Contains = function(a, b) {
	return a.contains ? a != b && a.contains(b) : !!(a
			.compareDocumentPosition(b) & 16);
};
var OverLay = Class.create();
OverLay.prototype = {
	initialize : function(options) {

		this.SetOptions(options);

		this.Lay = _$(this.options.Lay)
				|| document.body.insertBefore(document.createElement("div"),
						document.body.childNodes[0]);

		this.Color = this.options.Color;
		this.Opacity = parseInt(this.options.Opacity);
		this.zIndex = parseInt(this.options.zIndex);

		with (this.Lay.style) {
			display = "none";
			zIndex = this.zIndex;
			left = top = 0;
			position = "fixed";
			width = height = "100%";
		}
		// if(isIE6){
		if (false) {
			this.Lay.style.position = "absolute";
			// ie6设置覆盖层大小程序
			this._resize = Bind(this, function() {
				this.Lay.style.width = Math.max(
						document.documentElement.scrollWidth,
						document.documentElement.clientWidth)
						+ "px";
				this.Lay.style.height = Math.max(
						document.documentElement.scrollHeight,
						document.documentElement.clientHeight)
						+ "px";
			});
			// 遮盖select
			this.Lay.innerHTML = '<iframe style="position:absolute;top:0;left:0;width:100%;height:100%;filter:alpha(opacity=0);"></iframe>';
		}
	},
	// 设置默认属性
	SetOptions : function(options) {
		this.options = {// 默认值
			Lay : null,// 覆盖层对象
			Color : "#000000",// 背景色
			Opacity : 100,// 透明度(0-100)
			zIndex : 1000
		// 层叠顺序
		};
		Extend(this.options, options || {});
	},
	// 显示
	Show : function() {
		// 兼容ie6 if(isIE6){
		if (false) {
			this._resize();
			window.attachEvent("onresize", this._resize);
		}
		// 设置样式
		with (this.Lay.style) {
			// 设置透明度
			isIE ? filter = "alpha(opacity:" + this.Opacity + ")"
					: opacity = this.Opacity / 100;
			backgroundColor = this.Color;
			display = "block";
		}
	},
	// 关闭
	Close : function() {
		var isIE6 = isIE
				&& ([ /MSIE (\d)\.0/i.exec(navigator.userAgent) ][0][1] == 6);
		this.Lay.style.display = "none";
		if (isIE6) {
			window.detachEvent("onresize", this._resize);
		}
	}
};

var LightBox = Class.create();
LightBox.prototype = {
	initialize : function(box, options) {

		this.Box = _$(box);// 显示层

		this.OverLay = new OverLay(options);// 覆盖层

		this.SetOptions(options);

		this.Fixed = !!this.options.Fixed;
		this.Over = !!this.options.Over;
		this.Center = !!this.options.Center;
		this.onShow = this.options.onShow;

		this.Box.style.zIndex = this.OverLay.zIndex + 1;
		this.Box.style.display = "none";

		// 兼容ie6用的属性 if(isIE6)
		if (true) {
			this._top = this._left = 0;
			this._select = [];
		}
	},
	// 设置默认属性
	SetOptions : function(options) {
		this.options = {// 默认值
			Over : true,// 是否显示覆盖层
			Fixed : false,// 是否固定定位
			Center : true,// 是否居中
			onShow : function() {
			}// 显示时执行
		};
		Extend(this.options, options || {});
	},
	// 兼容ie6的固定定位程序
	Show : function(options) {
		// 覆盖层
		this.Over && this.OverLay.Show();

		this.Box.style.display = "block";

		// 兼容ie6 if(isIE6){
		if (true) {
			if (!this.Over) {
				// 没有覆盖层ie6需要把不在Box上的select隐藏
				this._select.length = 0;
				Each(document.getElementsByTagName("select"), Bind(this,
						function(o) {
							if (!Contains(this.Box, o)) {
								o.style.visibility = "hidden";
								this._select.push(o);
							}
						}));
			}
		}

		this.onShow();
	},
	// 关闭
	Close : function() {
		this.Box.style.display = "none";
		this.OverLay.Close();
		// if(isIE6){
		if (false) {
			window.detachEvent("onscroll", this._fixed);
			Each(this._select, function(o) {
				o.style.visibility = "visible";
			});
		}
	}
};

function addCookie() {
	if (document.all) {
		window.external.addFavorite('https://www.j1.com', '健一网-专业的医药网上购物商城！');
	} else if (window.sidebar) {
		window.sidebar.addPanel('健一网-专业的医药网上购物商城！', 'http://zx.j1.com', "");
	}
}

function setHomepage() {
	if (document.all) {
		document.body.style.behavior = 'url(#default#homepage)';
		document.body.setHomePage('https://www.j1.com');

	} else if (window.sidebar) {
		if (window.netscape) {
			try {
				netscape.security.PrivilegeManager
						.enablePrivilege("UniversalXPConnect");
			} catch (e) {
				alert("您的浏览器不支持此项功能，请手动添加，谢谢。");
			}
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1']
				.getService(Components.interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage', 'https://www.j1.com');
	}
}
$(document).ready(function() {
	$('.sidelist-x').mousemove(function() {
		$(this).find('.i-list-x').show();
		$(this).find('h3').addClass('sidelisthover');
	});
	$('.sidelist-x').mouseleave(function() {
		$(this).find('.i-list-x').hide();
		$(this).find('h3').removeClass('sidelisthover');
	});
});

// j1j1j1j1j1j1j1j1j1 业务处理 结束 j1j1j1j1j1j1j1j1j1

// @@@@@@@@@@@@@@@ 登入与注册 开始@@@@@@@@@@@@@@@@@@@
/**
 * 刷新验证码
 */
function refreshCode() {
	$("#yzmImg").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
}
/**
 * 登录校验
 * 
 * @returns {Boolean}
 */
function loginCheck() {
	// 校验用户名
	var userName = jQuery.trim($("#userName").val());
	if (!userName) {
		$("#errMsgDiv").text("请输入用户名");
		$("#errMsgDiv").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv").removeClass("register-tip");
	}
	// 校验密码
	var password = jQuery.trim($("#password").val());
	if (!password) {
		$("#errMsgDiv").text("请输入密码");
		$("#errMsgDiv").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv").removeClass("register-tip");
	}
	// 校验验证码
	var keyword = jQuery.trim($("#keyword").val());
	if (!keyword) {
		$("#errMsgDiv").text("请输入验证码");
		$("#errMsgDiv").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv").removeClass("register-tip");
	}
	return true;
}
/**
 * 打开注册页面
 */
function beginOpenRegister() {
	var backURL = $("#backURL").val();
	if (backURL == "") {
		window.location.href = homePath + "/register.html";
	} else {
		window.location.href = homePath + "/register.html?backURL=" + backURL;
	}
}
/**
 * 刷新验证码
 */
function freshCode() {
	$("#yzmImg").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
}
/**
 * 刷新验证码
 */
function refreshCode2() {
	//debugger
	$("#yzmImg2").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
	//alert("asdfa");
}
/**
 * 登录校验
 * 
 * @returns {Boolean}
 */
function loginCheck2() {
	// 校验用户名
	var userName = jQuery.trim($("#userName2").val());
	if (!userName) {
		$("#errMsgDiv2").text("请输入用户名");
		$("#errMsgDiv2").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv2").removeClass("register-tip");
	}
	// 校验密码
	var password = jQuery.trim($("#password2").val());
	if (!password) {
		$("#errMsgDiv2").text("请输入密码");
		$("#errMsgDiv2").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv2").removeClass("register-tip");
	}
	// 校验验证码
	var keyword = jQuery.trim($("#keyword2").val());
	if (!keyword) {
		$("#errMsgDiv2").text("请输入验证码");
		$("#errMsgDiv2").addClass("register-tip");
		return false;
	} else {
		$("#errMsgDiv2").removeClass("register-tip");
	}
	$("#userName2").val(
			$("#userName2").val().replaceAll('<', '〈').replaceAll('>', '〉'));
	$("#password2").val(
			$("#password2").val().replaceAll('<', '〈').replaceAll('>', '〉'));
	return true;
}
/**
 * 刷新验证码
 */
function freshCode2() {
	$("#yzmImg2").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
}
function changeTwoDecimal(x) {
	var f_x = parseFloat(x);
	if (isNaN(f_x)) {
		return false;
	}
	f_x = Math.round(f_x * 100) / 100;
	var s_x = f_x.toString();
	var pos_decimal = s_x.indexOf('.');
	if (pos_decimal < 0) {
		pos_decimal = s_x.length;
		s_x += '.';
	}
	while (s_x.length <= pos_decimal + 2) {
		s_x += '0';
	}
	return s_x;
}

/**
 * 检查用户名是否存在
 * @param loginName
 * @returns {String}
 */
function checkLoginNameExist(loginName) {
	var isExist = "N";
	$.ajax({
		url : homePath + "/member-checkLoginName.html",
		data : "loginName=" + loginName,
		type : "post",
		async : false,
		success : function(data) {
			isExist = data;
		},
		error : function() {
			showError("系统错误，请与管理员联系！");
		}
	});
	//alert(isExist)
	return isExist;
}

/**
 * yangqiuqin
 * 当光标聚焦mini登录用户名输入框时
 * 
 */
function onfocusMiniUserName(){
	if($("#userName").val()=="请输入邮箱/手机号/用户名"){
		$("#userName").val('');
	}
	$("#userName").removeClass('text bian-02');
	$("#userName").addClass('text bian-01');
	$("#miniLoginNameDiv").text('');
	$("#miniLoginNameDiv").hide();
	$("#miniLoginName").removeClass('error');
}

/**
 * yagnqiuqin
 * 光标聚焦mini登录密码输入框时样式的变化
 */
function onfocusMiniPwd(){
	$("#password").removeClass('text bian-02');
	$("#password").addClass('text bian-01');
	$("#miniPasswordDiv").text('');
	$("#miniPasswordDiv").hide();
	$("#miniPassword").removeClass('error');
}

/**
 * 会员登录（弹出窗口形式） 2012.9.7
 */
function quickLoginNew(Urls) {
	//alert("aa");
	// 校验用户名
	var userName = jQuery.trim($("#userName").val());
	if (!userName || (userName=="请输入邮箱/手机号/用户名")) {
		$("#userName").removeClass('text bian-01');
		$("#userName").addClass('text bian-02');
		$("#miniLoginNameDiv").text("请输入用户名");
		$("#miniLoginNameDiv").show();
		$("#miniLoginName").removeClass("correct");
		$("#miniLoginName").addClass("error");
		return false;
	} else if(checkLoginNameExist(userName)=="N"){
		$("#userName").removeClass('text bian-01');
		$("#userName").addClass('text bian-02');
		$("#miniLoginNameDiv").show();
		$("#miniLoginNameDiv").text("您输入的账户名不存在，请核对后重新输入");
		$("#miniLoginName").removeClass('correct');
		$("#miniLoginName").addClass('error');
		return false;
	}else{
		$("#userName").removeClass('text bian-02');
		$("#userName").addClass('text bian-01');
		$("#miniLoginNameDiv").text('');
		$("#miniLoginNameDiv").hide();
		$("#miniLoginName").removeClass('error');
		$("#miniLoginName").addClass('correct');
	}
	// 校验密码
	var password = jQuery.trim($("#password").val());
	if (!password) {
		$("#password").removeClass('text bian-01');
		$("#password").addClass('text bian-02');
		$("#miniPasswordDiv").text("请输入密码");
		$("#miniPasswordDiv").show();
		$("#miniPassword").removeClass('correct');
		$("#miniPassword").addClass('error');
		return false;
	} else {
		$("#password").removeClass('text bian-02');
		$("#password").addClass('text bian-01');
		$("#miniPasswordDiv").text('');
		$("#miniPasswordDiv").hide();
		$("#miniPassword").removeClass('error');
		$("#miniPassword").addClass('correct');
	}
	
	//提取是否记住密码值
	var isRemember;
	if(document.getElementById("miniRememberUser").checked){
		isRemember=document.getElementById("miniRememberUser").value;
	}
	
	//alert(isRemember);
	
	// 校验验证码
//	var keyword = jQuery.trim($("#keyword").val());
//	if ($("#loginYanInput").css("display") != "none") {
//		if (!keyword) {
//			$("#errMsgDiv").text("请输入验证码");
//			$("#errMsgDiv").addClass("register-tip");
//			return false;
//		} else {
//			$("#errMsgDiv").text("").removeClass("register-tip");
//		}
//	}
	
	// /var backURL = jQuery.trim($("#backURL").val());
	var loginDto = {
		userName : userName,
		password : password,
		keyword : null,
		isRemember:isRemember
	};
	$.ajax({
		url : homePath + "/member-loginAjax.html",
		data : loginDto,
		type : "post",
		success : function(data) {
			if (data != "ok") {
				$("#password").removeClass('text bian-01');
				$("#password").addClass('text bian-02');
				$("#miniPasswordDiv").text(data);
				$("#miniPassword").removeClass("correct");
				$("#miniPassword").addClass("error");
//				if ($.cookie("loginErrNum") != null) {
//					var num = $.cookie("loginErrNum");
//					if (Number(num) >= 3) {
//						$("#chgImg").click();
//						$("#over_login").css("height","450px");
//						$("#loginYan").css("display", "inline");
//						$("#loginYanInput").css("display", "inline");
//					} else {
//						$("#over_login").css("height","380px");
//						$("#loginYan").css("display", "none");
//						$("#loginYanInput").css("display", "none");
//					}
//				}
				
			} else {
				$("#miniPasswordDiv").text("").removeClass("error");

				if (Urls == null || Urls == "") {
					location.reload();
				} else {
					//homePath +
					window.location.href = Urls;
				}
			}
		}
	});
}



$(document).ready(function() {
	$('#keyword').bind('keyup', function(event) {
		if (event.keyCode == "13") {
			// 需要进行的处理程序
			// alert("验证码回车"+Urls);
			quickLoginNew(Urls);
		}
	});
});
/*
 * $("#password").live("blur",function()//重复刷新验证码 { refreshCode(); } );
 */
function addMultiShopCart(skuString) {
}
/**
 * 会员注册，校验
 */
function checkadd(Url) {
	// 检查必填项
	var loginName = $.trim($("#ReloginName").val());
	if (!loginName) {
		$("#ReloginNameTip").text("请填写用户名").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip").text("").removeClass("register-tip");
	}

	var loginPassword = $.trim($("#ReloginPassword").val());

	if (!loginPassword) {
		$("#ReloginPasswordTip").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip").text("").removeClass("register-tip");
	}

	var loginPassword2 = $.trim($("#ReloginPassword2").val());

	if (!loginPassword2) {
		$("#ReloginPassword2Tip").text("请填写确认密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip").text("").removeClass("register-tip");
	}

	/*
	 * var email = $.trim($("#email").val()); if(!email){
	 * $("#emailTip").text("请填写邮箱").addClass("register-tip"); return false;
	 * }else{ $("#emailTip").text("").removeClass("register-tip"); }
	 */

	var keyword = $.trim($("#Rekeyword").val());
	if ($("#yanzhengmaInput").css("display") != "none") {
		if (!keyword) {
			$("#RekeywordTip").text("请填写验证码").addClass("register-tip");
			return false;
		} else {
			$("#RekeywordTip").text("").removeClass("register-tip");
		}
	}

	var isChecked = $("#ReagreementCk").attr("checked");
	if (!isChecked) {
		$("#ReagreementTip").text("请勾选接受").addClass("register-tip");
		return false;
	} else {
		$("#ReagreementTip").text("").removeClass("register-tip");
	}

	// 检查用户名是否存在
	var isExist = checkLoginName(loginName);
	if (isExist == "Y") {
		$("#ReloginNameTip").text("该用户名已存在").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip").text("").removeClass("register-tip");
	}

	// 校验用户名为4-20位字符，中文、英文、数字及“_”、“-”
	var re = /^[a-zA-Z0-9\u4E00-\u9FA5_@.-]*$/;
	var nameLength = loginName.length;
	if (!re.test(loginName) || nameLength < 4 || nameLength > 30) {
		$("#ReloginNameTip").text('4-30位字符,中文,英文,数字及“_”');
		return false;
	} else {
		$("#ReloginNameTip").text("");
	}

	// 校验密码为6-16位英文、数字组成
	var re2 = /^[a-zA-Z0-9]{6,16}$/;
	if (!re2.test(loginPassword)) {
		$("#ReloginPasswordTip").text("密码为6-16位英文、数字组成").addClass(
				"register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip").text("").removeClass("register-tip");
	}

	// 校验确认密码为6-16位英文、数字组成
	if (!re2.test(loginPassword2)) {
		$("#ReloginPassword2Tip").text("密码为6-16位英文、数字组成").addClass(
				"register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip").text("").removeClass("register-tip");
	}
	// 校验两次输入密码是否一致
	if (loginPassword != loginPassword2) {
		$("#ReloginPassword2Tip").text("两次输入密码不一致").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip").text("").removeClass("register-tip");
	}
	
	$("#mobileState").val("N");
	//校验用户名是否手机号
	var reMobile = /^(13|15|18|14)[0-9]{9}$/;
	if(reMobile.test(loginName)){
		if($("#mobilecheckDiv").is(":hidden")){
			$("#codePhone1").val("");
			getCodeBoxLogin('ReloginName','ReloginNameTip','getCodeButton1');
			$('#mobilecheckDiv').css('display', '');
			return false;
		}else{
			var isMobile = validatePhoneLogin('ReloginNameTip','codePhone1','ReloginName');
			if(!isMobile){
				return false;
			}
		}
	}else{
		$('#mobilecheckDiv').css('display', 'none');
	}
	
	registerMember(Url);

	/*
	 * //校验邮箱 var re3 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	 * if(!re3.test(email)){
	 * $("#emailTip").text("邮箱格式不正确").addClass("register-tip"); return false;
	 * }else{ $("#emailTip").text("").removeClass("register-tip"); }
	 */
	var email = $.trim($("#Reemail").val());
	if (email.indexOf('>') > 0 || email.indexOf('<') > 0) {
		return false;
	}
}

// loginName焦点失去后验证用户是否存在
$("#ReloginName").live("blur", function() {
	// 检查必填项
	var loginName = $.trim($("#ReloginName").val());
	if (!loginName) {
		$("#ReloginNameTip").text("请填写用户名").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip").text("").removeClass("register-tip");
	}
	// refreshCode(); 重复刷新验证码
	// 检查用户名是否存在
	var isExist = checkLoginName(loginName);
	if (isExist == "Y") {
		$("#ReloginNameTip").text("该用户名已存在").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip").text("").removeClass("register-tip");
	}

});

// loginPassword焦点失去后验证用户是否存在
$("#ReloginPassword").live("blur", function() {
	var loginPassword = $.trim($("#ReloginPassword").val());
	if (!loginPassword) {
		$("#ReloginPasswordTip").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip").text("").removeClass("register-tip");
	}
});

// loginPassword2焦点失去后验证用户是否存在
$("#ReloginPassword2").live("blur", function() {
	var loginPassword = $.trim($("#ReloginPassword").val());
	var loginPassword2 = $.trim($("#ReloginPassword2").val());
	if (!loginPassword2) {
		$("#ReloginPassword2Tip").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip").text("").removeClass("register-tip");
	}

	// 校验两次输入密码是否一致
	if (loginPassword != loginPassword2) {
		$("#ReloginPassword2Tip").text("两次输入密码不一致").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip").text("").removeClass("register-tip");
	}

});
// keyword焦点失去后验证用户是否存在
$("#Rekeyword").live("blur", function() {
	var keyword = $.trim($("#Rekeyword").val());
	if (!keyword) {
		$("#RekeywordTip").text("请填写验证码").addClass("register-tip");
		return false;
	} else {
		$("#RekeywordTip").text("").removeClass("register-tip");
	}
});
/**
 * 刷新验证码
 */
function refreshCode() {
	$("#ReImg").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
}
/**
 * 检查用户名是否存在
 */
function checkLoginName(loginName) {
	var isExist = "N";

	$.ajax({
		url : homePath + "/member-checkLoginName.html",
		data : "loginName=" + loginName,
		type : "post",
		async : false,
		success : function(data) {
			isExist = data;

		},
		error : function() {
			showError("系统错误，请与管理员联系！");
		}
	});
	return isExist;
}
/**
 * regisdter member ajax注册用户
 */
function registerMember() {
	var keyword = $.trim($("#Rekeyword").val());
	var loginPassword2 = $.trim($("#ReloginPassword2").val());
	var loginPassword = $.trim($("#ReloginPassword").val());
	var loginName = $.trim($("#ReloginName").val());
	var mobileState = $.trim($("#mobileState").val());
	var Reemail = "";
	var isEmailRXG = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	if (isEmailRXG.test(loginName)) {
		Reemail = loginName;
	}
	$.ajax({
		url : homePath + "/member-register-ajax.html",
		data : "Rekeyword=" + keyword + "&ReloginPassword2=" + loginPassword2
				+ "&ReloginPassword=" + loginPassword + "&ReloginName="
				+ loginName + "&Reemail=" + Reemail + "&mobileState=" + mobileState,
		type : "post",
		success : function(data) {
			if (data == "haveUser") {
				$("#ReloginNameTip").text("该用户名已存在").addClass("register-tip");
				if ($.cookie("registerErrNum") != null) {
					var registerNum = $.cookie("registerErrNum");
					alert(registerNum);
					if (Number(registerNum) >= 3) {
						$("#yanzhengma").css("display", "inline");
						$("#yanzhengmaInput").css("display", "inline");
					} else {
						$("#yanzhengma").css("display", "none");
						$("#yanzhengmaInput").css("display", "none");
					}
				}
			} else if (data == "errorCode") {
				$("#RekeywordTip").text("验证码错误").addClass("register-tip");
				if ($.cookie("registerErrNum") != null) {
					var registerNum = $.cookie("registerErrNum");
					if (Number(registerNum) >= 3) {
						$("#yanzhengma").css("display", "inline");
						$("#yanzhengmaInput").css("display", "inline");
					} else {
						$("#yanzhengma").css("display", "none");
						$("#yanzhengmaInput").css("display", "none");
					}
				}
			} else if (data == "success") {
				location.reload();
			}
		}
	});
}
/**
 * regisdter member ajax注册用户
 */
function registerMember2(Url) {
	var keyword = $.trim($("#Rekeyword2").val());
	var loginPassword2 = $.trim($("#ReloginPassword22").val());
	var loginPassword = $.trim($("#ReloginPassword3").val());
	var loginName = $.trim($("#ReloginName2").val());
	var Reemail = $.trim($("#Reemail2").val());
	$.ajax({
		url : homePath + "/member-register.html?backURL=" + Url,
		data : "Rekeyword2=" + keyword + "&ReloginPassword22=" + loginPassword2
				+ "&ReloginPassword3=" + loginPassword + "&ReloginName2="
				+ loginName + "&Reemail2=" + Reemail,
		type : "post",
		success : function(data) {
		}
	});
}
/**
 * 刷新验证码
 */
function refreshCode2() {
	$("#ReImg2").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
}
// keyword焦点失去后验证用户是否存在
$("#Rekeyword2").live("blur", function() {
	var keyword = $.trim($("#Rekeyword2").val());
	if (!keyword) {
		$("#RekeywordTip2").text("请填写验证码").addClass("register-tip");
		return false;
	} else {
		$("#RekeywordTip2").text("").removeClass("register-tip");
	}
});
// loginPassword2焦点失去后验证用户是否存在
$("#ReloginPassword22").live("blur", function() {
	var loginPassword = $.trim($("#ReloginPassword3").val());
	var loginPassword2 = $.trim($("#ReloginPassword22").val());
	if (!loginPassword2) {
		$("#ReloginPassword2Tip2").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip2").text("").removeClass("register-tip");
	}

	// 校验两次输入密码是否一致
	if (loginPassword != loginPassword2) {
		$("#ReloginPassword2Tip2").text("两次输入密码不一致").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip2").text("").removeClass("register-tip");
	}

});
// loginPassword焦点失去后验证用户是否存在
$("#ReloginPassword3").live("blur", function() {
	var loginPassword = $.trim($("#ReloginPassword3").val());
	if (!loginPassword) {
		$("#ReloginPasswordTip2").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip2").text("").removeClass("register-tip");
	}
});
// loginName焦点失去后验证用户是否存在
$("#ReloginName2").live("blur", function() {
	// 检查必填项
	var loginName = $.trim($("#ReloginName2").val());
	if (!loginName) {
		$("#ReloginNameTip2").text("请填写用户名").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip2").text("").removeClass("register-tip");
	}
	// refreshCode(); 重复刷新验证码
	// 检查用户名是否存在
	var isExist = checkLoginName(loginName);
	if (isExist == "Y") {
		$("#ReloginNameTip2").text("该用户名已存在").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip2").text("").removeClass("register-tip");
	}

});
/**
 * 会员注册，校验
 */
function checkadd2(Url) {
	// 检查必填项
	var loginName = $.trim($("#ReloginName2").val());
	if (!loginName) {
		$("#ReloginNameTip2").text("请填写用户名").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip2").text("").removeClass("register-tip");
	}

	var loginPassword = $.trim($("#ReloginPassword3").val());

	if (!loginPassword) {
		$("#ReloginPasswordTip2").text("请填写密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip2").text("").removeClass("register-tip");
	}

	var loginPassword2 = $.trim($("#ReloginPassword22").val());

	if (!loginPassword2) {
		$("#ReloginPassword2Tip2").text("请填写确认密码").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip2").text("").removeClass("register-tip");
	}

	/*
	 * var email = $.trim($("#email").val()); if(!email){
	 * $("#emailTip").text("请填写邮箱").addClass("register-tip"); return false;
	 * }else{ $("#emailTip").text("").removeClass("register-tip"); }
	 */

	var keyword = $.trim($("#Rekeyword2").val());
	if ($("#yanzhengma").css("display") != "none") {
		if (!keyword) {
			$("#keywordTip2").text("请填写验证码").addClass("register-tip");
			return false;
		} else {
			$("#keywordTip2").text("").removeClass("register-tip");
		}
	}
	var isChecked = $("#ReagreementCk2").attr("checked");
	if (!isChecked) {
		$("#ReagreementTip2").text("请勾选接受").addClass("register-tip");
		return false;
	} else {
		$("#ReagreementTip2").text("").removeClass("register-tip");
	}

	// 检查用户名是否存在
	var isExist = checkLoginName(loginName);
	if (isExist == "Y") {
		$("#ReloginNameTip2").text("该用户名已存在").addClass("register-tip");
		return false;
	} else {
		$("#ReloginNameTip2").text("").removeClass("register-tip");
	}

	// 校验用户名为4-20位字符，中文、英文、数字及“_”、“-”
	var re = /^[a-zA-Z0-9\u4E00-\u9FA5_@.-]*$/;
	var nameLength = loginName.length;
	if (!re.test(loginName) || nameLength < 4 || nameLength > 30) {
		$("#ReloginNameTip2").text('4-30位字符,中文,英文,数字及“_”');
		return false;
	} else {
		$("#ReloginNameTip2").text("");
		var isEmailRXG = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if (isEmailRXG.test(loginName)) {
			$("#Reemail2").val(loginName);
		}
	}

	// 校验密码为6-16位英文、数字组成
	var re2 = /^[a-zA-Z0-9]{6,16}$/;
	if (!re2.test(loginPassword)) {
		$("#ReloginPasswordTip2").text("密码为6-16位英文、数字组成").addClass(
				"register-tip");
		return false;
	} else {
		$("#ReloginPasswordTip2").text("").removeClass("register-tip");
	}

	// 校验确认密码为6-16位英文、数字组成
	if (!re2.test(loginPassword2)) {
		$("#ReloginPassword2Tip2").text("密码为6-16位英文、数字组成").addClass(
				"register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip2").text("").removeClass("register-tip");
	}

	// 校验两次输入密码是否一致
	if (loginPassword != loginPassword2) {
		$("#ReloginPassword2Tip2").text("两次输入密码不一致").addClass("register-tip");
		return false;
	} else {
		$("#ReloginPassword2Tip2").text("").removeClass("register-tip");
	}
	
	// registerMember2(Url);

	/*
	 * //校验邮箱 var re3 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	 * if(!re3.test(email)){
	 * $("#emailTip").text("邮箱格式不正确").addClass("register-tip"); return false;
	 * }else{ $("#emailTip").text("").removeClass("register-tip"); }
	 */
	var email = $.trim($("#Reemail2").val());
	if (email.indexOf('>') > 0 || email.indexOf('<') > 0) {
		return false;
	}
	
	$("#mobileState").val("N");
	//校验用户名是否手机号
	var reMobile = /^(13|15|18|14)[0-9]{9}$/;
	if(reMobile.test(loginName)){
		if($("#mobilecheckDiv2").is(":hidden")){
			$("#codePhone2").val("");
			getCodeBoxLogin('ReloginName2','ReloginNameTip2','getCodeButton2');
			$('#mobilecheckDiv2').css('display', '');
			return false;
		}else{
			var isMobile = validatePhoneLogin('ReloginNameTip2','codePhone2','ReloginName2');
			return isMobile;
		}
	}else{
		$('#mobilecheckDiv2').css('display', 'none');
	}
	
}

var loopObj=null;
var seconds=0;	
//获取手机验证码的方法
function getCodeBoxLogin(mobliephone,phoneMessage,getCodeButton)
{		   
	var phone=$("#"+mobliephone).val();
	if(seconds>0){
		return;
	}
	//验证手机号码
	if(!checkMobile(phone))
	{
	   $("#"+phoneMessage).html("手机号码格式不正确");
	   return;
	}else{
		$("#"+phoneMessage).html("");
	}
	
	$.post(
		    homePath+"/memberCenter/getValidateCount.html", 
			{
		    	phone:phone			    	
			},
			function(data){ 
				if(data=="have")
				{
					$("#"+phoneMessage).html("手机已被人验证");
				}else{
							$.post(
								    homePath+"/memberCenter/sendPhoneCodeLogin.html", 
									{
								    	phoneNum:phone			    	
									},
									function(data){
										if(data=="yes")
										{
//												$("#mobiletext").show();	
											clearInterval(loopObj);
											seconds=60;
											loopObj=window.setInterval(function(){doUpdateLogin(getCodeButton);},1000);
										}else{
											$("#"+phoneMessage).html("您今天5次手机验证机会用完了，等明天再来验证吧");
										}
								});	
				     }
		    }
		);	
}		
function doUpdateLogin(getCodeButton){
	seconds-=1;
	if(seconds<=0)
	{
		$("#"+getCodeButton).html("获取验证码");
		$("#"+getCodeButton).attr("value","获取验证码");
	}
	else
	{
		$("#"+getCodeButton).html(seconds + "秒后可重发");
		$("#"+getCodeButton).attr("value", seconds + "秒后可重发");
	}
}	

//验证手机号码
function validatePhoneLogin(phoneCodeMessage,codePhone,mobliephone)
{
	var isExist = false;
	var codePhoneVal=$("#"+codePhone).val();
	if(codePhoneVal.length==6)
	{
		$.ajax({
			url : homePath+"/memberCenter/validatePhoneLogin.html",
			data: {codePhone:codePhoneVal,mobile:$("#"+mobliephone).val()},
			type: "post",
			async: false,
			success : function(data) {
				if(data=="errorCode"){
					   $("#"+phoneCodeMessage).html("验证码错误，请重新输入");
					   $("#"+codePhone).val("");
					   isExist = false;
				   }else if(data=="no"){
					   $("#"+phoneCodeMessage).html("今天你的验证次数超过50次，请您等待明天继续验证");
					   $("#"+codePhone).val("");
					   isExist = false;
				   }else{
//					   alert("手机验证成功");
					   $("#mobileState").val("Y");
					   $("#mobileState2").val("Y");
					   isExist = true;
				   }

			},
			error : function() {
				showError("系统错误，请与管理员联系！");
			}
		});
	}else{
		$("#"+phoneCodeMessage).html("验证码格式错误，请重新输入");
	}
	return isExist;
}

// @@@@@@@@@@@@@@@ 登入与注册 结束@@@@@@@@@@@@@@@@@@@

// ============autopoint-1.0开始 ==================
var state = 0;

(function($) {
	$.fn
			.extend({
				autopoint : function(settings) {
					var parent = $(this);// 文本输入框对象
					var oldText = parent.val();// 文本输入框中的内容
					var dropDiv = $(
							'<div id="tie" style="margin-left:-2px;width:357px"></div>')
							.addClass('dropDiv').appendTo('body');
					parent
							.keydown(function(event) {
								if (dropDiv.css('display') != 'none') {// 当提示层显示时才对键盘事件处理
									var currentList = dropDiv.find('.'
											+ constants.listHoverCSS);
									if (event.keyCode == constants.keyDown) {// 如果按的是向下方向键
										if (currentList.length == 0) {
											// 如果提示列表没有一个被选中,则将列表第一个选中
											parent.val(getPointWord(dropDiv
													.find('.list:first')
													.mouseover()));
											dropDiv.find('.list:last').css(
													'background-color', '');
											dropDiv.find('.list:first').css(
													'background-color',
													'rgb(255,255,153)');
										} else if (currentList.next().length == 0) {
											// 如果是最后一个被选中,则取消选中,即可认为是输入框被选中
											unHoverAll();
										} else {
											unHoverAll();
											// 将原先选中列的下一列选中
											if (currentList.next().length != 0) {
												parent
														.val(getPointWord(currentList
																.next()
																.mouseover()));
												currentList.css(
														'background-color', '');
												currentList.next().css(
														'background-color',
														'rgb(255,255,153)');
											}
											;
										}
										return false;
									} else if (event.keyCode == constants.keyUp) {// 如果按的是向上方向键
										if (currentList.length == 0) {
											parent.val(getPointWord(dropDiv
													.find('.list:last')
													.mouseover()));
											dropDiv.find('.list:first').css(
													'background-color', '');
											dropDiv.find('.list:last').css(
													'background-color',
													'rgb(255,255,153)');
										} else if (currentList.prev().length == 0) {
											unHoverAll();
										} else {
											unHoverAll();
											if (currentList.prev().length != 0) {
												parent
														.val(getPointWord(currentList
																.prev()
																.mouseover()));
												currentList.css(
														'background-color', '');
												currentList.prev().css(
														'background-color',
														'rgb(255,255,153)');
											}
											;
										}
										return false;
									} else if (event.keyCode == constants.keyEnter)
										dropDiv.empty().hide();
								}
								// 当按下键之前记录输入框值,以方便查看键弹起时值有没有变
								oldText = parent.val();
							});
					parent.keyup(function(event) {
						// 如果弹起的键是向上或向下方向键则返回
						if (event.keyCode == constants.keyDown
								|| event.keyCode == constants.keyUp)
							return;
						// 若输入框值没有改变或变为空则返回
						var currentText = parent.val();
						if (currentText == oldText)
							return;
						if (currentText == '') {
							dropDiv.empty().hide();
							return;
						}
						getData(currentText);
					});
					parent.blur(function() {
						if (dropDiv.find('.' + constants.listHoverCSS) != 0)
							return;
						// 文本输入框失去焦点则清空并隐藏提示层
						dropDiv.empty().hide();
					});
					/** 处理ajax返回成功的方法* */
					handleResponse = function(json) {
						var isEmpty = true;
						for ( var o in json) {
							if (o == 'data')
								isEmpty = false;
						}
						if (isEmpty) {
							showErrorMsg("返回数据格式错误,请检查请求URL是否正确!");
							return;
						}
						if (json['data'].length == 0) {
							// 返回数据为空
							return;
						}
						refreshDropDiv(json);
						dropDiv.show();
					};
					/** 处理ajax失败的方法* */
					handleError = function(error) {
						// showErrorMsg("由于url错误或超时请求失败!");
					};
					showErrorMsg = function(error) {
						alert(error);
					};
					/** 通过ajax返回json格式数据生成用来创建dom的字符串* */
					render = function(json) {
						var res = json['data'] || json;
						var appendStr = '';
						// 用json对象中内容替换模版字符串中匹配/\{([a-z]+)\}/ig的内容,如{word},{view}
						for ( var i = 0; i < res.length; i += 1) {
							appendStr += (settings.tpl || constants.tpl)
									.replace(/\{([a-z]+)\}/ig, function(m, n) {
										return res[i][n];
									});
						}
						// appendStr += '<div style="text-align:right"><a
						// onclick=$("#tie").hide()
						// href="javascript:void(0)">[关闭]</a></div>' ;
						jebind(appendStr);
					};
					/** 将新建dom对象插入到提示框中,并重新绑定mouseover事件监听* */
					jebind = function(a) {
						dropDiv.append(a);
						dropDiv.find('.list').each(function() {
							$(this).unbind('mouseover').mouseover(function() {
								unHoverAll();
								$(this).addClass(constants.listHoverCSS);
								state = 1;
							}).unbind('click').click(function() {
								parent.val(getPointWord($(this)));
								dropDiv.empty().hide();
								parent.focus();
								state = 0;

								search();
							});
						});
					};
					/** 将提示框中所有列的hover样式去掉* */
					unHoverAll = function() {
						dropDiv.find('.list').each(function() {
							$(this).removeClass(constants.listHoverCSS);
							state = 0;
						});
					};
					/** 在提示框中取得当前选中的提示关键字* */
					getPointWord = function(p) {
						return p.find('span:last').text();
					};
					/** 刷新提示框,并设定样式* */
					refreshDropDiv = function(json) {
						dropDiv.empty();
						var left = parent.offset().left + 2;
						var height = parent.height();
						var top = parent.offset().top + height;
						var width = settings.width || parent.width() + 8
								+ 'px';
						dropDiv.css({
							'border' : '1px solid #D9D4D4',
							'left' : left,
							'top' : top,
							'width' : width,
							'position' : 'absolute',
							'z-index' : 20,
							'background' : '#F7F7F7'
						});
						render(json);
					};
					/** 通过ajax向服务器请求数据* */
					getData = function(word) {
						$.ajax({
							type : 'POST',
							data : {
								"word" : word
							},
							url : settings.url || '',
							dataType : 'json',
							timeout : 1000,
							success : handleResponse,
							error : handleError
						});
					};
					/** 一些常量* */
					var constants = {
						keyLeft : 37,// 向左方向键
						keyUp : 38,// 向上方向键
						keyRight : 39,// 向右方向键
						keyDown : 40,// 向下方向键
						keyEnter : 13,// 回车键
						listHoverCSS : 'jhover',// 提示框列表鼠标悬浮的样式
						// tpl : '<div class="list" style="' + parent.height() +
						// '"><div class="word">{word}</div><div
						// class="view">约{view}条记录</div></div>'
						tpl : '<div class="list" style="'
								+ parent.height()
								+ '"> <div  onMouseMove="$(this).css(\'background-color\',\'rgb(255,255,153)\')" onMouseOut="$(this).css(\'background-color\',\'\');state = 0;" style="font-size:12px;line-height:20px;font-family:宋体;padding-left:8px;cursor: pointer;color:#333333;"><span style="text-align: right;float: right;color:#a1a1a1;">约{amount}个商品&nbsp;</span> <span>{word}</span></div></div>'
					};
				}
			});
})(jQuery);
// ============autopoint-1.0结束 ==================

// ###########第三方js 开始#############
var hz6d_fixed_conf = {};
hz6d_fixed_conf.arg = "joyi365";
hz6d_fixed_conf.cid = "70771113";

if (typeof hz6d_from_page == 'undefined')
	var hz6d_from_page = hz6d_getCookie("53kf_" + hz6d_fixed_conf.cid
			+ "_keyword");
if (hz6d_from_page == "") {
	hz6d_from_page = document.referrer;
	document.cookie = "53kf_" + hz6d_fixed_conf.cid + "_keyword="
			+ hz6d_from_page;
}

function hz6d_getCookie(name) {
	var offset = document.cookie.indexOf(name + "=");
	if (offset != -1) {
		offset += name.length + 1;
		var end = document.cookie.indexOf(";", offset);
		if (end == -1) {
			end = document.cookie.length;
		}
		return document.cookie.substring(offset, end);
	} else {
		return "";
	}
}

function hz6d_FixedKF(v, s) {
	if (hz6d_fixed_conf[s].img == '')
		hz6d_fixed_conf[s].img = 'http://kf1.53kf.com/style/chat/new3/img/wk_zixun_cn.gif';
	if (hz6d_fixed_conf[s].text == '')
		hz6d_fixed_conf[s].text = "\u70b9\u51fb\u5bf9\u8bdd";

	var img = hz6d_fixed_conf[s].img, text = hz6d_fixed_conf[s].text, height = hz6d_fixed_conf[s].height, width = hz6d_fixed_conf[s].width, style = hz6d_fixed_conf[s].style, arg = hz6d_fixed_conf.arg, kflist = hz6d_fixed_conf[s].kf;
	var href_str = 'http://chat.53kf.com/webCompany.php?arg=' + arg + '&style='
			+ style + '&keyword=' + escape(hz6d_from_page) + '&kf=' + kflist;

	if (v == "iframe") {
		document
				.write('<iframe marginwidth="0" marginheight="0" frameborder="0" cellspacing="0" width="'
						+ width
						+ '" height="'
						+ height
						+ '" src="'
						+ href_str
						+ '"></iframe>');
	} else if (v == "img") {
		document.write('<a href="' + href_str
				+ '" target="_blank"><img width="' + width + '" height="'
				+ height + '" src="' + img + '" /></a>');
	} else {
		document.write('<div width="' + width + '" height="' + height
				+ '"><a href="' + href_str + '" target="_blank">' + text
				+ '</a></div>');
	}
}
// ###########第三方js 结束#############

function addCollections(goodsId) {
	doAjax({
		url : homePath + '/myec/addCollection.html',
		data : "goodsId=" + goodsId,
		type : "post",
		success : function(data) {
			// me.attr("goodsId",goodsId);
			if (data == "no") {
				showTips("该商品已经收藏成功，请勿重复添加！", "alert", 1500);
			} else {
				showSuccess("添加收藏成功，您可以到会员中心查看已经收藏的物品！", "操作成功");
			}
			;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			showError("系统错误，请与管理员联系！");
		}
	});
}
//获取cps 中的cookie值
function getCookie(objName){
	var arrCookie=document.cookie.split("; "); 
	var cps = "";
	//遍历cookie获取cps标识
	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if(arr[0]==objName) cps = arr[1]; 
	}
	return cps;
}

/**
 * 跳转第三方合作页面
 * @param thirdHref
 */
function gotoThirdPage(thirdHref){
	var formObj =document.createElement("form");
	var date=new Date();
	var dateStr=date.getMilliseconds();
	document.body.appendChild(formObj);
	formObj.id="postForm";
	formObj.action=homePath+"/showThirdPage.html";
	formObj.method="POST";
	
	formObj.target="newWin"+dateStr;
	var i = document.createElement("input");
	i.type = "hidden";
	i.value = thirdHref;
	i.name = "thirdHref";
	formObj.appendChild(i);
	window.open("about:blank","newWin"+dateStr,"");//newWin 是上面form的target
	formObj.submit();
	formObj.remove();
}
