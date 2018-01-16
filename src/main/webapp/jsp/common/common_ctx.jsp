<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<c:set var="ctx" value="<%=WebURLParams.SEARCH_PAGE_URL %>" />
<c:set var="ctxcj" value="<%=WebURLParams.CJ_URL %>" />
<c:if test="${empty(ctx) }">
	<c:set var="ctxcj" value="https://cj.j1.com" />
</c:if>