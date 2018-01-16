<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>

</head>
<body>
转码
<br/><br/>
需要转码的内容<input type="text" id="content"/>
<br/><br/>
转码的结果<input type="text" id="result"/>
<br/><br/>
<input type="button" value="utf8=>unicode" onclick="encoding();"/><input type="button" value="unicode=>utf8" onclick="decoding();"/>

<script type="text/javascript">
function encoding(){
	var content = document.getElementById("content").value;
	if(content.indexOf("%25") >= 0)
		content = content.replace(/%25/g, "%");
	var result;
	if(content.indexOf("%") >= 0)
		result = content;
	else
		result = encodeURI(content);
	document.getElementById("result").value = result;
}

function decoding(){
	var content = document.getElementById("content").value;
	if(content.indexOf("%25") >= 0)
		content = content.replace(/%25/g, "%");
	var result;
	if(content.indexOf("%") >= 0)
		result = decodeURI(content);
	else
		result = content;
	document.getElementById("result").value = result;
}

</script>
</body>
</html>