$(function (){
	if($.cookie("loginErrNum")!=null){
		var num=$.cookie("loginErrNum");
		if(Number(num)>=3){
			$("#over_login").css("height","450px");
			$("#loginYan").css("display","inline");
			$("#loginYanInput").css("display","inline");
		}else{
			$("#loginYan").css("display","none");
			$("#loginYanInput").css("display","none");
			$("#over_login").css("height","380px");
		}
	}
	if($.cookie("registerErrNum")!=null){
		var registerNum=$.cookie("registerErrNum");
		if(Number(registerNum)>=3){
			$("#over_login").css("height","450px");
			$("#yanzhengma").css("display","inline");
			$("#yanzhengmaInput").css("display","inline");
		}else{
			$("#yanzhengma").css("display","none");
			$("#yanzhengmaInput").css("display","none");
			$("#over_login").css("height","380px");
		}
	}
});
var Urls ="";
/**
 *新版加入购物车的操作js  
 **/
function beginloginrove(Url){
	    Urls =Url;
//	    $.ajax({
//	    	url : homePath+"/loginItem.html",
//	    	type : "get",
//	    	success : function(data){
//	    		$("#miniCC").html(data);
//	    	}
//	    });
	    
	    //覆盖层  
	    var pay_note_body = new LightBox("newover_login");  
	    pay_note_body.Over = true;  //是否启用覆盖层  :true 、 false;  
	    pay_note_body.OverLay.Color = "#000000"; //覆盖层颜色 ，必须启用覆盖层才有作用  
	    pay_note_body.OverLay.Opacity = 60; //覆盖层透明度   
	    pay_note_body.Fixed = true; // 是否定位  
	    pay_note_body.Center = true; //是否居中  
	    $("#newbtn_close").click(function(){  
	        // 关闭覆盖层       
	        pay_note_body.Close(); 
	    });   
	    if($("#newflowName").val() == "" || $("#newflowName").val() == null){ 
			// 弹出覆盖层  
	    	$("#newover_login").show();
	    	//$("#newover_login").style.position="fixed";
			pay_note_body.Show(); 
	    }else{
			  window.location.href = homePath+Urls;
	    }
};

/**
 * yangqiuqin
 * mini登录
 */
function beginlogin(){ 
	var loginBackUrl=window.location.href;
	quickLoginNew(loginBackUrl);
};

/**
 * yangqiuqin
 * mini框注册时验证
 */
function checkMiniRegister(){
	//debugger;
	var protocolMini;
	
	if(document.getElementById("protocolMini").checked){
		protocolMiniValue=document.getElementById("protocolMini").value;
		$("#labelMiniProtocol").text('');
		$("#labelMiniProtocol").removeClass('error');
	}else{
		$("#labelMiniProtocol").text('请接受条款');
		$("#labelMiniProtocol").addClass('error');
		checkMiniUser();
		checkMiniPwd();
		checkMiniRePwd();
		checkMiniYzm("pt");
		checkMiniYzm("mobil");
		return false;
	}
	var a=checkMiniUser();
	var b =checkMiniPwd();
	var c =checkMiniRePwd();
	var d=checkMiniYzm("pt");
	var e=checkMiniYzm("mobil");
	var f =(d || e);
	var g=(a & b & c & f);
	var h= (!g);
	if(!(checkMiniUser() & checkMiniPwd() & checkMiniRePwd() & (checkMiniYzm("pt") || checkMiniYzm("mobil")) & (protocolMiniValue=="1"))){
		return false;
	}
}

/**
 * 光标离开用户名输入框时验证
 * @returns {Boolean}
 */
function checkMiniUser(){
	var username=$.trim($("#miniRegisterName").val());
	if(username==""){
		$("#miniRegisterName").val("请输入邮箱/手机号");
		 $("#miniRegisterName").addClass('text bian-02');
		$("#miniErrorRegisterNameDiv").text("请输入邮箱/手机号");
		$("#miniErrorRegisterNameDiv").show();
		$("#miniErrorRegisterName").addClass('error');
		if($("#miniptyzm").show() || $("#minimobilyzm").show()){
			$("#miniptyzm").show();
			$("#minimobilyzm").hide();
		}
		return false;
	}else if(checkMiniRegisterName(username)!="Y"){
		var mobilReg=/^(13|15|18|14)[0-9]{9}$/;
		var isEmailRXG = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if(mobilReg.test(username)){
			if($("#miniptyzm").show()){
				$("#miniptyzm").hide();
			}
			$("#minimobilyzm").show();
		}else if(isEmailRXG.test(username)){
			if($("#minimobilyzm").show()){
				$("#minimobilyzm").hide();
			}
			$("#miniptyzm").show();
			$("#ministoreemail").val(username);
		}else{
			$("#miniErrorRegisterNameDiv").text("请输入正确的邮箱或手机号！");
			$("#miniErrorRegisterNameDiv").show();
			$("#miniRegisterName").addClass('text bian-02');
			//$("#labelUserName").removeClass('focus error correct');
			$("#miniErrorRegisterName").addClass('error');
			return false;
		}		
		$("#miniErrorRegisterNameDiv").text('');
		$("#miniErrorRegisterNameDiv").show();
		$("#miniErrorRegisterName").addClass('correct');
		return true;
	}else{
		$("#miniErrorRegisterNameDiv").text("该用户名已被注册或已被认证，请重新输入！");
		$("#miniErrorRegisterNameDiv").show();
		$("#miniErrorRegisterName").addClass('error');
		return false;
	}	
}

