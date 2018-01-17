<%@ page trimDirectiveWhitespaces="true" %> 
<%@page import="com.huayuan.search.core.common.page.PageImpl"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctxcj"  value="<%=WebURLParams.CJ_URL%>"/>
<c:if test="${pagination == null || pagination.totalCount eq 0 }">
	<jsp:include page="/jsp/common/taglibs.jsp">
		<jsp:param value="搜索【健一网官方网站】" name="seoTitle"/>
		<jsp:param value="搜索" name="seoKeyword"/>
		<jsp:param value="搜索" name="seoDesc"/>
	</jsp:include>
</c:if>
<c:if test="${pagination != null && pagination.totalCount gt 0 }">
<jsp:include page="/jsp/common/taglibs.jsp">
	<jsp:param value="${searchKeyword}-正品${searchKeyword}|价格|效果|副作用|说明书_【健一网官方网站】_【健一网】${titlePage }" name="seoTitle"/>
	<jsp:param value="${searchKeyword},官方网站,官网,正品,${searchKeyword},真假,价格,效果,怎么样,多少钱,副作用" name="seoKeyword"/>
	<jsp:param value="${searchKeyword},健一网上药店销售正品${searchKeyword}，
	天天低价格，周周送好礼，享受${searchKeyword}最低价格。大量${searchKeyword}的网友评论，${searchKeyword}图片、${searchKeyword}心得、${searchKeyword}技巧等供您参考。网购${searchKeyword}就上健一网上药店，感受贴心服务" name="seoDesc"/>
</jsp:include>
</c:if>
<%
String keyword2 = request.getParameter("keyword");
String encodeKwd2 = java.net.URLEncoder.encode(keyword2,"UTF-8").replace("%", "%25");
String totalTime = (String) request.getAttribute("totalTime");
String totalHits = (String) request.getAttribute("totalHits");
%> 
<link href="${ctxcj }/css/view/2list.css" rel="stylesheet" type="text/css" />
<c:set var="kwd" value="<%=encodeKwd2%>"/>
<c:set var="keyword2" value="<%=keyword2%>"/>
<jsp:include page="/jsp/home_v1/header.jsp"/>		
<jsp:include page="/jsp/home_v1/tool.jsp"/>
<!-- 列表开始 -->
<div id="listpagecontainer">
 <div id="listpagecontent">
 	<div class=detailnav>
      <SPAN ><A href="<%=WebURLParams.HOME_PAGE_URL %>/">首页</A></SPAN> 
      <SPAN class=arrow>&gt;</SPAN> 
      <SPAN> 搜索</SPAN> 
    </div>
    <!--listpageleft start-->
    <div class="listpageleft">
    	<!--list-Screening start-->
       <div class="list-Screening">
       		<h3>&nbsp;&nbsp;分类筛选</h3>
           <div class="listpageChooseBox">
           		<c:forEach items="${cataLogList}" var="product">
           			<c:if test="${product.proCatalogId > 0}">
           			<c:choose>
						<c:when test="${product.proCatalogId==proCatalogId}">
							<h3> <a style="color: red;">${product.proCatalogName}<span>(${product.productNum})</span></a></h3>
						</c:when>
						<c:otherwise>
							<h3>
								<c:if test="${kwd == 'null' }">
		        					<a href="#">${product.proCatalogName}<span>(${product.productNum})</span></a>
		       	 				</c:if>
		       	 				<c:if test="${kwd != 'null' }">
		        					<a href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/<%=encodeKwd2%>/1/1-${product.proCatalogId}-${orderBy}-1-${searchType }/${product.proCatalogId}.html">${product.proCatalogName}<span>(${product.productNum})</span></a>
		       	 				</c:if>
	       	 				</h3>
						</c:otherwise>
					 </c:choose>
			        </c:if>
               </c:forEach>
           </div>
       </div>
       <!--list-Screening end-->
        <!--热销商品 start-->
       <div id="hotProductShow"></div>
	   <!--热销商品 end-->
	   <!-- 促销列表 start -->
	  <jsp:include page="/jsp/view/common/left_promote.jsp"/>
	  <!-- 促销列表 end -->
    </div>
    <!--listpageleft end-->
    <!--listpageright start-->

    <div class="listpageright">
    	<!--相关搜索 start-->
      <div class="listsearchmain">
		  <h5 class="result_info">共搜索到<span style="color: red;"><%=totalHits%></span>条结果,耗时<span style="color: red;"> <%=Double.parseDouble(totalTime) / 1000.0 %></span>秒
		  </h5>
         <ul>
            <li class="listsearchmain-xg">相关搜索：</li>
            <c:if test="${suggestWordList != null }">
	            <c:forEach var="word" items="${suggestWordList }">
	            	<li><a href="${word.url}">${word.word }</a></li>
	            </c:forEach>
	        </c:if>

            <div class="clear"></div>
         </ul>
      </div>
      <!--相关搜索 end-->
     <!--促销活动 促销信息 start -->
	 <jsp:include page="/jsp/view/goods_list/search_promotion_activity.jsp"/>
	 <!--促销活动 促销信息 end -->
     <!-- 商品属性start -->
     <jsp:include page="/jsp/view/goods_list/search_filter_condition.jsp"/>
     <!-- 商品属性end -->
	 <!-- 商品列表 start -->
	 <jsp:include page="/jsp/view/goods_list/search_goods_list.jsp"/>
	<!-- 商品列表 end -->
    </div>
    <!--listpageright end-->
    <div class="clear"></div>
    <!--广告商品 start-->
    <jsp:include page="/recommend/2/2.html" />
    <!--广告商品 end-->
    <jsp:include page="/jsp/view/common/footer_promote.jsp" />
 </div>
</div>
<!-- 列表结束 -->
<div class="clear"></div>
<%
    Cookie[] cookies = request.getCookies();
    String cpsCookie = "";
    if(null != cookies)
    {
    	for (int i = 0; i < cookies.length; i++){
   		  if (cookies[i].getName().equals("cpsSource")){
   			  cpsCookie = cookies[i].getValue();
   			  break;
   		  }
   		}
    }
	
 %>
<c:set var="cpsName" value="<%=cpsCookie %>"/>
<c:if test="${cpsName == 'haoye'}">
<!--好耶代码开始 iDigger Tracking Codes-->
<script type="text/javascript">
	var idgJsHost = (("https:" == document.location.protocol) ? "https" : "http");
  	var idgDomain = idgJsHost == "http" ? "1" : "2";
  	document.write(unescape("%3Cscript src='" + idgJsHost + "://" + idgDomain + ".allyes.com.cn/idigger.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	try {
  		var idgTracker = _alysP.init("ifc","T-000045-01", "");
  		idgTracker._setTrackPath(idgJsHost + '://idigger.allyes.com/main/adftrack');
  		var s={};
   		s.keywords="${keyword2}";      //搜索关键词传入变量
   		s.userid="${sessionScope.memberId}";   // 注册用户ID - 示例 - s.userid="user1"; 
  		idgTracker._setECM(s);      
  		idgTracker._trackPoint();
	} catch(err) {}
</script>
<!--好耶代码结束iDigger Tracking Codes-->
</c:if>
<!--footer -->
<%@include file="/jsp/home_v1/footer.jsp" %>
<!-- body  end -->