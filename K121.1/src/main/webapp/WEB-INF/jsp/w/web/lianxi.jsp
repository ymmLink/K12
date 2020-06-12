<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>联系留言</title>
	<link href="/static/css/lianxi.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header_img"><img alt="" src="../static/images/cooperate/lianxi.png" style="width: 100%;height: auto"></div>
	</header>
	<div class="lianxi">
		<div class="lianxi_div">
			<form class="form" id="form">
					<div class="form_context">
						<div class="cooperate_form_title">您的姓名：</div>
						<div>
							<input class="input_info" placeholder="请填写您的姓名" name="name">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="cooperate_form_title">您的电话：</div>
						<div>
							<input class="input_info" placeholder="请填写您的联系方式" name="phone"> 
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="cooperate_form_title">留言：</div>
						<div>
							<input class="input_info" placeholder="请填写您的意见/反馈" name="message">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_button">
						<div onclick="click_sub()"><img alt="" src="../static/images/cooperate/submit.png" style="width: calc(180px * 1);height: calc(56px * 1)"></div>
						
					</div>
				</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#lianxi").css("color","rgba(255,255,255,1)")
	}
	function click_sub(){
		var url="/aboutMe/lianxi";
		var data  = $("#form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("提交成功，我们会虚心接受您的意见")
				}
			},
			error:function(){
				alert("修改出错了");
			}
		})
	}
</script>
</html>