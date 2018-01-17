NTKF_PARAM = {
		siteid : "kf_9946",
		settingid : "kf_9946_1368425170123",
		itemid : "${goodsInfo.goodsNo }",
		orderid : "${orderId}",
		orderprice : "${orderPrice}",
		uid : "${sessionScope.memberId}",
		uname : "${sessionScope.loginName}"
	}
//
function ntcall_onChatWindowStatus(status) {
	if (status == 1 || status == 2) //咨询聊窗被打开或者最小化
	{
		//document.getElementById("nalkerbtn").className = "nalker_ischattingwindow";
	} else if (status == 3) //咨询聊窗被关闭
	{
		//document.getElementById("nalkerbtn").className = "nalker_closechatwindow";
	}
}
////
(function(w, d, s, l, i) {
	w[l] = w[l] || [];
	w[l].push({
		'gtm.start' : new Date().getTime(),
		event : 'gtm.js'
	});
	var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
			+ l
			: '';
	j.async = true;
	j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
	f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-7V5C');

////
function setHome(url){
    url=url?url:window.location.href;
    try{
        document.body.style.behavior='url(#default#homepage)';
        document.body.setHomePage(url);
    }catch(e){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }catch(e){
                alert("您的浏览器不支持自动操作，请您手动设为首页。");
            }
            var prefs=Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage',url);
        }else{
            alert('您的浏览器不支持自动操作，请您手动设为首页。');
        }
    }
}