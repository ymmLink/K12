<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 用户晒单</title>
	<link href="/static/css/userOrder.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="userOrder">
		<div class="userOrder_div">
			<div class="userOrder_title">用户晒单</div>
			<div class="userOrder_img">
				<div class="userOrder_img_1">
				<c:forEach items="${sunsheets}" var="u" varStatus="s">
					<div style="cursor:pointer" class="userOrder_img_div" onclick="click_detail('${u.id}')">
						<div class="userOrder_img_div_img">
							<img alt="" src="${u.img01 }" style="width: calc(321px * 0.8928);height: calc(181px * 0.8928);">
						</div>
						<div class="userOrder_img_div_describe">${u.message }</div>
						<div class="userOrder_buttom">
							<div class="userOrer_buttom_headimg">
								<img alt="" src="${u.avatarUrl }" style="width: calc(40px * 0.8928);height: calc(40px * 0.8928);">
							</div>
							<div class="userOrer_buttom_name">${u.nickName }</div>
							<div class="userOrer_buttom_address">${u.adress }</div>
						</div>
					</div>
				</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<div class="big" style="display:none">
		<div class="userOrderDetail">
			<div class="userOrderDetail_left">
			</div>
			<div class="userOrderDetail_right">
			</div>
			<div onclick="click_exit()" class="exit">
				<img alt="" src="../static/images/user/pic4.png" style="width:calc(24px * 1);heigth:calc(24px * 1);">
			</div>
			<div class="toleft">
				<img alt="" src="../static/images/user/letf.png" style="width:calc(70px * 0.8928);heigth:calc(70px * 0.8928);">
			</div>
			<div class="toright">
				<img alt="" src="../static/images/user/right.png" style="width:calc(70px * 0.8928);heigth:calc(70px * 0.8928);">
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
</body>
<script type="text/javascript">
	window.onload=function(){
		$("#lianxi").css("color","rgba(255,255,255,1)")
	}
	function click_exit(){
		$(".big").css("display","none")
	}
	function click_detail(id){
		$(".big").css("display","block")
		var url = "/judge/detail";
		$.ajax({
			"url":url,
			"data":{
				id:id
			},
			"type":"POST",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					var op = "<div class='userOrderDetail_info'>"+
								"<div class='userOrderDetail_info_left'>"+
									"<div class='userOrderDetail_info_name'>"+json.object.nickName+"</div>"+
									"<div class='userOrderDetail_info_adress'>"+json.object.adress+"</div>"+
								"</div>"+
								"<div class='userOrderDetail_info_right'></div>"+
							"</div>"+
							"<div class='line'></div>"+
							"<div class='userOrderDetail_describe'>"+json.object.message+"</div>"+
							"<div class='userOrderDetail_right_img'>"+
								"<div class='orderDetail_righr_img_img'><img alt='' src='"+json.object.skuMainPic+"' style='width:calc(321px * 0.8928);heigth:calc(181px * 0.8928);'></div>"+
								"<div class='orderDetail_righr_img_text'>"+
									"<div class='orderDetail_righr_img_title'>"+json.object.title+"</div>"+
									"<div class='orderDetail_righr_img_price'>￥"+json.object.price+"</div>"+
								"</div>"+
							"</div>";
					$(".userOrderDetail_right").empty();
					$(".userOrderDetail_right").append(op);
					var ok = "<div class='userOrderDetail_left_top'>"+
								"<img alt='' src='"+json.object.img01+"' style='width:calc(796px * 0.8928);height:calc(448px * 0.8928);'>"+
							 "</div>"+
							 "<div class='userOrderDetail_left_buttom'>"+
								"<img alt='' src='"+json.object.img02+"' style='width:calc(796px * 0.8928);height:calc(448px * 0.8928);'>"+
							 "</div>";
					$(".userOrderDetail_left").empty();
					$(".userOrderDetail_left").append(ok);
				}
			}
		})
	}
</script>
</html>