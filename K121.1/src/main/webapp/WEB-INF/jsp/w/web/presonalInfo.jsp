<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
	<link href="/static/css/presonalInfo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="presonalInfo">
		<div class="presonalInfo_div">
			<div class="presonalInfo_context">
				<div class="presonalInfo_headimg"><img alt="" src="" id="userimg" style="width: calc(168px * 0.8928);height: calc(168px * 0.8928);"></div>
				<div class="presonalInfo_name" id="username">巴厘没有岛</div>
				<a href="/index/outlogin"   ><div class="presonalInfo_info">退出登录</div></a>
			</div>
			<div class="presonalInfo_form">
				<form class="form">
					<div class="form_context">
					<div class="presonalInfo_title">您的姓名：</div>
						<div>
							<input class="input_info" placeholder="请填写您的姓名" name="name" autocomplete="off">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="presonalInfo_title">您的电话：</div>
						<div>
							<input class="input_info" placeholder="请填写您的联系方式" name="phone" autocomplete="off">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="presonalInfo_title">您的地址：</div>
						<div>
							<input class="input_info" placeholder="请填写您的地址" name="adress" autocomplete="off">
						</div>
						<div class="line"></div>
					</div>
					<div>
						<div style="width: 180px;height: 56px;cursor:pointer" onclick="click_sub()"><img alt="" src="../static/images/adress/pic11.png"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		var url = "/presonal/onload"
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					document.getElementById('username').innerHTML=json.object.nickName;
					$("#userimg").attr("src",json.object.avatarUrl);
				}else if(json.resInteger==600){
					alert("无用户信息")
					location.href = "index/";
				}
			}
			
		})
	}
	function click_sub(){
		var url = "/presonal/update";
		var data = $(".form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"POST",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					alert("信息更新成功")
					window.location.reload();
				}else if(json.resInteger==600){
					alert("无用户信息")
					location.href = "index/";
				}
			}
			
		})
	}
</script>
</html>