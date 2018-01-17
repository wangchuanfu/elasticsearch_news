$(function() {
	$.ajax({
		url : searchPath + '/productCatalogCommon/getCatalogHtml2.html',
		data : {},
		type : "post",
		success : function(data) {
			$("#cataLogMapDiv").html(data);
		}
	});
	if ($("#pageType") != null && $("#pageType").val() == "index") {
		if (screen.width >= 1200) {
			$("#cataLogMapDiv").css("width", 1200);
		}
	}
	$("#allNav").hover(function() {
		$("#sidebar-x").show();
	}, function() {
		$("#sidebar-x").hide();
	});
	$("#sidebar-x").hover(function() {
		$("this").show();
	}, function() {
		$("this").hide();
	});
});