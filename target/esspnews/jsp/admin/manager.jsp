<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="健一,搜索,管理,j1,健一">
<meta name="description" content="健一搜索管理。">
<link href="<%=WebURLParams.SEARCH_PAGE_URL %>/css/search/base.css" rel="stylesheet" type="text/css" />
<link href="<%=WebURLParams.SEARCH_PAGE_URL %>/css/search/manager.css" rel="stylesheet" type="text/css" />
<title>健一搜索管理</title>
<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/lib/jquery/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="<%=WebURLParams.SEARCH_PAGE_URL %>/js/search/search.js"></script>
</head>
<body>
	<div class="logo">
		<a href="https://www.j1.com/">
			<img src="<%=WebURLParams.IMG_URL %>/images/images1308/logo.gif" alt="健一网网上药店" width="199" height="41">
		</a>
	</div>
	
	<div class="controller">
	<table class="controller_table">
		<tr>
			<td>
				<label class="title_label">初始化选项：</label>
			</td>
			<td>
				
				<input id="callInitial" name="callInitial" value="呼叫中心" class="input_button" type="button"/>
				<input id="webInitial" name="webInitial" value="主站商品" class="input_button" type="button"/>
				<input id="keywordRankInitial" name="keywordRankInitial" value="关键词索引" class="input_button" type="button"/>
				<input id="productWeightInitial" name="productWeightInitial" value="商品销量权重" class="input_button" type="button"/>
				<input id="keywordBrandAndCatalogInitial" name="keywordBrandAndCatalogInitial" value="关键字品牌以及目录" class="input_button" type="button"/>
				<input id="webAttrSuggestInitial" name="webAttrSuggestInitial" value="主站属性&建议" class="input_button" type="button"/>
				<input id="j1doctor" name="j1doctor" value="J1医生" class="input_button" type="button"/>
				
				
				
			</td>
			<td>
				
			</td>
		</tr>
		<tr>
			<td>
				<label class="title_label">词库添加：</label>
			</td>
			<td>
				<input id="dictText" name="dictText" value="" class="input_button" autocomplete="off" type="text"/>
				<input id="dictBtn" name="dictBtn" value="添加" class="input_button" type="button"/>
			</td>
			<td>
				
			</td>
		</tr>
	</table>
	</div>
	
	<div id="show_place" class="show_place">
		<textarea id="show_msg" class="show_msg" readonly="true"></textarea>
	</div>
	<script>
	
		function appendMsg(msg)
		{
			$("#show_msg").append((new Date().format("yyyy-MM-dd hh:mm:ss") + "  " + msg + "\n"));
			//自动滚动，滚动条始终保持在最下方
			var scrollTop = $("#show_msg")[0].scrollHeight;
			$("#show_msg").scrollTop(scrollTop);
		}
		
		$(document).ready(function(){
			$("#callInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialCall.html",
		             data: {"status":"init"},
		             dataType: "json",
					 beforeSend: function(data){
						 $("#callInitial").attr("disabled", true);
						 appendMsg("呼叫中心开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#callInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("呼叫中心初始化失败。");
		            	 $("#callInitial").removeAttr("disabled");
		             }
		         });
			});
			$("#webInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialWeb.html",
		             data: {"status":"init"},
		             dataType: "json",
		             beforeSend: function(data){
		            	 $("#webInitial").attr("disabled", true);
		            	 appendMsg("主站商品开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#webInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("主站商品初始化失败。");
		            	 $("#webInitial").removeAttr("disabled");
		             }
		        });
			});
			
			$("#productWeightInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialProductWeight.html",
		             data: {"status":"init"},
		             dataType: "json",
		             beforeSend: function(data){
		            	 $("#productWeightInitial").attr("disabled", true);
		            	 appendMsg("销量权重开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#productWeightInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("销量权重初始化失败。");
		            	 $("#productWeightInitial").removeAttr("disabled");
		             }
		        });
			});
			
			
			$("#keywordBrandAndCatalogInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialKeywordBrandAndCatalog.html",
		             data: {"status":"init"},
		             dataType: "json",
		             beforeSend: function(data){
		            	 $("#keywordBrandAndCatalogInitial").attr("disabled", true);
		            	 appendMsg("关键字品牌以及目录开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#keywordBrandAndCatalogInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("关键字品牌以及目录初始化失败。");
		            	 $("#keywordBrandAndCatalogInitial").removeAttr("disabled");
		            	 $("#productWeightInitial").removeAttr("disabled");
		             }
		        });
			});
			
			
			$("#webAttrSuggestInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialAttr.html",
		             data: {"status":"init"},
		             dataType: "json",
		             beforeSend: function(data){
		            	 $("#webAttrSuggestInitial").attr("disabled", true);
		            	 appendMsg("主站属性&建议库开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#webAttrSuggestInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("主站属性&建议初始化失败。");
		            	 $("#webAttrSuggestInitial").removeAttr("disabled");
		             }
		        });
			});
			$("#dictBtn").click(function(){
				var tdict = $("#dictText").val();
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/addDict.html",
		             data: {"status":"init","dict":tdict},
		             dataType: "json",
					 beforeSend: function(data){
						 $("#dictBtn").attr("disabled", true);
						 appendMsg("新词提交开始...");
		             },
		             success: function(data){
		            	 if(data.message == "success")
		            		 appendMsg("新词提交成功！");
		            	 else if(data.message == "fail")
		            		 appendMsg("缺少需要添加的关键字！");
		            	 else
		            		 appendMsg("新词添加失败！");
		            	 $("#dictBtn").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("新词提交失败。");
		            	 $("#dictBtn").removeAttr("disabled");
		             }
		         });
			});
			
			$("#keywordRankInitial").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialKeyWordRank.html",
		             data: {"status":"init"},
		             dataType: "json",
					 beforeSend: function(data){
						 $("#keywordRankInitial").attr("disabled", true);
						 appendMsg("关键词搜索次数索引开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#keywordRankInitial").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("关键词搜索次数索引初始化失败。");
		            	 $("#keywordRankInitial").removeAttr("disabled");
		             }
		         });
			});
			$("#j1doctor").click(function(){
				$.ajax({
		             type: "POST",
		             url: "<%=WebURLParams.SEARCH_PAGE_URL %>/admin/initialJ1Doctor.html",
		             data: {"status":"init"},
		             dataType: "json",
					 beforeSend: function(data){
						 $("#j1doctor").attr("disabled", true);
						 appendMsg("J1医生开始初始化...");
		             },
		             success: function(data){
		            	 appendMsg(data.message);
		            	 $("#j1doctor").removeAttr("disabled");
		             },
		             error: function(data){
		            	 appendMsg("J1医生初始化失败。");
		            	 $("#j1doctor").removeAttr("disabled");
		             }
		         });
			});
		});
	</script>
</body>
</html>