/**
 * 光标聚焦用户名输入框时的验证
 */
function checkMminiUserOnFocus(){
	//alert($("#miniLoginName").val());
	if($("#miniRegisterName").val()=="请输入邮箱/手机号"){
		$("#miniRegisterName").val('');
	}
	$("#miniRegisterName").removeClass('text bian-02');
	$("#miniRegisterName").addClass('text bian-01');
	$("#miniErrorRegisterNameDiv").text("请输入邮箱/手机号");
	$("#miniErrorRegisterNameDiv").hide();
	$("#miniErrorRegisterName").removeClass('correct');
	$("#miniErrorRegisterName").removeClass('error');
//	$("#miniErrorRegisterName").addClass('focus');
}

/**
 * 光标离开密码框时的验证
 */
function checkMiniPwd(){   
	checkMiniRePwd();
	var password=$("#miniPwd").val();
	var lengthPwd=password.length;
	var pwdReg=/^\d{1,10}$/ ;
	if(password==""){
		$("#miniErrorRegisterPwdDiv").text('请输入密码');
		$("#miniErrorRegisterPwdDiv").show();
		updateCssMini("miniPwd","miniErrorRegisterPwd");
	}else if(pwdReg.test(password)){
		$("#miniErrorRegisterPwdDiv").text('该密码比较简单，建议您更改为复杂密码');
		$("#miniErrorRegisterPwdDiv").show();
		updateCssMini("miniPwd","miniErrorRegisterPwd");
	}else if(lengthPwd<6 || lengthPwd>20){
		$("#miniErrorRegisterPwdDiv").text('密码长度只能在6~20位字符之间');
		$("#miniErrorRegisterPwdDiv").show();
		updateCssMini("miniPwd","miniErrorRegisterPwd");
	}else{
		$("#miniPwd").removeClass('text bian-02');
		$("#miniPwd").addClass('text bian-01');
//		$("#miniErrorRegisterPwd").removeClass('focus');
		$("#miniErrorRegisterPwd").removeClass('error');
		$("#miniErrorRegisterPwdDiv").text('');
		$("#miniErrorRegisterPwdDiv").hide();
		$("#miniErrorRegisterPwd").addClass('correct');
		return true;
	}
}

/**
 * 光标聚焦密码框时验证
 */
function checkMiniPwdOnfocus(){
	$("#miniPwd").removeClass('text bian-02');
	$("#miniPwd").addClass('text bian-01');
	$("#miniErrorRegisterPwdDiv").text('6~20位字符,不建议使用纯数字、字母或符号！');
	$("#miniErrorRegisterPwdDiv").hide();
	$("#miniErrorRegisterPwd").removeClass('error');
	$("#miniErrorRegisterPwd").removeClass('correct');
}

/**
 * 光标离开确认密码框时的验证方法
 */
function checkMiniRePwd(){
	var rePwd=$("#reminiRegisterPwd").val();
	var pwd=$("#miniPwd").val();
	var rePwdLength=rePwd.length;
	if(rePwdLength<6 || rePwdLength>20){
		$("#reminiErrorRegisterPwdDiv").text('密码长度应在6~20个字符之间！');
		$("#reminiErrorRegisterPwdDiv").show();
		updateCssMini("reminiRegisterPwd","reminiErrorRegisterPwd");
	}else if(rePwd!=pwd){
		$("#reminiErrorRegisterPwdDiv").text('两次密码输入不一致！');
		$("#reminiErrorRegisterPwdDiv").show();
		updateCssMini("reminiRegisterPwd","reminiErrorRegisterPwd");
	}else{
		$("#reminiRegisterPwd").removeClass('text bian-02');
		$("#reminiRegisterPwd").addClass('text bian-01');
		$("#reminiErrorRegisterPwdDiv").text('');
		$("#reminiErrorRegisterPwdDiv").hide();
		//$("#reminiErrorRegisterPwd").removeClass('focus');
		$("#reminiErrorRegisterPwd").removeClass('error');
		$("#reminiErrorRegisterPwd").addClass('correct');
		return true;
	}
}

