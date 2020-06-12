<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
	<link href="/static/css/login.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header_img">
			<img alt="" src="../static/images/login/log.png" style="width: 100%;height: 100%;">
			<div class="login_div">
			<div class="login_title">微信授权登陆</div>
			<div class="login_img"><!-- <img alt="" src="../static/images/login/pic2.png" style="width: calc(306px * 1);height: calc(306px * 1);"> --></div>
			<div class="login_text">请使用微信扫描二维码登录伊莱达</div>
		</div>
		</div>
		
	</header>
	
</body>
<script type="text/javascript">
	
</script>
</html>