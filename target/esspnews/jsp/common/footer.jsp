<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<%-- <script src="<%=WebURLParams.CJ_URL %>/js/kf.js" type="text/javascript"></script> --%>
<div id="moveHtmlDiv" >
    <!-- 商品分类开始 -->		
	<jsp:include page="/productCatalogCommon/getCatalogHtml.html"/>	
	<!-- 商品分类结束  -->
</div>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/catalog.js"></script>
<jsp:include page="/jsp/common/google_analytics.jsp"/>
<!--footer开始--> 
    <div style="width:1000px; margin:0 auto;"><div id="go-top"><a href="#header">TOP↑</a></div></div>
    <div class="clear"></div>
	<div id="footer">
    <div id="container">
      <div id="footer-contact">
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>订购咨询热线</td>
          </tr>
          <tr>
            <td style="font-size:16px; font-weight:bold; color:#f23201">4007-800-800</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>客服服务时间<br />
              9:00 - 21:30 节假照常</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
           <tr>
            <td><a href="https://www.j1.com/upload/yao/sitemap.html" target="_blank">网站地图</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
          </tr>
        </table>
      </div>
      <div class="foot-list">
					<ul>
							<h3>新手上路</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-21.html" target="_blank" rel="nofollow">免费注册</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-23.html" target="_blank" rel="nofollow">购物流程</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-24.html" target="_blank" rel="nofollow">支付安全</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-25.html" target="_blank" rel="nofollow">安全购药</a></li>
						</ul>
						<ul>
							<h3>关于支付</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-26.html" target="_blank" rel="nofollow">支付方式</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-27.html" target="_blank" rel="nofollow">发票</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-28.html" target="_blank" rel="nofollow">退款</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-62.html" target="_blank" rel="nofollow">优惠券使用</a></li>
						</ul>
						<ul>
							<h3>关于配送</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-29.html" target="_blank" rel="nofollow">配送方式</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-30.html" target="_blank" rel="nofollow">配送费用</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-31.html" target="_blank" rel="nofollow">收货验货</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-32.html" target="_blank" rel="nofollow">到货时间</a></li>
						</ul>
						<ul>
							<h3>售后服务</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-33.html" target="_blank" rel="nofollow">退货服务</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-34.html" target="_blank" rel="nofollow">如何退换货</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-35.html" target="_blank" rel="nofollow">发票票据</a></li>
                            <li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-102.html" target="_blank" rel="nofollow">健一卡须知</a></li>
						</ul>
						<ul>
							<h3>其他</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-36.html" target="_blank" rel="nofollow">会员等级</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-37.html" target="_blank" rel="nofollow">会员积分</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-38.html" target="_blank" rel="nofollow">免责条款</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-39.html" target="_blank" rel="nofollow">投诉与建议</a></li>
						</ul>
						<ul>
							<h3>关于我们</h3>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html" target="_blank" rel="nofollow">关于健一</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-41.html" target="_blank" rel="nofollow">联系我们</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-42.html" target="_blank" rel="nofollow">诚聘英才</a></li>
							<li><a href="<%=WebURLParams.HOME_PAGE_URL %>/link.html" target="_blank" rel="nofollow">友情链接</a></li>
						</ul>
					<div class="clear"></div>
                    <p style="margin-top:10px;"><img src="https://img.j1.com/images/footer-img.jpg" width="1000" height="55" alt="100%正品保证" /></p>
                    <br style="line-height:10px" /> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:20px; text-align:center;">
  <tr>
    <td>
    <p>按字母索引商品：
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-A.html">A</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-B.html">B</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-C.html">C</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-D.html">D</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-E.html">E</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-F.html">F</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-G.html">G</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-H.html">H</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-I.html">I</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-J.html">J</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-K.html">K</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-L.html">L</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-M.html">M</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-N.html">N</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-O.html">O</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-P.html">P</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-Q.html">Q</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-R.html">R</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-S.html">S</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-T.html">T</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-U.html">U</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-V.html">V</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-W.html">W</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-X.html">X</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-Y.html">Y</a>
          <a href="<%=WebURLParams.HOME_PAGE_URL %>/tags-Z.html">Z</a>
        </p>
    </td>
  </tr>
</table>                       
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:20px; text-align:center;">
  <tr>
    <td><a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">互联网药品交易服务资格证书</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">药品经营许可证</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">互联网药品信息服务资格证书</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">食品流通许可证</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">医疗器械经营企业许可证</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">药品经营质量管理规范认证证书（新）</a><br />
    <a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">互联网医疗保健信息服务审核同意书</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">信用资质等级评定</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">信用资质等级证书</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">企业法人营业执照</a>&nbsp;&nbsp;<a  target="_blank" rel="nofollow" href="https://www.j1.com/news-help-40.html">税务登记证</a></td>
  </tr>
</table>
<div class="foot-img">
			<a href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action;jsessionid=ppHpQsvTypTQ8TnpTLhRsLnT9LLX1bxwQDhQTmhfjTnPgT7pypGG!1946552544" target="_blank" rel="nofollow"><img src="https://img.j1.com/images/index_r9_c13.jpg" border="0" /></a>
            <a href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110510115725380" target="_blank" rel="nofollow"><img src="https://img.j1.com/images/index_r9_c17.jpg" border="0" /></a><br />
						j1.com All rights reserved     沪ICP备09007253号
				  </div>
				</div>
    </div>
  </div><!--footer结束--> 
</div><!--pagement结束-->
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=14072815" charset="UTF-8"></script>
</body>
<!--在线客服 begin -->
<div class="kf" id="j1-kf" >
  <div class="kf-list" id="online_kf" style="display:none;">
<div class="kf-title">专业药师咨询</div>
<img src="https://img.j1.com/images/yaoshi.gif" width="104" height="112" alt="专业药师" />
<ul>
<li><a  target="_blank" href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4006070365&cref=file%3A%2F%2F%2FC%3A%2FDocuments%2520and%2520Settings%2FAdministrator%2F%25E6%25A1%258C%25E9%259D%25A2%2FUntitled-1.html&ref=undefined&pt=undefined&f=1&ty=1&ap=&as=&aty=0&a=&dm=undefined&sv=4&sp=">QQ咨询</a></li>
<li><a  target="_blank" href="http://chat.53kf.com/webCompany.php?arg=joyi365&style=1&keyword=http%3A//www.j1.com/&kf=">在线咨询</a></li>
<li><a  target="_blank" href="http://chat.53kf.com/webCompany.php?arg=joyi365&style=1&keyword=http%3A//www.j1.com/&kf=">售后服务</a></li>
</ul>
<br />
<p >全国热线</p>
<p style="color:#f13201; font-weight:bold; font-size:12px; margin-top:5px;">4007-800-800</p>
</div>
  <div id="menu_kf"><img src="https://img.j1.com/images/kf-small.gif" class="press" alt="专业药师咨询"></div>
</div>