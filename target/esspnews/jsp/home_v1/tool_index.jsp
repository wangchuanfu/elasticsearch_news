<%@ page language="java" contentType="text/html;charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div class="clear"></div>
<div class="j11308_nav_frame">
	<div class="j11308_nav j11308_width1">
		<div class="j11308_nav_left" style="height: 40px;overflow: hidden;">
			<a id="allNav" href="https://www.j1.com/sitemap.html" target="_blank">全部商品分类</a>
			<div class="j11308_nav_left"></div>
		</div>
		<div class="j11308_nav_menu">
			<ul class="j11308_nav_menu1">
				<li><a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/">首页</a></li>
				<li><a href="https://miao.j1.com/" title="特卖9点半">特卖9点半</a></li>
				<li><a href="https://www.j1.com/pd-yaopin.html" title="专科药品">专科药品</a></li>
				<li><a href="https://www.j1.com/pd-huazhuangpin.html" title="化妆品">化妆品</a></li>
				<!--  
				<li><a href="javaScript:void(0);" onclick="gotoThirdPage('http://mall.ikang.com/index.php?route=adver/jianyi/ikang')" title="爱康体检">爱康体检</a></li>
				
				<li><a href="http://tuan.j1.com/" title="精品惠">精品惠</a></li>
				-->
			</ul>
		</div> 
		
		<div class="j11308_nav_right">
			<a href="https://www.j1.com/news-help-40.html" target="_blank" rel="nofollow">互联网药品交易资格证
				沪C20100001</a>
		</div>
	</div>
</div>
<div id="cataLogMapDiv"
	style="position: relative; margin: 0 auto; z-index: 100; background-color: #fff; width: 1200px;">
	<jsp:include page="/productCatalogCommon/getCatalogHtml.html" />
</div>
