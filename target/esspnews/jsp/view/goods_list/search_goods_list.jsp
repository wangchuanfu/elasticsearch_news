<%@ page trimDirectiveWhitespaces="true" %> 
<%@page import="com.huayuan.search.core.common.page.PageImpl"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<c:set var="ctxcj"  value="<%=WebURLParams.CJ_URL%>"/>
<c:set var="ctxcjl"  value="http://localhost:8082/j1search"/>

<%--其它服务器URL end --%>
<%
	String keyword = null;
	keyword = request.getParameter("keyword");
	if (keyword == null) {
		keyword = (String) request.getAttribute("searchKeyword");
	}
	String encodeKwd = java.net.URLEncoder.encode(keyword, "UTF-8").replace("%", "%25");
%>

<script type="text/javascript">
function checkInput(){
	var productName = $.trim($("#productName").val());
	if(!productName){
		alert('请输入商品名称');
		return false;
	}
	
	var productFactory = $.trim($("#productFactory").val());
	if(!productFactory){
		alert('请输入生产厂家');
		return false;
	}
	
	var phoneNumber = $.trim($("#phoneNumber").val());
	if(!phoneNumber){
		alert('请输入联系电话');
		return false;
	}
	alert('提交成功！即将转向首页');
}
function search2(){
	$("#searchInput").val($("#searchInput2").val());
	search();
}
function searchWord(word){
	$("#searchInput").val(word);
	search();
}
</script>
<c:if test="${pagination == null || pagination.totalCount eq 0 }">
		<div
			style="width: 100%; padding-top: 20px; padding-bottom: 20px; text-align: center;">
			暂无数据</div>

		<div id="yuding-center01">
			<p>健一网 商品预定申请单</p>
			<div class="yuding-center01-right">
				<p style="color: #656565; border: none; margin-bottom: 10px;">
					（如果您没有找到您需要的商品，请将您要寻找的商品告诉我们，我们会运用<font color="#f13201">健一网专业的医药供销渠道</font>为您采购。
				</p>
				<form id="findProductForm" name="findProductForm" method="post" onsubmit="return checkInput();" action="<%=WebURLParams.HOME_PAGE_URL %>/search/findProduct.html" >
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th><font color="#f13201">*</font>&nbsp;商品名称</th>
						<td><input id="productName" name="productName" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th>商品数量</th>
						<td><input id="productNumber" name="productNumber" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th><font color="#f13201">*</font>&nbsp;生产厂家</th>
						<td><input id="productFactory" name="productFactory" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th>您的姓名</th>
						<td><input id="name" name="name" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th><font color="#f13201">*</font>&nbsp;联系电话</th>
						<td><input id="phoneNumber" name="phoneNumber" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th></th>
						<td class="yuding-tips">为了能及时与您联络，推荐使用手机</td>
					</tr>
					<tr>
						<th>您的邮箱</th>
						<td><input id="mail" name="mail" type="text" class="yuding-text01" /></td>
					</tr>
					<tr>
						<th></th>
						<td class="yuding-tips">我们会用邮件回复您的需求；请查收您的邮件</td>
					</tr>
					<tr>
						<th>用户留言</th>
						<td><textarea id="message" name="message" cols="" rows="" class="yuding-text02">&nbsp;</textarea></td>
					</tr>
					<tr>
						<th style="height: 20px;"></th>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="提交采购申请"
							class="yuding-confirm" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="findProductForm.reset();"
							class="orange">重新填写</a></td>
					</tr>
				</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</c:if>
