<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>邮箱绑定</title>
     <jsp:include page="/jsp/home_v1/header.jsp" />
	 <jsp:include page="/jsp/home_v1/tool.jsp"/>	 
	 <div style="width: 1000px;height: 100px;margin: auto;font-size: 20px;">
		 <c:choose>
		     <c:when test="${bindingEmail=='haved'}">
		        <div style="border: 1px solid #EDD4B3;margin-top: 10px;margin-bottom: 10px;">
		         <table width="400px" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td width="46" rowspan="2"><img src="https://img.j1.com/images/right-hyzx2.gif" width="46" height="46"></td>
					    <td height="25"><span class="suggest-another">邮箱已绑定！</span></td>
					  </tr>
			     </table>	
			    </div> 
		     </c:when>
		     <c:when test="${bindingEmail=='yes'}">
		        <div style="border: 1px solid #EDD4B3;margin-top: 10px;margin-bottom: 10px;">
		         <table width="400px" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td width="46" rowspan="2"><img src="https://img.j1.com/images/right-hyzx.gif" width="46" height="46"></td>
					    <td height="25"><span class="suggest-another">恭喜您，邮箱验证成功！</span></td>
					  </tr>
			     </table>	
			    </div> 	  
		     </c:when>
		     <c:otherwise>
		         <div style="border: 1px solid #EDD4B3;margin-top: 10px;margin-bottom: 10px;">
			         <table width="400px" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td width="46" rowspan="2"><img src="https://img.j1.com/images/right-hyzx2.gif" width="46" height="46"></td>
						    <td height="25"><span class="suggest-another">邮箱绑定失败！</span></td>
						  </tr>
				     </table>	
			     </div>
		     </c:otherwise>
		 </c:choose>
	 </div>
	 <jsp:include page="/jsp/home_v1/footer.jsp" />
</html>