<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<c:if test="${fn:length(cpList) gt 0 }">
	<div class="top_menu1" >
		<div class="top_menu3">购物车&nbsp;<a href="<%=WebURLParams.HOME_PAGE_URL %>/shopcart.html?time=<%=System.currentTimeMillis()%>">${fn:length(cpList)}</a>&nbsp;件</div>
		<div class="top_menu2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="pt" items="${cpList }">
					<tr>
						<td class="process-td process-bottom">
							<div class="cart-01">
								<a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html">
									<c:if test="${empty pt.proImageUrl }">
										<img src="https://img.j1.com/images/default/product_default_small.jpg" alt="${pt.productName }" title="${pt.productName }"/>
									</c:if>
									<c:if test="${!empty pt.proImageUrl }">
										<img src="${pt.proImageUrl}" onError="dealwithErrImg(event)" width="58px" height="88px" alt="${pt.productName }" title="${pt.productName }"/>	
									</c:if>
								</a>
							</div>
						</td>
						<td class="process-td process-bottom">
							<div class="cart-02">
								<a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" title="${pt.productName } ${pt.promotePhrase}">
									${pt.productName }
									<span class="orange" style="font-weight: bold;">
										<c:if test="${fn:length(pt.promotePhrase) gt 10 }">${fn:substring(pt.promotePhrase,0,10) }</c:if>
										<c:if test="${fn:length(pt.promotePhrase) le 10 }">${pt.promotePhrase }</c:if>
									</span>
								</a> 
								<p title="${pt.drugTreatment }">
									<c:if test="${fn:length(pt.drugTreatment) gt 20 }">${fn:substring(pt.drugTreatment,0,20) }</c:if>
									<c:if test="${fn:length(pt.drugTreatment) le 20 }">${pt.drugTreatment }</c:if>
								</p> 
							</div>
						</td>
						<td align="center" class="process-td process-bottom">
							<strong class="font18">￥<fmt:formatNumber pattern="#0.00#" value="${empty pt.ecPrice ?0.00:pt.ecPrice}"/></strong>
						</td>
						<td align="center" class="process-td process-bottom">
							<a href="javascript:void(0)" onclick="deleteCartGoods('${pt.goodsId}')" class="blue">删除</a>
						</td>
		  			</tr>
				</c:forEach>
				<tr>
					<td class="process-td process-bottom"></td>
					<td class="process-td process-bottom"></td>
					<td align="center" class="process-td process-bottom"></td>
					<td align="center" class="process-td process-bottom">
						<input name="" type="button" class="settlement-btn" onclick="window.location.href = '<%=WebURLParams.HOME_PAGE_URL %>/shopcart.html?time=<%=System.currentTimeMillis() %>';return false;"/>
					</td>
			  	</tr>
			</table>
	    </div>
	</div>
</c:if>
