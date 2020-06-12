<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>设计师</title>
	<link href="/static/css/stylist.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	</header>
	<div class="stylist">
		<div class="stylist_top">
			<div class="stylist_div">
				<div class="stylist_context">
					<!-- <div class="stylist_person">
						<div class="stylist_img"><img alt="" src="../static/images/stylist/headimg_big.png"></div>
						<div class="stylist_name">张艳丹</div>
						<div class="stylist_chengji"><img alt="" src="../static/images/stylist/01.png"></div>
					</div>
					<div class="stylist_text">
						南京艺术学院毕业，中国设计十大杰出青年，18年家具设计金奖。这是一个奇迹的时代，一个艺术的时代，一个挥金如土的时代，也是一个充满嘲讽的时代。狩猎帽子起源于14世纪的英国北部和意大利南部的部分地区，之后又被英国殖民者带去了美国。
					</div> -->
				</div>
				<div class="stylist_paihang">
					
			</div>
		</div>
		
	</div>
	
	<div class="stylist_buttom">
			<div class="stylist_buttom_div">
				<div class="stylist_buttom_1">
					
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#stylist").css("color","rgba(255,255,255,1)");
		var url = "/stylist/onload"
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs;
				if(json.resInteger==200){
					var op =
					"<div class='stylist_person'>"+
						"<div class='stylist_img'><img alt='' src='"+list[0].img+"' style='width:calc(160px * 0.8928);height:calc(160px * 0.8928);border-radius: 50%;'></div>"+
						"<div class='stylist_name'>"+list[0].name+"</div>"+
						"<div class='stylist_chengji'><img alt='' src='../static/images/stylist/01.png'></div>"+
					"</div>"+
					"<div class='stylist_text'>"+
						""+list[0].describe+""+
					"</div>";
					$(".stylist_context").append(op);
					
					var ol = 
						"<div class='stylist_paihang_1' style='cursor:pointer' onclick='click_stylist("+list[0].id+")'>"+
							"<div class='stylist_min_img'><img alt='' src='"+list[0].img+"' style='width:calc(90px * 0.8928);height:calc(90px * 0.8928);border-radius: 50%;'></div>"+
							"<div class='stylist_min_name'>"+list[0].name+"</div>"+
							"<div class='stylist_min_chengji'>01</div>"+
						"</div>"+
						"<div class='stylist_paihang_2' style='cursor:pointer' onclick='click_stylist("+list[1].id+")'>"+
							"<div class='stylist_min_img'><img alt='' src='"+list[1].img+"' style='width:calc(90px * 0.8928);height:calc(90px * 0.8928);border-radius: 50%;'></div>"+
							"<div class='stylist_min_name' style='color:rgba(49,49,49,1)'>"+list[1].name+"</div>"+
							"<div class='stylist_min_chengji_1'>02</div>"+
						"</div>"+
						"<div class='stylist_paihang_3' style='cursor:pointer' onclick='click_stylist("+list[2].id+")'>"+
							"<div class='stylist_min_img'><img alt='' src='"+list[2].img+"' style='width:calc(90px * 0.8928);height:calc(90px * 0.8928);border-radius: 50%;'></div>"+
							"<div class='stylist_min_name' style='color:rgba(49,49,49,1)'>"+list[2].name+"</div>"+
							"<div class='stylist_min_chengji_1'>03</div>"+
						"</div>";
					$(".stylist_paihang").append(ol);
					for(var i=3;i<list.length;i++){
						var url = list[i].img+"";
						var ok = "<div class='stylist_buttom_1_1' style='cursor:pointer' onclick='click_stylist("+list[i].id+")'>"+
						"<div class='other_stylist'><img alt='' src='"+url+"'  style='width:calc(301px * 0.8928);height:calc(170px * 0.8928);border: none;'></div>"+
						"<div class='other_stylist_div'>"+
							"<div class='other_stylist_name'>"+list[i].name+"</div>"+
							"<div class='other_stylist_detail'>"+list[i].describe+"</div>"+
						"</div>"+
					"</div>";
						$(".stylist_buttom_1").append(ok);
					}
				}else if(json.resInteger==600){
					alert("设计师们正在休假");
					
				}
			},
			error:function(){
				alert("设计师出错了");
			}
		})
	}
	function click_stylist(id){
		location.href = "/stylist/toDetail?id="+id
	}
</script>
</html>