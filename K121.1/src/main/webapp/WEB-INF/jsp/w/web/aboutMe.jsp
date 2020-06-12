<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>关于我们</title>
	<link href="/static/css/aboutMe.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/swiper.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/static/js/swiper.min.js"></script>
	
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
		<!-- 轮播组件 -->
		<div class="partzero" > 
			<div class="swiper-container" >
				<div class="swiper-wrapper">
					<c:forEach items="${showImgList }" var="c" varStatus="index" >
						<div class="swiper-slide orange-slide" onclick="open_video()">
							<img class="slideimg" alt="" src="${c.img}" style="width: 100%;height: 640px;">
							<!-- <div class="stop">
								<img alt="" src="../static/images/stop.png" style="width: calc(174px * 1);height: calc(174px * 1)">
							</div> -->
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<!-- <div class="video">
			<div><img alt="" src="../static/images/video.png"></div>
			<div class="stop"><img alt="" src="../static/images/stop.png"></div>
		</div> -->
		
		<!-- <div class="video">
			<div class="close" onclick="close_video()"><img alt="" src="../static/images/close.png"></div>
			<video controls>  
	    		<source src="/static/video/movie.mp4" type="video/mp4">  
	   			<source src="/static/video/movie.ogg" type="video/ogg">  
	    		<source src="/static/video/movie.webm" type="video/webm"> 
	    		<object data="movie.mp4" width="320px" height="240px">    
	        		<embed src="/static/video/movie.swf" width="320px" height="240px">  
	    		</object> 
			</video>
			
		</div> -->
		
		
		
		
		<div class="aboutme">
			<div class="aboutme_content">
				<div class="aboutme_title">${aboutUs.usBigTitle }</div>
				<div class="aboutme_detail">${aboutUs.usSmallTitle }</div>
			</div>
			<div class="aboutme_text">
				${aboutUs.usText }
			</div>
		</div>
	
		<div class="glorious">
			<div class="glorious_content">
				<div class="glorious_title">${aboutUs.medalBigTitle }</div>
				<div class="glorious_detail">${aboutUs.medalSmallTitle }</div>
			</div>
			<div class="glorious_img">
				<!-- <div class="glorious_img_1"><img alt="" src="../static/images/medal1.png" style="width: calc(248px * 1);height: calc(248px * 1)"></div>
				<div class="glorious_img_1"><img alt="" src="../static/images/medal2.png" style="width: calc(248px * 1);height: calc(248px * 1)"></div>
				<div class="glorious_img_1"><img alt="" src="../static/images/medal3.png" style="width: calc(248px * 1);height: calc(248px * 1)"></div>
				<div class="glorious_img_1"><img alt="" src="../static/images/medal4.png" style="width: calc(248px * 1);height: calc(248px * 1)"></div>
				<div class='glorious_img_1'><img alt="" src="../static/images/medal5.png" style="width: calc(248px * 1);height: calc(248px * 1)"></div> -->
			</div>
		</div>
	
		<div class="magazine">
			<div class="magazine_content">
				<div class="magazine_title">${aboutUs.magazineBigTitle }</div>
				<div class="magazine_detail">${aboutUs.magazineSmallTitle }</div>
			</div>
			<div class="magazine_img">
				<!-- <div class="magazine_img_1"><img alt="" src="/static/images/magezine1.png" style="width: calc(232px * 1);height: calc(254px * 1)"></div>
				<div class="magazine_img_1"><img alt="" src="/static/images/magezine2.png" style="width: calc(232px * 1);height: calc(254px * 1)"></div>
				<div class="magazine_img_1"><img alt="" src="/static/images/magezine3.png" style="width: calc(232px * 1);height: calc(254px * 1)"></div>
				<div class="magazine_img_1"><img alt="" src="/static/images/magezine4.png" style="width: calc(232px * 1);height: calc(254px * 1)"></div>
				<div ><img alt="" src="../static/images/magezine5.png" style="width: calc(232px * 1);height: calc(254px * 1)"></div> -->
			</div>
		</div>
	
		<div class="design">
			<div class="design_content">
				<div class="design_title">${aboutUs.designBigTitle }</div>
				<div class="design_detail">${aboutUs.designSmallTitle }</div>
			</div>
			<div class="design_img">
				<!-- <div class="design_img_1">
					<div class="design_img_headimg"><img alt="" src="/static/images/design1.png" style="width: calc(301px * 1);height: calc(170px * 1)"></div>
					<div class="design_img_info">
						<div class="design_name">张艳丹</div>
						<div class="design_jianjie">南京艺术学院毕业，中国设计十大杰出青年，18年家具设计金奖</div>
					</div>
				</div>
				<div class="design_img_1">
					<div class="design_img_headimg"><img alt="" src="/static/images/design2.png" style="width: calc(301px * 1);height: calc(170px * 1)"></div>
					<div class="design_img_info">
						<div class="design_name">张某某</div>
						<div class="design_jianjie">南京艺术学院毕业，中国设计十大杰出青年，18年家具设计金奖</div>
					</div>
				</div>
				<div class="design_img_1">
					<div class="design_img_headimg"><img alt="" src="/static/images/design3.png" style="width: calc(301px * 1);height: calc(170px * 1)"></div>
					<div class="design_img_info">
						<div class="design_name">卡卷·奥利</div>
						<div class="design_jianjie">南京艺术学院毕业，中国设计十大杰出青年，18年家具设计金奖</div>
					</div>
				</div>
				<div class="design_img_2">
					<div class="design_img_headimg"><img alt="" src="/static/images/design4.png" style="width: calc(301px * 1);height: calc(170px * 1)"></div>
					<div class="design_img_info">
						<div class="design_name">托马斯·杰里科</div>
						<div class="design_jianjie">南京艺术学院毕业，中国设计十大杰出青年，18年家具设计金奖</div>
					</div>
				</div> -->
			</div>
			<div class="design_buttom" onclick="click_designer()" style="cursor:pointer">
				<div class="design_buttom_name">查看更多设计师</div>
			</div>
		</div>
	
		<div class="partners">
			<div class="partners_content">
				<div class="partners_title">${aboutUs.cooperationBigTitle }</div>
				<div class="partners_detail">${aboutUs.cooperationSmallTitle }</div>
			</div>
			<div class="partners_img"><img alt="" src="${aboutUs.cooperationImg }" style="width: calc(1344px * 0.8645);height: calc(623px * 0.8645)"></div>
		</div>
	
		<div class="shop">
			<div class="design_content">
				<div class="design_title">${aboutUs.storeBigTitle }</div>
				<div class="design_detail">${aboutUs.storeSmallTitle }</div>
			</div>
			<div class="shop_img">
				<!-- <div class="shop_img_1">
					<div class="shop_img_headimg"><img alt="" src="/static/images/shop1.png" style="width: calc(657px * 1);height: calc(370px * 1)"></div>
				</div>
				<div class="shop_img_2">
					<div class="shop_img_headimg"><img alt="" src="/static/images/shop2.png" style="width: calc(657px * 1);height: calc(370px * 1);bac"></div>
				</div> -->
			</div>
			<div class="design_buttom" onclick="click_store()" style="cursor:pointer">
				<div class="design_buttom_name">查看更多门面</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
	
