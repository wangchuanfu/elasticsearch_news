<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${hotWordListCount>0}">
	<c:forEach items="${hotWordList}" var="hotWord" varStatus="s">
		<c:if test="${s.index le 8}">
			<a href="javascript:void(0)" onclick="setKeyword('${hotWord}');return false;">${hotWord}</a>
		</c:if>
		<c:if test="${!s.last}">
			&nbsp;|&nbsp;
		</c:if>
	</c:forEach>
</c:if>
