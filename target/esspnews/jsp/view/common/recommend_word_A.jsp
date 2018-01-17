<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="word" items="${seoWordList }" varStatus="i">
	<A href="${word.seoWordUrl}" target="_blank">${word.seoWordName }</A> 
	&nbsp;
<%-- 	<c:if test="${i.index == 9 }"> --%>
<!-- 		<br> -->
<%-- 	</c:if> --%>
</c:forEach>