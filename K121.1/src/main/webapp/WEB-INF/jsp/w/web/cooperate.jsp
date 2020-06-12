<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合作加盟</title>
	<link href="/static/css/cooperate.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<div class="header_img"><img alt="" src="../static/images/cooperate/cooperate.png" style="width: 100%;height: auto"></div>
	</header>
	<div class="cooperate">
		<div class="cooperate_div">
			<div class="cooperate_form">
				<form class="form">
					<div class="form_context">
						<div class="cooperate_form_title">您的姓名：</div>
						<div>
							<input class="input_info" placeholder="请填写您的姓名" name="name" autocomplete="off">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="cooperate_form_title">您的电话：</div>
						<div>
							<input class="input_info" placeholder="请填写您的联系方式" name="phone" autocomplete="off"> 
						</div>
						<div class="line"></div>
					</div>
					<div class="form_context">
						<div class="cooperate_form_title">您的合作意向：</div>
						<div>
							<input class="input_info" placeholder="请填写您的合作意向" name="intention" autocomplete="off">
						</div>
						<div class="line"></div>
					</div>
					<div class="form_button">
						<div onclick="click_sub()"><img alt="" src="../static/images/cooperate/submit.png"></div>
						<div class="form_button_text">稍后会有工作人员跟你联系，请耐心等待。</div>
					</div>
				</form>
			</div>
		</div>
		<div class='img'>
			<div class="img_div">
				<div><img alt="" src="../static/images/cooperate/pic1.png" style="width: calc(1344px * 0.8928);height: calc(756px * 0.8928)"></div>
				<!-- <div>
					<div>集合采购</div>
					<div></div>
					<div>从点睛单品到惊艳全屋的解决方案，一次满足多样空间、风格、户型需求。如您是公司、酒店、公寓、咖啡厅、房地产或空间设计师等大宗采购方，我们期待与您共创中国的当代生活印记。</div>
				</div> -->
			</div>
			<div class="img_div">
				<div><img alt="" src="../static/images/cooperate/pic2.png" style="width: calc(1344px * 0.8928);height: calc(756px * 0.8928)"></div>
			</div>
			<div class="img_div">
				<div><img alt="" src="../static/images/cooperate/pic3.png" style="width: calc(1344px * 0.8928);height: calc(756px * 0.8928)"></div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	window.onload=function(){
		$("#cooperate").css("color","rgba(255,255,255,1)")
	}
	function click_sub(){
		var url = "/cooperate/submit"
		var data = $(".form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					alert("申请成功")
					location.reload(true) 
				}
			},
		})
	}
</script>
</html>