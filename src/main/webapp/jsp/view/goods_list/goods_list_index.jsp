<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="com.huayuan.search.core.common.page.PageImpl"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/jsp/common/taglibs.jsp">
	<jsp:param value="_goods_list" name="seoPageSufix" />
</jsp:include>
<!--<link href="https://cj.j1.com/css/view/2list.css" rel="stylesheet" type="text/css" />-->
<link href="http://localhost:8082/j1search/css/product2.css" rel="stylesheet" type="text/css" />
<link href="http://localhost:8082/j1search/css/view/2list.css" rel="stylesheet" type="text/css" />
<jsp:include page="/jsp/home_v1/header.jsp" />
<jsp:include page="/jsp/home_v1/tool.jsp" />
<c:set var="catalogId" value="${catalog.proCatalogId}" />
<!-- 列表开始 -->
<div id="listpagecontainer">
	<div id="listpagecontent">
		<div class=detailnav>
			<SPAN><A href="${ctx}/">健一网首页</A></SPAN> <SPAN class=arrow>&gt;</SPAN><c:if test="${!empty  topName}">&nbsp;<a href="<%=WebURLParams.LIST_PAGE_URL %>/p-${topCId }${requestInfo }.html" target="_blank">${topName }</a>&nbsp;&gt;&nbsp;</c:if>
			<c:if test="${catalog.proCatalogLevel eq 2 }">
				<SPAN><A href="<%=WebURLParams.LIST_PAGE_URL %>/p-${secId }${requestInfo }.html">${secName}</A></SPAN>
				<SPAN class=arrow>&gt;</SPAN>
				<strong class="detailnav_h1">${catalog.proCatalogName }</strong>
			</c:if>
			<c:if test="${catalog.proCatalogLevel ne 2 }">
				<SPAN>${secName }</SPAN>
			</c:if>
		</div>
		<!--listpageleft start-->
		<div class="listpageleft">
			<!--list-Screening start-->
			<div class="list-Screening">
				<div class="list_h1">${empty secName?topName:secName }</div>
				<div class="listpageChooseBox"><input type="hidden" id="noticeGoodsIdHidden"/><input type="hidden" id="noticeProductIdHidden"/><input type="hidden" id="goodsNoHidden"/>
					<c:forEach items="${navList}" var="thdCata">
						<c:choose>
							<c:when test="${thdCata.proCatalogId eq catalog.proCatalogId }">
								<h3>
									<a style="color: #c40000">${thdCata.proCatalogName }</a><span></span>
								</h3>
							</c:when>
							<c:otherwise>
								<h3>
									<a href="<%=WebURLParams.LIST_PAGE_URL %>/p-${thdCata.proCatalogId }${requestInfo }.html">${thdCata.proCatalogName }<span></span>
									</a>
								</h3>
							</c:otherwise>
						</c:choose>
						<ul>
							<li></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<!--list-Screening end-->
			<!--排行榜 start （原有的热销商品）-->
			<div id="billboard"></div>
			<!--排行榜 end （原有的热销商品）-->
			<!-- 同类商品推荐st -->
			<div >
				<jsp:include page="/similarGoodsRec/${catalog.proCatalogId}.html"></jsp:include>
			</div>
			<!-- 同类商品推荐ed -->
			<!-- ##########################   左边        ############################### -->
			<jsp:include page="/recommend/2/1.html" />
			<!-- 推广商品end -->
			<!--热门搜索 start-->
			<div class="list-Screening">
				<strong>热门搜索</strong>
				<jsp:include page="/recommend/1/1.html" />
			</div>
			<!--热门搜索 end-->
			<!--常见病例 start-->
			<div class="list-Screening">
				<strong>常见病例</strong>
				<jsp:include page="/recommend/getThreeCatalog/${catalog.proCatalogId}.html" />
			</div>
			<!--常见病例 end-->
			<!--常见症状 start-->
			<div class="list-Screening">
				<strong>常见症状</strong>
				<jsp:include page="/recommend/1/3.html" />
			</div>
			<!--常见症状 end-->
			<!--推广图片链接 start-->
			<div class="listleft-tj">
				<a target="_blank" href="http://dongeejiao.j1.com/"><img width="205" height="260" alt="" src="https://img.j1.com/images/newdetail_left-ad02.jpg"></a>
			</div>
			<div class="listleft-tj">
				<a target="_blank" href="https://www.j1.com/activity/xtyppg.html"><img width="205" height="260" alt="" src="https://img.j1.com/images/newdetail_left-ad04.jpg"></a>
			</div>
			<div class="listleft-tj">
				<a target="_blank" href="https://www.j1.com/activity/xyj311.html"><img width="205" height="260" alt="" src="https://img.j1.com/images/newdetail_left-ad03.jpg"></a>
			</div>
			<!--推广图片链接 end-->
			<!-- ############################   左边        ############################# -->
			<!-- 促销列表 end -->
		</div>
		<!--listpageleft end-->
		<!--listpageright start-->
		<div class="listpageright">
			<!-- 相关推荐 -->
			<jsp:include page="/plist/catalogSuggest.html?catalogId=${catalog.proCatalogId }"/>
			<!--促销活动 促销信息 -->
			<jsp:include page="/plist/promotionGoods.html?catalogId=${catalog.proCatalogId }"/>
			<!--排序-->
			<!-- 商品属性 -->
			<jsp:include page="/filterCondition/${catalog.proCatalogId }${requestInfo }.html" />
			<!-- 商品属性  end-->
			<!-- 商品列表 start -->
			<jsp:include page="/plist/${catalog.proCatalogId }${requestInfo }/p=${pageNum }.html">
				<jsp:param value="${orderBy }" name="orderBy" />
			</jsp:include>
			<!-- 商品列表 end -->
		</div>
		<c:if test="${hotProductList != '[]'}">
			<div id="hotProductHid" style="display: none;">
				<jsp:include page="/jsp/view/goods_list/hot_sale_product.jsp" />
			</div>
			<script type="text/javascript">
				function initHotProduct() {
					$("#billboard").html($("#hotProductHid").html());
				}
				initHotProduct();
			</script>
		</c:if>
		<!--listpageright end-->
		<div class="clear"></div>
		<!--广告商品 start-->
		<jsp:include page="/recommend/2/2.html" />
		<!--广告商品 end-->
		<!--猜你喜欢start-->
