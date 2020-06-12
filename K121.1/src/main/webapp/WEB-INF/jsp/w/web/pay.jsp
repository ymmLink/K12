<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>支付</title>
	<link href="/static/css/pay.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<script type="text/javascript">
		var payModel="zhifubao";
		var oid="${order.oid}";
		function chosePay(item){
			var state=$(item).attr("data-state");
			if(state=='0'){
				var list=$(".payImg");
			
				for(var i=0;i<list.length;i++){
					$(list[i]).attr("src","../static/images/pay/pic3.png");
					$(list[i]).attr("data-state","0");
				}
				$(item).attr("src","../static/images/pay/pic1.png")
				$(item).attr("data-state","1");
				payModel=$(item).attr("data-value");
				if(payModel=='weixin'){
					$.ajax({
						url:"/before/order/wxpay",
						type:"post",
						data:{"oid":oid},
						dataType:"json",
						error:function(){alert('请稍后重试');},
						success:function(data){
							
							$("#payImg").attr("src",data.code_url);
							$(".pay_buttom_text").text("打开手机微信扫一扫继续付款");
							oid=data.res1;
						}
					});
				}
			}
		}
		function pay(item){
			oid=$(item).attr("data-oid");
			if(payModel=='weixin'){
				$.ajax({
					url:"/before/order/wxpay",
					type:"post",
					data:{"oid":oid},
					dataType:"json",
					error:function(){alert('请稍后重试');},
					success:function(data){
						if(data.res1=="success"){
							alert("支付成功!");
						}else{
							//alert("appid:"+data[0]+";timeStamp:"+data[1]+";nonceStr:"+data[2]+";package:"+data[3]+";paySign:"+data[4])
							WeixinJSBridge.invoke('getBrandWCPayRequest',{
			  		 "appId" : data.zhifu1,"timeStamp" : data.zhifu2, "nonceStr" : data.zhifu3, "package" : data.zhifu4,"signType" :"MD5", "paySign" : data.zhifu5 
			   			},function(res){
							WeixinJSBridge.log(res.err_msg);
							//alert(res.err_code + res.err_desc + res.err_msg);
				            if(res.err_msg == "get_brand_wcpay_request:ok"){  
				                alert("微信支付成功!");  
				                //location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx92ccff38caf73e3b&redirect_uri=http%3a%2f%2fwww.hwjsxy.com%2fw%2fqianduan!informlist.action&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';
				            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
				                alert("用户取消支付!");  
				               //document.form1.submit();
				            }else{  
				               alert("微信支付失败!");  
				               //document.form1.submit();
				            }  
							})
						}
					}
				});
			}else if(payModel="zhifubao"){
				window.location.href="/before/order/alipay"
			}
		}
<<<<<<< .mine
		$(document).ready(function(){
			window.setInterval(function(){
				$.ajax({
					url:"/before/order/checkPay",
					type:"post",
					data:{"oid":oid},
					dataType:"text",
					success:function(res){
							if(res=='success'){
								window.location.href="/presonal";
							}
						}
					})
			},1000);
		})
||||||| .r21127
	
=======
		$(document).ready(function(){
			window.setInterval(function(){
				$.ajax({
					url:"/before/order/checkPay",
					type:"post",
					data:{"oid":oid},
					dataType:"text",
					success:function(res){
							console.log(res)
							if(res=='success'){
								window.location.href="/presonal";
							}
						}
					})
			},1000);
		})

>>>>>>> .r21152
	</script>
	<div class="pay">
		<div class="pay_div">
			<div class="pay_div_top">
				<div class="pay_div_top_top">
					<div class="pay_div_top_top_text">订单金额：</div>
					<div class="pay_div_top_top_price">¥${order.finalTotol }</div>
				</div>
				<div class="pay_div_top_buttom">
					<div class="pay_div_top_buttom_left">付款方式：</div>
					<div class="pay_div_top_buttom_right">
						<div class="pay_div_top_buttom_right_zfb">
							<div><img alt="" src="../static/images/pay/pic1.png" style="width:calc(20px * 1);height: calc(20px * 1);margin-top: 4px;" class="payImg" data-value="zhifubao" data-state="1" onclick="chosePay(this)"></div>
							<div class="pay_div_top_buttom_right_text">支付宝</div>
						</div>
						<div class="pay_div_top_buttom_right_wx">
							<div><img alt="" src="../static/images/pay/pic3.png" style="width:calc(20px * 1);height: calc(20px * 1);margin-top: 4px;" class="payImg" data-value="weixin" data-state="0" onclick="chosePay(this)"></div>
							<div class="pay_div_top_buttom_right_text">微信</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pay_div_line"></div>
			<div class="pay_div_buttom">
				<div style="width: calc(190px * 1);height: calc(190px * 1);margin: 7px auto 30px auto">
					<div><img id="payImg" alt="" src="../static/images/pay/pic2.png" style="width:calc(190px * 1);height: calc(190px * 1);"></div>
				</div>
				<div class="pay_saoyisao">
					<div class="pay_buttom">
						<div><img alt="" src="../static/images/pay/pic4.png" style="width:calc(46px * 1);height: calc(48px * 1);" ></div>
						<div class="pay_buttom_text">打开手机支付宝扫一扫继续付款</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>