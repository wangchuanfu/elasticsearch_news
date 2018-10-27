<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>

<c:choose>
<c:when test="${not empty newsTopic}">
<a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/newDetail-notice.html" target="_blank">${newsTopic}</a>
</c:when>
<c:otherwise>
暂无公告
</c:otherwise>
</c:choose>
