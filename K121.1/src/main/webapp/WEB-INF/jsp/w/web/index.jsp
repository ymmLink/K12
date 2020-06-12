<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="java.util.List"%>
    <%@page import="com.example.demo.entity.Store"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
	<link href="/static/css/index.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/swiper.min.css" rel="stylesheet" type="text/css">
	
</head>
<<<<<<< .mine
<body style="padding:0px;margin:0px">
||||||| .r21069
<body>
=======
<body style="margin:0px;">
>>>>>>> .r21091
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../static/js/swiper.min.js"></script>
	<header class="header"></header>
	<div class="body">
		<div class="top_title"><img alt="" src="../static/images/title.png" style="width: calc(258px * 1);height: calc(41px * 1);"></div>
		<div class="top_daohang">
			<ul>
				<li>首页</li>
				<li><a href="index/about" style="text-decoration : none; color:rgba(51,51,51,1)">关于我们</a></li>
				<li><a href="index/activity" style="text-decoration : none;color:rgba(51,51,51,1)">优惠活动</a></li>
				<li><a href="index/customize" style="text-decoration : none;color:rgba(51,51,51,1)">全屋定制</a></li>
				<li><a href="index/furniture" style="text-decoration : none;color:rgba(51,51,51,1)">家具家私</a></li>
				<li><a href="index/ironmongery" style="text-decoration : none;color:rgba(51,51,51,1)">门窗五金</a></li>
				<li><a href="index/online" style="text-decoration : none;color:rgba(51,51,51,1)">在线定制</a></li>
				<li><a href="index/news" style="text-decoration : none;color:rgba(51,51,51,1)">新闻资讯</a></li>
				<li><a href="index/stylist" style="text-decoration : none;color:rgba(51,51,51,1)">找设计师</a></li>
				<li><a href="index/shop" style="text-decoration : none;color:rgba(51,51,51,1)">实体门店</a></li>
				<li><a href="index/cooperate" style="text-decoration : none;color:rgba(51,51,51,1)">合作加盟</a></li>
				<li><a href="index/lianxi" style="text-decoration : none;color:rgba(51,51,51,1)">联系留言</a></li>
			</ul>
		</div>
		
		<!-- 轮播组件 -->
		<div class="partzero">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach items="${banners}" var="c" varStatus="index">
						<div class="swiper-slide orange-slide">
							<img class="slideimg" alt="" src="${c.image}" style="width: 100%;height: 90%;">
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
			
		<div class="online">
			<div class="online_text">
				<div class="top">${bcList01[0].title }</div>
				<div class="buttom">${bcList01[0].smallTitle }</div>
			</div>
			<div class="online_img">
				<div class="online_img_1"><a href="index/online"><img src="${bcList01[0].img }" style="width: calc(309px * 0.893);height: calc(343px * 0.893);"></a></div>
				<div class="online_img_2"><a href="index/online"><img src="${bcList01[1].img }" style="width: calc(309px * 0.893);height: calc(343px * 0.893);"></a></div>
				<div class="online_img_3"><a href="index/online"><img src="${bcList01[2].img }" style="width: calc(309px * 0.893);height: calc(343px * 0.893);"></a></div>
				<div class="online_img_4"><a href="index/online"><img src="${bcList01[3].img }" style="width: calc(309px * 0.893);height: calc(343px * 0.893);"></a></div>
			</div>
		</div>
		
		<div class="customize" >
			<div class="online_text">
				<div class="top">${bcList02[0].title }</div>
				<div class="buttom">${bcList02[0].smallTitle }</div>
			</div>
			<div class="online_img" style="height: 410px;">
				<div class="customize_1"><a href="index/customize"><img src="${bcList02[0].img }" style="width: calc(410px * 0.9268);height: calc(410px * 0.9268);margin-left:16px"></a></div>
				<div class="customize_2"><a href="index/customize"><img src="${bcList02[1].img }" style="width: calc(410px * 0.9268);height: calc(410px * 0.9268);margin-left:8px"></a></div>
				<div class="customize_3"><a href="index/customize"><img src="${bcList02[2].img }" style="width: calc(410px * 0.9268);height: calc(410px * 0.9268);"></a></div>
			</div>
			<div class="buttum_img">
				<div class="buttum_img_1"><a href="index/userorder"><img src="${bcList05[0].img }" style="width: calc(896px * 0.8928);height: calc(504px * 0.8928);margin-left:16px"></a></div>
				<div class="buttum_img_2">
					<div class="buttum_img_2_1"><a href="index/cooperate"><img src="${bcList04[0].img }" style="width: calc(448px * 0.8928);height: calc(252px * 0.8928);margin-left:16px"></a></div>
					<div class="buttum_img_2_1"><a href="index/stylist"><img src="${bcList03[0].img }" style="width: calc(448px * 0.8928);height: calc(252px * 0.8928);margin-left:16px"></a></div>
				</div>
			</div>
		</div>
		
		<div class="product">
			<div class="online_text">
				<div class="top">${bcList06[0].title }</div>
				<div class="buttom">${bcList06[0].smallTitle }</div>
			</div>
			<div class="title">
				<div class="title_text">
					<div class="text_1">家具家私</div>
					<div style="cursor:pointer" class="text_2" onclick="click_more()">
						<div class="text_2_1">更多</div>
						<div class="text_2_2">></div>
						<div class="text_2_3">></div>
					</div></a>
				</div>
				<div class="line">
					<div class="line_1"></div>
				</div>
				<div class="big_div">
					<c:forEach items="${furniture}" var="u" varStatus="s">
						<div class="product_1">
							<div class="product_img"><img alt="" src="${u.skuMainPic }" style="width: calc(321px * 0.9345);height: calc(181px * 0.9345);"></div>
							<div class="product_content">
								<div class="product_text">${u.title }</div>
								<div class="product_price">￥${u.price } </div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>

			<div class="title">
				<div class="title_text">
					<div class="text_1">五金门窗</div>
					<div style="cursor:pointer" class="text_2" onclick="click_wujing()">
						<div class="text_2_1">更多</div>
						<div class="text_2_2">></div>
						<div class="text_2_3">></div>
					</div>
				</div>
				<div class="line">
					<div class="line_1"></div>
				</div>
				<div class="big_div">
					<c:forEach items="${ironmongery}" var="u" varStatus="s">
						<div class="product_1">
							<div class="product_img"><img alt="" src="${u.skuMainPic }" style="width: calc(321px * 0.9345);height: calc(181px * 0.9345);"></div>
							<div class="product_content">
								<div class="product_text">${u.title }</div>
								<div class="product_price">￥${u.price } </div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			
			
			
		</div>
		<!-- 优质门店 -->
		<div class="youzhi">
			<div class="youzhi_div">
				<div class="youzhi_content">
					<div class="youzhi_text">${bcList08[0].title }</div>
					<div class="youzhi_detail">${bcList08[0].smallTitle }</div>
				</div>
				<div class="youzhi_img">
					<div id="youzhi_img_1" class="youzhi_img_div">
						<img alt="" src="${store[0].img }" style="width: calc(657px * 0.8928);height: calc(370px * 0.8928)">
						<div id="img1" style="width:100%;height:80px;background:rgba(0,0,0,0.5);display:none;position: absolute;left: 0;bottom: 0;">
							<div class="youzhi_img_div_text">${store[0].name }</div>
							<div class="youzhi_img_div_xingji">
							<%List<Store> store = (List<Store>)session.getAttribute("store");
							for(int i=0;i<Integer.valueOf(store.get(0).getStar());i++){ %>
								<div><img alt="" src="/static/images/index/pic5.png" style="margin-right: 10px;width: calc(16px * 0.8928);height: calc(16px * 0.8928)" ></div>
							<%} %>
							<%for(int i=0;i<5-Integer.valueOf(store.get(0).getStar());i++){ %>
								<div><img alt="" src="/static/images/index/pic6.png" style="margin-right: 10px;width: calc(16px * 0.8928);height: calc(16px * 0.8928)"></div>
							<%} %>
							</div>
						</div>
					</div>
					<div id="youzhi_img_2" class="youzhi_img_div">
						<img alt="" src="/static/images/youzhi_2.png" style="width: calc(657px * 0.8928);height: calc(370px * 0.8928)">
						<div id="img2" style="width:100%;height:80px;background:rgba(0,0,0,0.5);display:none;position: absolute;left: 0;bottom: 0;">
							<div class="youzhi_img_div_text">${store[0].name }</div>
							<div class="youzhi_img_div_xingji">
								<%
								for(int i=0;i<Integer.valueOf(store.get(1).getStar());i++){ %>
									<div><img alt="" src="/static/images/index/pic5.png" style="margin-right: 10px;width: calc(16px * 0.8928);height: calc(16px * 0.8928)" ></div>
								<%} %>
								<%for(int i=0;i<5-Integer.valueOf(store.get(1).getStar());i++){ %>
									<div><img alt="" src="/static/images/index/pic6.png" style="margin-right: 10px;width: calc(16px * 0.8928);height: calc(16px * 0.8928)"></div>
								<%} %>
							</div>
						</div>
					</div>
				</div>
				<div class="youzhi_more">
					<a href="index/shop" style="text-decoration : none;"><div class="youzhi_more_text">查看更多门店</div></a>
				</div>
			</div>
		</div>
		<div class="news">
			<div class="news_1">
				<div class="news_content">
					<div class="news_text">${bcList09[0].title }</div>
					<div class="news_detail">${bcList09[0].smallTitle }</div>
				</div>
				<div class="news_img">
					<div class="news_img_div">
						<c:forEach items="${news}" var="u" varStatus="s">
						<div class="news_img_${s.index+1 }">
							<img alt="" src="${u.img }" style="width: calc(657px * 0.8904);height: calc(370px * 0.8904)">
							<div id="img_div_${s.index }" style="width:100%;height:80px;background:rgba(0,0,0,0.5);display:none;position: absolute;left: 0;bottom: 0;">
								<div style="margin-top: 19px;margin-left: 20px;">
									<div class="news_img_text">${u.title }</div>
									<div class="news_img_data">${u.submitDate.substring(0,10) }</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
			<div class="youzhi_more">
				<a href="index/news" style="text-decoration : none;"><div class="youzhi_more_text">查看更多新闻</div></a>
			</div>
			<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
		</div>

	</div>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">

	$(function(){
		$('#youzhi_img_1').hover(function() {
			$("#img1").css("display","block");
	    },function(){
	    	$("#img1").css("display","none");
	    });
	});
	
	$(function(){
		$('#youzhi_img_2').hover(function() {
			$("#img2").css("display","block");
	    },function(){
	    	$("#img2").css("display","none");
	    });
	});
	
	$(function(){
		$('.news_img_1').hover(function() {
			$("#img_div_0").css("display","block");
	    },function(){
	    	$("#img_div_0").css("display","none");
	    });
	});
	$(function(){
		$('.news_img_2').hover(function() {
			$("#img_div_1").css("display","block");
	    },function(){
	    	$("#img_div_1").css("display","none");
	    });
	});
	
	$(function(){
		$('.news_img_3').hover(function() {
			$("#img_div_2").css("display","block");
	    },function(){
	    	$("#img_div_2").css("display","none");
	    });
	});
	$(function(){
		$('.news_img_4').hover(function() {
			$("#img_div_3").css("display","flex");
	    },function(){
	    	$("#img_div_3").css("display","none");
	    });
	}); 
	var mySwiper = new Swiper('.swiper-container',{
	  	loop: true,
		autoplay: 3000,
	    pagination: '.swiper-pagination',
	    paginationClickable: true,
	    autoHeight:true,
	});
	setInterval("mySwiper.slideNext()", 5000);
	
	function click_more(){
		location.href = "index/furniture"
	}
	function click_wujing(){
		location.href = "index/ironmongery"
	}
</script>
</html>