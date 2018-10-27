


function decreaseAmountMini(strGoodsId,obj) {
	$(obj).attr("onclick","");
	var oldNum = Number($("#orderAmountMini"+strGoodsId).val());
	var newNum = oldNum - 1;
	
	$("#orderAmountMini"+strGoodsId).val(newNum);
	changeSumPriceMini(strGoodsId);
}

function increaseAmountMini(strGoodsId,obj) {
	$(obj).attr("onclick","");
	var oldNum = Number($("#orderAmountMini"+strGoodsId).val());
	var newNum = oldNum + 1;
	$("#orderAmountMini"+strGoodsId).val(newNum);
	changeSumPriceMini(strGoodsId);
}

function changeAmountMini(strGoodsId) {
	changeSumPriceMini(strGoodsId);
}

function changeSumPriceMini(strGoodsId) {
	
	var amount = parseInt($("#orderAmountMini"+strGoodsId).val());
	var skuGroupId = $("#sku"+strGoodsId).val();
	if (amount < 1 || isNaN(amount)) {
		amount = 1;
	}
	$("#orderAmountMini"+strGoodsId).val(amount);
	var maxAmount = Number($("#orderAmountMini"+strGoodsId).attr("max-amount"));
	
	var promoteAmount = Number($("#orderAmountMini"+strGoodsId).attr("promote-amount"));
	
	var bl = false;
	
	if (!isNaN(promoteAmount) && promoteAmount > 0 && (promoteAmount < maxAmount || maxAmount <= 0 || isNaN(maxAmount))) {
		if (amount > promoteAmount){
			amount = promoteAmount;
			bl = true;
		} else {
		}
	} else {
	}
	
	if (maxAmount > 0 && !bl) {
		if (amount > maxAmount && !isNaN(maxAmount)){
			amount = maxAmount;
		} else {
		}
	} else {
	}

	
	
	var minAmount = Number($("#orderAmountMini"+strGoodsId).attr("min-amount"));
	if (amount < minAmount && !isNaN(minAmount)){
		amount = minAmount;
	} else {
	}
	
	$.ajax({
		url:homePath+'/myec/orderShoppingCart/updateAmount.html',
		data:{"skuId":strGoodsId.split("-")[0],"skuAmount":amount,"skuGroupId":skuGroupId},
		cache:false,
		type:"post",
		success:function(data){
			changeTotalPriceMini("N");
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
		}
	});
	
}

function changeTotalPriceMini(load) {
	if(load == "Y"){
		$("#shopcartDiv").html('<div class="jzz"><div><img src="https://img.j1.com/images/images1308/ico/jzi.gif" width="55" height="8" alt="加载中" /></div><p>请稍后，正在加载中......</p></div>');
	}
	$.ajax({
		  type: 'POST',
		  url: homePath+"/shopcart.html",
		  data:{"shocartUrl":"shopcartMini"},
		  success:function(data){
			  $("#shopcartDiv").html(data);
			}
		});

	
}



function deleteGoodsMini(strGoodsId){
	$.ajax({
		url:homePath+'/myec/orderShoppingCart/deleteGoods.html',
		data:{"skuId":strGoodsId},
		cache:false,
		type:"post",
		success:function(data){
			$("#tr"+strGoodsId).remove();
			doReloadMini();
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			showError("系统错误，请与管理员联系！");
		}
	});
}

function doReloadMini(){
	changeTotalPriceMini("N");
}

function continueBuyMini(){
	window.open(homePath+"/");
}


function shopcartCommitMini() {
  beginloginrove("/myec/confirm.html");
}











