<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
   prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
	<link href="/static/css/cart.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<form class="cart" action="/cart/sub">
		<div class="cart_div">
			<div class="cart_title">伊莱达-购物车</div>
			<div class="cart_line"></div>
			<div class="cart_img">
				
			</div>
		</div>
		<div class="line"></div>
		<div class="cart_buttom">
			<div class="cart_buttom_top">
				<div class="cart_buttom_top_click" onclick="click_qx()"><img id="qx" alt="" src="../static/images/cart/pic3.png" style="width:calc(20px * 1);height: calc(20px * 1);"></div>
				<div class="cart_buttom_top_quanxuan">全选</div>
				<div class="cart_buttom_top_shuxian"></div>
				<div class="cart_buttom_top_text">已选0件</div>
			</div>
			<div class="cart_buttom_top_price">实付：￥0</div>
			<input id="price_total" type='hidden' name='priceTotal' value=0;>
			<input disabled="true" type="submit" class="cart_buttom_top_submit" value="立即下单"><!-- <img onclick="click_sub()" alt="" src="../static/images/cart/pic6.png" style="width:calc(240px * 1);height: calc(60px * 1);"> --></input>
		</div>
	</form>
	<div class="cart_none">
		<div class="cart_none_div"><img alt="" src="../static/images/cart/pic7.png"></div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	var length;
	var arr=0;
	var shuzu=[];
	var prices=[];
	var moneys=[];
	var price=0;
	var num = [];
	onload=function(){
		var url = "/cart/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs
				if(json.resInteger==200){
					$(".cart_none").css("display","none")
					$(".cart").css("display","block")
					length = list.length;
					
					for(var i=0;i<list.length;i++){
						console.debug(list[i])
						shuzu[i] = list[i].sid;
						prices[i] = list[i].price * list[i].num;
						moneys[i] = list[i].price * list[i].num;
						num[i] = list[i].num;
						var op = "<div class='cart_img_context'>"+
						"<div class='cart_click'><img id='cartagree"+list[i].sid+"' class='cartagree' onclick='click_choose("+list[i].sid+","+i+")' alt='' src='../static/images/cart/pic3.png' style='width:calc(20px * 1);height: calc(20px * 1);'></div>"+
						"<div style='cursor:pointer' class='cart_image' onclick='click_detail("+list[i].bianma+")'><img alt='' src='"+list[i].skuMainPic+"' style='width:calc(200px * 0.8928);height: calc(113px * 0.8928);'></div>"+
						"<div class='cart_text'>"+
							"<div class='cart_text_top'>"+list[i].title+"</div>"+
							"<div class='cart_text_buttom'>"+list[i].guigeValueIdColorName+"/"+list[i].guigeValueId2Name+"</div>"+
						"</div>"+
						"<div class='cart_price'>"+
							
							"<div class='cart_oldprice' id='cart_oldprice"+i+"'>￥ "+list[i].marketPrice+"</div>"+
							
							"<div class='cart_newprice' style='display:flex;'>"+
								"<div>￥ </div>"+
								"<div  id='cart_newprice"+i+"'>"+list[i].price+"</div>"+
							"</div>"+
						"</div>"+
						"<div class='cart_total'>"+
							"<div class='cart_del' style='cursor:pointer' onclick='click_del("+i+","+list[i].sid+")'>"+
								"<img alt='' src='../static/images/cart/pic4.png' style='width:calc(20px * 1);height: 2px;'>"+
							"</div>"+
							"<div class='cart_num' id='num"+i+"'>"+list[i].num+"</div>"+
							"<div class='cart_add' style='cursor:pointer' onclick='click_add("+i+","+list[i].sid+")'>"+
								"<img alt='' src='../static/images/cart/pic5.png' >"+
							"</div>"+
						"</div>"+
						"<div style='cursor:pointer' class='cart_shanchu' onclick='click_delete("+list[i].id+",&quot;"+list[i].oid+"&quot;)'>删除</div>"+
						"<input id='shuliang"+i+"' type='hidden' name='shuliang'>"+
						"<input id='cartInfo"+list[i].sid+"' type='hidden' name='cartInfo'>"+
						"<input id='qx"+i+"' type='hidden' value='"+list[i].sid+"'>"+
					"</div>";
					$(".cart_img").append(op)
					for(var j=0;j<json.objs.length;j++){
						if(json.objs[j].isDiscount==0){
							$("#cart_oldprice"+j).css("display","none");
						}else{
							$("#cart_oldprice"+j).css("display","block");
						}
					}
					if(list[i].isDiscount==0){
						var index = "#cart_oldprice"+i
						$(index).html("")
					}
					}
				}else if(json.resInteger==600){
					$(".cart_none").css("display","block")
					$(".cart").css("display","none")
				}
			}
		})
		$(".cart_buttom_top_submit").attr("disabled",true)
	}
	function click_choose(id,i){
		
		var n = "#shuliang"+i
		var index = "#cartagree"+id;
		var mark = "#cartInfo" + id;
		if($(index).attr("src")=="../static/images/cart/pic1.png"){
			$(".cart_buttom_top_submit").attr("disabled",true)
			$(index).attr("src","../static/images/cart/pic3.png")
			$(mark).val("")
			arr = arr-1;
			$(".cart_buttom_top_text").empty()
			var op = "已选"+arr+"件"
			$(".cart_buttom_top_text").append(op);
			price = price-prices[i]
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
			$(n).val("")
		}else if($(index).attr("src")=="../static/images/cart/pic3.png"){
			$(".cart_buttom_top_submit").attr("disabled",false)
			$(index).attr("src","../static/images/cart/pic1.png")
			$(mark).val(id)
			arr = arr+1;
			$(".cart_buttom_top_text").empty()
			var op = "已选"+arr+"件"
			$(".cart_buttom_top_text").append(op);
			price = price+prices[i]
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
			$(n).val(num[i])
		}
	}
	function click_qx(){
		var index = ".cartagree";
		if($(index).attr("src")=="../static/images/cart/pic1.png"){
			$(".cart_buttom_top_submit").attr("disabled",true)
			$(index).attr("src","../static/images/cart/pic3.png")
			$("#qx").attr("src","../static/images/cart/pic3.png")
			$(".cart_buttom_top_text").empty()
			var op = "已选0件"
			$(".cart_buttom_top_text").append(op);
			arr=0;
			price=0;
			for(var i=0;i<length;i++){
				var id = shuzu[i];
				var n = "#shuliang"+i
				var mark = "#cartInfo"+id;
				var value = $("#qx"+i).val();
				$(mark).val("")
				$(n).val("")
			}
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
		}else if($(index).attr("src")=="../static/images/cart/pic3.png"){
			$(".cart_buttom_top_submit").attr("disabled",false)
			$(index).attr("src","../static/images/cart/pic1.png")
			$("#qx").attr("src","../static/images/cart/pic1.png")
			$(".cart_buttom_top_text").empty()
			var op = "已选"+length+"件";
			$(".cart_buttom_top_text").append(op);
			arr=length;
			price=0;
			for(var i=0;i<length;i++){
				var id = shuzu[i];
				price = price + prices[i];
				var mark = "#cartInfo"+id;
				var n = "#shuliang"+i
				var value = $("#qx"+i).val();
				$(mark).val(value)
				$(n).val(num[i])
			}
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
		}
	}
	function click_del(i,sid){
		var index = "#num"+i
		var mark = "#cartagree"+sid

		var text = $(index).text()
		var money = $("#cart_newprice"+i).text()
		if(text==1){
			return 
		}
		text = parseInt(text)-1
		prices[i] = parseInt(text)*parseFloat(money)
		if($(mark).attr("src")=="../static/images/cart/pic1.png"){
			price = price-parseFloat(money)
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
		}
		$(index).text(text)
		$("#shuliang"+i).val(text)
	}
	function click_add(i,sid){
		var index = "#num"+i
		var mark = "#cartagree"+sid
		var text = $(index).text()
		var money = $("#cart_newprice"+i).text()
		text = parseInt(text)+1
		prices[i] = parseInt(text)*parseFloat(money)
		if($(mark).attr("src")=="../static/images/cart/pic1.png"){
			price = price+parseFloat(money)
			$(".cart_buttom_top_price").empty()
			var ok = "实付：￥ "+price+"";
			$(".cart_buttom_top_price").append(ok);
			$("#price_total").val(price)
		}
		document.getElementById('num'+i).innerHTML=text
		$("#shuliang"+i).val(text)
	}
	function click_delete(id,oid){
		var url = "/cart/delete";
		$.ajax({
			"url":url,
			"data":{
				id:id,
				oid:oid
			},
			"type":"POST",
			"dataType":"json",
			success:function(json){
				$(".cart_img").empty()
				var list = json.objs
				if(json.resInteger==200){
					$(".cart_none").css("display","none")
					$(".cart").css("display","block")
					length = list.length;
					for(var i=0;i<list.length;i++){
						shuzu[i] = list[i].sid;
						prices[i] = list[i].price;
						var op = "<div class='cart_img_context'>"+
						"<div class='cart_click'><img id='cartagree"+list[i].sid+"' class='cartagree' onclick='click_choose("+list[i].sid+","+i+")' alt='' src='../static/images/cart/pic3.png' style='width:calc(20px * 1);height: calc(20px * 1);'></div>"+
						"<div class='cart_image'><img alt='' src='"+list[i].skuMainPic+"' style='width:calc(200px * 1);height: calc(113px * 1);'></div>"+
						"<div class='cart_text'>"+
							"<div class='cart_text_top'>"+list[i].title+"</div>"+
							"<div class='cart_text_buttom'>"+list[i].guigeValueIdColorName+"/"+list[i].guigeValueId2Name+"</div>"+
						"</div>"+
						"<div class='cart_price'>"+
							"<div class='cart_oldprice' id='cart_oldprice"+i+"'>￥ "+list[i].marketPrice+"</div>"+
							"<div class='cart_newprice' style='display:flex;'>"+
								"<div>￥ </div>"+
								"<div  id='cart_newprice"+i+"'>"+list[i].price+"</div>"+
							"</div>"+
						"</div>"+
						"<div class='cart_total'>"+
							"<div class='cart_del' style='cursor:pointer' onclick='click_del("+i+","+list[i].sid+")'>"+
								"<img alt='' src='../static/images/cart/pic4.png' style='width:calc(20px * 1);height: 2px;'>"+
							"</div>"+
							"<div class='cart_num' id='num"+i+"'>"+list[i].num+"</div>"+
							"<div class='cart_add' style='cursor:pointer' onclick='click_add("+i+","+list[i].sid+")'>"+
								"<img alt='' src='../static/images/cart/pic5.png' >"+
							"</div>"+
						"</div>"+
						"<div style='cursor:pointer' class='cart_shanchu' onclick='click_delete("+list[i].id+",&quot;"+list[i].oid+"&quot;)'>删除</div>"+
						"<input id='shuliang"+i+"' type='hidden' value='1' name='shuliang'>"+
						"<input id='cartInfo"+list[i].sid+"' type='hidden' name='cartInfo'>"+
						"<input id='qx"+i+"' type='hidden' value='"+list[i].sid+"'>"+
					"</div>";
					$(".cart_img").append(op)
					if(list[i].isDiscount==0){
						var index = "#cart_oldprice"+i
						$(index).html("")
					}
					}
				}else if(json.resInteger==600){
					$(".cart_none").css("display","block")
					$(".cart").css("display","none")
				}
			}
		})
	}
	function click_detail(id){
		location.href = "/activity/cart?id="+id;
	}
</script>
</html>