<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String appid = (String) request.getSession().getAttribute("appId");
String timestamp = (String) request.getSession().getAttribute("timestamp");
String nonceStr = (String) request.getSession().getAttribute("nonceStr");

String packageValue =(String) request.getSession().getAttribute("package");
String paySign =(String) request.getSession().getAttribute("sign");
%>

<!DOCTYPE HTML >
<html>
  <head>
		<title>支付</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="/static/pintuer/css/pintuer.css">
	    <link rel="stylesheet" href="/static/pintuer/css/admin.css">
	    <script src="/static/pintuer/js/jquery.js"></script>
	    <script src="/static/pintuer/js/pintuer.js"></script>
	</head>
  
  <body style="font-size:14px;background:#F5F5F5;">
    <div style="position:fixed;top:0px;background:#000;width:100%;line-height:35px;font-weight:bold;color:#fff;font-size:16px;text-align:center;">
           <span style="clear:both;margin-right:5%;">支付测试</span>
    </div>
    <div style="margin-top:35px;height:60px;">
        <div style="text-align:center;height:26px;line-height:26px;font-style:italic;font-size:13px;"><span style="color:#32CD32;" class="icon-shield"> 您正在安全支付环境中，请放心付款</span></div>
        <div style="text-align:center;height:30px;line-height:30px;font-size:22px;font-weight:bold;">￥1</div>
    </div>
    <div style="background:#fff;height:100px;">
        <div style="font-size:13px;height:23px;line-height:23px;text-algin:right;"><span style="float:left;margin-left:3px;">订单编号</span><span style="float:right;margin-right:3px;">0123456789</span></div>
        <div style="font-size:13px;height:23px;line-height:23px;text-algin:right;"><span style="float:left;margin-left:3px;">交易类型</span><span style="float:right;margin-right:3px;">即时交易</span></div>
    </div>
    <div class="form-button" style="text-align:center;margin-top:15px;">
			<a href="javascript:void(0)" onclick="callpay()"><button class="button" style="width:90%;background:#32CD32;color:#fff;" >
				立即支付</button></a>
	</div>
	<!-- 
    <div class="form-button" style="text-align:center;margin-top:15px;">
			<a href="javascript:void(0)" onclick="location='/team/refund'"><button class="button" style="width:90%;background:#32CD32;color:#fff;" >
				退款</button></a>
	</div> -->
    <div class="form-button" style="text-align:center;margin-top:15px;">
			<a href="javascript:void(0)" onclick="location='/team/refund'"><button class="button" style="width:90%;background:#32CD32;color:#fff;" >
				提现</button></a>
	</div>
	<script type="text/javascript">

  	function callpay(){
		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
  		 appId : "<%=appid%>",
  		 timeStamp : "<%=timestamp%>", 
  		 nonceStr : "<%=nonceStr%>", 
  		 package : "<%=packageValue%>",
  		 signType : "MD5",
  		 paySign : "<%=paySign%>" 
   			},function(res){

   				WeixinJSBridge.log(res.err_msg);
 				//alert(res.err_code + res.err_desc + res.err_msg);
	            if(res.err_msg == "get_brand_wcpay_request:ok"){  
	            	alert("微信支付成功!");
	            	$("#alertmsg").html("微信支付成功!");
					$("#tanchuang").css("display","");
	            //	$('#href').attr('href','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx3de1b3c3b550363d&redirect_uri=http%3a%2f%2fwww.xiangbanxiaoyuan.com%2fw%2fproduct!findall1.action%3fhuojia.id%3d'+id+'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect');
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
	                $("#alertmsg").html("用户取消支付!");
					$("#tanchuang").css("display",""); 
	            }else{  
	            	$("#alertmsg").html("微信支付失败!");
					$("#tanchuang").css("display","");  
	            }  
			})
			

		}
  </script>
  </body>
</html>
