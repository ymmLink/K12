<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>优惠活动</title>
	<link href="/static/css/activity.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header_img"><img alt="" src="../static/images/activity.png" style="width: 100%;height: auto;"></div>
	</header>
	<div class="activity">
		<div class="activity_content">
			<div class="activity_title">Product 优惠产品</div>
			<div class="activity_detail">更多优质产品，让你体验不一样的家</div>
		</div>
		<div class="activity_img">
			<div class="activity_img_1">
				
				
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	</div>
	
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
	
</body>
<script type="text/javascript">
	onload=function(){
		$("#activity").css("color","rgba(255,255,255,1)")
		var url = "/activity/onload"
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json.objs)
				var list = json.objs;
				if(json.resInteger==200){
					console.log(list.length);
					for(var i=0;i<list.length;i++){
						var op = "<div class='activity_img_1_1' onclick='click_produce("+list[i].bianma+")' style='cursor:pointer'>"+
							"<div><img alt='' src='"+list[i].img+"' style='width: clac(321px * 0.8928);height: calc(181px * 0.8928);'></div>"+
							"<div class='activity_img_info'>"+
								"<div class='activity_img_title'>"+list[i].title+"</div>"+
								"<div class='activity_img_oldprice'>￥"+list[i].marketPrice+"</div>"+
								"<div class='activity_img_newprice'>￥"+list[i].price+" 起</div>"+
							"</div>"+
						"</div>";
						$(".activity_img_1").append(op);
					}
				}else if(json.resInteger==600){
					alert("无优惠商品");
					location.href = "index/";
				}
			},
			error:function(){
				alert("优惠出错了");
			}
		})
	}
	function click_produce(id){
		location.href = "/activity/cart?id="+id;
	}
</script>
</html>