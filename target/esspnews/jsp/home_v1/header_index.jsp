<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<script type="text/javascript">
	function getSearchPath(){
		return "<%=WebURLParams.SEARCH_PAGE_URL %>" ;
	}
	function getHomePath(){
		return "<%=WebURLParams.HOME_PAGE_URL %>" ;
	}
	var searchPath = getSearchPath();
	var homePath = getHomePath();
</script>
<script type="text/javascript">
	NTKF_PARAM = {
		siteid : "kf_9946",
		settingid : "kf_9946_1368425170123",
		itemid : "${goodsInfo.goodsNo }",
		orderid : "${orderId}",
		orderprice : "${orderPrice}",
		uid : "${sessionScope.memberId}",
		uname : "${sessionScope.loginName}"
	}
</script>
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/home_v1/global.css" />
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/home_v1/index1300.css" />
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/asyncBox.v1.4.js"></script> 
<meta name="baidu-site-verification" content="UwMxw3fJra" />
<meta name="google-site-verification" content="Rg7ZL2f7FePuhH6aTlXfmYTRhXMalKpeqCfEo9CSU-w" />
<%-- <script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/kf.js"></script>  --%>
<script type="text/javascript" src="http://tj.ranknowcn.com/tj/t.php?site=842"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/home_v1/index_js.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/home_v1/head_index.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/myec/shopcartMini.js"></script>
<link rel="icon" href="https://img.j1.com/images/images1308/favicon.ico" type="image/x-icon" />
</head>
<body style="background:#fff;">
	<div
		style="width: 100%; background: #ffffff; margin: 0px; padding: 0px;">
		<c:if test="${sessionScope.ISCaibei != null }">
			<div id="topbar">
				<div id="topbar-wrap">
					<div class="qq_caibei">
						<span class="qq_caibei1">您好，${sessionScope.realName
							}&nbsp;|&nbsp;<a href="http://cb.qq.com/my/my_jifen_source.html"
							target="_blank">我的彩贝积分</a>
						</span> <strong><a href="http://cb.qq.com/" target="_blank">QQ彩贝联盟</a>商家</strong>：健一网-QQ会员返<span class="qq_caibei2">8.8%</span>彩贝积分，
						普通会员返<span class="qq_caibei2">5.8%</span>彩贝积分（<a href="http://item.cb.qq.com/mall/10724.html
						" target="_blank">详情</a>）
					</div>
				</div>
			</div>
		</c:if>
		<!--顶部 start -->
		<div class="j11308_top">
			<div class="j11308_width1">
				<div class="j11308_top_left">
					<a href="javascript:addfavorite();" rel="nofollow">收藏健一网</a><span>|</span><a href="" onclick="setHome()" rel="nofollow">设为首页</a>
				</div>
				<div class="j11308_top_right">
					<ul class="j11308_top_right1">
						<li style="background: none;">全国热线：<strong class="j11308_font01"> 
							4007-800-800</strong>
						</li>
						
						<li class="sjjy"><em></em>微信关注<img class="gzjy" src="https://img.j1.com/images/images1308/ico/sj_02.png" alt="扫一扫关注健一" /></li>
						<li style="padding: 0 3px;">
							<div id="j11308_navbox" class="j11308_menu">
								<a class="tit" href="#">网站导航<b></b></a>
								<ul class="subnav">
									
									<li><a href="http://zx.j1.com/" target="_blank"
										title="健康谈">健康谈</a></li>
								</ul>
							</div>
						</li>
						<li>
						<!-- onclick='beginloginrove("/myec/orderChange.html");' <%=WebURLParams.HOME_PAGE_URL %>/new_login_page.html-->
						<a rel="nofollow" style="cursor: pointer;" href="javascript:void(0);" onclick='beginloginrove("/myec/orderChange.html");'/>我的订单</a></li>
						<li class="j11308_top_menu_link">您好， <c:if
								test="${sessionScope.realName != null }">
						${sessionScope.realName }
					 </c:if> <c:if test="${sessionScope.realName == null }">
						${sessionScope.loginName}
					 </c:if> 欢迎来到健一网！ <c:if test="${sessionScope.loginName == null }">
								[ <a href="<%=WebURLParams.HOME_PAGE_URL %>/login.html" rel="nofollow">登录</a> ] [ <a
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
		<!--  
		<div class="j11308_width1"><a href="https://www.j1.com/activity/promotions616.html" target="_balnk"><img src="https://img.j1.com/upload/detail/image/20140613/top616.jpg" alt="6.16千万让利" /></a></div>
		-->
		<!--头部 start -->
		<div class="j11308_header_1">
			<div class="j11308_header j11308_width1">
				<div class="j11308_header_logo">
					<a href="https://www.j1.com" target="_blank"><img
						src="https://img.j1.com/images/images1308/logo.gif" alt="健一网网上药店"
						width="199" height="41" /></a>
				</div>
				<div class="j11308_header_city">
					<a href="https://www.j1.com/activity/save.html" target="_blank"><img src="https://img01.j1.com/images/images1308/xlqg/cxhd_18.gif" width="125" height="60" alt="超级惠省钱" /></a>
				</div>
				<div class="j11308_header_search">
					<div class="j11308_form1">
						<input type="text" class="input_text1" id="searchInput"
							value=<c:if test="${searchKeyword!=null}"> ${searchKeyword}</c:if>
							<c:if test="${searchKeyword==null}">请输入关键字:商品名或症状或疾病名</c:if>
							onclick="clearValue();"
							onkeydown="bindEnter(event,function(){search();})"
							onblur="hideautopoint()" /> <input name="" type="button"
							value="" class="search_btn" onclick="search();" />
						</div>
					<%@include file="/html/hotworlds.jsp" %>
				</div>
				<div class="j11308_header_login">
					<div id="j11308_login" class="j11308_login_menu">
						<div class="j11308_login_ico1"></div>
						<a class="j11308_login_tit" rel="nofollow"
							style="cursor: pointer;"
							onclick='beginloginrove("/myec/orderChange.html");'>我的健一网</a>
						<ul class="j11308_login_subnav">
							<li><a rel="nofollow"
								style="cursor: pointer;"
								onclick='beginloginrove("/myec/orderChange.html");'>我的订单</a></li>
							<li><a rel="nofollow"
								style="cursor: pointer;"
								onclick='beginloginrove("/comment.html");'>我的评价</a></li>								
							<li><a target="_blank" rel="nofollow"
								style="cursor: pointer;"
								onclick='beginloginrove("/memberIntegralLog/getPage/1.html");'>我的积分</a></li>
						</ul>
					</div>
					<div class="j11308_header_login_right">
						<span class="gwtb"></span>
						<span class="j11308_header_login_right1"></span><a title="去购物车结算"
							target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/shopcart.html?time=<%=System.currentTimeMillis()%>" rel="nofollow">去购物车结算</a>
						<div class="j11308_header_login_right2">
							<span id="cartCount">0</span>
						</div>
					</div>
					<!-- 购物车 start -->
	<div class="newest" id="shopcartDiv">

	</div>
<script type="text/javascript">
$(".j11308_header_login_right").hover(function() {
	$(this).addClass('act');
	changeTotalPriceMini("Y");
	$(".newest").show().hover(function() {
		$(this).show();
		$(".j11308_header_login_right").addClass('act');
	}, function() {
		$(this).hide();
		$(".j11308_header_login_right").removeClass('act')
	});;
}, function() {
	$(this).removeClass('act');
	$(".newest").hide();
});
</script>
<!-- 购物车 over -->
					
				</div>
			</div>
		</div>
		<!-- 头部end -->
		<jsp:include page="/jsp/login/login_flow.jsp" />
		<!-- 返回顶部 -->
		<a href="#" id="toTop"></a>	
		<!-- 在线客服改版 st -->
		<div class="swt-per"><img src="https://img02.j1.com/images/images1308/ico/swt_01.png" width="37" height="159" alt="在线咨询" /></div>
		<div class="swt-sqsh">
		    <a href="https://smt.j1.com/LR/Chatpre.aspx?id=KAR89602298" target="_blank"><img src="https://img02.j1.com/images/images1308/ico/swt_02.jpg" alt="售前咨询" /></a>
		    <a href="https://smt.j1.com/LR/Chatpre.aspx?id=KAR89602298" target="_blank"><img src="https://img02.j1.com/images/images1308/ico/swt_03.jpg" alt="售后咨询" /></a>
		    <div class="swt-time">
		        <p>全国咨询热线</p>
		        <strong>4007-800-800</strong>
		        <p>（9:00-21:30）</p>
		    </div>
		</div>
<script type="text/javascript">
    $(".swt-per").hover(function() {
        $(".swt-sqsh").show().hover(function() {
            $(this).show()
        }, function() {
            $(this).hide()
        });
    }, function() {
        $(".swt-sqsh").hide();
    });
    $(".j11308_top_right1 .sjjy").hover(function() {
		$(".j11308_top_right1 .sjjy .gzjy").show()
	}, function() {
		$(".j11308_top_right1 .sjjy .gzjy").hide()
	});
    $(window).bind("scroll resize", function () {
        var winWidth = $(window).width();
        if (winWidth > 400 && $(window).scrollTop() > 400) {
            $('#toTop').slideDown("slow");
        } else {
            $('#toTop').slideUp("slow");
        }
    });
</script>
		<!-- 在线客服改版  ed -->
	</div>
	<script type="text/javascript" src="<%=WebURLParams.HOME_PAGE_URL %>/js/lib/jquery/jquery-ui.js"></script>