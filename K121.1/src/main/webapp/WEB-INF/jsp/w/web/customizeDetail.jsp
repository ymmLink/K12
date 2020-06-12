<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.example.demo.entity.Customized"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全屋定制详情</title>
	<link href="/static/css/custmoizeDetail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<% 		Customized customized = (Customized)session.getAttribute("customized");
				String video = customized.getVideo();
			if(video!=null){%>
			<div class="header_img">
			<!-- <div class="close" onclick="close_video()"><img alt="" src="../static/images/close.png"></div> -->
			<video controls style="width: 100%;height: 640px;">  
	    		<source src="${customized.video.substring(0,customized.video.lastIndexOf('.')) }.mp4" type="video/mp4">  
	   			<source src="${customized.video.substring(0,customized.video.lastIndexOf('.')) }.ogg" type="video/ogg">  
	    		<source src="${customized.video.substring(0,customized.video.lastIndexOf('.')) }.webm" type="video/webm"> 
	    		<object data="movie.mp4" width="320px" height="240px">    
	        		<embed src="${customized.video.substring(0,customized.video.lastIndexOf('.')) }.swf" width="320px" height="240px">  
	    		</object> 
			</video>
		</div>
		<%}else{ %>
			<div class="header_img"><img alt="" src="${ customized.img}" style="width: 100%;height: 640px;"></div>
		<%} %>
	</header>
	<div class="customizeDetail">
		<div class="customizeDetail_person">
			<div class="customizeDetail_person_name">${ customized.title}</div>
			<div class="customizeDetail_person_info">
				<div>
					<div class="customizeDetail_headimg"><image src="${ customized.img}" style="width:calc(60px * 0.8928);height:calc(60px * 0.8928);border-radius:50%;"></div>
				</div>
				<div class="customizeDetail_info">
					<div>
						<div class="customizeDetail_name">${designer.name } 设计</div>
						<div class="customizeDetail_detail">${designer.describe }</div>
					</div>
					<div style="cursor:pointer" class="customizeDetail_cakan" onclick="click_style(${designer.id })">查看设计师</div>
				</div>
			</div>
		</div>
		
		<div class="customizeDetail_img">
			<div class="customizeDetail_text">
				${customized.detail }
				<!-- <div >甜而不腻，张艳丹和她的设计师团队，用四平落地的建筑线条、点状射灯、玻璃与整墙面墙纸等，带出了明快的现代气息。
				“要软萌，却不能让人觉得特别廉价，照顾了圆润感，更要空间轮廓”。去除了多余的柔性软装（窗帘，装饰画等），让空间基线漂亮地露出来。</div>
				<img alt="" src="../static/images/customize/customize_pic7.png" style="width: 956px;height: 538px;">
			
				<div >为了让空间不单调，Leon选择用点缀型的单品插入，让颜色和造型都更丰富。“柔嫩的小圆领的粉，气球沙发的蓝则非常明媚，这样穿插，把单色的呆板就破了。”</div>
				<img alt="" src="../static/images/customize/customize_pic8.png" style="width: 956px;height: 538px;">
			
				<div >▲玻璃，延展视觉通透性，半私密效果，互不干扰的听觉沟通，想增加更多私密感，百叶窗了解一下。</div>
				<img alt="" src="../static/images/customize/customize_pic9.png" style="width: 956px;height: 538px;">
			
				<div >甜而不腻，张艳丹和她的设计师团队，用四平落地的建筑线条、点状射灯、玻璃与整墙面墙纸等，带出了明快的现代气息。
				“要软萌，却不能让人觉得特别廉价，照顾了圆润感，更要空间轮廓”。去除了多余的柔性软装（窗帘，装饰画等），让空间基线漂亮地露出来。</div>
				<img alt="" src="../static/images/customize/customize_pic10.png" style="width: 956px;height: 538px;"> -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#customize").css("color","rgba(255,255,255,1)")
	}
	function click_style(id){
		location.href = "/stylist/toDetail?id="+id;
	}
</script>
</html>