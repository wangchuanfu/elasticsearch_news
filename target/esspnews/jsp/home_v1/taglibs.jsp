<%@ page trimDirectiveWhitespaces="true" %> 
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="baidu-site-verification" content="UwMxw3fJra" />
<jsp:include page="/jsp/seo/seo${param.seoPageSufix }.jsp" >
	<jsp:param value="${param.seoTitle }" name="seoTitle"/>
	<jsp:param value="${param.seoKeyword }" name="seoKeyword"/>
	<jsp:param value="${param.seoDesc }" name="seoDesc"/>
</jsp:include>
<meta property="qc:admins" content="16502756576216375" />
<link rel="icon" href="https://img.j1.com/images/images1308/favicon.ico" type="image/x-icon" />
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
