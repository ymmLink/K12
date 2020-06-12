package com.example.demo.utils;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.WxWebLogin;

public class WXWebUtil {
	public static final String URL_ACCESS_TOKEN="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	public static final String URL_USER_INFO="https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
	
	/*网页得到{ 
	"access_token":"ACCESS_TOKEN", 
	"expires_in":7200, 
	"refresh_token":"REFRESH_TOKEN",
	"openid":"OPENID", 
	"scope":"SCOPE",
	"unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
	}*/
	public static JSONObject getAccessTokenResult(String code) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("grant_type","authorization_code");
		String requestUrl = URL_ACCESS_TOKEN.replace("APPID", WxWebLogin.getAppID()).replace("SECRET",
				WxWebLogin.getAppSecret()).replace("CODE", code);
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		
		return parseObject;

	}
	/*
	 * { 
		"openid":"OPENID",
		"nickname":"NICKNAME",
		"sex":1,
		"province":"PROVINCE",
		"city":"CITY",
		"country":"COUNTRY",
		"headimgurl": "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
		"privilege":[
		"PRIVILEGE1", 
		"PRIVILEGE2"
		],
		"unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
		}
	 */
	public static JSONObject getUserInfoResult(String accessToken,String openId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
	
		String requestUrl = URL_USER_INFO.replace("ACCESS_TOKEN", accessToken).replace("OPENID",openId);
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		return parseObject;
	}
	//手机端
	public static JSONObject getAccessTokenResult2(String code) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("grant_type","authorization_code");
		String requestUrl = URL_ACCESS_TOKEN.replace("APPID", WxWebLogin.OfficialAppID).replace("SECRET",
				WxWebLogin.OfficialAppSecret).replace("CODE", code);
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		
		return parseObject;

	}
	/*
	 * { 
		"openid":"OPENID",
		"nickname":"NICKNAME",
		"sex":1,
		"province":"PROVINCE",
		"city":"CITY",
		"country":"COUNTRY",
		"headimgurl": "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
		"privilege":[
		"PRIVILEGE1", 
		"PRIVILEGE2"
		],
		"unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
		}
	 */
	public static JSONObject getUserInfoResult2(String accessToken,String openId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
	
		String requestUrl = URL_USER_INFO.replace("ACCESS_TOKEN", accessToken).replace("OPENID",openId);
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		return parseObject;
	}
}
