<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="com.huayuan.search.core.common.page.PageImpl"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<script type="text/javascript">
function search2(){
	$("#searchInput").val($("#searchInput2").val());
	search();
}
function clearValueFoot() {
	var word = $('#searchInput2').attr("value");
	if (word == "请输入关键字:商品名或症状或疾病名") {
		$('#searchInput2').attr('value', '');
	}
}
</script>
<!--listsearchmain3 start-->
<div class="listsearchmain3">
	<div class="listsearchmain3-con">
		<dl class="px">
			<dt>排序：</dt>
			<dd>
				<c:choose>
					<c:when test="${orderBy eq 0 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=1" class="current"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 1 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html" class="current"><cite class="fl">销量</cite><span class="up"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 4 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=5" class="current"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 5 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4" class="current"><cite class="fl">评论</cite><span class="up"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 2 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=3" class="current"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 3 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2" class="current"><cite class="fl">价格</cite><span class="up"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 6 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=7" class="current"><cite class="fl">时间</cite><span class="down"></span></a>
					</c:when>
					<c:when test="${orderBy eq 7 }">
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html"><cite class="fl">销量</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=4"><cite class="fl">评论</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=2"><cite class="fl">价格</cite><span class="down"></span></a>
						<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=6" class="current"><cite class="fl">时间</cite><span class="up"></span></a>
					</c:when>
				</c:choose>
			</dd>
		</dl>
		<div class="pagenav">
			<span>共${pagination.totalCount }个商品 </span> <cite>${pagination.page}/${pagination.totalPage}</cite>
			<c:if test="${pagination.page != 1}">
				<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page-1}" ><</a>
			</c:if>
			<c:if test="${pagination.page == 1}">
				<a rel="nofollow" class="disabled"><</a>&nbsp;
			</c:if>
			<c:if test="${pagination.page != pagination.totalPage}">
				<a rel="nofollow" href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page+1}" >></a>
			</c:if>
			<c:if test="${pagination.page == pagination.totalPage}">
				<a rel="nofollow" class="disabled">></a>
			</c:if>
		</div>
	</div>
</div>
<!--listsearchmain3 end-->
<!--商品列表 start-->
<div class="listsearchmain4">
	<jsp:include page="/jsp/view/goods_list/goods_list_detail.jsp" />
</div>
<!--商品列表 end-->
<!--listsearchmain5 start-->
<div class="listsearchmain5">
	<jsp:include page="/jsp/view/component/pagination_footer.jsp" />
</div>
<!--listsearchmain5 end-->
<!--listsearchmain6 start-->
<div class="listsearchmain6">
	<div class="listsearch-cont">
		<div class="listsearyou">重新搜索:</div>
		<div class="listsearch-cont2">
			<div style="width: 315px; height: 26px; margin-left: 11px; *margin-left: 5px; background-color: write;">
				<input name="searchInput2" maxlength="25" type="text" class="keyword" id="searchInput2" value=<c:if test="${searchKeyword!=null}"> "${searchKeyword}" </c:if> <c:if test="${searchKeyword==null}">"请输入关键字:商品名或症状或疾病名"</c:if> onclick="clearValueFoot();" onkeydown="bindEnter(event,function(){search2();})" onblur="hideautopoint()" />
			</div>
		</div>
		<div class="listsearch-cont3">
			<a href="#" target="_blank" class="keywordser" onclick="return false;"><img src="https://img.j1.com/images/view/listpage/searbtn.jpg" width="60" height="28" onclick="search2();" /> </a>
		</div>
	</div>
</div>
<!--listsearchmain6 end-->
<!--百分点代码：列表页-->
<script type="text/javascript">
	window["_BFD"] = window["_BFD"] || {};
	_BFD.BFD_INFO = {
		"category" : [["${topName }",""]<c:if test="${catalog.proCatalogLevel eq 2 }">,["${secName }","https://www.j1.com/products/${secId }-0-1.html"]</c:if>,["${catalog.proCatalogName }","https://www.j1.com/products/${catalogId }-0-1.html"]],   //商品的类别详细信息，第一个元素为类别名称，第二个元素为类别地址，2维数组;类别从大到小，数组最后一项为商品当前属类别
		"category_id" : [""<c:if test="${catalog.proCatalogLevel eq 2 }">,"${secId }"</c:if>,"${catalogId }"],   //类别ID;对应类别详细信息，一维数组
		"user_id" : "${sessionScope.memberId}", //网站当前用户id，如果未登录就为0或空字符串
		"page_type" : "list" //当前页面全称，请勿修改
	};
</script>
