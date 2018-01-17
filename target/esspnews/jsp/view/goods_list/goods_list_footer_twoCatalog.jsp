<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
  <!--热门搜索 start-->
     <c:forEach var="catalog" items="${twoProductCatalogList}">
         	<a target="_blank"	href="<%=WebURLParams.ITEM_PAGE_URL %>/products/${catalog.proCatalogId}-0-1.html">${catalog.proCatalogName}</a>   
     </c:forEach>            
    <!--热门搜索 end-->