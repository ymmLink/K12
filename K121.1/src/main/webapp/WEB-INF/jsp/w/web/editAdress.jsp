<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加地址</title>
	<link href="/static/css/ediAddress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="addAdress">
		
		<div class="addAdress_form">
			<div class="addAdress_top">编辑收货地址</div>
			<form class="form" id="form">
				<div class="form_context">
					
					<div class="addAdress_title">地址信息：</div>
					<div class="addAdress_province">
						<input id="adress" class="input_info" placeholder="请选择省/市/区/街道 " name="adress" value="${updateAdress.contactAdress}" autocomplete="off">
						<img onclick="xiala()" alt="" src="../static/images/adress/pic10.png" style="width: calc(20px * 1);height: calc(14px * 1);margin-top: calc(18px * 1);">
					</div>
					<div class="line"></div>
					<div class="adress_choose" >
						<div class="fenlei">
								<div class="provice" onclick="ck_P()">省</div>
								<div class="shi" onclick="ck_S()">市</div>
								<div class="qu" onclick="ck_Q()">区</div>
							<div class="street" onclick="ck_J()">街道</div>
						</div>
						<div class="provice_text">
							
						</div>
					</div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">详细地址：</div>
					<div>
						<input class="input_info" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" name="adreedetail" value="${updateAdress.detail}" autocomplete="off">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">邮政编码：</div>
					<div>
						<input class="input_info" placeholder="请填写邮编" name="port" value="${updateAdress.port}" autocomplete="off">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">收货人姓名：</div>
					<div>
						<input class="input_info" placeholder="请填写收货人姓名" name="name" value="${updateAdress.contactName}" autocomplete="off">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">手机号码：</div>
					<div>
						<input class="input_info" placeholder="请填写收货人手机号码" name="phone" value="${updateAdress.contactPhone}" autocomplete="off">
					</div>
					<div class="line"></div>
				</div>
				<div class="edit_button">
					<!-- 提交地址的代号 -->
					<input type="hidden" id="proviceCode" name="proviceCode" autocomplete="off"/>
					<input type="hidden" id="cityCode" name="cityCode" autocomplete="off"/>
					<input type="hidden" id="areaCode" name="areaCode" autocomplete="off"/>
					<div onclick="update_adress(${updateAdress.id})"><img alt="" src="../static/images/adress/pic11.png"></div>
					<div style="cursor:pointer" class="edit_del" onclick="del_adress(${updateAdress.id})">删除本地址</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
var sheng=""
	var shi=""
	var qu=""
	var jiedao=""
	function xiala(){
		if($(".adress_choose").css("display")!="none"){
			$(".adress_choose").css("display","none");
			console.log($(".adress_choose").css("display"))
		}else{
			$(".adress_choose").css("display","block");
			province()
		}
	}
	function province(){
		var url="/adress/getProvince";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			"success":function(json){
				console.log(json.objs)
				var list = json.objs;
				console.log("list.size=" + list.length)
				for(var i=0;i<list.length;i++){
					console.log(list[i].name)
					var op = "<option onclick='click_province(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
					//选定标签的子集添加HTML代码
					$(".provice_text").append(op)
				}
				
			}
		})
	}
	function ck_P(){	
		$(".provice").css("backgroundColor","white")
		$(".shi").css("backgroundColor","rgba(240,240,240,1)")
		$(".qu").css("backgroundColor","rgba(240,240,240,1)")
		$(".street").css("backgroundColor","rgba(240,240,240,1)")
		var url="/adress/getProvince";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			"success":function(json){
				$(".provice_text").empty();
				console.log(json.objs)
				var list = json.objs;
				console.log("list.size=" + list.length)
				for(var i=0;i<list.length;i++){
					console.log(list[i].name)
					var op = "<option onclick='click_province(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
					//选定标签的子集添加HTML代码
					$(".provice_text").append(op)
				}
			}
		})
	}
	function ck_S(){
		var provinceCode = $("#proviceCode").val().trim();
		
		if(provinceCode == ''){
			alert("请先选择省份");
			
			return ;
		}
		$(".provice").css("backgroundColor","rgba(240,240,240,1)")
		$(".shi").css("backgroundColor","white")
		$(".qu").css("backgroundColor","rgba(240,240,240,1)")
		$(".street").css("backgroundColor","rgba(240,240,240,1)")
		console.log(provinceCode)
		var url="/adress/getCity?parent="+provinceCode
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			"success":function(json){
				$(".provice_text").empty();
				console.log(json.objs)
				var list = json.objs;
				console.log("list.size=" + list.length)
				for(var i=0;i<list.length;i++){
					console.log(list[i].name)
					var op = "<option onclick='click_city(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
					//选定标签的子集添加HTML代码
					$(".provice_text").append(op)
				}
			}
		})
	}
	function ck_Q(){
		var provinceCode = $("#proviceCode").val().trim();
		if(provinceCode == ''){
			alert("请先选择省份");	
			return ;
		}
		var cityCode = $("#cityCode").val().trim();
		if(cityCode == ''){
			alert("请先选择城市");	
			return ;
		}
		$(".provice").css("backgroundColor","rgba(240,240,240,1)")
		$(".shi").css("backgroundColor","rgba(240,240,240,1)")
		$(".qu").css("backgroundColor","white")
		$(".street").css("backgroundColor","rgba(240,240,240,1)")
		var url="/adress/getArea?parent="+cityCode
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			"success":function(json){
				$(".provice_text").empty();
				console.log(json.objs)
				var list = json.objs;
				console.log("list.size=" + list.length)
				for(var i=0;i<list.length;i++){
					console.log(list[i].name)
					var op = "<option onclick='click_area(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
					//选定标签的子集添加HTML代码
					$(".provice_text").append(op)
				}
			}
		})
	} 
	function click_province(that){
		document.getElementById('adress').innerHTML="";
		$("#proviceCode").val(that.attributes[1].value);
		
		$("#adress").val(that.label);
		sheng = that.label
	} 
	function click_city(that){
		$("#cityCode").val(that.attributes[1].value);
		var str=sheng+that.label
		$("#adress").val(str);
		shi=that.label
	}
	function click_area(that){
		$("#areaCode").val(that.attributes[1].value);
		var str=sheng+shi+that.label
		$("#adress").val(str);
		qu=that.label
	}

	function update_adress(id){
		var url = "/adress/update?id="+id;
		var data  = $("#form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("修改成功");
					window.history.go(-1);
				}else if(json.resInteger==600){
					alert("无此记录");
				}
			},
			error:function(){
				alert("修改出错了");
			}
		})
	}
	function del_adress(id){
		var url = "/adress/delete?id="+id;
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("删除成功");
					location.href = "/order/submit";
				}else if(json.resInteger==600){
					alert("无此记录");
				}
			},
			error:function(){
				alert("删除出错了");
			}
		})	
	}
	
</script>
</html>