<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>全屋定制</title>
	<link href="/static/css/customize.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		
		<div class="header_img"><img alt="" src="../static/images/customize.png" style="width: 100%;height: auto;"></div>
		
	</header>
	
	<div class="customize">
		<div class="customize_img">
			<div class="customize_img_1">
				
			
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	var video
	var totalTime = 0;
	var currentTime = 0;
	onload=function(){
		$("#customize").css("color","rgba(255,255,255,1)")
		$(".daohang1").css("display","flex")
		var url = "/customize/onload"
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs;
				if(json.resInteger==200){
					for(var i=0;i<list.length;i++){
						var op = ""
						if(list[i].video!=null){
							op="<div class='customize_img_1_1' onclick=click_detail("+list[i].id+") style='cursor:pointer'>"+
							"<div class='customize_img_1_1_img'><img class='custmize_img_img'  alt='' src='"+list[i].img+"' ></div>"+
							"<div class='customize_img_1_1_stop' ><img alt='' src='../static/images/stop.png' style='width: 78px;height: 78px;'></div>"+
							"<div class='customize_img_1_1_text'>"+list[i].title+"</div>"+
						"</div>";
						}else{
							op="<div class='customize_img_1_1' onclick=click_detail("+list[i].id+") style='cursor:pointer'>"+
							"<div class='customize_img_1_1_img'><img  class='custmize_img_img' alt='' src='"+list[i].img+"'></div>"+
							"<div class='customize_img_1_1_text'>"+list[i].title+"</div>"+
							"<div class='customize_img_1_1_text2'>"+list[i].detail+"</div>"+
						"</div>"
						}
						$(".customize_img_1").append(op);
					}
				}else if(json.resInteger==600){
					alert("设计师们还在加紧设计中");
					
				}
			},
			error:function(){
				alert("全屋定制出错了");
			}
		})
	
	}
	function click_detail(id){

		location.href = "/customize/getvideo?id="+id
		
	}
	function click1(str){
		var url = "/customize/classify?str="+str
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs;
				if(json.resInteger==200){
					$(".customize_img_1").empty();
					for(var i=0;i<list.length;i++){
						var op = ""
						if(list[i].video!=null){
							op="<div class='customize_img_1_1' onclick=click_detail("+list[i].id+") style='cursor:pointer'>"+
							"<div class='customize_img_1_1_img'><img alt='' src='"+list[i].img+"' style='width: calc(662px * 0.8928);height: calc(372px * 0.8928);'></div>"+
							"<div class='customize_img_1_1_stop' ><img alt='' src='../static/images/stop.png' style='width: 78px;height: 78px;'></div>"+
							"<div class='customize_img_1_1_text'>"+list[i].title+"</div>"+
						"</div>";
						}else{
							op="<div class='customize_img_1_1' onclick=click_detail("+list[i].id+") style='cursor:pointer'>"+
							"<div class='customize_img_1_1_img'><img alt='' src='"+list[i].img+" 'style='width: calc(662px * 0.8928);height: calc(372px * 0.8928);'></div>"+
							"<div class='customize_img_1_1_text'>"+list[i].title+"</div>"+
						"</div>"
						}
						$(".customize_img_1").append(op);
					}
				}else if(json.resInteger==600){
					alert("设计师们还在加紧设计中");
				}
			},
		})
	}
	
	
</script>
</html>