<!-- 		<div class="list_recommed"> -->
<!-- 			<h2>猜您喜欢</h2> -->
<!-- 			<div class="listsearchfull"> -->
<!-- 				<div class="listsearch-one"> -->
<!-- 					<div class="listsearch-ztimg"> -->
<%-- 						<center> --%>
<!-- 							<a rel="nofollow" target="_blank" href="/ec-web/product/44470-55057.html"> <img width="200" height="200" alt="酷柏Frequency38半年抛隐形眼镜2片装" onerror="dealwithErrImg(event)" src="https://img01.j1.com/upload/goods/138-138/44470_0.jpg"> -->
<!-- 							</a> -->
<%-- 						</center> --%>
<!-- 					</div> -->
<!-- 					<div class="listsearch-cx"> -->
<!-- 						<a target="_blank" href="">红字促销语红字促销语红字促销语红字促销语</a> -->
<!-- 					</div> -->
<!-- 					<div class="listsearch-mc"> -->
<!-- 						<a title="全球第三大隐形品牌，佩戴舒适，提供自然湿润" target="_blank" href="/ec-web/product/44470-55057.html"> 酷柏Frequency38半年抛隐形眼镜2片装<b></b> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="listsearch-ms">
<!-- 			              	<span class="orange" style="font-weight: bold;"> -->
<!-- 		              			</span> -->
<!-- 			              </div> --> 
<!-- 					<div class="listsearch-price"> -->
<%-- 						<cite>直降</cite><cite>满赠</cite> <span class="liststyle2">¥128.00</span> <span class="liststyle1">¥128.00</span> --%>
<!-- 					</div> -->
<!-- 					<div class="listsearch-des"> -->
<!-- 						<span>总销量：3804</span><a href="" class="">1901条评论</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!--猜你喜欢end-->
		<!-- ########################   底部链接       ############################ -->
		<div class="listlink">
			<ul>
				<li class="listdh">站内导航：</li>
				<jsp:include page="/recommend/1/4.html" />
				<div class="clear"></div>
			</ul>
			<ul>
				<li class="listdh">专科用药：</li>
				<jsp:include page="/recommend/1/5.html" />
				<div class="clear"></div>
			</ul>
			<ul>
				<li class="listdh">分&nbsp;&nbsp;&nbsp;&nbsp;类：</li>
				<jsp:include page="/recommend/getTwoCatalog/${catalog.proCatalogId}.html" />
				<div class="clear"></div>
			</ul>
		</div>
		<div class="list_recommed">
			<h2>相关品牌推荐</h2>
			<div class="listerrorad">
				<a href="https://www.j1.com/p-11000-2515.html"><img alt="三九" src="https://img.j1.com/images/images1308/error/lg_01.gif"></a> <a href="https://www.j1.com/p-11000-2535.html"><img alt="中美史克" src="https://img.j1.com/images/images1308/error/lg_02.gif"></a> <a href="https://www.j1.com/p-11000-2823.html"><img alt="西安杨森" src="https://img.j1.com/images/images1308/error/lg_03.gif"></a> <a href="https://www.j1.com/p-11000-2545.html"><img alt="惠氏" src="https://img.j1.com/images/images1308/error/lg_04.gif"></a> <a href="https://www.j1.com/p-11000-2533.html"><img alt="云南白药" src="https://img.j1.com/images/images1308/error/lg_05.gif"></a> <a href="https://www.j1.com/p-15200-2579.html"><img alt="欧姆龙" src="https://img.j1.com/images/images1308/error/lg_06.gif"></a> <a
					href="https://www.j1.com/p-15200-2589.html"><img alt="三诺" src="https://img.j1.com/images/images1308/error/lg_07.gif"></a> <a href="https://www.j1.com/p-15200-2657.html"><img alt="雅培" src="https://img.j1.com/images/images1308/error/lg_08.gif"></a> <a href="https://www.j1.com/p-16100-2659.html"><img alt="美素佳儿" src="https://img.j1.com/images/images1308/error/lg_09.gif"></a> <a href="https://www.j1.com/p-16100-3689.html"><img alt="雀巢" src="https://img.j1.com/images/images1308/error/lg_10.gif"></a> <a href="https://www.j1.com/%25E6%25B1%25A4%25E8%2587%25A3%25E5%2580%258D%25E5%2581%25A5/1/1-0-0-1/ss.html"><img alt="汤成倍健" src="https://img.j1.com/images/images1308/error/lg_11.gif"></a> <a
					href="https://www.j1.com/%25E5%2585%25BB%25E7%2594%259F%25E5%25A0%2582/1/1-0-0-1/ss.html"><img alt="养生堂" src="https://img.j1.com/images/images1308/error/lg_12.gif"></a> <a href="https://www.j1.com/%25E5%2596%2584%25E5%25AD%2598/1/1-0-0-1/ss.html"><img alt="善存" src="https://img.j1.com/images/images1308/error/lg_13.gif"></a> <a href="https://www.j1.com/%25E5%2586%25AC%25E9%2598%25BF%25E9%2598%25BF%25E8%2583%25B6/1/1-31183-0-1/31183.html"><img alt="东阿阿胶" src="https://img.j1.com/images/images1308/error/lg_14.gif"></a> <a href="https://www.j1.com/p-18100-2611.html"><img alt="杜蕾斯" src="https://img.j1.com/images/images1308/error/lg_15.gif"></a> <a href="https://www.j1.com/p-18100-2615.html"><img alt="杰士邦" src="https://img.j1.com/images/images1308/error/lg_16.gif"></a> <a
					href="https://www.j1.com/p-4774.html"><img alt="博士伦" src="https://img.j1.com/images/images1308/error/lg_17.gif"></a> <a href="https://www.j1.com/p-4704.html"><img alt="海昌" src="https://img.j1.com/images/images1308/error/lg_18.gif"></a> <a href="https://www.j1.com/p-11000-2515.html"><img alt="三九" src="https://img.j1.com/images/images1308/error/lg_01.gif"></a> <a href="https://www.j1.com/p-11000-2535.html"><img alt="中美史克" src="https://img.j1.com/images/images1308/error/lg_02.gif"></a>
			</div>
		</div>
	</div>
