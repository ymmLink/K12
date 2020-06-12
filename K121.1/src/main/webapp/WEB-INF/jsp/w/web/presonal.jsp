<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLI
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
	<link href="/static/css/presonal.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="presonal">
		<div class="presonal_div">
			<div class="presonal_context">
				<div class="presonal_headimg" >
					<img alt="" src="" id="userimg" style="width: calc(168px * 0.8928);height: calc(168px * 0.8928);">
				</div>
				<div class="presonal_name" id="username"></div>
				<div style="cursor:pointer" class="presonal_info" onclick="click_info()">个人信息</div>
			</div>
			<div class="order_info">
				<div style="margin-left: 79px;cursor:pointer" id="dfk" class="order_choose" onclick="click_dfk('000')">待付款</div>
				<div style="cursor:pointer" id="dfh" class="order_choose" onclick="click_dfh('001')">待发货</div>
				<div style="cursor:pointer" id="dsh" class="order_choose" onclick="click_dsh('002')">待收货</div>
				<div style="cursor:pointer" id="pj" class="order_choose" onclick="click_pj('003')">评价</div>
				<div style="cursor:pointer" id="tk" class="order_choose" onclick="click_tk('100')">退款/售后</div>
				<div style="cursor:pointer" id="wdpj" class="order_choose" onclick="click_wdpj()">我的评价</div>
				<div style="cursor:pointer" id="dzgl" class="order_choose" onclick="click_dzgl()">地址管理</div>
			</div>
			<div class="order_none"><img alt="" src="../static/images/presonal/pic1.png"></div>
			<!-- 有数据时 -->
			<div class="order_detail">
			<form class='order_detail_div'>
				<!-- <div class="cart_div">
					<div class="cart_line">
						<div class="cart_line_img"><img alt="" src="../static/images/cart/pic1.png" style="width:calc(20px * 1);height: calc(20px * 1);"></div>
						<div class="cart_line_order">订单号：2019070855426589</div>
					</div>
					<div class="cart_img">
						<div class="cart_img_context">
							
							<div class="cart_image"><img alt="" src="../static/images/cart/pic2.png" style="width:calc(200px * 1);height: calc(113px * 1);"></div>
							<div class="cart_text">
								<div class="cart_text_top">云团沙发升级版</div>
								<div class="cart_text_buttom">灰白格/双人座右扶手</div>
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥4599</div>
								<div class="cart_newprice">￥999</div>
							</div>
							<div class="cart_total">
								X1
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥999</div>
							</div>
							<div class="cart_shanchu">取消订单</div>
						</div>
						<div class="cart_img_context">
							
							<div class="cart_image"><img alt="" src="../static/images/cart/pic2.png" style="width:calc(200px * 1);height: calc(113px * 1);"></div>
							<div class="cart_text">
								<div class="cart_text_top">云团沙发升级版</div>
								<div class="cart_text_buttom">灰白格/双人座右扶手</div>
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥4599</div>
								<div class="cart_newprice">￥999</div>
							</div>
							<div class="cart_total">
								X1
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥4599</div>
							</div>
							<div class="cart_shanchu">取消订单</div>
						</div>
					</div>
				</div> -->
				</form>
				
			</div>
			
			<!-- 地址没数据 -->
			<div class="address_none">
				<div class="address_none_img"><img alt="" src="../static/images/presonal/pic2.png"></div>
				<div><img alt="" src="../static/images/presonal/pic4.png"></div>
			</div>
			<!-- 地址有数据 -->
			<div class="address">
				<div class="address_top">
					<div class="address_top_left">已有地址</div>
					<div class="address_top_right">添加新地址</div>
				</div>
				<div class="address_line"></div>
				<div class="address_button">
					<%-- <%for(int i=0;i<4;i++){ %>
					<div class="address_button_context">
						<div class="address_button_detail">福建省 厦门市 湖里区 金山街道 园亭路21号</div>
						<div class="address_button_name">张某某</div>
						<div class="address_button_phone">15806014596</div>
						<div class="address_button_img_top"><img alt="" src="../static/images/presonal/pic5.png"></div>
						<div class="address_button_img_buttom"><img alt="" src="../static/images/presonal/pic6.png"></div>
					</div>
					<%} %> --%>
				</div>
			</div>
			<div class="judge_none"><img alt="" src="../static/images/presonal/pic3.png"></div>
			<div class="judge">
				<div class="judge_title">我的评价</div>
				<%-- <c:forEach items="${eps}" var="u" varStatus = "s">
					
				</c:forEach> --%>
			</div>
		</div>
		<div class="line"></div>
				<div class="cart_buttom">
					<div class="cart_buttom_top">
						<!-- <div class="cart_buttom_top_click"><img id="qx" onclick="click_qx()" alt="" src="../static/images/cart/pic3.png" style="width:calc(20px * 1);height: calc(20px * 1);"></div>
						<div class="cart_buttom_top_quanxuan">全选</div> -->
						<div class="cart_buttom_top_shuxian"></div>
						<div class="cart_buttom_top_text">已选0件</div>
					</div>
					<div class="cart_buttom_top_price">实付：￥0</div>
					<div class="cart_buttom_top_submit"><img id="sub_img" onclick="click_sub()" alt="" src="../static/images/cart/pic6.png" style="width:calc(240px * 1);height: calc(60px * 1);"></div>
					<div style="display:none" class="cart_buttom_top_submit1" onclick="click_shouhuo()"><div>确认收货</div></div>
				</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	var oids=[];
	var length;
	var choose=0;
	var orderprice=[];
	var finalprice = 0;
	var orderChoise="";
	onload=function(){
		$("#dfk").css("border-bottom","2px solid rgba(49,49,49,1)")
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
		mothed("000")
	}
	function click_info(){
		location.href = "/presonal/presonalInfo";
	}
	function click_dfk(orderState){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)");
		$("#dfk").css("border-bottom","2px solid rgba(49,49,49,1)");
		$("#qx").attr("src","../static/images/cart/pic3.png")
		$(".agreeImg").attr("src","../static/images/cart/pic3.png")
		finalprice = 0
		var context = "实付：￥" + finalprice;
		$(".cart_buttom_top_price").html(context); 
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".order_detail").css("display","block");
		$(".order_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		mothed(orderState)
		
	}
	function click_dfh(orderState){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#dfh").css("border-bottom","2px solid rgba(49,49,49,1)")
		$("#qx").attr("src","../static/images/cart/pic3.png")
		$(".agreeImg").attr("src","../static/images/cart/pic3.png")
		finalprice = 0
		var context = "实付：￥" + finalprice;
		$(".cart_buttom_top_price").html(context);  
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".order_detail").css("display","block");
		$(".order_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		mothed(orderState)
	}
	function click_dsh(orderState){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#dsh").css("border-bottom","2px solid rgba(49,49,49,1)")
		$("#qx").attr("src","../static/images/cart/pic3.png")
		$(".agreeImg").attr("src","../static/images/cart/pic3.png")
		finalprice = 0
		var context = "实付：￥" + finalprice;
		$(".cart_buttom_top_price").html(context);  
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".order_detail").css("display","block");
		$(".order_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		mothed(orderState)
	}
	function click_pj(orderState){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#pj").css("border-bottom","2px solid rgba(49,49,49,1)")
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".order_detail").css("display","block");
		$(".order_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		$(".cart_buttom").css("display","none");
		mothed(orderState)
	}
	function click_tk(orderState){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#tk").css("border-bottom","2px solid rgba(49,49,49,1)")
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".order_detail").css("display","block");
		$(".order_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		mothed(orderState)
	}
	function click_wdpj(){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#wdpj").css("border-bottom","2px solid rgba(49,49,49,1)")
		$(".order_detail").css("display","none");
		$(".order_none").css("display","none");
		$(".judge").css("display","block");
		$(".judge_none").css("display","none");
		$(".address").css("display","none");
		$(".address_none").css("display","none");
		$(".cart_buttom").css("display","none");
		var url = "/judge/myevaluate";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				if(json.resInteger==200){
					var list = json.objs
					$(".judge").empty()
					for(var i=0;i<list.length;i++){
						var j = i+1;
						var op = "<div class='judge_line'></div>"+
					"<div class='judge_context'>"+
						"<div class='judge_data'>"+list[i].evaluateDate+"</div>"+
						"<div class='judge_descrice'>"+list[i].title+"</div>"+
						"<div class='judge_type'>"+list[i].guigeValueIdColorName+"/"+list[i].guigeValueId2Name+"</div>"+
						
					"</div>"+
					"<div class='judge_text'>"+list[i].message+"</div>"+
					"<div class='judge_img'>"+
						"<div id='img"+j+"1' class='judge_img_inner'><img alt='' src='"+list[i].img01+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"1)'></div>"+
						"<div id='img"+j+"2' class='judge_img_inner'><img alt='' src='"+list[i].img02+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"2)'></div>"+
						"<div id='img"+j+"3' class='judge_img_inner'><img alt='' src='"+list[i].img03+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"3)'></div>"+
						"<div id='img"+j+"4' class='judge_img_inner'><img alt='' src='"+list[i].img04+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"4)'></div>"+
						"<div id='img"+j+"5' class='judge_img_inner'><img alt='' src='"+list[i].img05+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"5)'></div>"+					
						"<div id='img"+j+"6' class='judge_img_inner'><img alt='' src='"+list[i].img06+"' style='width: calc(112px * 0.8928);height: calc(112px * 0.8928);' onerror='hideImg2("+j+"6)'></div>"+
						
					"</div>";
					$(".judge").append(op);
		
					}
				}else if(json.resInteger==600){
					$(".judge").css("display","none");
					$(".judge_none").css("display","block");
				}
			}
		})
	}
	function hideImg2(i){
		
		var index = "#img"+i
		console.log(index)
		$(index).css("display","none")
	}
	function click_dzgl(){
		$(".order_choose").css("border-bottom","2px solid rgba(246,246,246,1)")
		$("#dzgl").css("border-bottom","2px solid rgba(49,49,49,1)")
		$(".order_detail").css("display","none");
		$(".order_none").css("display","none");
		$(".judge").css("display","none");
		$(".judge_none").css("display","none");
		$(".address").css("display","block");
		$(".address_none").css("display","none");
		$(".cart_buttom").css("display","none");
		adreemethod()
	}
	function adreemethod(){
		var url = "/order/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				$(".address").empty()
				if(json.resInteger==200){
					var ok="<div class='address_top'>"+
							"<div class='address_top_left'>已有地址</div>"+
							"<div class='address_top_right' style='cursor:pointer' onclick='click_addnew()'>添加新地址</div>"+
						"</div>";
						$(".address").append(ok)
					var list = json.objs
					for(var i=0;i<list.length;i++){
						var op = "<div class='address_button_context'>"+
						"<div class='address_button_detail'>"+list[i].contactAdress+list[i].detail+"</div>"+
						"<div class='address_button_name'>"+list[i].contactName+"</div>"+
						"<div class='address_button_phone'>"+list[i].contactPhone+"</div>"+
						"<div class='address_button_img_top'><img style='cursor:pointer' onclick='click_xiugai("+list[i].id+")' alt='' src='../static/images/presonal/pic5.png'></div>"+
						"<div class='address_button_img_buttom'><img style='cursor:pointer' onclick='click_del("+list[i].id+")' alt='' src='../static/images/presonal/pic6.png'></div>"+
					"</div>";
					$(".address").append(op)
					}
				}else if(json.resInteger==600){
					$(".address").css("display","none");
					$(".address_none").css("display","block");
				}
			}
		})
	}
	function mothed(orderState){
		var url = "/order/orderFind?state="+orderState;
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					var list = json.objs;
					length = list.length;
					console.log(list)
					console.log(length)
					oids =[]
					$(".order_detail_div").empty();
					$(".order_none").css("display","none");
					$(".order_detail_div").css("display","block");
					
					for(var i=0;i<list.length;i++){
						oids[i] = list[i][0].oid;
						var op = "<div class='cart_div'>"+
							"<input id='hiddenOid"+i+"' class='hiddenOid' type='hidden' name='oid'>"+
							"<div class='cart_line'>"+
							"<div class='cart_line_img' onclick='click_agree("+i+")'><img id='agreeImg"+i+"' class='agreeImg' alt=''src='../static/images/cart/pic3.png' style='width:calc(20px * 1);height: calc(20px * 1);'></div>"+
							"<div class='cart_line_order'>订单号："+list[i][0].oid+"</div>"+
							"<div style='cursor:pointer;display:none;' class='sqtk1' onclick='click_sqtk("+i+")'>申请退款</div>"+
							"</div>"+
							"<div class='cart_img' id='cart_img"+i+"'></div>"+
						"</div>";
						$(".order_detail_div").append(op)
						if(orderState=="001"){
							$(".cart_line_img").empty()
						}
						var list1 = list[i]
						price = 0;
						for(var j=0;j<list1.length;j++){
						
							price = price + list1[j].price*list1[j].productNumber
							
							var ok = "<div class='cart_img_context'>"+
								"<div class='cart_image' style='cursor:pointer' onclick='click_detail(\""+orderState+"\",\""+list1[j].oid+"\")'><img alt='' src='"+list1[j].skuMainPic+"' style='width:calc(200px * 0.8928);height: calc(113px * 0.8928);'></div>"+
								"<div class='cart_text' style='cursor:pointer' onclick='click_detail(\""+orderState+"\",\""+list1[j].oid+"\")'>"+
									"<div class='cart_text_top'>"+list1[j].title+"</div>"+
									"<div class='cart_text_buttom'>"+list1[j].guigeValueIdColorName+"/"+list1[j].guigeValueId2Name+"</div>"+
								"</div>"+
								"<div class='cart_price' style='cursor:pointer' onclick='click_detail(\""+orderState+"\",\""+list1[j].oid+"\")'>"+
									"<div class='cart_oldprice'>￥"+list1[j].marketPrice+"</div>"+
									"<div class='cart_newprice'>￥"+list1[j].price+"</div>"+
								"</div>"+
								"<div class='cart_total' style='cursor:pointer' onclick='click_detail(\""+orderState+"\",\""+list1[j].oid+"\")'>X"+list1[j].productNumber+"</div>"+
								"<div class='cart_price' style='cursor:pointer' onclick='click_detail(\""+orderState+"\",\""+list1[j].oid+"\")'>"+
									"<div class='cart_finalprice'>￥"+list1[j].productNumber*list1[j].price+"</div>"+
									
								"</div>"+
								"<div class='cart_shanchu'>"+
									"<div style='cursor:pointer;' class='sqtk0' onclick='click_qxdd("+i+","+list1[j].skuId+")'>取消订单</div>"+
									"<div style='cursor:pointer;display:none;' class='pingjia' onclick='click_topj("+i+","+list1[j].skuId+")'>评价</div>"+
									"<div style='cursor:pointer;display:none;' class='ckwl2' onclick='click_logistics(\""+list1[j].oid+"\")'>查看物流</div>"+
									"<div style='cursor:pointer;display:none;' class='ckjd' onclick='click_jingdu(\""+list1[j].oid+"\")'>查看进度</div>"+
								"</div>"+
							
								"</div>";
							$("#cart_img"+i).append(ok)
						
						}
						if(orderState=="001"){
							$(".sqtk0").css("display","none");
							$(".sqtk1").css("display","flex");
							$(".ckwl2").css("display","none");
							$(".pingjia").css("display","none");
							$(".ckjd").css("display","none");
						}
						if(orderState=="002"){
							$(".sqtk0").css("display","none");
							$(".sqtk1").css("display","flex");
							$(".ckwl2").css("display","flex");
							$(".pingjia").css("display","none");
							$(".ckjd").css("display","none");
						}
						if(orderState=="003"){
						$(".sqtk1").css("display","flex");
						$(".sqtk0").css("display","none");
						$(".pingjia").css("display","flex");
						$(".ckjd").css("display","none");
						}
						if(orderState=="100"){
							$(".ckjd").css("display","flex");
							$(".sqtk0").css("display","none");
							$(".sqtk1").css("display","none");
							$(".ckwl2").css("display","none");
							$(".pingjia").css("display","none");
						}
						
						orderprice[i] = price;
					
					}
					
					if(orderState=="000"){
						$(".cart_buttom").css("display","flex")
						$(".cart_buttom_top_submit").css("display","flex")
						$(".cart_buttom_top_submit1").css("display","none")
					}
					if(orderState=="001"){
						$(".cart_buttom").css("display","none")
					}
					if(orderState=="002"){
						$(".cart_buttom").css("display","flex")
						$(".cart_buttom_top_submit").css("display","none")
						$(".cart_buttom_top_submit1").css("display","flex")
					}
					if(orderState=="100"){
						$(".cart_buttom").css("display","none")
					}
				
				}else if(json.resInteger==600){
					$(".order_detail_div").css("display","none");
					$(".order_none").css("display","block")
					$(".cart_buttom").css("display","none")
				}
			}
		})
	}
	
	function click_agree(i){
		var index = "#agreeImg"+i;
		if($(index).attr("src")=="../static/images/cart/pic1.png"){
			$(".agreeImg").attr("src","../static/images/cart/pic3.png")
			$(index).attr("src","../static/images/cart/pic3.png")
			/* choose = choose - 1; */
			var text = "已选0件";
			$(".cart_buttom_top_text").html(text)
			$("#hiddenOid"+i).val("")
			finalprice =orderprice[i];
/* 			finalprice = finalprice - orderprice[i]; */
			var context = "实付：￥" + 0;
			$(".cart_buttom_top_price").html(context);  
		}else if($(index).attr("src")=="../static/images/cart/pic3.png"){
			$(".agreeImg").attr("src","../static/images/cart/pic3.png")
			$(index).attr("src","../static/images/cart/pic1.png")
			//choose = choose + 1;
			var text = "已选"+1+"件";
			$(".cart_buttom_top_text").html(text)
			$("#hiddenOid"+i).val(oids[i])
			finalprice =orderprice[i];
/* 			finalprice = finalprice + orderprice[i]; */
			var context = "实付：￥" + finalprice;
			$(".cart_buttom_top_price").html(context);  
		}
		orderChoise=oids[i];
	}

	function click_qx(){
		if($("#qx").attr("src")=="../static/images/cart/pic1.png"){
			$("#qx").attr("src","../static/images/cart/pic3.png")
			$(".agreeImg").attr("src","../static/images/cart/pic3.png")
			var text = "已选0件";
			$(".cart_buttom_top_text").html(text)
			$(".hiddenOid").val("");
			finalprice = 0;
			var context = "实付：￥" + finalprice;
			$(".cart_buttom_top_price").html(context);  
		}else if($("#qx").attr("src")=="../static/images/cart/pic3.png"){
			$("#qx").attr("src","../static/images/cart/pic1.png")
			$(".agreeImg").attr("src","../static/images/cart/pic1.png")
			var text = "已选"+length+"件";
			choose = length
			$(".cart_buttom_top_text").html(text)
			console.log(oids)
			finalprice = 0;
			var context = "实付：￥" + finalprice;
			$(".cart_buttom_top_price").html(context);
			for(var i=0;i<length;i++){
				var oid = oids[i];
				var mark = "#hiddenOid"+i;
				$(mark).val(oid);
				finalprice = finalprice + orderprice[i];
				var context = "实付：￥" + finalprice;
				$(".cart_buttom_top_price").html(context);  
			}
		}
	}
	function click_qxdd(i,skuId){
		var oid = oids[i]
		var url = "/order/delete";
		$.ajax({
			"url":url,
			"data":{
				oid:oid,
				skuId:skuId
			},
			"type":"POST",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("删除成功")
					mothed("000")
				}else if(json.resInteger==700){
					
				}
			}
		})
	}
	function click_sqtk(i){
		var oid = oids[i]
		var url = "/order/applyreturn?oid="+oid;
		console.log(url)
		location.href = url;
		/* $.ajax({
			"url":url,
			"data":{
				oid:oid,
				skuId:skuid
			},
			"type":"POST",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					location.href = "/w/web/refund";
				}else if(json.resInteger==700){
					
				}
			}
		}) */
	}
	function click_sub(){
		var oid=orderChoise;
		window.location.href="/index/pay?oid="+oid;
	}
	function click_shouhuo(){
		var data = $(".order_detail_div").serialize();
		var url = "/order/shouhuo";
		$.ajax({
			"url":url,
			"data":data,
			"type":"POST",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					//跳转到评价
					click_pj("003")
				}
			}
		})
	}
	function click_topj(i,skuId){
		var oid = oids[i]
		var url = "/order/topingjia?oid="+oid+"&skuId="+skuId;
		location.href = url;
	}
	function click_del(id){
		var url = "/adress/delete";
		$.ajax({
			"url":url,
			"data":{
				id:id
			},
			"type":"POST",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					adreemethod()
				}else if(json.resInteger==600){
					$(".address").css("display","none");
					$(".address_none").css("display","block");
				}
			}
		})
	}
	function click_xiugai(id){
		location.href = "/adress/toUpdate?id="+id;
	}
	function click_detail(orderState,oid){
		console.log(orderState)
		console.log(oid)
		if(orderState=="004" || orderState=="100"  || orderState=="101"  || orderState=="102"  || orderState=="103"){
			return 
		}else{
			var url = "/order/detail?status="+orderState+"&oid="+oid;
			location.href = url;
		}
		
	}
	function click_jingdu(oid){
		var url = "/order/refundDetail?oid="+oid;
		location.href = url;
	}
	function click_logistics(oid){
		location.href = "/order/logistics?oid="+oid;
	}
	function click_addnew(){
		location.href = "/adress/toAdd";
	}
</script>
</html>