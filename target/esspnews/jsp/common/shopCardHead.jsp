<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<!-- <link href="<%=WebURLParams.CJ_URL %>/css/shopcart.css" rel="stylesheet" type="text/css" /> -->
<link href="<%=WebURLParams.HOME_PAGE_URL %>/css/shopcart.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/home_v1/global.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/detail.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/home/login-fly.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/registered.css" />
<link href="<%=WebURLParams.CJ_URL %>/css/home_v1/common3.css" rel="stylesheet" type="text/css" />
<link href="<%=WebURLParams.CJ_URL %>/css/shopcart/common2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"	src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/asyncBox.v1.4.js"></script>
<meta name="robots" content="nofollow" />
<script type="text/javascript">
  var is_send =false;
  function is_send_true(){
	  is_send = true;
  }
</script>
<body>
<script type="text/javascript">
NTKF_PARAM = {
  siteid:"kf_9946",
  settingid: "kf_9946_1368425170123",
  itemid: "${goodsInfo.goodsNo }",
  orderid:"${orderId}",
  orderprice: "${orderPrice}",
  uid:"${sessionScope.memberId}",
  uname:"${sessionScope.loginName}"
} 
</script>
<script type="text/javascript" src="http://download.ntalker.com/t2d2/ntkfstat.js?" charset="utf-8"></script>
<div id="pagement" >
<div id="topbar" style="text-align: center;" class="clearfix">
    	 <div id="topbar-wrap">
   		 <div id="headerbar">
            <span>
            您好，<c:if test="${sessionScope.realName != null }">${sessionScope.realName }</c:if>
	<c:if test="${sessionScope.realName == null }">
		${sessionScope.loginName}
	 </c:if> &nbsp;欢迎光临 健一网 健康商城！
	 <c:if test="${sessionScope.loginName == null }">
		[&nbsp;<a href="<%=WebURLParams.HOME_PAGE_URL %>/login.html" target="_blank" >登录</a> ]
[<a href="###" onclick="beginRegister();">免费注册 </a> ]
	 </c:if>
	 <c:if test="${sessionScope.loginName != null }">
		<a href="<%=WebURLParams.HOME_PAGE_URL %>/member-logout.html">退出 </a>
	 </c:if>
            </span>
            <c:if test="${sessionScope.loginName == null }">
	            <span><a href="#" ><img src="https://img.j1.com/images/qq_login.gif"  onclick="openQQLoginWindow();"  alt="用QQ账号登录" /></a></span>
	            <span><a href="#" ><img src="https://img.j1.com/images/zhifubao_login.gif" onclick="openAlipayLoginWindow();" alt="支付宝登录" /></a></span>
			 </c:if>
		 </div>
         <div id="headerbar_right"><a  target="_blank" style="cursor: pointer;"  onclick= 'beginloginrove("/myec/orderChange.html")'; >我的订单</a> | <span>全国热线：<strong>4007-800-800</strong></span> </div>
         <div class="clear"></div>
         </div>       
    </div>
<jsp:include page="/jsp/login/login_flow.jsp" />