</body>
<script type="text/javascript">
	/* var video =  document.querySelector('video');
	var totalTime = 0;
	var currentTime = 0; */
	var mySwiper = new Swiper('.swiper-container',{
	  	loop: true,
		autoplay: 3000,
	    pagination: '.swiper-pagination',
	    paginationClickable: true, 
	    autoHeight:true,
	    autoplayDisableOnInteraction:true
	});
	var a = setInterval("mySwiper.slideNext()", 5000);
	
	onload=function(){
		//alert(11)
		$("#about").css("color","rgba(255,255,255,1)")
		var url = "/aboutMe/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list1 = json.objs;
				var list2 = json.objs2;
				var list3 = json.objs3;
				var list4 = json.objs4;
				if(json.resInteger==200){
					for(var i=0;i<list1.length;i++){
						var op = "<div class='glorious_img_1'><img alt='' src='"+list1[i].img+"' style='width: calc(248px * 0.8645);height: calc(248px * 0.8645)'></div>";
						$(".glorious_img").append(op);
					}
					for(var i=0;i<list2.length;i++){
						var op = "<div class='magazine_img_1'><img alt='' src='"+list2[i].img+"' style='width: calc(232px * 0.8928);height: calc(254px * 0.8928)'></div>";
						$(".magazine_img").append(op);
					}
					for(var i=0;i<list3.length;i++){
						var op = "<div class='design_img_1' style='text-align: center;'>"+
						"<div class='design_img_headimg'><img alt='' src='"+list3[i].img+"' style='height: calc(170px * 0.8928);margin: 0 auto;'></div>"+
						"<div class='design_img_info'>"+
							"<div class='design_name'>"+list3[i].name+"</div>"+
							"<div class='design_jianjie'>"+list3[i].describe+"</div>"+
						"</div>"+
					"</div>";
						$(".design_img").append(op);
					}
					for(var i=0;i<list4.length;i++){
						var op = "<div class='shop_img_1'>"+
						"<div class='shop_img_headimg'><img alt='' src='"+list4[i].img+"' style='width: calc(657px * 0.8926);height: calc(370px * 0.8926)'></div>"+
						"</div>";
						$(".shop_img").append(op);
					}
				}
			}
			
		})
	}
	function click_designer(){
		location.href = "/index/stylist";
	}
	function click_store(){
		location.href = "/index/shop";
	}
	/*
	
	$("#about").css("color","rgba(255,255,255,1)")
		var url = "/aboutMe/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				
				if(json.resInteger==200){
					var op = "<div class='glorious_img_1'><img alt='' src='../static/images/medal1.png' style='width: calc(248px * 1);height: calc(248px * 1)'></div>"+
					"<div class='glorious_img_1'><img alt='' src='../static/images/medal2.png' style='width: calc(248px * 1);height: calc(248px * 1)'></div>"+
					"<div class='glorious_img_1'><img alt='' src='../static/images/medal3.png' style='width: calc(248px * 1);height: calc(248px * 1)'></div>"+
					"<div class='glorious_img_1'><img alt='' src='../static/images/medal4.png' style='width: calc(248px * 1);height: calc(248px * 1)'></div>"+
					"<div class='glorious_img_1'><img alt='' src='../static/images/medal5.png' style='width: calc(248px * 1);height: calc(248px * 1)'></div>";
				}
			}
			
		})
	
	function open_video(){
		$(".video").css("display","block")
		video.currentTime = totalTime;
		video.play();
	}
	function close_video(){
		video.pause();
		$(".video").css("display","none")
	} */
</script>
</html>