<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>k12管理系统</title>
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link href="/static/h-ui/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<link href="/static/h-ui.admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/static/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet"
	type="text/css" />
<link href="/static/layer/theme/default/layer.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
</head>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/layer/layer.js"></script>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<div class="form form-horizontal" >
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="userName" name="userName" type="text" 
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password"
							 class="input-text size-L">
					</div>
				</div>
				<div id="err"></div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							name="" type="submit" class="btn btn-success radius size-L"
							onclick="login()" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
		</div>
	</div>
</body>
<script type="text/javascript">
function login() {
	var userName = $("#userName").val();
	var password = $("#password").val();
	var ip = returnCitySN["cip"];
	$.post("/admin/doLogin", {
		account : userName,
		password : password,
		ip : ip
	}, function(date) {
		console.log(date);
		if (date == 1) {
			window.location.href = "/admin/login";
		} else {
			layer.alert("账号或密码输入错误");
			
		}
	});
	$(document).ready(function (){
		var msg="${msg}";
		if(msg=='noLogin'){
			window.parent.location.href="/admin/login";
		}
	});
}
</script>
</html>