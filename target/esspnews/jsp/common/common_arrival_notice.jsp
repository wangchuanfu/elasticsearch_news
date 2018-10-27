<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<link href="<%=WebURLParams.HOME_PAGE_URL %>/css/product2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/common/commonArrivalNotice.js"></script>
<input type="hidden" id="noticeGoodsIdHidden" /><input type="hidden" id="noticeProductIdHidden" /><input type="hidden" id="goodsNoHidden" />
<!-- 到货通知 start -->
<div id="dhtzsubmit" class="dhtzsubmit" style="display: none">
	<div style="background: #000; filter: alpha(opacity =           40); opacity: 0.4; -moz-opacity: 0.4; width: 100%; height: 100%; position: fixed; _position: absolute; left: 0px; top: 0px; z-index: 999998;"></div>
	<div style="width: 600px; overflow: visible; border: 5px solid #AEAEAE; background: none repeat scroll 0% 0% rgb(255, 255, 255); left: 50%; top: 45%; z-index: 999999; display: block; margin-left: -300px;" class="white_content">
		<div style="height: 30px; line-height: 30px; background: #c40000; padding: 2px; width: 597px;">
			<cite class="fl addcart_title">预定成功</cite> <a class="fr addcart_close" onclick="document.getElementById('dhtzsubmit').style.display='none';" href="#"><img alt="关闭" src="https://img.j1.com/images/sc_icon_bg_4.png"></a>
		</div>
		<div class="bookok" id="bookok">
			<span>预定成功，到货后我们将尽快给您回复！</span>
		</div>
	</div>
</div>
<div id="dhtz" class="dhtz" style="display: none" >
			<div style="background: #000; filter: alpha(opacity =         40); opacity: 0.4; -moz-opacity: 0.4; width: 100%; height: 100%; position: fixed; _position: absolute; left: 0px; top: 0px; z-index: 999998;"></div>
			<div style="width: 600px; overflow: visible; border: 5px solid #AEAEAE; background: none repeat scroll 0% 0% rgb(255, 255, 255); left: 50%; top: 50%; z-index: 999999; display: block; margin-left: -300px; margin-top: -198px" class="white_content">
				<div style="height: 30px; line-height: 30px; background: #c40000; padding: 2px; width: 597px;">
					<cite class="fl addcart_title">到货通知</cite> <a class="fr addcart_close" onclick="document.getElementById('dhtz').style.display='none';" href="#"><img alt="关闭" src="https://img.j1.com/images/sc_icon_bg_4.png"></a>
				</div>
				<p>您所需要的商品因热销导致暂无库存，请留下您的联系方式，我们将为您全力采购。</p>
				<div style="width: 520px;" class="reservation_cont" style="display:none">
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
						<dd style="width: 345px" class="field">
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
						<dd class="field dun">
							<input type="text" maxlength="4" name="keywordNotice" id="keywordNotice" class="an1" onblur="checkKeyword()" onfocus="clearCss('keywordtip')">
						</dd>
						<dd class="prompt">
							<img id="vcodeimg" style="width: 60px; height: 24px; *float: left;" class="focus" src="<%=WebURLParams.HOME_PAGE_URL %>/system/keyword.html" alt="点击换一张" onclick="freshCode();return false;">&nbsp; <a style="color: #14a0cd; text-decoration: underline;" id="linkvcode" href="javascript:void(0);" onclick="freshCode();return false;">换一张</a> <b id="keywordtip" class="onShow"></b>
						</dd>
					</dl>
					<div>
						<input type="button" id="btnSave" value="确 定" class="yes bg_icon2 txt_02" onclick="saveArrivalNotice()"> <input type="reset" value="重 置" onclick="arrivalNoticeReset()" class="reset bg_icon2 txt_02">
					</div>
				</div>
			</div>
		</div>
<!-- 到货通知 end -->