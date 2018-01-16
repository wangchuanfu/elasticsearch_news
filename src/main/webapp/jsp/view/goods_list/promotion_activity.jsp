<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>

<c:if test="${fn:length(promotionGoods) gt 0}">
	<div class="borderbox clearfix">
		<div class="listcx_left" style="width: 100%">
			<h2>促销活动</h2>
			<c:forEach items="${promotionGoods }" var="promotionGoods" varStatus="pgoodsIndex">
				<c:if test="${pgoodsIndex.index lt 4 }">
					<dl class="cxlist">
						<dt>
							<a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${promotionGoods.productId }-${promotionGoods.goodsId}.html" target="_blank"><img src="${promotionGoods.proImageUrl}" alt="${promotionGoods.productName}"></a>
						</dt>
						<dd>
							<span>${promotionGoods.promotePhrase }</span><cite>${promotionGoods.productName}</cite><s>¥<fmt:formatNumber pattern="#0.00#" value="${empty promotionGoods.ecPrice ?0.00:promotionGoods.ecPrice}" /></s> <a class="cxlist_btn" href="javaScript:void(0);" onclick="addMultiCart('${promotionGoods.goodsId},1,0')">立即抢购</a>
						</dd>
					</dl>
				</c:if>
			</c:forEach>
		</div>
		<!-- 暂时去除 -->
		<!-- 	<div class="listcx_right"> -->
		<!-- 		<h2>促销活动</h2> -->
		<!-- 		<ul> -->
		<!-- 			<li><a href="" target="_blank"><span>.</span>IT数码精品购疯抢中!IT数码精品购疯抢中!</a></li> -->
		<!-- 			<li><a href="" target="_blank"><span>.</span>IT数码精品购疯抢中!</a></li> -->
		<!-- 			<li><a href="" target="_blank"><span>.</span>IT数码精品购疯抢中!</a></li> -->
		<!-- 			<li><a href="" target="_blank"><span>.</span>IT数码精品购疯抢中!</a></li> -->
		<!-- 			<li><a href="" target="_blank"><span>.</span>IT数码精品购疯抢中!</a></li> -->

		<!-- 		</ul> -->
		<!-- 	</div> -->
	</div>
</c:if>