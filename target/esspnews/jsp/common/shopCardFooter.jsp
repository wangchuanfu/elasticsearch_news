<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<script type="text/javascript">
window["_BFD"] = window["_BFD"] || {};
_BFD.client_id = "Ctest_jianyi";
_BFD.script = document.createElement("script");
_BFD.script.type = "text/javascript";
_BFD.script.async = true;
_BFD.script.charset = "utf-8";
_BFD.script.src = (('https:' == document.location.protocol?'https://ssl-static1':'http://static1')+'.baifendian.com/service/jianyiwang/jianyiwang.js');
document.getElementsByTagName("head")[0].appendChild(_BFD.script);
</script> 
	<div id="shopcart-footer">
			<div style="width:1000px;margin:0 auto">
<br style="line-height:10px" /> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:20px; text-align:center;font-size: 12px">
  <tr>
    <td><a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">互联网药品交易服务资格证书</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">药品经营许可证</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">互联网药品信息服务资格证书</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">食品流通许可证</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">医疗器械经营企业许可证</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">药品经营质量管理规范认证证书（新）</a><br />
    <a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">互联网医疗保健信息服务审核同意书</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">信用资质等级评定</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">信用资质等级证书</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">企业法人营业执照</a>&nbsp;&nbsp;<a  target="_blank" href="<%=WebURLParams.HOME_PAGE_URL %>/news-help-40.html">税务登记证</a><br>
    j1.com All rights reserved     沪ICP备09007253号</td>
  </tr>
</table>
			</div>
		</div>
<!--footer结束-->
</div>
<div style="display: none;">
	<%@include file="/jsp/common/google_analytics.jsp" %>
</div>
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
</body>
</html>