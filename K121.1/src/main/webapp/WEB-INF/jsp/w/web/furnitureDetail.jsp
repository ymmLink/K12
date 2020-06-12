<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>家具详情</title>
	<link href="/static/css/furnitureDetail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header">
			<div class="header_img" id="header_img"><img alt="" src="${discountProduct.img }" style="width: 700px;height: calc(450px * 0.8789);"></div>
			<div class="furnitureDetail_info">
				<div class="furnitureDetail_name">${discountProduct.title}</div>
				<div class="furnitureDetail_price" id="furnitureDetail_price">
					<div class="furnitureDetail_price_top">￥${discountProduct.price}</div>
					<div class="furnitureDetail_price_button">￥${discountProduct.marketPrice}</div>
				</div>
				<div class="furnitureDetail_color">
					<!-- 选中外框会变色 -->
					<div class="furnitureDetail_color_text"> 颜 色：</div>
					<div class="furnitureDetail_color_context"> 
					<c:forEach items="${colorImg}" var="u" varStatus="s">
						<div class="furnitureDetail_color_context_img" onclick="click_color(${s.index+1 })" id="color${s.index+1 }"><img alt="" src="${u}" id="img${s.index+1 }" style="width: 28px;height: 28px;"></div>
					</c:forEach>
					</div>
				</div>
				<div class="furnitureDetail_type">
					<div class="furnitureDetail_type_text">规 格:</div>
					<div class="furnitureDetail_type_context">
					<c:forEach items="${styles}" var="u" varStatus="s">
						<div class="furnitureDetail_type_context_div" onclick="click_style(${s.index+1 })" id="style${s.index+1 }">${u}</div>
					</c:forEach>
					</div>
				</div>
				<div class="furnitureDetail_num">
					<div class="furnitureDetail_num_text">数 量:</div>
					<div class="furnitureDetail_num_mark">
						<div class="furnitureDetail_num_del" id="del" onclick="del_num()">-</div>
						<div class="furnitureDetail_num_num" id="number">1</div>
						<div class="furnitureDetail_num_add" id="add" onclick="add_num()">+</div>
					</div>
				</div>
				<div class="furnitureDetail_submit">
					<form id="form">
						<input type="hidden" name = "img" id="img" value="${discountProduct.img }">
						<input type="hidden" name = "title" id="title" value="${discountProduct.title }">
						<input type="hidden" name = "price" id="price" value="${discountProduct.price }">
						<input type="hidden" name = "style" id="style" autocomplete="off">
						<input type="hidden" name = "color" id="color" autocomplete="off">
						<input type="hidden" name = "shuliang" id="shuliang" autocomplete="off" value="1">
						<div style="cursor:pointer" class="furnitureDetail_submit_buy" onclick="click_buy()">立即购买</div>
					</form>
					<form id="form_cart">
						<input type="hidden" name = "img_cart" id="img_cart" value="${discountProduct.img }">
						<input type="hidden" name = "title_cart" id="title_cart" value="${discountProduct.title }">
						<input type="hidden" name = "price_cart" id="price_cart" value="${discountProduct.price }">
						<input type="hidden" name = "style_cart" id="style_cart" autocomplete="off">
						<input type="hidden" name = "color_cart" id="color_cart" autocomplete="off">
						<input type="hidden" name = "shuliang_cart" id="shuliang_cart" autocomplete="off" value="1">
						<div style="cursor:pointer" class="furnitureDetail_submit_cart" onclick="click_cart()">加入购物车</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<div class="furnitureDetail">

	<c:if test="${designerCommendeds!=null }">
			<div class="furnitureDetail_shejishi">
				<div class="furnitureDetail_shejishi_info">
					<div class="furnitureDetail_shejishi_detail">
						<div class="furnitureDetail_shejishi_img" style="text-align: center;"><img alt="" src="${designerCommendeds.img }" style="height: calc(170px * 0.8928);"></div>
						<div class="furnitureDetail_shejishi_name">${designerCommendeds.name }</div>
					</div>
					<div class="furnitureDetail_shejishi_context">
						<div class="furnitureDetail_shejishi_jingli">${designerCommendeds.describe }</div>
						<div onclick="click_stylist(${designerCommendeds.id })" class="furnitureDetail_shejishi_anniu" style="cursor:pointer">了解更多</div>
					</div>
				</div> 
			</div>
		
	</c:if>
	<!-- 图文详情 -->
	<div class="furnitureDetail_img">
	${discountProduct.detail}
	</div>
	<c:if test="${productRecommendeds!=null }">
		<div class="furnitureDetail_tuijian">
			<div class="text">设计师推荐搭配</div>
			<div class="img">
				<c:forEach items="${productRecommendeds}" var="u" varStatus="s">
					<div onclick="click_tuijian(${u.bianma})" style="cursor:pointer">
						<div><img alt="" src="${u.img }" style="width: calc(321px * 0.8784);height: calc(181px * 0.8784);"></div>
							<div class="context">
							<div class="context_name">${u.title }</div>
							<div class="context_price">￥${u.price }起</div>
						</div>
					</div>
				</c:forEach>
			
			</div>
		</div>
	</c:if>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	/* 获取地址的参数 */
	var getParam = function(name){
	    var search = document.location.search;
	    var pattern = new RegExp("[?&]"+name+"\=([^&]+)", "g");
	    var matcher = pattern.exec(search);
	    var items = null;
	    if(null != matcher){
	            try{
	                    items = decodeURIComponent(decodeURIComponent(matcher[1]));
	            }catch(e){
	                    try{
	                            items = decodeURIComponent(matcher[1]);
	                    }catch(e){
	                            items = matcher[1];
	                    }
	            }
	    }
	    return items;
	}
	var id = getParam('id')
	onload=function(){
		if(${discountProduct.bigCategory !=null}&&!${discountProduct.bigCategory eq ""}&&${discountProduct.bigCategory eq "家具家私"}){
			$("#furniture").css("color","rgba(255,255,255,1)")
		}else{
			$("#ironmongery").css("color","rgba(255,255,255,1)")
		}
		/* $("#color1").css("border","1px solid rgba(49,49,49,1)")
		$("#style1").css("border","1px solid rgba(49,49,49,1)") */
		$(".furnitureDetail_price_top").empty();
		$(".furnitureDetail_price_button").empty();
	}
	function click_color(i){
		console.debug(id);
		var index = "#color" + i
		var imgUrl= "#img"+i
		$(".furnitureDetail_color_context_img").css("border","1px solid rgba(229,229,229,1)")
		$(index).css("border","1px solid rgba(49,49,49,1)")
		var path = $(imgUrl).attr('src');
		$("#color").val(path)
		$("#color_cart").val(path)
		var text = $("#shuliang").val();
		var text1 = $("#style").val();
		var text2 = $("#color").val();
		if(text1==""){
			
			return 
		}
		if(text2==""){
			
			return 
		}
		var url = "/product/update?id="+id;
		var data = $("#form").serialize()
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					$("#header_img").empty();
					$("#furnitureDetail_price").empty();
					
					var op = "<img alt='' src='"+json.object.skuMainPic+"' style='width:700px;height: calc(450px * 0.8789);'>"
					$("#header_img").append(op);
					var ok = "<div class='furnitureDetail_price_top'>￥ "+json.object.price+"</div>"+
					"<div class='furnitureDetail_price_button'>￥ "+json.object.marketPrice+"</div>";
					$("#furnitureDetail_price").append(ok);
				}else if(json.resInteger==600){
					alert("无该商品规格的商品");
				}
			},
			error:function(){
				alert("下订单出错了");
			}
		})
	}
	function click_style(i){
		console.debug(id);//productId
		var index = "#style" + i
		//设置选中样式
		//1.全部取消
		$(".furnitureDetail_type_context_div").css("border","1px solid rgba(229,229,229,1)")
		//2.选中
		$(index).css("border","1px solid rgba(49,49,49,1)")
		var text = $(index).text();
		$("#style_cart").val(text)
		$("#style").val(text)
		var text = $("#shuliang").val();
		var text1 = $("#style").val();
		var text2 = $("#color").val();
		if(text1==""){
			
			return 
		}
		if(text2==""){
			
			return 
		}
		var url = "/product/update?id="+id;
		var data = $("#form").serialize()
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					$("#header_img").empty();
					$("#furnitureDetail_price").empty();
					var op = "<img alt='' src='"+json.object.skuMainPic+"' style='width:700px;height: calc(450px * 0.8789);'>"
					$("#header_img").append(op);
					var ok = "<div class='furnitureDetail_price_top'>￥ "+json.object.price+"</div>"+
					"<div class='furnitureDetail_price_button'>￥ "+json.object.marketPrice+"</div>";
					$("#furnitureDetail_price").append(ok);
				}else if(json.resInteger==600){
					alert("无该商品规格的商品");
				}
			},
			error:function(){
				alert("下订单出错了");
			}
		})
	}
	function del_num(){
		var num = $("#number").text();
		if(num==1){
			return
		}else{
			num = parseInt(num)-1
			document.getElementById('number').innerHTML=num;
			$("#shuliang_cart").val(num)
			$("#shuliang").val(num)
		}
	}
	function add_num(){
		var num = $("#number").text();
		num = parseInt(num)+1
		document.getElementById('number').innerHTML=num;
		$("#shuliang_cart").val(num)
		$("#shuliang").val(num)
	}
	function click_buy(){
		var text = $("#shuliang").val();
		var text1 = $("#style").val();
		var text2 = $("#color").val();
		if(text2==""){
			alert("请选择颜色")
			return 
		}
		if(text1==""){
			alert("请选择规格")
			return 
		}
		
		var url = "/order/add?id="+id;
		var data = $("#form").serialize();
		$.ajax({
			"url":"/after/hasUser",
			"type":"POST",
			"dataType":"text",
			success:function(res){
				if(res=='false'){
					var reurl=window.location.href;
				   	var turl="/wx/oauth?reurl="+reurl;
					layer.open({
						  type: 2,
						  title: '伊莱达',
						  shadeClose: true,
						  shade: 0.8,
						  area: ['380px', '90%'],
						  content: turl //iframe的url
						}); 
				}else if(res=='true'){
					$.ajax({
						"url":url,
						"data":data,
						"type":"GET",
						"dataType":"json",
						success:function(json){
							if(json.resInteger==200){
								location.href = "/order/submit";
							}else if(json.resInteger==600){
								alert("无该商品规格的商品");
							}
						},
						error:function(){
							alert("下订单出错了");
						}
					})
				}
			}
		});
	}
	function click_cart(){
		var text = $("#shuliang_cart").val();
		var text1 = $("#style_cart").val();
		var text2 = $("#color_cart").val();
		if(text1==""){
			alert("请选择规格")
			return 
		}
		if(text2==""){
			alert("请选择颜色")
			return 
		}
		var url = "/cart/add?id="+id;
		var data = $("#form_cart").serialize();
		$.ajax({
			"url":"/after/hasUser",
			"type":"POST",
			"dataType":"text",
			success:function(res){
				if(res=='false'){
					var reurl=window.location.href;
				   	var turl="/wx/oauth?reurl="+reurl;
					layer.open({
						  type: 2,
						  title: '伊莱达',
						  shadeClose: true,
						  shade: 0.8,
						  area: ['380px', '90%'],
						  content: turl //iframe的url
						}); 
				}else if(res=='true'){
					$.ajax({
						"url":url,
						"data":data,
						"type":"GET",
						"dataType":"json",
						success:function(json){
							if(json.resInteger==200){
								alert("添加成功");
							}else if(json.resInteger==600){
								alert("无该商品规格的商品");
							}
						},
						error:function(){
							alert("添加购物车出错了");
						}
					})
				}
			}
		});
	}
	function click_tuijian(id){
		location.href = "/activity/cart?id="+id;
	}
	function click_stylist(id){
		location.href = "/stylist/toDetail?id="+id
	}
</script>
</html>