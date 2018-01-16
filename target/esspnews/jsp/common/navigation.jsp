<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<c:if test="${param.shoAlways ne 'T'  }">
	<script type="text/javascript">
		$(function() {
			$("#allNav").hover(function() {
				$(".sidebar-relative").show();
			}, function() {
				$(".sidebar-relative").hide();
			});
			$(".sidebar-relative").hover(function() {
				$(this).show();
			}, function() {
				$(this).hide();
			});
		});
	</script>
</c:if>
<div id="nav">
	<div class="nav-classification">
		<a id="allNav" href="javascript:void(0)">所有商品分类</a>
	</div>
	<ul>
		<li><a <c:if test="${page ne 'promotion' }">class="select"</c:if> href="<%WebURLParams.HOME_PAGE_URL %>/">首页</a></li>
		<li><a href="https://jp.j1.com/" target="_blank">精品会</a></li>
		<li><a href="http://zx.j1.com/" target="_blank">健康资讯</a></li>  
		<li><a href="http://zx.j1.com/ask/" target="_blank">寻医问药</a></li>  
	</ul>
</div>
<div class="clear"></div>
<c:choose>
	<c:when test="${shoAlways eq 'T' }">
		<div id="sidebar">
	</c:when>
	<c:otherwise>
		<div class="sidebar-relative" style="display: none">
			<div class="sidebar-absolute">
				<div id="sidebar">
	</c:otherwise>
</c:choose>
<c:forEach var="pc" items="${cataLogsList }" varStatus="pci">
	<div class="sidelist">
		<div class="sidelist-li">
			<h3>
				<div class="sidelist-strong">
					<span>·${pci.index+1 }F</span> ${pc.proCatalogName }
				</div>
				<c:forEach var="sugCata" items="${pc.suggestCatalogs }" varStatus="sugi">
					<c:choose>
						<c:when test="${sugi.last }"><a href="<%=WebURLParams.ITEM_PAGE_URL %>/products/${sugCata.proCatalogId }-0-1.html">${sugCata.proCatalogName }</a>				
						</c:when>
						<c:otherwise><a href="<%=WebURLParams.ITEM_PAGE_URL %>/products/${sugCata.proCatalogId }-0-1.html">${sugCata.proCatalogName }</a>|</c:otherwise>
					</c:choose>
				</c:forEach>
			</h3>
		</div>
		<c:if test="${pci.index lt 3 }">
			<div style="display: none;" class="i-list">
		</c:if>
		<c:if test="${pci.index eq 3}">
			<div style="display: none;top: -50px" class="i-list">
		</c:if>
		<c:if test="${pci.index eq 4}">
			<div style="display: none;top: -232px" class="i-list">
		</c:if>
		<c:if test="${pci.index eq 5}">
			<div style="display: none;top: -105px" class="i-list">
		</c:if>
		<c:if test="${pci.index eq 6}">
			<div style="display: none;top: -80px" class="i-list">
		</c:if>
		<c:if test="${pci.index eq 7 }">
			<div style="display: none;top: -200px" class="i-list">
		</c:if>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top" class="i-border-right">
						<div class="i-list-left">
							<c:forEach var="spc" items="${pc.subCatalogs }">
								<div class="i-list-con">
									<h1>
										<a href="<%=WebURLParams.ITEM_PAGE_URL %>/products/${spc.proCatalogId }-0-1.html">
											${spc.proCatalogName }
										</a>
									</h1>
									<ul>
										<c:forEach var="gspc" items="${spc.subCatalogs }">
											<li><a href="<%=WebURLParams.ITEM_PAGE_URL %>/products/${gspc.proCatalogId }-0-1.html">${gspc.proCatalogName }</a></li>
										</c:forEach>
									</ul>
									<div class="clear"></div>
								</div>
							</c:forEach>
						</div>
					</td>
					<td valign="top">	
						<div class="i-list-right">
							<div class="i-right-con">
								<h1>品牌推荐</h1>
								<ul>
									<c:forEach var="rcb" items="${pc.recommendBrandList }" varStatus="ip">
										<c:if test="${ip.index lt 6 }">
											<li><a href="<%=WebURLParams.ITEM_PAGE_URL %>/brand-${rcb.productBrandId}-0-0-1.html">${rcb.productBrandName }</a></li>
										</c:if>
									</c:forEach>
									<div class="clear"></div>
								</ul>
								<div class="clear"></div>
							</div>
							<div class="i-right-con">
								<h1>热门推荐</h1>
								<ul>
									<c:forEach var="hp" items="${pc.suggestProduct }" varStatus="ip">
										<c:if test="${ip.index lt 6 }">
											<li><a href="<%=WebURLParams.ITEM_PAGE_URL %>/product/${hp.productId }-${hp.goodsId }.html">${hp.productName }</a></li>
										</c:if>
									</c:forEach>
									<div class="clear"></div>
								</ul>
								<div class="clear"></div>
							</div>
						</div>
					</td>
				</tr>
			</table>	
		</div>
	</div>
</c:forEach>
<c:choose>
	<c:when test="${param.shoAlways eq 'T' }">
		</div>
	</c:when>
	<c:otherwise>
		</div>
		</div>
		</div>
	</c:otherwise>
</c:choose>