</div>
<!-- 列表结束 -->

<!-- 到货通知 start -->
<script type="text/javascript" src="https://cj.j1.com/js/common/commonArrivalNotice.js"></script>
<div id="dhtzsubmit" style="display: none">
	<div style="background: #000; filter: alpha(opacity =           40); opacity: 0.4; -moz-opacity: 0.4; width: 100%; height: 100%; position: fixed; _position: absolute; left: 0px; top: 0px; z-index: 999998;"></div>
	<div style="width: 600px; overflow: visible; border: 2px solid rgb(196, 0, 0); background: none repeat scroll 0% 0% rgb(255, 255, 255); left: 50%; top: 45%; z-index: 999999; display: block; margin-left: -300px;" class="white_content">
		<div style="height: 30px; line-height: 30px; background: #c40000; padding: 2px; width: 597px;">
			<cite class="fl addcart_title">预定成功</cite> <a class="fr addcart_close" onclick="document.getElementById('dhtzsubmit').style.display='none';" href="#"><img alt="关闭" src="https://img.j1.com/images/sc_icon_bg_4.png"></a>
		</div>
		<div class="bookok" id="bookok">
			<span>预定成功，到货后我们将尽快给您回复！</span>
		</div>
	</div>
</div>
<div id="dhtz" style="display: none">
			<div style="background: #000; filter: alpha(opacity =         40); opacity: 0.4; -moz-opacity: 0.4; width: 100%; height: 100%; position: fixed; _position: absolute; left: 0px; top: 0px; z-index: 999998;"></div>
			<div style="width: 600px; overflow: visible; border: 2px solid rgb(196, 0, 0); background: none repeat scroll 0% 0% rgb(255, 255, 255); left: 50%; top: 50%; z-index: 999999; display: block; margin-left: -300px; margin-top: -198px" class="white_content">
				<div style="height: 30px; line-height: 30px; background: #c40000; padding: 2px; width: 597px;">
					<cite class="fl addcart_title">到货通知</cite> <a class="fr addcart_close" onclick="document.getElementById('dhtz').style.display='none';" href="#"><img alt="关闭" src="https://img.j1.com/images/sc_icon_bg_4.png"></a>
				</div>
				<p>您所需要的商品因热销导致暂无库存，请留下您的联系方式，我们将为您全力采购。</p>
				<div style="width: 460px;" class="reservation_cont" style="display:none">
					<dl class="clearfix">
						<dt class="label">
							<span>*</span>预定数量：
						</dt>
						<dd class="field">
							<input type="text" id="txtNum" name="txtNum" onblur="checkBuyNum()" onfocus="clearCss('numtip')">
						</dd>
						<dd class="prompt">
							<b id="numtip" class="onShow">请输入数量</b>
						</dd>
					</dl>
					<dl class="clearfix">
						<dt class="label">
							<span>*</span>姓名：
						</dt>
						<dd class="field">
							<input type="text" id="txtName" name="txtName" onblur="checkName()" onfocus="clearCss('nametip')">
						</dd>
						<dd class="prompt">
							<b id="nametip" class="onShow">请输入姓名</b>
						</dd>
					</dl>
					<dl class="clearfix">
						<dt class="label">
							<span>*</span>手机号码：
						</dt>
						<dd class="field">
							<input type="text" id="txtMobile" name="txtMobile" onblur="checkMobile()" onfocus="clearCss('mobiletip')">
						</dd>
						<dd class="prompt">
							<b id="mobiletip" class="onShow">请输入手机号</b>
						</dd>
					</dl>
					<dl class="message">
						<dt class="label">留言：</dt>
						<dd style="width: 160px" class="field">
							<textarea id="txtMessage" cols="25" rows="5" name="txtMessage" onblur="checkMessage()" onfocus="clearCss('msgtip')"></textarea>
						</dd>
						<dd class="prompt">
							<b id="msgtip" class="onShow"></b>
						</dd>
					</dl>
					<dl>
						<dt class="label">
							<span>*</span>验证码：
						</dt>
						<dd class="field">
							<input type="text" maxlength="4" name="keywordNotice" id="keywordNotice" class="an1" onblur="checkKeyword()" onfocus="clearCss('keywordtip')">
						</dd>
						<dd class="prompt">
							<img id="vcodeimg" style="width: 60px; height: 24px; *float: left;" class="focus" src="${ctx }/system/keyword.html" alt="点击换一张" onclick="freshCode();return false;">&nbsp; <a style="color: #14a0cd; text-decoration: underline;" id="linkvcode" href="javascript:void(0);" onclick="freshCode();return false;">换一张</a> <b id="keywordtip" class="onShow"></b>
						</dd>
					</dl>
					<div>
						<input type="button" id="btnSave" value="确 定" class="yes bg_icon2 txt_02" onclick="saveArrivalNotice()"> <input type="reset" value="重 置" onclick="arrivalNoticeReset()" class="reset bg_icon2 txt_02">
					</div>
				</div>
			</div>
		</div>