<c:if test="${pagination.totalCount ne 0 }">
	<c:if test="${!isAnd}"> 
		<div class="listsearchmain2">&nbsp;抱歉！没有找到 <strong style="color: red;"> ${searchKeyword } </strong> 的相关商品，以下是根据搜索词  
		<strong>
		<c:forEach var="akeyWord" items="${fSearchValue}">
			<a href="javascript:searchWord('${akeyWord}')" style="color: red;"> ${ akeyWord}</a>
		</c:forEach>
		</strong> 
		分别匹配到的结果。共找到<strong style="color: red;">${pagination.totalCount}件</strong>相关商品；</div>
	</c:if>	
	<c:if test="${isAnd}">
		<div class="listsearchmain2">
	   <h1>&nbsp;<strong>"${searchKeyword}"</strong></h1>找到${pagination.totalCount}件相关商品；健一网提供的<strong>"${searchKeyword}"</strong>及<strong>"${searchKeyword}相关产品"</strong>均为正品
	</div>
	</c:if>
	
	<!--listsearchmain3 start-->
      <div class="listsearchmain3">
       <div class="listsearchmain3-con">
       	<dl class="px">
			<dt>排序：</dt>
			<dd>
			<!-- 低->高（灰2）低->高（红1）  高——>低（灰4）高——>低（红3） -->
			<c:choose>
           	<c:when test="${orderBy eq 0 }">
           	    <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-0-1-${searchType }.html" class="current" ><cite class="fl">默认</cite></a></li>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-1-1-${searchType }.html" ><cite class="fl">销量</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-2-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-3-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="down"></span></a>
           	</c:when>
           	<c:when test="${orderBy eq 1 }">
           		<a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-0-1-${searchType }.html"><cite class="fl">默认</cite></a></li>
	            <a  rel="nofollow"  href="${ctxcjl }s/<%=encodeKwd%>/1/1-${proCatalogId}-1-1-${searchType }.html" class="current" ><cite class="fl">销量</cite><span span class="down"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-2-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-3-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="down"></span></a>
           	</c:when>
           	<c:when test="${orderBy eq 2 }">
           	   <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-0-1-${searchType }.html"><cite class="fl">默认</cite></a></li>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-1-1-${searchType }.html"><cite class="fl">销量</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-2-1-${searchType }.html" class="current"  ><cite class="fl">价格</cite><span span class="down"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-3-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="down"></span></a>
           	</c:when>
           	<c:otherwise>
           	   <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-0-1-${searchType }.html"><cite class="fl">默认</cite></a></li>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-1-1-${searchType }.html"><cite class="fl">销量</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-2-1-${searchType }.html" ><cite class="fl">价格</cite><span span class="up"></span></a>
	            <a  rel="nofollow"  href="${ctxcjl }/s/<%=encodeKwd%>/1/1-${proCatalogId}-3-1-${searchType }.html" class="current"  ><cite class="fl">价格</cite><span span class="up"></span></a>
           	</c:otherwise>
           </c:choose>
			</dd>
		</dl>
         <jsp:include page="/jsp/view/component/pagination_header.jsp" />
       </div>
      </div>
      <!--listsearchmain3 end-->   
      <!--商品列表 start-->
      <div class="listsearchmain4">
      	<jsp:include page="/jsp/view/goods_list/goods_list_detail.jsp" />
      </div>
      <!--商品列表 end-->
      <!--listsearchmain5 start-->
      <div class="listsearchmain5">
      	<jsp:include page="/jsp/view/component/pagination_footer_search.jsp" />
      </div>
      <!--listsearchmain5 end-->
 </c:if>     
	<!--listsearchmain6 start-->
   <div class="listsearchmain6">
      <div class="listsearch-cont">
       <div class="listsearyou">重新搜索1:</div>
        <div class="listsearch-cont2">
        	<div style="width:315px; height:26px;margin-left:11px;*margin-left:5px;background-color: write; ">
	          <input name="searchInput2" maxlength="25" type="text" class="keyword" id="searchInput2" value=<c:if test="${searchKeyword!=null}"> "${searchKeyword}" </c:if>
			<c:if test="${searchKeyword==null}">"请输入关键字:商品名或症状或疾病名"</c:if>
			onclick="clearValue();"
			onkeydown="bindEnter(event,function(){search2();})" 
			onblur="hideautopoint()"/>
			</div>
         </div>
         <div class="listsearch-cont3">
              <a href="#" target="_blank" class="keywordser" onclick="return false;"><img src="https://img.j1.com/images/view/listpage/searbtn.jpg" width="60" height="28" onclick="search2();"/> </a>
            </div>
      </div>
   </div>
   <!--listsearchmain6 end-->
	﻿<!--百分点代码：搜索结果页-->
﻿<script type="text/javascript">
	window["_BFD"] = window["_BFD"] || {};
	_BFD.BFD_INFO = {
	
		"search_id" : [${ids}],//搜索结果显示商品的id号
		
		"search_word" : "${searchKeyword}",   //搜索词
		<c:if test="${pagination.totalCount ne 0 }">
		<c:if test="${isAnd}">
		"search_result" : "1",   //搜索有无结果，1表示有结果，0表示无结果
		</c:if>
		</c:if>
		<c:if test="${pagination.totalCount ne 0 }">
		<c:if test="${!isAnd}"> 
		"search_result" : "0",   //搜索有无结果，1表示有结果，0表示无结果
		</c:if>
		</c:if>
		"user_id" : "${sessionScope.memberId}", //网站当前用户id，如果未登录就为0或空字符串
		
		"page_type" : "search" //当前页面全称，请勿修改
	};
	
	
</script>
