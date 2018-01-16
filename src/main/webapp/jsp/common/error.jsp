<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>系统出错 - 健一网</title>
<meta name="description" content="健一网" />
<meta name="Keywords" content="健一网" />
<link href="<%=WebURLParams.CJ_URL %>/css/home/common2.css" rel="stylesheet" type="text/css" />
<link href="<%=WebURLParams.CJ_URL %>/css/new-address.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/jquery-1.5.2.min.js" ></script>
<script type="text/javascript">
var secs = 5;    
$(function(){
	for(var i=secs;i>=0;i--){    
		window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);    
	}
});

function doUpdate(num){
	$("#timeCount").html(num);
	if(num == 0){
		window.location.href = "<%=WebURLParams.HOME_PAGE_URL %>/";
	}
}    
</script>
</head>
<body>
<div id="new-address" style="margin:0 auto; margin-top:15%;">
	<div class="top">
		<span>404-Not Found</span>
	</div>
	<div class="content" style="width:600px;">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right" width="200"><img src="https://img.j1.com/images/logo.jpg" /></td>
				<td height="35" align="center">
					<table width="400" border="0" cellspacing="0" cellpadding="0">
			  			<tr>
			    			<td align="center">Error Code:404;</td>
			  			</tr>
		      			<tr>
		        			<td align="center">
		        				抱歉！您正在访问的路径不存在或者暂不可用。
		        				<p><font color="red" style=" font-weight:900;">${errors }</font></p>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td align="center">网站导航 ：<a href="https://www.j1.com">首页</a> &nbsp; <a href="https://jp.j1.com">精品会</a>
		        			&nbsp; <a href="http://21.j1.com/">10点秒杀</a>
		        			&nbsp; <a href="http://zx.j1.com/">健康谈</a></td>
		      			</tr>
		      			<tr>
		        			<td align="center">
		        				<span>
		        					<strong><span id="timeCount">5</span>秒后自动转到首页。</strong>
		        				</span>
		        				如果没有跳转， <a href="<%=WebURLParams.HOME_PAGE_URL %>/">请点击这里。</a>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td align="center">&nbsp;</td>
		      			</tr>
		    		</table>
		    	</td>    
		  	</tr>
		</table>
	</div>
	<div class="bottom"></div>
</div>
</body>
</html>