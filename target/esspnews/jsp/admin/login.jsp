<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="健一,搜索,管理,j1,健一">
<meta name="description" content="健一搜索管理。">
<link href="<%=WebURLParams.SEARCH_PAGE_URL %>/css/search/base.css" rel="stylesheet" type="text/css" />
<link href="<%=WebURLParams.SEARCH_PAGE_URL %>/css/search/login.css" rel="stylesheet" type="text/css" />
<title>健一搜索管理</title>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/jquery-1.5.2.min.js"></script>
</head>
<body>
	<div class="logo">
		<a href="https://www.j1.com/">
			<img src="<%=WebURLParams.IMG_URL %>/images/images1308/logo.gif" alt="健一网网上药店" width="199" height="41">
		</a>
	</div>
	<div class="login">
		<form action="<%=WebURLParams.SEARCH_PAGE_URL %>/check.html" method="post">
			用户名：<input id="username" name="username" class="input_text" autocomplete="off" type="text"/>
			<br/>
			密码&nbsp;&nbsp;：<input id="password" name="password" class="input_text" autocomplete="off" type="text"/>
			<br/>
			<input value="login" class="input_submit" type="submit"/>
			<script type="text/javascript">
				document.getElementById("username").focus();
			</script>
		</form>
	</div>
	
	</form>

</body>
</html>