<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加地址</title>
	<link href="/static/css/addAdress.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="addAdress">
		
		<div class="addAdress_form">
			<div class="addAdress_top">添加收货地址</div>
			
			<form class="form" >
				<div class="form_context">
					<div class="addAdress_title">地址信息：</div>
					<div   class="addAdress_province">
						<input  onclick="xiala()" id="address" readonly="readonly" class="input_info" placeholder="请选择省/市/区/街道 " name="adress" autocomplete="off">
						<img onclick="xiala()" alt="" src="../static/images/adress/pic10.png" style="width: calc(20px * 1);height: calc(14px * 1);margin-top:calc(18px* 1);">
					</div>
					<div class="line"></div>
					<div class="adress_choose" >
						<div class="fenlei">
								<div class="provice" onclick="ck_P()">省</div>
								<div class="shi" onclick="ck_S()">市</div>
								<div class="qu" onclick="ck_Q()">区</div>
						</div>
						<div class="provice_text">
							
						</div>
					</div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">详细地址：</div>
					<div>
						<input class="input_info" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" name="adreedetail" autocomplete="off" required="required">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">邮政编码：</div>
					<div>
						<input class="input_info" placeholder="请填写邮编" name="port" autocomplete="off">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">收货人姓名：</div>
					<div>
						<input class="input_info" placeholder="请填写收货人姓名" name="name" autocomplete="off" required="required">
					</div>
					<div class="line"></div>
				</div>
				<div class="form_context">
					<div class="addAdress_title">手机号码：</div>
					<div>
						
						<input class="input_info" 
							type="text" 
						 autocomplete="off" 
						 placeholder="请填写收货人手机号码" 
						 name="phone" 
						 id='phone'
						 onblur="upperCase()"
						 required="required">
					</div>
					<div class="line"></div>
				</div>
				<div>
					<!-- 提交地址的代号 -->
					<input type="hidden" id="proviceCode" name="proviceCode" autocomplete="off"/>
					<input type="hidden" id="cityCode" name="cityCode" autocomplete="off"/>
					<input type="hidden" id="areaCode" name="areaCode" autocomplete="off"/>
					<div type="submit" onclick="click_submit()"><img alt="" src="../static/images/adress/pic11.png"></div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	//验证手机号	
	function upperCase(){
		var phone = document.getElementById('phone').value;
		if(!(/^1[34578]\d{9}$/.test(phone))){ 
		    alert("手机号码有误，请重填");  
		    return false; 
		} 
	}
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
					var op = "<option class='provinceoption' onclick='click_province(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
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
					var op = "<option class='provinceoption' onclick='click_province(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
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
					var op = "<option class='cityoption'  onclick='click_city(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
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
					var op = "<option class='areaoption' onclick='click_area(this)' value='"+list[i].code+"'>" + list[i].name+"</option>"
					//选定标签的子集添加HTML代码
					$(".provice_text").append(op)
				}
			}
		})
	} 
	function click_province(that){
		var ps=document.getElementsByClassName("provinceoption");
		for( var i=0;i<ps.length;i++){
			ps[i].style.backgroundColor="";
		}
		that.style.backgroundColor ="#cfddfb";
		$("#proviceCode").val(that.attributes[2].value);
		console.debug(that);
		console.debug(that.attributes[2]);
		console.debug(that.attributes[2].value);
		console.debug($("#proviceCode").val());
		$("#address").val(that.label);
		sheng = that.label
	} 
	function click_city(that){
		var ps=document.getElementsByClassName("cityoption");
		for( var i=0;i<ps.length;i++){
			ps[i].style.backgroundColor="";
		}
		that.style.backgroundColor ="#cfddfb";
		$("#cityCode").val(that.attributes[2].value);
		var str=sheng+that.label
		$("#address").val(str);
		shi=that.label
	}
	function click_area(that){
		var ps=document.getElementsByClassName("areaoption");
		for( var i=0;i<ps.length;i++){
			ps[i].style.backgroundColor="";
		}
		that.style.backgroundColor ="#cfddfb";
		$("#areaCode").val(that.attributes[2].value);
		var str=sheng+shi+that.label
		$("#address").val(str);
		qu=that.label
	}
	function click_submit(){
		var bornTime = $("input[name='adreedetail']").val();
		if(bornTime == ''){
		    alert('请输入详细地址！');
		    return ;
		}
		
		
		
		var bornTime = $("input[name='name']").val();
		if(bornTime == ''){
		    alert('请输入收件人姓名！');
		    return ;
		}
		
		var bornTime = $("input[name='phone']").val();
		if(bornTime == ''){
		    alert('请输入收件人电话！');
		    return ;
		}
		
		
		var url = "/adress/submit";
		var data = $(".form").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("提交成功");
					location.href = "/presonal";
				}
			},
			error:function(){
				alert("提交失败");
			},
		})
	}
</script>
</html>