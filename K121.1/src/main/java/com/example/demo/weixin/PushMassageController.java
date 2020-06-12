package com.example.demo.weixin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.weixin4j.Weixin;
import org.weixin4j.WeixinException;
import org.weixin4j.model.base.Token;

import com.example.demo.utils.CommonUtil;
import com.example.demo.utils.TimeUtil;

import net.sf.json.JSONObject;

/**
 * 微信模板信息
 * 
 * @author My
 * @CreateDate 2016-1-19
 * @param
 */
@RestController
public class PushMassageController {
	
	@Autowired
    private Weixin weixin;
	// 通知
	public void xiaoxi(String openid) throws WeixinException {
		// 微信接口
		String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		Token token = weixin.getToken();// 获取token
		url = url.replace("ACCESS_TOKEN", token.getAccess_token());// 转换为响应接口模式
		// 封装数据
		JSONObject json = new JSONObject();
		json.put("touser", openid);// 接收者wxName
		json.put("template_id", "CtTmY-ugQC1OH_mggxn59lNUq3BwqJzANN5YwyXWIFQ");// 消息模板
		
		//json.put("url","http://gebeile.xmyunxin.com/team!toMyDealer.action");//填写url可查看详情

		JSONObject dd = new JSONObject();

		JSONObject dd2 = new JSONObject();
		//填写头部的DATA
		dd2.put("value", "您好，您已购买成功。");// 头部消息
		//设置字体颜色
		dd2.put("color", "#173177");
		//填写你设置在模板的参数
		dd.put("first", dd2);

		JSONObject cc2 = new JSONObject();//第一个消息
		cc2.put("value", "微信数据服务");
		cc2.put("color", "#173177");
		dd.put("keyword1", cc2);

		JSONObject ee2 = new JSONObject();//第二个消息
		ee2.put("value", "1元");
		ee2.put("color", "#173177");
		dd.put("keyword2", ee2);
		
		JSONObject ee3 = new JSONObject();//第三个消息
		ee3.put("value", "微信");
		ee3.put("color", "#173177");
		dd.put("keyword3", ee3);
		
		JSONObject ee4 = new JSONObject();//第三个消息
		ee4.put("value", TimeUtil.getString());
		ee4.put("color", "#173177");
		dd.put("keyword4", ee4);
		
		JSONObject gg4 = new JSONObject();//底部消息
		gg4.put("value", "感谢您的使用！");
		dd.put("remark", gg4);
		
		json.put("data", dd);
		JSONObject js = CommonUtil.httpsRequest1(url, "POST", json.toString());
		System.out.println("js==" + js);
	}
}
