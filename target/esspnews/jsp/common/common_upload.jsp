<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<link type="text/css" rel="stylesheet" href="<%=WebURLParams.CJ_URL %>/js/lib/SWFUpload/css/default.css" />
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/SWFUpload/swfupload.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/SWFUpload/plugins/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/SWFUpload/fileprogress.js"></script>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/SWFUpload/handlers.js"></script>

<script type="text/javascript" language="JavaScript">
function generateNewBatch(branch){
	var d = new Date();
	return  branch+""+d.getTime();
}

//branch 附件真实存放名字，以该变量为开始名
//relativePath，附件存放的相对路径，以/upload/为开始路径
//attach 附件一些信息

var swf;
function initUpload(branch,relativePath,attach){
	var batchNo = generateNewBatch(branch);
	$("#batchNoUploadId").attr("innerHTML",batchNo);
	var uploadParam = new Object();
	//if(attach.fileCount == 'singleSelect'){
	buttonAction = SWFUpload.BUTTON_ACTION.SELECT_FILE;
	//}else{
	//	buttonAction = SWFUpload.BUTTON_ACTION.SELECT_FILES;	
	//}
	var splitKey = attach.splitKey;
	if(splitKey == undefined || splitKey == null){
		splitKey = "";
	}
	var settings = {
		flash_url : homePath+"/js/lib/SWFUpload/Flash/swfupload.swf",
		upload_url: homePath+"/attach/upload.html?batchNo="+batchNo,
		file_post_name:'uploadFile',
		use_query_string:true,
		post_params: {"relativePath":relativePath,"splitKey":splitKey,"attachNo":attach.attachNo,"attachNotes":attach.attachNotes,"attachType":attach.attachType,"picType":attach.picType,"uploadUsername":"<%=(String)session.getAttribute("userName")%>","uploadUserId":"<%=(Integer)session.getAttribute("userId")%>" },
		file_size_limit : "10 MB",
		file_types : attach.fileType,
		file_types_description : "All Files",
		file_upload_limit : 100,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
		debug: false,

		// Button settings
		button_image_url: homePath+"/js/lib/SWFUpload/images/uploadall.png",
		button_width: "61",
		button_height: "22",
		button_placeholder_id: "spanButtonPlaceHolder",
		button_text: '<span class="theFont"></span>',
		button_text_style: ".theFont { font-size: 16; }",
		button_text_left_padding: 12,
		button_text_top_padding: 3,
		button_action:buttonAction,
		
		// The event handler functions are defined in handlers.js
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete	// Queue plugin event
	};
	swf = new SWFUpload(settings);
	
}


function uploadCommonSuccess() {
	var batchNo = $("#batchNoUploadId").attr("innerHTML");
	var url = getAppPath() + "/attach/find.html";
	doAjax({
		url:url,
		type:'post',
		data:{batchNo:batchNo},
		success:function(data){
			commonSuccessReturn(data);			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			
			commonErrorReturn();	
		}
	});
	
}

function refreshBatchNo(){
	if(swf != undefined){
		$("#divStatus").attr("innerHTML","0个文件已经上传");
	}
}

//上传成功后返回的函数，attach是存在数据库中的记录，该方法需要被override
//function commonSuccessReturn(attachList){
	//for(var i = 0; i < attachList.length; i++){
		//var attach = attachList[i];
		//alert("文件名："+attach.attachRealName);
//	}
// }

//上传失败返回的函数 该方法需要被override
//function commonErrorReturn(){
//	alert("please do something after upload failure....");	
// }

//一个例子，attach的四个属性不能为null
function initCommonUploadTest(){
	var attach = new Object();
	attach.attachNo = "pmd";
	attach.attachNotes = "";
	attach.attachType = "pic";
	attach.picType = "gif";
	attach.fileType = "*.jpg;*.gif";
	attach.fileCount = 1;
	initUpload('common','pic/sku',attach);
}


</script>