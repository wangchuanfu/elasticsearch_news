/*顶部全国城市切换*/
function listShow1()
{
	var obj=document.getElementById("about_list1");
	obj.style.display="block";
}
function loops1()
{
		var obj=document.getElementById("about_list1");
		obj.style.display="none";
}
//新版客服
$(function(){

		$(".top").click(function(){
			$("body,html").animate({scrollTop:0},200);
			return false;
		});

		$(".kf_con").hover(function(){
			$(".morekfs").show();
			$("#btm_zn").addClass("current");

		},function(){
			$(".morekfs").hide();
			$("#btm_zn").removeClass("current");
		});
});
