<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!--热门搜索 start-->
<div class="hotserh "><div class="hotserh-con clearfix">
     	<c:forEach var="word" items="${seoWordList }"><a href="${word.seoWordUrl}" target="_blank">${word.seoWordName }</a></c:forEach>
     	</div></div>
<!--热门搜索 end-->