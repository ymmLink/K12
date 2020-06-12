<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>个人中心</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<link rel="stylesheet" href="/static/pintuer/css/pintuer.css">
	    <link rel="stylesheet" href="/static/pintuer/css/admin.css">
	    <script src="/static/pintuer/js/jquery.js"></script>
	    <script src="/static/pintuer/js/pintuer.js"></script>
	</head>

	<body style="background-color: #F5F5F5;">
		<div >
			<div style="height: 120px;background-color: #700000;">
				<div style="height: 100px;">
					<div style="height: 70px;float: left;width: 20%;margin-left: 40%;margin-top: 10px; ">
						<img style="width: 100%;height: 70px;border-radius:100px;" alt="" src="${team.headimg }">
					</div>
				</div>
				<div style="height: 20px;width: 100%;text-align: center;line-height: 0px;color: white;font-size: 17px;letter-spacing: 1px;">
					${team.nickname }
				</div>
			</div>
		</div>
		<c:import url="fenxiang.jsp"></c:import>
	</body>
</html>
