<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
  <!--热门搜索 start-->
	<div class="hotserh">
         <div class="hotserh-con clearfix">
         	<c:forEach var="catalog" items="${threeCatalogList}" varStatus="i">
           		<A href="<%=WebURLParams.LIST_PAGE_URL %>/p-${catalog.proCatalogId}.html" target="_blank">${catalog.proCatalogName}</A>   
           	</c:forEach>            
       </div>
     </div>          
      
    <!--热门搜索 end-->