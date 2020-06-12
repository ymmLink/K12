<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>设计师</title>
	<link href="/static/css/stylistxq.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	</header>
	<div class="stylistxq">
		<div class="stylistxq_top">
			<div class="stylistxq_info">
				<div class="stylistxq_info_left">
					<div class="stylistxq_div">
						<div class="stylistxq_info_left_personInfo">
							<!-- <div class="stylistxq_info_left_personInfo_name">张某某</div>
							<div class="stylistxq_dianpu">
								<div class="stylistxq_dianpu_num">工号：21489563</div>
								<div class="stylistxq_dianpu_xian"></div>
								<div class="stylistxq_dianpu_pingjia">
									<img alt="" src="../static/images/stylist/start1.png">
									<img alt="" src="../static/images/stylist/start1.png">
									<img alt="" src="../static/images/stylist/start1.png">
									<img alt="" src="../static/images/stylist/start1.png">
									<img alt="" src="../static/images/stylist/start2.png">
								</div>
							</div>
							<div class="stylistxq_dianpu_address">门店：厦门市湖里区国联建材城2楼b18</div> -->
						</div>
						<div class="stylistxq_text">
							
							<!-- <div class="stylistxq_context">
								<div class="stylistxq_context_mark"></div>
								<div class="stylistxq_context_font">意大利及瑞典著名建筑师、设计师；众多国际知名设计展策展人、国际设计比赛评委；造作艺术总监及战略顾问</div>
							</div>
							<div class="stylistxq_context">
								<div class="stylistxq_context_mark"></div>
								<div class="stylistxq_context_font">与Casamania等世界上几乎所有的精尖品牌合作，并荣获IF、EDIDA等一系列国际重量级设计大奖</div>
							</div>
							<div class="stylistxq_context">
								<div class="stylistxq_context_mark"></div>
								<div class="stylistxq_context_font">2013年被Interior Innovation Award和Elle Décor Italy联合授予年度设计师</div>
							</div>
							<div class="stylistxq_context">
								<div class="stylistxq_context_mark"></div>
								<div class="stylistxq_context_font">2013年受邀成为全球知名家具家居设计展IMM Cologne荣誉嘉宾</div>
							</div> -->
						</div>
						<div class="agree" onclick="click_agree()" style="cursor:pointer">
							<div class="agree_img"><img alt="" src="../static/images/stylist/agree.png"></div>
							<div class="agree_text">点赞</div>
						</div>
					</div>
				</div>
				<div class="stylistxq_info_right">
					<div class="stylistxq_info_left_img"><!-- <img alt="" src="../static/images/stylist/shejishi.png" style="width:620px;height:740px"> --></div>
				</div>
			</div>
		</div>	
		<!-- 设计案例 -->
		<div class="anli">
			<div class="anli_info">
				<div class="anli_info_title">Design example 设计案列</div>
				<div class="anli_info_descrice">大牌设计，带给你不一样的体验</div>
			</div>
			<div class="anli_info_img">
				<div class="anli_info_img_1">
					<!-- <div class="anli_info_img_1_1">
						<div sytle="width:321px;height:181px;"><img alt="" src="../static/images/stylist/pic2.png" style="width:calc(321px * 1);height:calc(181px * 1)"></div>
						<div class="anli_info_context">
							<div class="anli_info_name">雁翎沙发</div>
							<div class="anli_info_price">￥2999 起</div>
						</div>
					</div> -->
					
				</div>
			</div>
		</div>
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
		$("#stylist").css("color","rgba(255,255,255,1)")
		var url = "/stylist/onloadxq?id="+id
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json);
					var op = "<div class='stylistxq_info_left_personInfo_name'>"+json.object.name+"</div>"+
					"<div class='stylistxq_dianpu'>"+
					"<div class='stylistxq_dianpu_num'>工号："+json.object.jobNumber+"</div>"+
					"<div class='stylistxq_dianpu_xian'></div>"+
					"<div class='stylistxq_dianpu_pingjia'>"+
						
					"</div>"+
				"</div>"+
				"<div class='stylistxq_dianpu_address'>门店："+json.object.storeBelong+"</div>";
				$(".stylistxq_info_left_personInfo").append(op);
				for(var i=0;i<json.object.star;i++){
					var ol = "<img alt='' src='../static/images/stylist/start1.png' style='width:calc(20px * 1);height:calc(20px * 1);margin-right:10px;'>";
					$(".stylistxq_dianpu_pingjia").append(ol);
				}
				for(var j=0;j<5-json.object.star;j++){
					var ok = "<img alt='' src='../static/images/stylist/start2.png' style='width:calc(20px * 1);height:calc(20px * 1);margin-right:10px;'>";
					$(".stylistxq_dianpu_pingjia").append(ok);
				}
				var oj = "<img alt='' src='"+json.object.photo+"' style='width:clac(620px * 0.8928);height:calc(740px * 0.8928)'>"
				$(".stylistxq_info_left_img").append(oj);
				$(".stylistxq_text").html(json.object.detail)
				for(var i=0; i<json.objs.length;i++){
					var og = "<div class='anli_info_img_1_1' >"+
					"<div style='cursor:pointer' sytle='width:calc(321px * 0.8928);height:calc(181px * 0.8928);' onclick='click_detail("+json.objs[i].bianma+")'><img  alt='' src='"+json.objs[i].skuMainPic+"' style='width:calc(321px * 0.8928);height:calc(181px * 0.8928)'></div>"+
					"<div class='anli_info_context'>"+
						"<div class='anli_info_name'>"+json.objs[i].title+"</div>"+
						"<div class='anli_info_price'>￥"+json.objs[i].price+" 起</div>"+
					"</div>"+
				"</div>";
				$(".anli_info_img_1").append(og);
				}
			},
			error:function(){
				alert("设计师出错了");
			}
		})
	}
	function click_agree(){
		var url = "/stylist/agree?id="+id
		$.ajax({
			"url":url,
			"type":"POST",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					alert("点赞成功")
				}else if(json.resInteger==700){
					alert("两周内不能重复点赞")
				}
			},
		})
	}
	function click_detail(bianma){
		location.href = "/activity/cart?id="+bianma;
	}
</script>
</html>