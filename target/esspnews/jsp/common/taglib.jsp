<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<jsp:include page="/jsp/seo/seo${param.seoPageSufix }.jsp" >
	<jsp:param value="${param.seoTitle }" name="seoTitle"/>
	<jsp:param value="${param.seoKeyword }" name="seoKeyword"/>
	<jsp:param value="${param.seoDesc }" name="seoDesc"/>
</jsp:include>
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/asyncbox/asyncbox.css"/>
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/css/collection.css"  />
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
</head>
<body>
