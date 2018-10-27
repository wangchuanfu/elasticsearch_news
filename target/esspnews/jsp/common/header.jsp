<%@ page trimDirectiveWhitespaces="true"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<script src="<%=WebURLParams.CJ_URL %>/js/common/FixedKF.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=WebURLParams.CJ_URL %>/js/member/show_sso_login_window.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/home_v1/index_js.js"></script>
<%--<script type="text/javascript" src="<%=WebURLParams.HOME_PAGE_URL %>/js/goods/login_rove.js"></script>
<script type="text/javascript" src="<%=WebURLParams.HOME_PAGE_URL %>/js/goods/lightBox.js"></script> --%>
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/detail.css" />
<link type="text/css" rel="stylesheet"
	href="<%=WebURLParams.CJ_URL %>/css/home/login-fly.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/registered.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/sidelist.css" />
<link id="screenWidthLink" type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/home_v1/index1300.css" />
<script type="text/javascript">
	$(function() {
		$("#searchInput").autopoint({
			url : "<%=WebURLParams.HOME_PAGE_URL %>/PortalSearchKeyword/findSearchPromotList.html"
		});
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
		var keyword = $.trim($("#searchInput").val());
		if (keyword == "" || keyword == "请输入关键字:商品名或症状或疾病名") {
			showAlert("请输入您要查找的关键词1!");
			return;
		} else {
			$("#keywordHid").attr("value", keyword);
			window.location.href = "http://localhost:8082/j1search" + "/"
					+ encodeURI(encodeURI(keyword)) + "/1/1-0-0-1/ss.html";
		}
	}
	function hideautopoint() {
		if (state == 0) {
			$("#tie").hide();
		}
	}
	function addfavorite() {
		if (document.all) {
			window.external.addFavorite('https://www.j1.com', '健一网');
		} else if (window.sidebar) {
			window.sidebar.addPanel('健一网', 'https://www.j1.com', "");
		}
	}
</script>
<!--顶部 start -->
<div class="j11308_top">
	<div class="j11308_width1">
		<div class="j11308_top_left">
			<a href="javascript:addfavorite();">收藏健一网</a>
		</div>
		<div class="j11308_top_right">
			<ul class="j11308_top_right1">
				<li style="background: none;">全国热线：<strong
					class="j11308_font01">4007-800-800</strong></li>
				<li style="padding: 0 3px;">
					<div id="j11308_navbox" class="j11308_menu">
						<a class="tit" href="#">网站导航<b></b></a>
						<ul class="subnav">
							<li><strong>特色栏目</strong></li>
							<li><a href="http://zx.j1.com/" target="_blank" title="健康谈">健康谈</a></li>
						</ul>
					</div>
				</li>
				<li><a target="_blank" rel="nofollow" style="cursor: pointer;"
					onclick='beginloginrove("/myec/orderChange.html");'>我的订单</a></li>
				<li class="j11308_top_menu_link">您好， <c:if
						test="${sessionScope.realName != null }">
						${sessionScope.realName }
					 </c:if> <c:if test="${sessionScope.realName == null }">
						${sessionScope.loginName}
					 </c:if> 欢迎来到健一网！ <c:if test="${sessionScope.loginName == null }">
								[ <a href="###" onclick="beginloginrove('');" rel="nofollow">登录</a> ] [ <a
							href="###" onclick="beginRegister('0');" rel="nofollow">注册</a> ]
							 </c:if> <c:if test="${sessionScope.loginName != null }">
						<a href="<%=WebURLParams.HOME_PAGE_URL %>/member-logout.html">退出 </a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</div>
<!--顶部 end-->
<!--头部 start -->
<div class="j11308_header j11308_width1">
	<div class="j11308_header_logo">
		<a href="https://www.j1.com" target="_blank"><img
			src="<%=WebURLParams.HOME_PAGE_URL %>/images/newindex/logo.jpg" alt="健一网网上药店" width="199"
			height="41" /></a>
	</div>
	<div class="j11308_header_city">
		<span class="j11308_font01 j11308_font02">全国站</span><span
			class="j11308_header_city1"><a href="#"
			onmouseover="listShow1()" onmouseout="loops1()">城市切换</a>
			<div id="about_list1" onmouseover="listShow1()" onmouseout="loops1()">
				<div class="j11308_ban">
					<ul class="j11308_ban1">
						<li>北京站</li>
						<li>上海站</li>
						<li>广州站</li>
					</ul>
				</div>
			</div> </span>
	</div>
	<div class="j11308_header_search">
		<form class="j11308_form1">
			<input type="text" class="input_text1" id="searchInput"
				value=<c:if test="${searchKeyword!=null}"> ${searchKeyword}</c:if>
				<c:if test="${searchKeyword==null}">请输入关键字:商品名或症状或疾病名</c:if>
				onclick="clearValue();"
				onkeydown="bindEnter(event,function(){search();})"
				onblur="hideautopoint()" /> <input name="" type="button" value=""
				class="search_btn" onclick="search();" />
		</form>
		<%@include file="/html/hotworlds.jsp" %>
	</div>
	<div class="j11308_header_login">
		<div id="j11308_login" class="j11308_login_menu">
			<div class="j11308_login_ico1"></div>
			<a class="j11308_login_tit" target="_blank" rel="nofollow"
				style="cursor: pointer;"
				onclick='beginloginrove("/myec/orderChange.html");'>我的账户</a>
			<ul class="j11308_login_subnav">
				<li><a target="_blank" rel="nofollow" style="cursor: pointer;"
					onclick='beginloginrove("/myec/orderChange.html");'>我的订单</a></li>
				<li><a target="_blank" rel="nofollow" style="cursor: pointer;"
					onclick='beginloginrove("/myec/orderChange.html");'>我的积分</a></li>
			</ul>
		</div>
		<div class="j11308_header_login_right">
			<span class="j11308_header_login_right1"></span><a title="去购物车结算"
				target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/myec/confirm.html">去购物车结算</a>
			<div class="j11308_header_login_right2">
				<span>0</span>
			</div>
		</div>
	</div>
</div>
<!-- 头部end -->
<jsp:include page="/jsp/login/login_flow.jsp" />
