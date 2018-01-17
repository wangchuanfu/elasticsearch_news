<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<c:set var="r" value="${(fn:length(pagination.data)%4==0)?(fn:length(pagination.data)/4):((fn:length(pagination.data)-fn:length(pagination.data)%4)/4 +1)}" />
<c:forEach var="v" begin="1" end="${r }">
	<!--搜索产品样式一排 start-->
	<div class="listsearch-jg">
		<c:forEach var="pt" items="${pagination.data }" varStatus="ip">
			<c:if test="${(ip.index+1) ge ((v-1)*4+1) && (ip.index+1) le (v*4)}">
				<div class="listsearch-one">
					<div class="listsearch-ztimg">
						<%-- <c:if test="${fn:length(pt.promoteList) gt 0 }">
							<c:set var="sumc" value="0" />
							<c:forEach items="${pt.promoteList }" var="pruleValue" varStatus="pruleIndex">
								<c:if test="${(!(pruleValue.discountPlan eq '2'))&&(sumc eq 0)}">
									<c:set var="sumc" value="${sumc+1 }" />
									<c:if test="${! empty pruleValue.itemNameList }">
										<c:if test="${! pruleValue.itemNameList[0].itemName2 }">
											<span <c:if test="${fn:length(pruleValue.itemNameList[0].itemName2) lt 4}">class='sgz'</c:if>>
												${pruleValue.itemNameList[0].itemName2 }
											</span>
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if> --%>
						<center>
							<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank" rel="nofollow"> <c:if test="${empty pt.proImageUrl }">
									<img src="https://img.j1.com/images/default/product_default_list.jpg" width="200" height="200" alt="${pt.productName }" />
								</c:if> <c:if test="${!empty pt.proImageUrl }">
									<img src="${pt.proImageUrl}" onError="dealwithErrImg(event)" width="200" height="200" alt="${pt.productName }" />
								</c:if>
							</a>
						</center>
					</div>
					<div class="listsearch-cx">
						<c:if test="${pt.promotePhrase != 'null' }">${pt.promotePhrase }</c:if>
					</div>
					<div class="listsearch-mc">
						<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank" title="${pt.drugTreatment }"> ${fn:substring(pt.productName1,0,71)}</a>
					</div>
					<div class="listsearch-price">
					<%-- 	<c:if test="${fn:length(pt.promoteList) gt 0 }">
							<c:forEach items="${pt.promoteList }" var="pruleType">
								<c:if test="${! empty pruleType.promoteName}">
									<c:if test="${!(pruleType.discountPlan eq '2')}">
										<cite>${pruleType.promoteName}</cite>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if> --%>
						<span class="liststyle2">¥<fmt:formatNumber pattern="#0.00#" value="${empty pt.ecPrice ?0.00:pt.ecPrice}" /></span> <span class="liststyle1">¥<fmt:formatNumber pattern="#0.00#" value="${empty pt.marketPrice ?0.00:pt.marketPrice}" /></span>
					</div>
					<div class="listsearch-des">
						<span>总销量：${empty pt.saleAmount?0:pt.saleAmount }</span><a class="" href="<%=WebURLParams.ITEM_PAGE_URL %>/userComment/getCommentList-${pt.goodsId}-1.html" target="_blank" onclick="javascript:void(0);">${empty pt.commentSum?0:pt.commentSum}条评论</a>
					</div>
					<div class="listsearch-xq">
						<div class="listshop">
							<c:choose>
								<c:when test="${pt.drugPrescriptionType eq 'SG' }">
									<c:choose>
										<c:when test="${pt.availableStock gt 0 }">
											<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html" target="_blank" rel="nofollow"> <span class="shopnow"></span><cite>加入购物车</cite>
											</a>
										</c:when>
										<c:otherwise>
											<a rel="nofollow" href="javaScript:void(0);" onclick="showArrivalNotice('${pt.goodsId}','${pt.productId}','${pt.goodsNo }')"><span class="message"></span><cite>到货通知</cite></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${pt.availableStock gt 0 }">
									<c:choose>
										<c:when test="${pt.drugPrescriptionType eq 'TC' }">
											<a rel="nofollow" href="https://smt.j1.com/LR/Chatpre.aspx?id=KAR89602298" target="_blank">立即咨询</a>
										</c:when>
										<c:otherwise>
											<a rel="nofollow" href="javaScript:void(0);" onclick="addMultiCart('${pt.goodsId},${pt.productLeastOrder }')"> <span class="shopnow"></span><cite>加入购物车</cite></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a rel="nofollow" href="javaScript:void(0);" onclick="showArrivalNotice('${pt.goodsId}','${pt.productId}','${pt.goodsNo }')"><span class="message"></span> <cite>到货通知</cite></a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="listcheck">
							<a rel="nofollow" target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${pt.productId}-${pt.goodsId}.html"> 查看详情 </a>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="clear"></div>
	</div>
	<!--搜索产品样式一排 end-->
</c:forEach>