/**
 * 光标聚焦确认密码框时的验证方法
 */
function checkMiniRePwdOnfocus(){
	$("#reminiRegisterPwd").removeClass('text bian-02');
	$("#reminiRegisterPwd").addClass('text bian-01');
	$("#reminiErrorRegisterPwdDiv").text('请再次输入密码！');
	$("#reminiErrorRegisterPwdDiv").hide();
	$("#reminiErrorRegisterPwd").removeClass('error');
	$("#reminiErrorRegisterPwd").removeClass('correct');
	//$("#reminiErrorRegisterPwd").addClass('focus');
}


/**
 * 光标离开普通验证码输入框时验证验证码是否正确
 */

function checkMiniYzm(yzlx){
	//如果是普通验证码
	var isSureMini="N";
	if(yzlx=="pt"){
		var ptYmValue=$("#miniptymvalue").val();
		if(ptYmValue==""){
			//如果验证码为空
			//$("#minilabelymDiv").text('请输入验证码');
			$("#minilabelym").addClass('error');
			$("#miniptymvalue").removeClass('text bian-01');
			$("#miniptymvalue").addClass('text bian-02');
			return false;
		}else{
			
			//如果验证码不为空，用.ajax进行验证码校验
			var url=homePath+"/valacode.html";
			$.ajax({
				url:url,
			    data:{"ptYmValue":ptYmValue},
			    type:"post",
			    async:false,
			    success: function(data) {
			    	isSureMini=data;
			    	
			    },
			    error : function(responseText,error) {
			    	//alert(error);
			    	showError("系统错误，请与管理员联系！");
			    }
			});
			if(isSureMini!="Y"){
				//$("#minilabelymDiv").text('验证码错误');
				$("#minilabelym").removeClass('correct');
	    		$("#minilabelym").addClass('error');
	    		$("#miniptymvalue").removeClass('text bian-01');
				$("#miniptymvalue").addClass('text bian-02');
	    		return false;
			}else{
				//$("#minilabelymDiv").text('');
				$("#minilabelym").removeClass('error');
	    		$("#minilabelym").addClass('correct');
	    		$("#miniptymvalue").removeClass('text bian-02');
				$("#miniptymvalue").addClass('text bian-01');
				return true;
			}
		}
	}else if(yzlx=="mobil"){
		//如果是手机验证码验证
		var mobilYmValue=$("#minimobilymvalue").val();
		if(mobilYmValue==""){
			//如果验证码为空
			//$("#minilabelmobilDiv").text('请输入手机验证码');
			$("#minilabelmobil").addClass('error');
			$("#minimobilymvalue").removeClass('text bian-01');
			$("#minimobilymvalue").addClass('text bian-02');
			return false;
		}else{
			
			//var aa= validateMiniMobilCode('minilabelmobilDiv','minimobilymvalue','miniRegisterName');
			//alert(aa);
			return validateMiniMobilCode('minilabelmobilDiv','minilabelmobil','minimobilymvalue','miniRegisterName');
		}
	}else{
		return false;
	}
}


/**
 * 光标聚焦验证码输入框
 */
function focusYzm(leixing){
	if(leixing=="pt"){
		$("#minilabelym").removeClass('error');
		$("#minilabelymDiv").text('');
		$("#minilabelymDiv").hide();
		$("#miniptymvalue").removeClass('text bian-02');
		$("#miniptymvalue").addClass('text bian-01');
	}else{
		$("#minilabelmobil").removeClass('error');
		$("#minilabelmobilDiv").text('');
		$("#minilabelmobilDiv").hide();
		$("#minimobilymvalue").removeClass('text bian-02');
		$("#minimobilymvalue").addClass('text bian-01');
	}
}
/**
 * 刷新验证码
 */
function refreshMiniRegisterCode() {
	//debugger
	$("#miniymimg").attr("src",
			homePath + "/system/keyword.html?" + Math.random() + 100);
	//alert("asdfa");
}
/**
 * 获取手机验证码的方法
 */
var loopObjRegisterMini=null;
var secondsRegisterMini=0;	
function getMiniMobileCode(mobliephone,phoneMessage,getCodeButton)
{		   
	var phone=$("#"+mobliephone).val();
	if(secondsRegisterMini>0){
		return;
	}
	
	if($("#"+getCodeButton).attr("disabled")){
		return;
	}
	
	$("#"+getCodeButton).attr("disabled","disabled"); 
	
	$.post(
		    homePath+"/memberCenter/getValidateCount.html", 
			{
		    	phone:phone			    	
			},
			function(data){ 
				if(data=="have")
				{
					$("#"+phoneMessage).text("手机已被人验证");
					$("#"+getCodeButton).removeAttr("disabled");
				}else{
							$.post(
								    homePath+"/memberCenter/sendPhoneCodeLogin.html", 
									{
								    	phoneNum:phone			    	
									},
									function(data){
										if(data=="yes")
										{
//												$("#mobiletext").show();	
											clearInterval(loopObjRegisterMini);
											secondsRegisterMini=60;
											loopObjRegisterMini=window.setInterval(function(){doUpdateMiniRegister(getCodeButton);},1000);
										}else{
											$("#"+phoneMessage).html("您今天5次手机验证机会用完了，等明天再来验证吧");
											$("#"+getCodeButton).removeAttr("disabled");
										}
								});	
				     }
		    }
		);	
}	

