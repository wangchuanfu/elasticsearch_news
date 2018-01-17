<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div class="left1-title">我的健一网</div>
<div class="left1-body">
	<div class="left1-leve2">
		<div class="spread">交易管理</div>
	</div>
	<ul class="ul-member">
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/orderChange.html" <c:if test="${param.fromPage eq 'myOrder' }">class="choose"</c:if>><s></s>我的订单</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/changeCollection.html" <c:if test="${param.fromPage eq 'wdsc' }">class="choose"</c:if>><s></s>我的收藏</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/assign/myCoupons.html" <c:if test="${param.fromPage eq 'yuq' }">class="choose"</c:if>><s></s>我的优惠券</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/memberIntegralLog/getPage/1.html" <c:if test="${param.fromPage eq 'sjf' }">class="choose"</c:if>><s></s>我的积分</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/changeInsideNotice.html" <c:if test="${param.fromPage eq 'zntz' }">class="choose"</c:if>><s></s>站内通知</a></li>
	</ul>
	<div class="left1-leve2">
		<div class="spread">消息中心</div>
	</div>
	<ul class="ul-member">
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/comment.html" <c:if test="${param.fromPage eq 'evalua' }">class="choose"</c:if>><s></s>我的评价</a><em>new</em></li>
	</ul>
	<div class="left1-leve2">
		<div class="spread">健一卡管理</div>
	</div>
	<ul class="ul-member">
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/cardBalance.html" <c:if test="${param.fromPage eq 'jykcx' }">class="choose"</c:if>><s></s>卡信息查询</a></li>
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/cardPassword.html" <c:if test="${param.fromPage eq 'jykxgmi' }">class="choose"</c:if>><s></s>修改密码</a></li>
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/cardTxnLog.html" <c:if test="${param.fromPage eq 'jykjymx' }">class="choose"</c:if>><s></s>查交易明细</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/recharge/changeInquires.html" <c:if test="${param.fromPage eq 'jykfw' }">class="choose"</c:if>><s></s>预存账户</a></li>
	</ul>   
	<div class="left1-leve2">
		<div class="spread">充值缴费</div>
	</div>
	<ul class="ul-member">
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/phoneExpend.html" <c:if test="${param.fromPage eq 'sjcz' }">class="choose"</c:if>><s></s>手机充值</a></li>
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/wegExpend.html" <c:if test="${param.fromPage eq 'ggjf' }">class="choose"</c:if>><s></s>公共缴费</a></li>
	</ul>
	<div class="left1-leve2">
		<div class="spread">资料管理</div>
	</div>
	<ul class="ul-member">
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/memberInfo.html" <c:if test="${param.fromPage eq 'hyxx' }">class="choose"</c:if>><s></s>会员信息</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/memberRank.html" <c:if test="${param.fromPage eq 'hydj' }">class="choose"</c:if>><s></s>会员等级</a></li>
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/memberCenter/gotoMemberSafePage.html" <c:if test="${param.fromPage eq 'zhaq' }">class="choose"</c:if>><s></s>账户安全</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/address.html" <c:if test="${param.fromPage eq 'shdz' }">class="choose"</c:if>><s></s>收货地址</a></li>
	</ul>
	<div class="left1-leve2">
		<div class="spread">售后管理</div>
	</div>
	<ul class="ul-member">
	    <li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/changeSuggest.html" <c:if test="${param.fromPage eq 'jyhts' }">class="choose"</c:if>><s></s>建议和投诉</a></li>
		<li class="li-member"><a href="<%=WebURLParams.HOME_PAGE_URL %>/myec/changeExchanged.html" <c:if test="${param.fromPage eq 'thhsq' }">class="choose"</c:if>><s></s>退换货申请</a></li> 
	</ul>
	<div class="clear"></div>
</div>
﻿<!--百分点代码：会员页-->
﻿<script type="text/javascript">
	window["_BFD"] = window["_BFD"] || {};
	_BFD.BFD_INFO = {
		"user_id" : "${sessionScope.memberId}", //网站当前用户id，如果未登录就为0或空字符串
		"page_type" : "account" //当前页面全称，请勿修改
	};
</script>