<%@ page trimDirectiveWhitespaces="true" %> 
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
        <ul>
           <li>&nbsp;&nbsp;排序：</li>
           <!-- 低->高（灰2）低->高（红1）  高——>低（灰4）高——>低（红3） -->
           <c:choose>
           	<c:when test="${orderBy eq 0 }">
           	   <li class="listsearchbtn3"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-0-1.html" class="liststyle4" >销量</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-1-1.html" >销量</a></li>
	           <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-2-1.html" >价格</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-3-1.html" >价格</a></li>
           	</c:when>
           	<c:when test="${orderBy eq 1 }">
           	   <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-0-1.html">销量</a></li>
	           <li class="listsearchbtn1"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-1-1.html" class="liststyle4">销量</a></li>
	           <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-2-1.html" >价格</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-3-1.html" >价格</a></li>
           	</c:when>
           	<c:when test="${orderBy eq 2 }">
           	   <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-0-1.html" >销量</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-1-1.html" >销量</a></li>
	           <li class="listsearchbtn3"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-2-1.html" class="liststyle4">价格</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-3-1.html" >价格</a></li>
           	</c:when>
           	<c:otherwise>
           	   <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-0-1.html">销量2</a></li>
	           <li class="listsearchbtn2"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-1-1.html" >销量</a></li>
	           <li class="listsearchbtn4"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-2-1.html" >价格</a></li>
	           <li class="listsearchbtn1"><a  rel="nofollow"  href="<%=WebURLParams.LIST_PAGE_URL %>/products/${catalogId }-3-1.html" class="liststyle4"  >价格</a></li>
           	</c:otherwise>
           </c:choose>
           <div class="clear"></div>
        </ul>
         <jsp:include page="/jsp/view/component/pagination_header.jsp" />
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
      	<jsp:include page="/jsp/view/component/pagination_footer_search.jsp" />
      </div>
      <!--listsearchmain5 end-->
 
	<!--listsearchmain6 start-->
   <div class="listsearchmain6">
      <div class="listsearch-cont">
       <div class="listsearyou">重新搜索:</div>
        <div class="listsearch-cont2">
        	<div style="width:315px; height:26px;margin-left:11px;*margin-left:5px;background-color: write; ">
	          <input name="searchInput2" maxlength="25" type="text" class="keyword" id="searchInput2" value=<c:if test="${searchKeyword!=null}"> "${searchKeyword}" </c:if>
			<c:if test="${searchKeyword==null}">"请输入关键字:商品名或症状或疾病名"</c:if>
			onclick="clearValueFoot();"
			onkeydown="bindEnter(event,function(){search2();})" 
			onblur="hideautopoint()"/>
			</div>
         </div>
         <div class="listsearch-cont3">
              <a href="#" target="_blank" class="keywordser" onclick="return false;"><img src="https://img.j1.com/images/view/listpage/searbtn.jpg" width="60" height="28" onclick="search2();"/> </a>
            </div>
      </div>
   </div>
   <!--listsearchmain6 end-->
	
﻿<!--百分点代码：列表页-->
﻿<script type="text/javascript">
	window["_BFD"] = window["_BFD"] || {};
	_BFD.BFD_INFO = {
		"category" : [["${topName }",""]<c:if test="${catalog.proCatalogLevel eq 2 }">,["${secName }","https://www.j1.com/products/${secId }-0-1.html"]</c:if>,["${catalog.proCatalogName }","https://www.j1.com/products/${catalogId }-0-1.html"]],   //商品的类别详细信息，第一个元素为类别名称，第二个元素为类别地址，2维数组;类别从大到小，数组最后一项为商品当前属类别
	
		"category_id" : [""<c:if test="${catalog.proCatalogLevel eq 2 }">,"${secId }"</c:if>,"${catalogId }"],   //类别ID;对应类别详细信息，一维数组
			
		"user_id" : "${sessionScope.memberId}", //网站当前用户id，如果未登录就为0或空字符串
		
		"page_type" : "list" //当前页面全称，请勿修改
	};
	
</script>
