<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
  <div class="clear"></div> 
<div class="j11308_nav_frame">
	<div class="j11308_nav j11308_width_1000">
		<div class="j11308_nav_left" style="height: 40px;overflow: hidden;">
			<a id="allNav" href="https://www.j1.com/sitemap.html" target="_blank">全部商品分类</a>
		</div>
		<div class="j11308_inside_nav" > 
			<ul class="j11308_nav_menu1">
				<li><a target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/">首页</a></li>
				<li><a target="_blank" href="https://www.j1.com/promotion/1722.html" title="肝病专题">肝病专题</a></li>
				<li><a href="https://www.j1.com/activity/fuke.html" title="女人专场">女人专场</a></li>
				<li><a href="https://www.j1.com/promotion/1872.html " title="骨病专场">骨病专场</a></li>
			</ul>
		</div> 
	</div>
	<div id="cataLogMapDiv" style="position: relative; margin: 0 auto;z-index:100;background-color:  #transparent;width: 1200px;">     
	</div>
</div>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/home_v1/tool.js"></script>