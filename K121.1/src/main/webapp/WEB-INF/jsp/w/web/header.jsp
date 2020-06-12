<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='shortcut icon' href='../static/images/favico.ico'/>
<link rel='bookmark' href='../static/images/favico.ico'/>
	<link href="/static/css/header.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div class="out_top">
		<div class="top">
			<div class="inner_top">
			<div style="display:flex;background: rgba(49,49,49,1);width: 1200px;margin: 0 auto">
				<div class="top_img"><img alt="" src="../static/images/logo2.png" style="width:calc(225px * 0.615)"></div>
				<div>
					<ul style="margin-top: 19px;">
						<li>
							<div><a href="/index" style="text-decoration : none; color:rgba(255,255,255,1)">首页</a></div>
							<div class="dian">●</div>
						</li>
						<li>
							<div><a href="/index/about" style="text-decoration : none; color:rgba(255,255,255,1)">关于我们</a></div>
							<div class="dian" id="about">●</div>
						</li>
						<li>
							<div><a href="/index/activity" style="text-decoration : none; color:rgba(255,255,255,1)">优惠活动</a></div>
							<div class="dian" id="activity">●</div>
						</li>
						<li>
							<div onclick="click_daohang('1')"><a href="/index/customize" style="text-decoration : none; color:rgba(255,255,255,1)">全屋定制</a></div>
							<div class="dian" id="customize">●</div>
						</li>
						<li>
							<div onclick="click_daohang('2')"><a href="/index/furniture" style="text-decoration : none; color:rgba(255,255,255,1)">家具家私</a></div>
							<div class="dian" id="furniture">●</div>
						</li>
						<li>
							<div onclick="click_daohang('3')"><a href="/index/ironmongery" style="text-decoration : none; color:rgba(255,255,255,1)">门窗五金</a></div>
							<div class="dian" id="ironmongery">●</div>
						</li>
						<li>
							<div><a href="/index/userorder" style="text-decoration : none; color:rgba(255,255,255,1);">客户晒单</a></div>
							<div class="dian" id="lianxi">●</div>
						</li>
						<li>
							<div><a href="/index/news" style="text-decoration : none; color:rgba(255,255,255,1)">新闻资讯</a></div>
							<div class="dian" id="news">●</div>
						</li>
						<li>
							<div><a href="/index/stylist" style="text-decoration : none; color:rgba(255,255,255,1)">找设计师</a></div>
							<div class="dian" id="stylist">●</div>
						</li>
						<li>
							<div><a href="/index/shop" style="text-decoration : none; color:rgba(255,255,255,1)">实体门店</a></div>
							<div class="dian" id="shop">●</div>
						</li>
						<li>
							<div><a href="/index/cooperate" style="text-decoration : none; color:rgba(255,255,255,1)">合作加盟</a></div>
							<div class="dian" id="cooperate" >●</div>
						</li>
						
						<li>
							<div><a href="/index/online" style="text-decoration : none; color:rgba(255,255,255,1)">在线定制</a></div>
							<div class="dian" id="online">●</div>
						</li>
					</ul>
					
				</div>
				</div>
			</div>
			<div class="daohang1" style="display: none">
				<div class="daohang_div1" >
				<c:forEach items="${customizeStyles}" var="u" varStatus="s">
					<div onclick="click1('${u.style }')" style="cursor:pointer">${u.style }</div>
				</c:forEach>
					<!-- <div onclick="click1('欧式')" style="cursor:pointer">欧式</div>
					<div onclick="click1('新中式')" style="cursor:pointer">新中式</div>
					<div onclick="click1('地中海')" style="cursor:pointer">地中海</div>
					<div onclick="click1('现代简约')" style="cursor:pointer">现代简约</div>
					<div onclick="click1('轻奢极简')" style="cursor:pointer">轻奢极简</div> -->
				</div>
			</div>
			<div class="daohang2" style="display: none">
				<div class="daohang_div2">
				<c:forEach items="${smallCategorys}" var="u" varStatus="s">
					<div onclick="click1('家具家私','${u.name }')" style="cursor:pointer">${u.name }</div>
				</c:forEach>
					<!-- <div onclick="click1('家具家私','桌几')" style="cursor:pointer">桌几</div>
					<div onclick="click1('家具家私','灯具')" style="cursor:pointer">灯具</div>
					<div onclick="click1('家具家私','沙发')" style="cursor:pointer">沙发</div>
					<div onclick="click1('家具家私','柜架')" style="cursor:pointer">柜架</div>
					<div onclick="click1('家具家私','椅凳')" style="cursor:pointer">椅凳</div> -->
				</div>
			</div>
			<div class="daohang3" style="display: none">
				<div class="daohang_div3">
				<c:forEach items="${smallCategorys}" var="u" varStatus="s">
					<div onclick="click1('门窗五金','${u.name }')" style="cursor:pointer">${u.name }</div>
				</c:forEach>
					<!-- <div onclick="click1('门窗五金','门')" style="cursor:pointer">门</div>
					<div onclick="click1('门窗五金','拉手')" style="cursor:pointer">拉手</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>