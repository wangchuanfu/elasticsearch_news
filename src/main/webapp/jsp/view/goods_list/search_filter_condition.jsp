<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<c:set var="ctxcj"  value="<%=WebURLParams.CJ_URL%>"/>
<%--其它服务器URL end --%>
<!--  注释筛选条件 -->
 <div class="j1131025_searchlist">
		<h1> <em>${catalogName }</em></h1>
			<dl class="choose clearfix">
				<dt>您已经选择：</dt>
				<dd>
					<c:forEach var="selectPara" items="${paraList }" varStatus="i">
						<c:if test="${selectPara.endUrl != ''}">
							<a href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/${selectPara.beginUrl}/${selectPara.endUrl }/1-${proCatalogId }-0-1-${searchType }/attr.html"><h5>${selectPara.attrName }：</h5>${fn:split(selectPara.attrs, '_')[1] }
						 	<i></i></a>
						</c:if>
						<c:if test="${selectPara.endUrl == ''}">
							<a href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/${selectPara.beginUrl}/${selectPara.endUrl }/1-${proCatalogId }-0-1-${searchType }/attr.html"><h5>${selectPara.attrName }：</h5>${fn:split(selectPara.attrs, '_')[1] }
						 	<i></i></a>
						</c:if>
					</c:forEach>
					<a href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/${attrKeyword}/1/1-0-0-1-${searchType }/attr.html" class="rechose">重新筛选</a>
				</dd>
			</dl>
		<c:forEach var="attr" items="${attrList }" varStatus="i">
			<dl class="clearfix choosetype">
				<dt>${attr.attrName }：</dt>
				<dd id="pl_brand${i.index }">
					<c:forEach var="att" items="${fn:split(attr.attrs, ',')}">
						<c:if test="${att != '' }">
							<a href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/${attr.beginUrl}/${attr.endUrl}${fn:split(att, '_')[0]}/1-${proCatalogId }-0-1-${searchType }/attr.html">${fn:split(att, '_')[1]}</a>
						</c:if>
					</c:forEach>
					<c:if test="${attr.attrName == '品牌'}">
						<span class="brandmore" style="display:none">更多</span> 
					</c:if>
				</dd>
			</dl>
		</c:forEach>
		<c:set var="attrLength" value="${fn:length(attrList)}"/>
		<c:if test="${attrLength > 3}">
			<div class="morebuttonwrap"><div class="pl_morebutton"><span>显示全部</span></div></div>
		</c:if>
	</div>
<script>
	if($("#pl_brand0 a").length < 15){
		$("#pl_brand0 .brandmore").hide();
	}else{
		$("#pl_brand0 .brandmore").show();
	};
	var $hidenum1=$("#pl_brand0 a:gt(13)");
	$hidenum1.hide();
	$(".brandmore").toggle(function(){
		$hidenum1.show();
		$(this).css("background","url(https://img.j1.com/images/listpage/pl_moreup.gif) no-repeat 25px 4px").text("收起");
	},function(){
		$hidenum1.hide();
		$(this).css("background","url(https://img.j1.com/images/listpage/pl_moredown.gif) no-repeat 25px 4px").text("更多" );
	});
	var $hidedl=$(".choosetype:gt(1):not(:last)");
	$hidedl.hide();
	$(".pl_morebutton span").toggle(function(){
		$hidedl.show();
		$(this).css("background","url(https://img.j1.com/images/listpage/pl_moreup.gif) no-repeat 69px 10px").text("向上收起");
	},function(){
		$hidedl.hide();
		$(this).css("background","url(https://img.j1.com/images/listpage/pl_moredown.gif) no-repeat 69px 10px").text("显示更多");
	});
	$(".choosetype:last").css("border-bottom","none");
</script>