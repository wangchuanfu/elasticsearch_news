<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%=WebURLParams.HOME_PAGE_URL %>
<jsp:include page="/jsp/common/taglibs.jsp">
	<jsp:param value="企业服务 - 健一网" name="seoTitle"/>
	<jsp:param value="企业服务 - 健一网" name="seoKeyword"/>
	<jsp:param value="企业服务 - 健一网" name="seoDesc"/>
</jsp:include>
<link href="<%=WebURLParams.CJ_URL %>/css/after-sales.css" rel="stylesheet" type="text/css" />
<jsp:include page="/jsp/home_v1/header.jsp"/>
			<jsp:include page="/jsp/home_v1/tool.jsp"/>
	<div id="container">
		<div id="content">
			<div class="msg">
				<a href="<%=WebURLParams.HOME_PAGE_URL %>/">首页</a> > 企业服务
			</div>
		    <div class="business">
				<img src="https://img.j1.com/images/friendlink_01_r2_c3.jpg" />
			</div>
			<div class="clear"></div>
			<div id="friend-table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td valign="top" class="friend-right"><div class="left">
				    <h1>只有企业客户享受到的专人、专心、贴心服务</h1>
					<ol>
					    <li>全方位的订购服务</li>
					    <li>专业贴心的客户管理</li>
					    <li>针对性的采购方案定制服务</li>
					    <li>专属客服</li>
						 <li>订单全程监控、专人跟踪</li>
						 <li>全面周到的配送服务</li>
						 <li>无忧的售后服务</li>
					</ol>
				</div></td>
					<td valign="top"><div class="right">
				    <h1>如何成为企业客户？</h1>
					<img src="https://img.j1.com/images/index_r4_c10.jpg"  style="margin:20px 0 0 10px;"/>
				</div></td>
				  </tr>
				</table>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="/jsp/home_v1/footer.jsp" %>
