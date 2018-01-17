<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div class="pagenav">
	<span></span> <cite>${pagination.page}/${pagination.totalPage }</cite>
	<c:if test="${pagination.page <= 1}">
		<a rel="nofollow" class="disabled"><</a>&nbsp;
	</c:if>
	<c:if test="${pagination.page > 1}">
		<a rel="nofollow"  href="<%=WebURLParams.SEARCH_PAGE_URL %>/s${pagination.requestURL}${pagination.page-1}-${searchType }.html${pagination.extraInfo}"><</a>
	</c:if>
	<c:if test="${pagination.page >= pagination.totalPage}">
		<a rel="nofollow" class="disabled">></a>
	</c:if>
	<c:if test="${pagination.page < pagination.totalPage}">
		<a rel="nofollow" href="<%=WebURLParams.SEARCH_PAGE_URL %>/s${pagination.requestURL}${pagination.page+1}-${searchType }.html${pagination.extraInfo}" >></a>
	</c:if>
</div>
