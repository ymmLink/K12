<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>门窗五金</title>
	<link href="/static/css/ironmongery.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		
	</header>
	<div class="ironmongery">
		<div class="ironmongery_img">
			<div class="ironmongery_img_1">
			<c:forEach items="${furnitures}" var="u" varStatus="s">
				<div class="ironmongery_img_1_1">
					<div style="cursor:pointer" onclick="click_detail(${u.bianma})"><img alt="" src="${u.skuMainPic }" style="width: calc(321px * 0.8928);height:  calc(181px * 0.8928)"></div>
					<div  class="ironmongery_img_1_1_info">
						<div class="ironmongery_img_1_1_name">${u.title }</div>
						<div class="ironmongery_img_1_1_price">￥${u.price } 起</div>
					</div>
				</div>
			</c:forEach>
				
			</div>
			
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#ironmongery").css("color","rgba(255,255,255,1)")
		$(".daohang3").css("display","flex")
	}
	function click_detail(id){
		location.href = "/activity/cart?id="+id;
	}
	function click1(str1,str2){
		var url="/product/findfurniture";
		$.ajax({
			"url":url,
			"data":{
				str1:str1,
				str2:str2
			},
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs
				if(json.resInteger==200){
					$(".ironmongery_img_1").empty();
					for(var i=0; i<list.length;i++){
						var op="<div class='ironmongery_img_1_1'>"+
						"<div style='cursor:pointer' onclick='click_detail("+list[i].bianma+")'><img alt='' src='"+list[i].skuMainPic+"' style='width: 228px;height: 129px'></div>"+
						"<div  class='ironmongery_img_1_1_info'>"+
							"<div class='ironmongery_img_1_1_name'>"+list[i].title+"</div>"+
							"<div class='ironmongery_img_1_1_price'>￥"+list[i].price+"起</div>"+
						"</div>"+
					"</div>";
					$(".ironmongery_img_1").append(op)
					}
				}else if(json.resInteger==600){
					alert("无此类的商品");
				}
			},
			error:function(){
				alert("五金出错了");
			}
		})
	}
	
</script>
</html>