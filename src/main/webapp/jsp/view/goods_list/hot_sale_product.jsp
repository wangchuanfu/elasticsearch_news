<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div class="list-Screening">
	<div class="list_h1">
		<span class="fl">一周热卖排行</span><a class="fr" href="">更多》</a>
	</div>
	<div class="listpageBox">
		<ul>
			<c:forEach var="pt" items="${hotProductList }" varStatus="hotIndex">
				<li>
					<div class="hotproduct">
						<div class="hotproduct-left">
							<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank"><img src="${pt.proImageUrl}" width="74" height="74" alt="${pt.productName }" /></a>
						</div>
						<div class="hotproduct-right">
							<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank" title="${pt.productName }"> ${fn:substring(pt.productName,0,12) } </a>
							<c:if test="${hotIndex.index lt 3 }">
								<span class="liststyle2">￥<fmt:formatNumber pattern="#0.00#" value="${empty pt.ecPrice ?0.00:pt.ecPrice}" /></span>
								<cite>${hotIndex.index+1}</cite>
							</c:if>
							<c:if test="${hotIndex.index gt 2 }">
								<span class="liststyle2">￥<fmt:formatNumber pattern="#0.00#" value="${empty pt.ecPrice ?0.00:pt.ecPrice}" /></span>
								<cite class="grey">${hotIndex.index+1}</cite>
							</c:if>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>