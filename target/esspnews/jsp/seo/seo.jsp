<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.huayuan.search.utils.StringUtils"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@page import="org.springframework.orm.ibatis.SqlMapClientTemplate"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<c:set var="seoTitle" value="健一网" />
<c:set var="seoKeyword" value="健一网" />
<c:set var="seoDesc" value="健一网" />
<c:if test="${!empty param.seoTitle }">
	<c:set var="seoTitle" value="${param.seoTitle }" />
</c:if>
<c:if test="${!empty param.seoKeyword }">
	<c:set var="seoKeyword" value="${param.seoKeyword }" />
</c:if>
<c:if test="${!empty param.seoDesc }">
	<c:set var="seoDesc" value="${param.seoDesc }" />
</c:if>
<title>${seoTitle }</title>
<meta name="keywords" content="${seoKeyword }" />
<meta name="description" content="${seoDesc }" />
