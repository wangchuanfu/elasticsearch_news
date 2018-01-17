<%@ page contentType="text/html;charset=UTF-8"%>

<c:if test="${sessionScope.fromSite eq 'mediav' }">
<script type="text/javascript">
var _mvq = _mvq || [];
_mvq.push(['$setAccount', 'm-26156-0']);

_mvq.push(['$setGeneral', 'ordercreate', '', /*用户名*/ '${sessionScope.loginName}', /*用户id*/ '${sessionScope.memberId}']);
_mvq.push(['$logConversion']);
_mvq.push(['$addOrder',/*订单号*/ '${orderId}', /*订单金额*/ '${orderPrice}']);
<c:forEach var = "item" items = "${goodsList}" varStatus = "v">
_mvq.push(['$addItem', /*订单号*/ '${orderId}', /*商品id*/ '${item.goodsId }', /*商品名称*/ '${item.goodsName }', /*商品价格*/ '${item.finalPrice }', /*商品数量*/ '${item.orderAmount }', /*商品页url*/ '', /*商品页图片url*/ '']);
</c:forEach>
_mvq.push(['$logData']);
</script>
</c:if>

 <%
    Cookie[] cookies = request.getCookies();
    String cpsCookie = "";
	for (int i = 0; i < cookies.length; i++){
	  if (cookies[i].getName().equals("cpsSource")){
		  cpsCookie = cookies[i].getValue();
		  break;
	  }
	}
 %>
<c:set var="cpsName" value="<%=cpsCookie %>"/>
<c:if test="${cpsName == 'haoye' && orderId!=''}">
<!--好耶代码开始 iDigger Tracking Codes-->
<script type="text/javascript">
  	var host = (("https:" == document.location.protocol) ? "https" : "http");
  	var idgDomain = host == "http" ? "1" : "2";
  	document.write(unescape("%3Cscript src='" + host + "://" + idgDomain + ".allyes.com.cn/idigger.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	var ids="";
	<c:forEach var = "item" items = "${goodsList}" varStatus = "v">
		ids=ids+${item.goodsId }+"|";
	</c:forEach>
 	var s={};
 	s.orderid="${orderId}";     // 订单id 
 	s.ordermoney="${orderPrice}";    // 订单金额
 	s.orderproductlist=ids.substring(0, ids.lastIndexOf("|"));        //订单内商品id，多个商品id之间用“|”分割
 	s.orderstatus=1;                //  订单付款状态1：未付款，2：已付款
 	s.userid="${sessionScope.memberId}";      // 注册用户ID - 示例 - s.userid="user1"; 
</script>
<script type="text/javascript">
	try {
  		var idgTracker = _alysP.init("ifc","T-000045-01", "");
  		idgTracker._setTrackPath(host + '://idigger.allyes.com/main/adftrack');
  		idgTracker._setECM(s);
  		idgTracker._trackPoint();
  		idgTracker._trackEvent('$conversion', "下单" , "${orderId}" ,  "${orderPrice}" ) ;
	} catch(err) {}
</script>
<!--好耶代码结束iDigger Tracking Codes-->
</c:if>
<c:if test="${sessionScope.fromSite eq 'behe' }">
<!-- 璧合代码开始 -->
<script type="text/javascript">
	var _hdspq = _hdspq || [];
	_hdspq.push(['_setVars', '781']);
	(function() {
		var hda = document.createElement('script'); hda.type = 'text/javascript'; hda.async = true;
		hda.src = 'http://v.behe.com/tracker/tk.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(hda, s);
	})();
</script>
<!-- 璧合代码结束 -->
</c:if>

<c:if test="${sessionScope.fromSite eq 'Vizury' }">
<!-- Vizury代码开始 -->
<script type="text/javascript">
var ids="orderid="+${orderId}+"&orderprice="+${orderPrice}+"&";
var count;
<c:forEach var = "item" items = "${goodsList}" varStatus = "v">
	count="${v.count}";
	<c:if test="${v.count<4}">
		ids=ids+"pid"+count+"="+${item.goodsId}+"&catid"+count+"=&quantity"+count+"="+${item.orderAmount}+"&price"+count+"="+${item.finalPrice}+"&";
	</c:if>
</c:forEach>

function create() {
    try {
        var baseURL = "http://serv3.vizury.com/analyze/analyze.php?account_id=VIZVRM1375&param=e500&"+ids+"currency=&section=1&level=1";

        var analyze = document.createElement("iframe");
        analyze.src = baseURL;
        analyze.scrolling = "no";
        analyze.width = 1;
        analyze.height = 1;
        analyze.marginheight = 0;
        analyze.marginwidth = 0;
        analyze.frameborder = 0;
        var node = document.getElementsByTagName("script")[0];
        node.parentNode.insertBefore(analyze, node);
    } catch (i) {
    }
}
var existing = window.onload;
window.onload = function() {
    if (existing) {
        existing();
    }
    create();
}
</script>
<!-- Vizury代码结束 -->
</c:if>

<c:if test="${sessionScope.fromSite eq 'adchina' }">
<!-- 易传媒码开始-->
<script type="text/javascript">
	ACTrackerz.track({
		type: "transaction", 
		orderId: "${orderId}", 
		total: "${orderPrice}", 
		checkout: "", 
		shipping: "", 
		tax: "", 
		city: "", 
		state: "", 
		country: "",
		store: "", 
		payment: "", 
		platform : "", 
		uid: "${sessionScope.memberId}"});
	<c:forEach var = "item" items = "${goodsList}" varStatus = "v">
		ACTrackerz.track({
			type: "item", 
			orderId: "${orderId}", 
			sku: "${item.goodsNo}", 
			price: "${item.finalPrice}", 
			quantity: "${item.orderAmount}",
			product: "${item.goodsName}", 
			category: "${item.proCatalogId}",
			brand: "", 
			pid: "${item.goodsId}"}); 
	</c:forEach>
</script>
<!-- 易传媒代码结束-->
</c:if>
