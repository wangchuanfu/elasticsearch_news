<%@ page contentType="text/html;charset=UTF-8"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<img src="https://www.j1.com/do_not_delete/noc.gif" style="display: none;" />
<script type="text/javascript" src="${ctxcj }/js/common/google_analytics.js"></script>
<!--  谷歌代码-->
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	  ga('create', 'UA-51643558-1', 'j1.com');
	  ga('send', 'pageview');
</script>

<script type="text/javascript">
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F63494115ba131fd7290b4f07c7bac19f' type='text/javascript'%3E%3C/script%3E"));
</script>
<c:if test="${sessionScope.fromSite eq 'mediav' }">
	<!-- 聚合代码开始 -->
	<script type="text/javascript">
		var _mvq = window._mvq || [];
		window._mvq = _mvq;
		_mvq.push([ '$setAccount', 'm-26156-0' ]);
		_mvq.push([ '$logConversion' ]);
		(function() {
			var mvl = document.createElement('script');
			mvl.type = 'text/javascript';
			mvl.async = true;
			mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(mvl, s);
		})();
	</script>
	<!-- 聚合代码结束 -->
</c:if>

<c:if test="${sessionScope.fromSite eq 'ka' }">
	<!-- 三九秒针代码开始-->
	<script type="text/javascript">
		var c = document.createElement("script");
		c.type = "text/javascript";
		c.async = true;
		c.src = ("https:" == document.location.protocol ? "https://" : "http://") + "sitemonitor.cn.miaozhen.com/boot/45858";
		var h = document.getElementsByTagName("script")[0];
		h.parentNode.insertBefore(c, h);
	</script>
	<!-- 三九秒针代码结束 -->
</c:if>

<c:if test="${sessionScope.fromSite eq 'Vizury' }">
	<!-- Vizury代码开始 -->
	<script type="text/javascript">
		(function() {
			try {
				var viz = document.createElement("script");
				viz.type = "text/javascript";
				viz.async = true;
				viz.src = ("https:" == document.location.protocol ? "https://ssl.vizury.com" : "http://serv3.vizury.com") + "/analyze/pixel.php?account_id=VIZVRM1375";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(viz, s);
				viz.onload = function() {
					try {
						pixel.parse();
					} catch (i) {
					}
				};
				viz.onreadystatechange = function() {
					if (viz.readyState == "complete" || viz.readyState == "loaded") {
						try {
							pixel.parse();
						} catch (i) {
						}
					}
				};
			} catch (i) {
			}
		})();
	</script>
	<!-- Vizury代码结束 -->
</c:if>

<c:if test="${sessionScope.fromSite eq 'KAnyqwj' }">
	<!-- 秒针代码开始 -->
	<script type="text/javascript">
		(function() {
			var c = document.createElement("script");
			c.type = "text/javascript";
			c.async = true;
			c.src = ("https:" == document.location.protocol ? "https://" : "http://") + "sitemonitor.cn.miaozhen.com/boot/45885";
			var h = document.getElementsByTagName("script")[0];
			h.parentNode.insertBefore(c, h);
		})();
	</script>
	<!-- 秒针代码结束 -->
</c:if>
<c:if test="${sessionScope.fromSite eq 'Kahr' || sessionScope.fromSite eq 'kahrcj' }">
	<!-- 汇仁代码开始 -->
	<script type="text/javascript">
		(function() {
			var c = document.createElement("script");
			c.type = "text/javascript";
			c.async = true;
			c.src = ("https:" == document.location.protocol ? "https://" : "http://") + "sitemonitor.cn.miaozhen.com/boot/45999";
			var h = document.getElementsByTagName("script")[0];
			h.parentNode.insertBefore(c, h);
		})();
	</script>
	<!-- 汇仁代码结束 -->
</c:if>

<!-- 获取用户行为数据代码开始-五味子-->
<script type="text/javascript">
	var _uid = "${sessionScope.memberId}";
	var _oid = "${orderId}";
	(function() { //(function(){})是一个闭包的用法，闭包必定会被调用。

		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.charset = 'UTF-8';
		ga.async = true;//ga.async = true 异步调用外部js文件，即不阻塞浏览器的解析
		ga.src = 'http://ga.j1.com/js/ana.js';
		var s = document.getElementsByTagName('script')[0]; //取得第一个tag名为script的元素
		s.parentNode.insertBefore(ga, s); //在s前添加元素ga
	})();
</script>
<!-- 获取用户行为数据代码结束-五味子-->

<c:if test="${sessionScope.fromSite eq 'adchina' }">
	<!-- 易传媒码开始-->
	<script type="text/javascript">
		ACTrackerz = {
			mid : 500312,
			ers : [ {
				type : "pageview",
				uid : "${sessionScope.memberId}",
				"pid" : ""
			} ],
			track : function(er) {
				this.ers.push(er);
			}
		};
		(function() {
			var js = document.createElement("script"), scri = document.getElementsByTagName("script")[0];
			js.type = "text/javascript";
			js.async = true;
			scri.parentNode.insertBefore(js, scri);
			js.src = location.protocol == "https:" ? "https://secure.acs86.com/nact.js" : "http://static.acs86.com/nact.js";
		})();
	</script>
	<!-- 易传媒代码结束-->
</c:if>

<c:if test="${sessionScope.fromSite eq 'kaxktk'}">
	<!-- 中美史克代码开始 -->
	<script type="text/javascript">
		(function() {
    		var c = document.createElement("script");
    		c.type = "text/javascript";
    		c.async = true;
    		c.src = ("https:" == document.location.protocol ? "https://" : "http://") + "sitemonitor.cn.miaozhen.com/boot/46003";
    		var h = document.getElementsByTagName("script")[0];
    		h.parentNode.insertBefore(c, h);
		})();
	</script>
	<!-- 中美史克代码结束 -->
</c:if>

<!-- Google 再营销代码  -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1002996634;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1002996634/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
 <!-- Google 再营销代码 结束-->
 
