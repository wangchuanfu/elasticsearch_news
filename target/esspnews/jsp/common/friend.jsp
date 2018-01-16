<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<jsp:include page="/jsp/common/taglibs.jsp">
	<jsp:param value="友情链接-健一网" name="seoTitle" />
	<jsp:param value="友情链接" name="seoKeyword" />
	<jsp:param value="健一网-专业的医药网上购物药店！要买药，就来j1.com！健一网网上药店、处方药天天低价、支持网上购药货到付款。销售产品包括中西药品、健康养生、医疗器械、隐形眼镜、美容护肤、母婴产品、居家生活等七个大类，数百万种产品。" name="seoDesc" />
</jsp:include>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/jquery-1.5.2.min.js"></script>
<jsp:include page="/jsp/home_v1/header.jsp" />
<jsp:include page="/jsp/home_v1/tool.jsp" />
<!-- 导入公共头部     end -->
<input id="pageType" type="hidden" value="index" />
<div class="sitemap_main ">
	<div class="msg">
		<a href="https://www.j1.com/">健一网首页</a> &gt; 友情链接
	</div>
	<div class="sitemap_sortwrap mt10">
		<h2>
			<span></span>友情链接
		</h2>
		<div class="line"></div>
		<div class="friendsbox clearfix">
			<c:forEach var="friend" items="${friendsList }">
				<a href="${friend.seoWordUrl }" target="_blank">${friend.seoWordName }</a>
			</c:forEach>
		</div>
		<p class="mt10">
			欢迎各大网站和健一网交换友情链接，在您把本站加为贵站友情链接后请联系我们。谢谢！<br />QQ:2745319701 （仅限友链合作，其它合作请拨021-60371111）
		</p>
	</div>
</div>
<%@include file="/jsp/home_v1/footer.jsp"%>
</html>