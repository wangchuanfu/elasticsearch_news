<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<jsp:include page="/jsp/common/taglibs.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	var requestURI = "${requestURI}";
	var callBackFunction = <c:out value="${callBackFunction}"></c:out>;
	var fobj;
	try{
		var fobj = JSON.parse(callBackFunction);	
	}catch(e){}
	
	if(typeof(fobj) == "object"){
		var fname = fobj.name;
		var fparam = fobj.params;
		alert(fname+":"+fparam);
	}else{
		window.location.href = "<%=WebURLParams.HOME_PAGE_URL %>"+requestURI;
	}
	
});
</script>
<div style=" text-align:center; font-size:18px; font-weight:bold; padding:100px 0 0 0; height:300px; color:#CC0000">页面中转中......</div>
