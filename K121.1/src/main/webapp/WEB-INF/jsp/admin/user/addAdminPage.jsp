<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息</title>
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="/static/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 欢迎页
	<span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span>
	管理员信息 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="codeView " >
      <form action="addAdmin" method="post" class="form form-horizontal responsive" id="demoform" >
        <div class="row clearfix">
          <label class="form-label col-xs-3">账号：</label>
          <div class="formControls col-xs-8">
            <input type="text" class="input-text" placeholder="账号"  name="account" id="account" >
          </div>
        </div>
        <div class="row clearfix ps" style="display:none">
          <label class="form-label col-xs-3">密码：</label>
          <div class="formControls col-xs-8">
            <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="password" >
          </div>
        </div>
        <div class="row clearfix ps" style="display:none">
          <label class="form-label col-xs-3">密码验证：</label>
          <div class="formControls col-xs-8">
            <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2" >
          </div>
        </div>
        <div class="row clearfix">
          <label class="form-label col-xs-3">姓名：</label>
          <div class="formControls col-xs-8">
            <input type="text" class="input-text" placeholder="请输入名字"  name="name" id="name" >
          </div>
        </div>
        <div class="row clearfix">
          <label class="form-label col-xs-3">手机：</label>
          <div class="formControls col-xs-8">
            <input type="text" class="input-text" autocomplete="off" placeholder="手机" name="phone" id="phone" >
          </div>
        </div>
        <div class="row clearfix">
          <label class="form-label col-xs-3">头像：</label>
          <div class="col-xs-8" style="height:100px;width:100px;flex-direction: row;display: flex;" id="pic" >
            <div class="field" id="s1" >
				<div id="qxscan0" class="fieldpicqx">
					<div class="" onclick="selectImg(this)" style="height:100px;width:100px;padding:0px;border:0px;">
						<img style="width:100%;height:100%" src="/static/image/bei.png">
					</div>
					<input onchange="readFile(this)" size="100" style="display:none" type="file" name="file"/>
				</div>
			</div>
          </div>
        </div>
        <div class="row clearfix">
          <div class="col-xs-8 col-xs-offset-3">
            <input class="btn btn-primary" type="button" value="保存" data-state="0" onclick="saveChange(this)">
          </div>
        </div>
      </form>
    </div>
</body>
<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/static/layer/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript"
	src="/static/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	var img;
	function selectImg(item){
		$(item).next().click();
	}
	function readFile(item){
		var reader = new FileReader();
		reader.readAsDataURL(item.files[0]);  //转成base64
		reader.fileName = item.files[0].name;
		img=item.files[0];
		reader.onload = function(e){
			var show=$(item).prev().children()[0];
			$(show).attr("src",this.result);
		}
	}
	function saveChange(item){
		var param = new FormData();
		var account=$("#account").val();
		var password=$("#password").val();
		var password2=$("#password2").val();
		var name=$("#name").val();
		var phone=$("#phone").val();
		if(password.trim()==''||password!=password2){
			layer.alert("两次输入密码不一致");
		}else{
			param.append("account",account);
			param.append("password",password);
			param.append("name",name);
			param.append("phone",phone);
			param.append("file",img);
			$.ajax({
	            url:"addAdmin",
	            type:'POST',
	            data:param,
	            async: false,
	            cache: false,
	            contentType: false,
	            processData: false,
	            success:function(data){
	                //请求成功
	                if(data=='fail'){
	                	layer.alert("失败，请重试");	
	                }else{
	                	layer.alert("修改成功");
	                	$(item).attr("data-state","0");
	                	$(item).val("修改");
	                	$(".ps").css("display","none");
	                }
	            },
	            error:function(){
	                //请求失败
	                alert("上传失败");
	            }
	        });
		}
	}
</script>
</html>