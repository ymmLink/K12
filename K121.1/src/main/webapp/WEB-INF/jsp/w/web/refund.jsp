<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申请退款</title>
	<link href="/static/css/refund.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="out">
		<form class="refund">
			<div class="cart_div">
				<div class="cart_title">订单信息</div>
				
				<div class="cart_line"></div>
				<div class="cart_img">
					<c:forEach items="${op}" var="u" varStatus="s">
						<div class="cart_img_context">
							<!-- <div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div> -->
							<div class="cart_image"><img alt="" src="${u.skuMainPic }" style="width:calc(200px * 0.8928);height: calc(113px * 0.8928);"></div>
							<div class="cart_text">
								<div class="cart_text_top">${u.title }</div>
								<div class="cart_text_buttom">${u.guigeValueIdColorName }/${u.guigeValueId2Name }</div>
							</div>
							<div class="cart_price">
								<c:if test="${u.isDiscount == 1 }"><div class="cart_oldprice">￥${u.marketPrice }</div></c:if>
								
								<div class="cart_newprice">￥${u.price }</div>
							</div>
							<div class="cart_total">
								X${u.productNumber }
							</div>
							<div class="cart_shanchu">￥${u.productNumber * u.price }</div>
						</div>
					</c:forEach>
					<!-- <div class="cart_img_context">
						<div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div>
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
						<div class="cart_shanchu">￥4599</div>
					</div> -->
				</div>
			</div>
			<div class="refund_detail">
				<div class="refund_detail_title">退货详情</div>
				<div class="cart_line"></div>
				<div class="refund_isacctuve">
					<div class="refund_isacctuve_title">是否收到货物</div>
					
					<input type="hidden" name="isAcctrue" id="isAcctrue">
					<div>
						<div class="refund_isacctuve_div_top" onclick="click_daohuo(0)">
							<div><img id="shoudao" alt="" src="../static/images/refund/pic2.png" style="width:calc(20px * 1);height: calc(20px * 1);"></div>
							<div class="refund_label">已收到货物</div>
						</div>
						<div class="refund_isacctuve_div_top" onclick="click_daohuo(1)">
							<div><img id="notshoudao" alt="" src="../static/images/refund/pic2.png" style="width:calc(20px * 1);height: calc(20px * 1);"></div>
							<div class="refund_label">未收到货物</div>
						</div>
					</div>
				</div>
				<div class="refund_shuoming">
					<div class="refund_shuoming_text">填写退款说明</div>
					<textarea name="text" rows="" cols="" style="width: 934px; height: 122px;" placeholder="请填写退款说明"></textarea>
				</div>
				<div class="refund_money">
					<div class="refund_money_text">退款金额</div>
					<div class="refund_money_price">退款金额会根据商品的具体情况而定，如有疑问请联系客服</div>
				</div>
			</div>
			<div class="refund_img"><img onclick="click_sub()" alt="" src="../static/images/refund/pic3.png" style="width:calc(180px * 1);height: calc(56px * 1);"></div>
		</form>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	var getParam = function(name){
	    var search = document.location.search;
	    var pattern = new RegExp("[?&]"+name+"\=([^&]+)", "g");
	    var matcher = pattern.exec(search);
	    var items = null;
	    if(null != matcher){
	            try{
	                    items = decodeURIComponent(decodeURIComponent(matcher[1]));
	            }catch(e){
	                    try{
	                            items = decodeURIComponent(matcher[1]);
	                    }catch(e){
	                            items = matcher[1];
	                    }
	            }
	    }
	    return items;
	}
	var oid = getParam('oid')
	function click_daohuo(i){
		if(i==0){
			$("#shoudao").attr("src","../static/images/refund/pic1.png")
			$("#notshoudao").attr("src","../static/images/refund/pic2.png")
			$("#isAcctrue").val(0)
		}else{
			$("#shoudao").attr("src","../static/images/refund/pic2.png")
			$("#notshoudao").attr("src","../static/images/refund/pic1.png")
			$("#isAcctrue").val(1)
		}
	}
	function click_sub(){
		var url = "/order/return?oid="+oid;
		var data = $(".refund").serialize();
		$.ajax({
			"url":url,
			"data":data,
			"type":"POST",
			"dataType":"json",
			success:function(json){
				if(json.resInteger==200){
					alert("申请成功，请耐心等待")
					window.history.go(-1);
				}else if(json.resInteger==600){
					alert("无该订单")
				}
			}
		})
	}
</script>
</html>