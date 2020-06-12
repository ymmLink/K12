<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/static/css/mark.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	<script src="/static/layui/layui.js"></script>
	<script src="/static/layer/layer.js"></script>
 	<link rel="stylesheet" href="/static/layer/theme/default/layer.css">
 	<link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
	<div class="mark">
		<div class="mark_1" style="cursor:pointer"><img alt="" src="/static/images/icon_customer.png"></div>
		<div class="mark_2" style="cursor:pointer"><img alt="" src="/static/images/icon_shop.png" onclick="cart()"></div>
		<div class="mark_3" style="cursor:pointer"><img alt="" src="/static/images/icon_mine.png" onclick="person()"></div>
	</div>
	
</body>
<script type="text/javascript">
	function person(){
		
		$.ajax({
			"url":"/after/hasUser",
			"type":"POST",
			"dataType":"text",
			success:function(res){
				if(res=='false'){
					layer.open({
						  type: 2,
						  title: '伊莱达',
						  shadeClose: true,
						  shade: 0.8,
						  area: ['380px', '90%'],
						  content: "/presonal" //iframe的url
						}); 
				}else if(res=='true'){
					window.location.href="/presonal";
				}
			}
		});
	}
	function cart(){
		$.ajax({
			"url":"/after/hasUser",
			"type":"POST",
			"dataType":"text",
			success:function(res){
				if(res=='false'){
					layer.open({
						  type: 2,
						  title: '伊莱达',
						  shadeClose: true,
						  shade: 0.8,
						  area: ['380px', '90%'],
						  content: '/index/cart' //iframe的url
						}); 
				}else if(res=='true'){
					window.location.href="/index/cart";
				}
			}
		});
	}
</script>
</html>