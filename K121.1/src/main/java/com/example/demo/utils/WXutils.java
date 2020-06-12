package com.example.demo.utils;

import java.security.AlgorithmParameters;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.pdf.codec.Base64;
import com.mysql.cj.protocol.Security;

public class WXutils {

	
	
	public static final String OPENID_URL = "https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=APPSECRET&js_code=CODE&grant_type=authorization_code";
	public static final String URL_ACCESS_TOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	public static final String URL_getWXACodeUnlimit = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=ACCESS_TOKEN";
	
	
	public static String getOpenID(String code,String appid,String secret) throws Exception {
		String requestUrl = OPENID_URL.replace("APPID", appid).replace("APPSECRET", secret).replace("CODE", code);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		String openId = parseObject.get("openid").toString();

		return openId;
	}
	public static JSONObject getOpenMessage(String code,String appid,String secret) throws Exception {
		String requestUrl = OPENID_URL.replace("APPID", appid).replace("APPSECRET", secret).replace("CODE", code);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
//		System.out.println("parseObject"+parseObject);
		

		return parseObject;
	}

	public static String getAccessToken(String appid,String secret) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String requestUrl = URL_ACCESS_TOKEN.replace("APPID", appid).replace("APPSECRET",
				secret);
		String httpsRequest = ApiHttpClientUtils.httpsRequest(requestUrl, paramMap, "GET", null);
		JSONObject parseObject = JSONObject.parseObject(httpsRequest);
		String accessToken = parseObject.get("access_token").toString();
		return accessToken;

	}
	//解密微信数据
	public static JSONObject decryptionUserInfo(String encryptedData, String sessionKey, String iv) {
		// 被加密的数据
		byte[] dataByte = Base64.decode(encryptedData);
		// 加密秘钥
		byte[] keyByte = Base64.decode(sessionKey);
		// 偏移量
		byte[] ivByte = Base64.decode(iv);
 
		try {
			// 如果密钥不足16位，那么就补足. 这个if 中的内容很重要
			int base = 16;
			if (keyByte.length % base != 0) {
				int groups = keyByte.length / base + (keyByte.length % base != 0 ? 1 : 0);
				byte[] temp = new byte[groups * base];
				Arrays.fill(temp, (byte) 0);
				System.arraycopy(keyByte, 0, temp, 0, keyByte.length);
				keyByte = temp;
			}
			// 初始化
			java.security.Security.addProvider(new BouncyCastleProvider());
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding", "BC");
			SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
			AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
			parameters.init(new IvParameterSpec(ivByte));
			cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
			byte[] resultByte = cipher.doFinal(dataByte);
			if (null != resultByte && resultByte.length > 0) {
				String result = new String(resultByte, "UTF-8");
				return JSONObject.parseObject(result);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
