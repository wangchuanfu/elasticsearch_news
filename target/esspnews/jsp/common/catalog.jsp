<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div id="sidebar-x"
		style="display: none; position: absolute; z-index: 1000;">
		<div class="clear"></div>
   <c:forEach items="${catalogMap}" var="oneAndTwoMap" varStatus="oneSta" > 
         <div class="sidelist-x">
			<div class="sidelist-x-li">
				<h3>
					<div class="sidelist-strong-x" style="background:url(<%=WebURLParams.HOME_PAGE_URL %>/images/icon_nav0${oneSta.count}.gif) no-repeat">
						<span>&gt;</span>&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"
							href="<%=WebURLParams.HOME_PAGE_URL %>/products/${oneAndTwoMap.key.proCatalogId}-0-1.html">${oneAndTwoMap.key.proCatalogName}</a>
					</div>
				</h3>
			</div>
			<div class="i-list-x">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" class="i-border-right-x">
							    <div class="i-list-left-x">							    
							        <c:forEach items="${oneAndTwoMap.value}" var="twoAndThreeMap">
							              <div class="i-list-con-x">
											<h1><a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/products/${twoAndThreeMap.key.proCatalogId}-0-1.html">${twoAndThreeMap.key.proCatalogName}</a></h1>											
											<ul>
											   <c:forEach items="${twoAndThreeMap.value}" var="catalog">
													<li><a target="_blank"
														href="<%=WebURLParams.HOME_PAGE_URL %>/products/${catalog.proCatalogId}-0-1.html">${catalog.proCatalogName}</a></li>
												</c:forEach>
											</ul>
											<div class="clear"></div>	
											</div>									
									</c:forEach>	
								</div>
						</td>
						<td valign="top"><!-- 广告    -->
							     <div class="i-list-right-x">
									<div class="i-right-con-x">
										<h1>推荐商品</h1>
										<ul>
											<c:forEach items="${oneAndTwoMap.key.recommendBrandList}" var="recommendBrand">
											     <li><a target="_blank"
												href="<%=WebURLParams.HOME_PAGE_URL %>/${recommendBrand.productBrandUrl}"><img
													src="${recommendBrand.productBrandImg}" width="194" height="60"
													alt="${recommendBrand.productBrandName}" /></a></li>
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
  <span class="sidelist-title-x">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>所有商品分类</td>
					<td><a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/upload/yao/sitemap.html">更多&gt;</a></td>
				</tr>
			</table>
		</span>
	</div>
