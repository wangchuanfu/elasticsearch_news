<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<dl class="borderbox clearfix">
	<dt class="tjtitle">相关推荐：</dt>
	<dd class="tjdes">
	<c:if test="${fn:length(catalogSuggests) gt 0 }">
		<c:forEach items="${catalogSuggests }" var="catalogSuggest">
			<a href="${catalogSuggest.catalogSuggestUrl }" target="_blank">${catalogSuggest.catalogSuggestName }</a>
			<span>|</span>
		</c:forEach>
	</c:if>
	</dd>
</dl>