/**
 * yangqiuqin
 * 60秒倒计时
 * @param getCodeButton
 */
function doUpdateMiniRegister(getCodeButton){
	secondsRegisterMini-=1;
	if(secondsRegisterMini<=0)
	{
		$("#"+getCodeButton).removeAttr("disabled");
		$("#"+getCodeButton).html("获取验证码");
		$("#"+getCodeButton).attr("value","获取验证码");
	}
	else
	{
		$("#"+getCodeButton).html(secondsRegisterMini + "秒后可重发");
		$("#"+getCodeButton).attr("value", secondsRegisterMini + "秒后可重发");
	}
}	

/**
 * yangqiuqin
 * 验证手机验证码
 */
function validateMiniMobilCode(phoneCodeMessage,minilabelmobil,codePhone,mobliephone)
{
	var isExist = false;
	var codePhoneVal=$("#"+codePhone).val();
	if(codePhoneVal.length==6)
	{
		$.ajax({
			url : homePath+"/memberCenter/validatePhoneLogin.html",
			data: {codePhone:codePhoneVal,mobile:$("#"+mobliephone).val()},
			type: "post",
			async: false,
			success : function(data) {
				if(data=="errorCode"){
					  // $("#"+phoneCodeMessage).text('短信验证码不正确或验证码已过期');
					   $("#"+minilabelmobil).removeClass('correct');
					   $("#"+minilabelmobil).addClass('error');
					   $("#"+codePhone).removeClass('text bian-01');
					   $("#"+codePhone).addClass('text bian-02');
					   isExist = false;
				   }else if(data=="no"){
					  // $("#"+phoneCodeMessage).text('今天你的验证次数超过50次，请您等待明天继续验证');
					   $("#"+minilabelmobil).removeClass('correct');
					   $("#"+minilabelmobil).addClass('error');
					   $("#"+codePhone).removeClass('text bian-01');
					   $("#"+codePhone).addClass('text bian-02');
					   isExist = false;
				   }else{
//					   alert("手机验证成功");
					  // $("#mobileState").val("Y");
					   $("#mobileState").val("Y");
					  // $("#"+phoneCodeMessage).text('');
					   $("#"+minilabelmobil).removeClass('error');
					   $("#"+minilabelmobil).addClass('correct');
					   $("#"+codePhone).removeClass('text bian-02');
					   $("#"+codePhone).addClass('text bian-01');
					   isExist = true;
				   }
			},
			error : function() {
				showError("系统错误，请与管理员联系！");
			}
		});
	}else{
		//   $("#"+phoneCodeMessage).text('验证码格式错误，请重新输入');
		   $("#"+minilabelmobil).removeClass('correct');
		   $("#"+minilabelmobil).addClass('error');
		   $("#"+codePhone).removeClass('text bian-01');
		   $("#"+codePhone).addClass('text bian-02');
		   isExist = false;
	}
	return isExist;
}

/**
 * 检查用户名是否存在
 * @param loginName
 * @returns {String}
 */
function checkMiniRegisterName(loginName) {
	var isExist = "N";
	$.ajax({
		url : homePath + "/member-checkLoginName.html",
		data : "loginName=" + loginName,
		type : "post",
		async : false,
		success : function(data) {
			isExist = data;
		},
		error : function() {
			showError("系统错误，请与管理员联系！");
		}
	});
	//alert(isExist)
	return isExist;
}

/**
 * 光标移除密码框时，样式的变换方法
 * @returns {Boolean}
 */
function updateCssMini(pwdcss,labelPwdcss){
	$("#"+pwdcss).removeClass('text bian-01');
	$("#"+pwdcss).addClass('text bian-02');
	$("#"+labelPwdcss).removeClass('focus');
	$("#"+labelPwdcss).removeClass('correct');
	$("#"+labelPwdcss).addClass('error');
	return false;
}


function  tregisterMember(){
	checkadd();
}
function retrunUrls(){
	 window.location.href = homePath+"/register.html?backURL="+Urls;
};
function beginRegister(){
	var pathname = window.location.pathname;
	if((homePath+"/")==pathname){
		window.location.href = homePath+"/register.html";
	}else{
		window.location.href = homePath+"/register.html?backURL="+pathname.substring(homePath.length);
	}
};