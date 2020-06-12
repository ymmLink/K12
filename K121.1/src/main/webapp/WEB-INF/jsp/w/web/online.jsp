<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在线定制</title>
	<link href="/static/css/online.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header_img"><img alt="" src="../static/images/online/different.png" style="width:100%;height: auto;"></div>
	</header>
	<div class="online">
		<div class="online_form">
			<form id="form">
				<div class="form_context">
					<div class="online_title">房屋大小：</div>
					<div>
						<input class="input_info" placeholder="请填写您的房屋大小" name="homeSize">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="online_title">咨询的项目：</div>
					<div>
						<input class="input_info" placeholder="请填写您要咨询的项目" name="consultProject">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="online_title">您的姓名：</div>
					<div>
						<input class="input_info" placeholder="请填写您的姓名" name="name">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="online_title">您的电话：</div>
					<div>
						<input class="input_info" placeholder="请填写您的联系方式" name="phone">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="online_title">您的地址：</div>
					<div>
						<input class="input_info" placeholder="请填写您的地址" name="adress">
					</div>
					<div class="line"></div>
				</div>
				<div>
					<div onclick="onclick_btn()"><img alt="" src="../static/images/online/submit.png"></div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#online").css("color","rgba(255,255,255,1)")
	}
	function onclick_btn(){
		var url = "/online/add"
		var data = $("#form").serialize()
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("提交成功，请耐心等待")
					location.href = "";
				}
			},
			error:function(){
			
			}
		})
	}
</script>
</html>