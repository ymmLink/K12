<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
	pageEncoding="utf-8"%>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<%
	String appid = (String) request.getSession().getAttribute("appId");
	String nonceStr = (String) request.getSession().getAttribute("nonceStr");
	String timestamp = (String) request.getSession().getAttribute("timestamp");
	String signature = (String) request.getSession().getAttribute("signature");
	String url = (String) request.getSession().getAttribute("url");
	String url1 = (String) request.getSession().getAttribute("url1");
	String title = "分享啦啦啦";
	String img ="http://www.gebeile.com/img/shangchengshouye.png";
%>
 <script type="text/javascript">
	//分享
	wx.config({
    debug: true,
    appId: '<%=appid%>',
    timestamp: '<%=timestamp%>',
    nonceStr: '<%=nonceStr%>',
    signature: '<%=signature%>',
    jsApiList: [
      'checkJsApi',
      'onMenuShareTimeline',
      'onMenuShareAppMessage',
      'onMenuShareQQ',
      'onMenuShareWeibo',
      'onMenuShareQZone',
      'hideMenuItems',
      'showMenuItems',
      'hideAllNonBaseMenuItem',
      'showAllNonBaseMenuItem',
      'translateVoice',
      'startRecord',
      'stopRecord',
      'onVoiceRecordEnd',
      'playVoice',
      'onVoicePlayEnd',
      'pauseVoice',
      'stopVoice',
      'uploadVoice',
      'downloadVoice',
      'chooseImage',
      'previewImage',
      'uploadImage',
      'downloadImage',
      'getNetworkType',
      'openLocation',
      'getLocation',
      'hideOptionMenu',
      'showOptionMenu',
      'closeWindow',
      'scanQRCode',
      'chooseWXPay',
      'openProductSpecificView',
      'addCard',
      'chooseCard',
      'openCard'
    ]
	});
	wx.ready(function(){
		var shareData = {
            title: '分享啦啦啦', // 分享标题
            desc: '葛贝乐养生饮料:清热降火，解酒护肝，美容养颜！', // 分享描述
            link: '<%=url%>',//window.location.href, // 分享链接
            imgUrl: '<%=img%>', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                alert("分享成功");
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                alert("不分享拉倒");
            }
		}
		 //分享接口
        <%-- 发送给好友 --%>
        wx.onMenuShareAppMessage(shareData);
        <%-- 分享到朋友圈 --%>
        wx.onMenuShareTimeline(shareData);
        <%-- 分享到QQ --%>
        wx.onMenuShareQQ(shareData);
        <%-- 分享到weibo --%>
        wx.onMenuShareWeibo(shareData);
        <%-- 分享到QQ空间 --%>
        wx.onMenuShareQZone(shareData);
	});
	wx.error(function(res){
		alert(res);
	});
</script>
