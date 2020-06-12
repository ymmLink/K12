<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="java.util.List"%>
    <%@page import="com.example.demo.entity.vo.Product_Sku"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>提交订单</title>
	<link href="/static/css/order.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="adress">
		<div class="adress_div">
			<div class="address_context">
				<div class="cart_title">确认收货地址</div>
				<a href="/adress/toAdd" style="text-decoration : none;"><div class="adress_new">添加新地址</div></a>
			</div>
			<div class="cart_line"></div>
			<div class="adress_my">
				<!-- <div class="adress_info">
					<div class="adress_info_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div>
					<div class="adress_info_text">福建省 厦门市 湖里区 金山街道 园亭路21号</div>
					<div class="adress_info_name">张某某</div>
					<div class="adress_info_phone">15806014596</div>
					<div class="adress_info_xiugai"><img alt="" src="../static/images/cart/pic9.png" style="width:24px;height: 24px;"></div>
				</div> -->
				
			</div>
		</div>
	</div>
	<div class="adress_none">
		<div class="adress_none_div">
			<div>
				<div class="adress_none_text">还没有收货地址哦~</div>
				<a href="/adress/toAdd" style="text-decoration : none;"><div class="adress_none_add">添加地址</div></a>
			</div>
		</div>
	</div>
	<div class="cart">
		<div class="cart_div">
			<div class="cart_title">确认订单信息</div>
			<div class="cart_line"></div>
			<div class="cart_img">
			<c:forEach items="${cartOrder}" var="u" varStatus="s">
				<div class="cart_img_context">
					<!-- <div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div> -->
					<div class="cart_image"><img alt="" src="${u.skuMainPic }" style="width:calc(200px * 0.8928);height: calc(113px * 0.8928);"></div>
					<div class="cart_text">
						<div class="cart_text_top">${u.title }</div>
						<div class="cart_text_buttom">${u.guigeValueIdColorName }/${u.guigeValueId2Name }</div>
					</div>
					<div class="cart_price">
						<div class="cart_oldprice">￥${u.marketPrice }</div>
						<div class="cart_newprice">￥${u.price }</div>
					</div>
					<div class="cart_total">
						X${u.num}
					</div>
					<div class="cart_shanchu">￥${u.price*u.num }</div>
				</div>
				<!-- <div class="cart_img_context">
					<div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div>
					<div class="cart_image"><img alt="" src="../static/images/cart/pic2.png" style="width:calc(200px * 1);height: calc(113px * 1);"></div>
					<div class="cart_text">
						<div class="cart_text_top">云团沙发升级版</div>
						<div class="cart_text_buttom">灰白格/双人座右扶手</div>
					</div>
					<div class="cart_price">
						<div class="cart_oldprice">￥4599</div>
						<div class="cart_newprice">￥999</div>
					</div>
					<div class="cart_total">
						X1
					</div>
					<div class="cart_shanchu">￥4599</div>
				</div> -->
				</c:forEach>
			</div>
		</div>
		<div class="line"></div>
		<div class="cart_buttom">
			<div class="cart_buttom_top">
				<!-- <div class="cart_buttom_top_text">已选0件</div> -->
			</div>
			<div class="cart_buttom_top_price">实付：￥
				<%	Double total = 0D;
					List<Product_Sku> list = (List<Product_Sku>)session.getAttribute("cartOrder"); 
					for(int i=0;i<list.size();i++){
						Product_Sku order_Product = list.get(i);
						total += order_Product.getPrice()*order_Product.getNum();
					}
				%>
				<%=total %>
			</div>
			<form id="form" style="margin-top: calc(15px * 1)";>
				<input type="hidden" name = "adree" id="adree" autocomplete="off">
				<input type="hidden" name = "name" id="name" autocomplete="off">
				<input type="hidden" name = "phone" id="phone" autocomplete="off">
				<input type="hidden" name = "priceTotal" id="priceTotal" value="<%=total %>" autocomplete="off">
				<div class="cart_buttom_top_submit" onclick="click_sub()"><img alt="" src="../static/images/cart/pic8.png" style="width:calc(240px * 1);height: calc(60px * 1);"></div>
			</form>
			
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		var url = "/order/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json);
				var list = json.objs;
				if(json.resInteger==200){
					$(".adress_none").css("display","none");
					$(".adress").css("display","block");
					for(var i=0;i<list.length;i++){
						var op = "<div class='adress_info'>"+
							"<div class='adress_info_click' onclick='click_adress("+list[i].id+")'><img class='adressImg' alt='' src='../static/images/cart/pic3.png' style='width: calc(20px * 1);height: calc(20px * 1);' id='adressImg"+list[i].id+"'></div>"+
							"<div class='adress_info_text' id='adressDetail"+list[i].id+"'>"+list[i].contactAdress+list[i].detail+"</div>"+
							"<div class='adress_info_name' id='contactName"+list[i].id+"'>"+list[i].contactName+"</div>"+
							"<div class='adress_info_phone' id='contactPhone"+list[i].id+"'>"+list[i].contactPhone+"</div>"+
							"<div class='adress_info_xiugai' onclick='click_xiugai("+list[i].id+")'><img alt='' src='../static/images/cart/pic9.png' style='width:calc(24px * 1);height: calc(24px * 1);'></div>"+
						"</div>";
						$(".adress_my").append(op);
							
					}
					
				}else if(json.resInteger==600){
					$(".adress").css("display","none");
					$(".adress_none").css("display","block");
				}
			},
			error:function(){
				alert("加载错误");
			}
		})
	}
	function click_adress(id){
		var index = "#adressImg"+id
		
		$(".adressImg").attr("src","../static/images/cart/pic3.png")
		$(index).attr("src","../static/images/cart/pic1.png")
		var mark1 = "#adressDetail"+id
		var mark2 = "#contactName"+id
		var mark3 = "#contactPhone"+id
		var adressDetail = $(mark1).text();
		$("#adree").val(adressDetail)
		var contactName = $(mark2).text();
		$("#name").val(contactName)
		var contactPhone = $(mark3).text();
		$("#phone").val(contactPhone)
	}
	function click_xiugai(id){
		location.href = "/adress/toUpdate?id="+id;
	}
	function click_sub(){
		
		
		if($("#name").val()==""){
			alert("请选择收货信息")
			return
		}
		
		var url = "/order/toPay";
		var data  = $("#form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				location.href = "/index/pay?oid="+json.res1;
			}
		})
	}
</script>
</html>