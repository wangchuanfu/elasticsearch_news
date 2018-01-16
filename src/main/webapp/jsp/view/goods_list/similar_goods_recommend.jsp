<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div class="list-Screening">
	<div class="list_h1">同类商品推荐</div>
	<div class="listpageBox">
		<ul>
			<c:forEach var="pt" items="${similarGoodsRecList }">
				<li><a class="tjproduct" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank" ><img src="${pt.proImageUrl}"> <span>${pt.productName}</span> <cite><s>￥<fmt:formatNumber pattern="#0.00#" value="${empty pt.ecPrice ?0.00:pt.ecPrice}" /></s></cite> </a></li>
			</c:forEach>
		</ul>
	</div>
</div>