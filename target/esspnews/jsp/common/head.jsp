<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<script src="<%=WebURLParams.CJ_URL %>/js/common/FixedKF.js" type="text/javascript"></script>
<link href="<%=WebURLParams.CJ_URL %>/css/home/common2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/member/show_sso_login_window.js"></script>
<script type="text/javascript">
$(function(){
	$("#searchInput").autopoint({url:"<%=WebURLParams.HOME_PAGE_URL %>/PortalSearchKeyword/findSearchPromotList.html"});
});
function setKeyword(keyword){
	$("#searchInput").val(keyword);
	search();
}
function clearValue(){
	var word = $('#searchInput').attr("value");
	if(word=="请输入关键字:商品名或症状或疾病名"){
		$('#searchInput').attr('value','');
	}
} 
function search(){
	var keyword = $.trim($("#searchInput").val());
	if(keyword==""||keyword=="请输入关键字:商品名或症状或疾病名"){
		showAlert("请输入您要查找的关键词!");
		return;
	}else{
		$("#keywordHid").attr("value",keyword); 
		window.location.href = "http://localhost:8082/j1search"+"/0089x/"+encodeURI(encodeURI(keyword))+"/1/1-0-0-1.html";
	}
}
function addfavorite()
{
   if (document.all)
   {
      window.external.addFavorite('https://www.j1.com','健一网');
   }
   else if (window.sidebar)
   {
      window.sidebar.addPanel('健一网', 'https://www.j1.com', "");
   }
} 
</script>
<div id="pagement">
	<div id="topbar">
    	 <div id="topbar-wrap">
   		 <div id="headerbar">
            <span>您好! &nbsp;欢迎光临 健一网 健康商城！ [<a  target="_blank" href="https://www.j1.com/login.html">登录</a>] [<a  target="_blank" href="https://www.j1.com/register.html">免费注册</a>]</span>
            <span><a href="#" ><img src="https://img.j1.com/images/qq_login.gif" width="93" onclick="openQQLoginWindow();" height="19" alt="用QQ账号登录" /></a></span>
            <span><a href="#" ><img src="https://img.j1.com/images/zhifubao_login.gif" onclick="openAlipayLoginWindow();" width="73" height="19" alt="支付宝登录" /></a></span>
		 </div>
         <div id="headerbar_right"><a  target="_blank" href="https://www.j1.com/myec/orderChange.html">我的健一</a> | <a  target="_blank" href="https://www.j1.com/myec/orderChange.html">我的订单</a>| <a href="javascript:addfavorite();">收藏本站</a>| <a  target="_blank" href="http://e.weibo.com/jianyiwang?ref=http%3A//weibo.com/boreen">+新浪微博</a></div>
         <div class="clear"></div>
         <div id="header">
            <br style="line-height:10px;" />
		    <div class="advertising-50" style="display:none;"><a  target="_blank" href="#"><img src="https://img.j1.com/images/1339139666874.jpg" /></a></div>
			<div class="clear"></div>
			<div class="logo"><a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/"><img src="https://img.j1.com/images/logo.gif" alt="健一网网上药店" border="0" /></a></div>
			<div class="top-right">
			  <div id="search">
					<div class="search">
						<input type="text" class="search-input" id="searchInput" value=<c:if test="${searchKeyword!=null}">${searchKeyword}</c:if><c:if test="${searchKeyword==null}">"请输入关键字:商品名或症状或疾病名"</c:if>
							onclick="clearValue();"  
							onkeydown="bindEnter(event,function(){search();})"/>
						<input name="" type="button" class="search-btn" onclick="search();"/>
					</div>
                    
					<div class="key-word"><a  target="_blank" href="<%=WebURLParams.SEARCH_PAGE_URL %>/s/%25E4%25B8%2587%25E8%2589%25BE%25E5%258F%25AF/1/1-0-0-1.html">万艾可</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/jianyi/00889x/%25E5%25B8%258C%25E7%2588%25B1%25E5%258A%259B/1-0-0-1.html">希爱力</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/43325-53271.html">阿卡波糖片</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/42354-42354.html">达美康</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/43649-43649.html">贺普丁</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/42286-55292.html">络活喜</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/42354-42354.html">达美康</a>&nbsp;<a  target="_blank" href="<%=WebURLParams.ITEM_PAGE_URL %>/product/44034-56009.html">雅塑</a></div>
			  </div>
				<div class="about-us">
                <div class="lx-phone">
				<a  target="_blank" href="http://chat.53kf.com/webCompany.php?arg=joyi365&amp;style=1&amp;keyword=http%3A//www.j1.com/&amp;kf=">药师在线</a>
				<a  target="_blank" href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4006070365&amp;cref=file%3A%2F%2F%2FC%3A%2FDocuments%2520and%2520Settings%2FAdministrator%2F%25E6%25A1%258C%25E9%259D%25A2%2FUntitled-1.html&amp;ref=undefined&amp;pt=undefined&amp;f=1&amp;ty=1&amp;ap=&amp;as=&amp;aty=0&amp;a=&amp;dm=undefined&amp;sv=4&amp;sp=">QQ咨询</a></div>
				<div class="hotline-top"><img src="https://img.j1.com/images/icon_phone.gif" width="13" height="16" />全国热线&nbsp;<span style="font-size:12px; font-weight:normal;">免长途费</span>&nbsp;<span>400-821-3131</span></div>
			  </div>
			</div>	
		</div>
         </div>       
    </div>
    <div class="clear"></div>
    <br style="line-height:5px;" />
    <div id="navbar">
    <div id="nav">
				<div class="nav-classification"><a  target="_blank" href="#">商品分类</a></div>
				<ul>
					<li><a  target="_blank" href="https://www.j1.com/" class="select">首页</a></li>
					<!-- <li><a  target="_blank" href="https://www.j1.com/promotion_beat.html">促销抢鲜</a></li>  -->
					<li><a  target="_blank" href="https://jp.j1.com/">精品会</a></li>
					<li><a  target="_blank" href="http://zx.j1.com/">健康资讯</a></li>
                    <li><a  target="_blank" href="http://zx.j1.com/ask/">专家问答</a></li>
				</ul>
                <div id="shopcart">
                <div id="shopcart-left"><span id="cartSpan">购物车</span>&nbsp;<a id="cartCount" href="<%=WebURLParams.HOME_PAGE_URL %>/shopcart.html?time=<%=System.currentTimeMillis()%>"><strong>0</strong>件</a></div>
                <div id="shopcart-go"><a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/myec/confirm.html"><img src="https://img.j1.com/images/shopcart_go.gif" width="62" height="26" alt="去结算" /></a></div>
                </div>
			</div>
      </div>