<!-- 到货通知 end -->
<div class="clear"></div>
<%
	Cookie[] cookies = request.getCookies();
	String cpsCookie = "";
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("cpsSource")) {
			cpsCookie = cookies[i].getValue();
			break;
		}
	}
%>
<c:set var="cpsName" value="<%=cpsCookie%>" />
<c:if test="${cpsName == 'haoye'}">
	<!--好耶代码开始 iDigger Tracking Codes-->
	<script type="text/javascript">
		var idgJsHost = (("https:" == document.location.protocol) ? "https" : "http");
		var idgDomain = idgJsHost == "http" ? "1" : "2";
		document.write(unescape("%3Cscript src='" + idgJsHost + "://" + idgDomain + ".allyes.com.cn/idigger.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		try {
			var idgTracker = _alysP.init("ifc", "T-000045-01", "");
			idgTracker._setTrackPath(idgJsHost + '://idigger.allyes.com/main/adftrack');
			var s = {};
			s.userid = "${sessionScope.memberId}"; // 注册用户ID - 示例 - s.userid="user1"; 
			idgTracker._setECM(s);
			idgTracker._trackPoint();
		} catch (err) {
		}
	</script>
	<!--好耶代码结束iDigger Tracking Codes-->
</c:if>
<!--footer -->
<%@include file="/jsp/home_v1/footer.jsp"%>
<!-- body  end -->