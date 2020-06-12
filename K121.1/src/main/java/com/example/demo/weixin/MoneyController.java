package com.example.demo.weixin;

import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.security.KeyStore;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.dom4j.DocumentException;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RestController;
import org.weixin4j.Weixin;
import org.weixin4j.WeixinException;
import org.weixin4j.model.pay.UnifiedOrder;
import org.weixin4j.model.pay.UnifiedOrderResult;
import org.weixin4j.model.pay.WCPay;
import org.weixin4j.util.PayUtil;
import org.weixin4j.util.SignUtil;
import org.xml.sax.InputSource;
import com.example.demo.entity.JsonResult;
import com.example.demo.entity.WxWebLogin;
import com.example.demo.utils.CommonUtil;
import com.example.demo.utils.Request;
import com.example.demo.utils.WXutils;

/**
 * 微信支付、退款、提现
 * @author xmyun
 *
 */
@RestController
public class MoneyController {
	
	@Autowired
    private Weixin weixin;
	
	@Value("${weixin4j.config.oauthUrl}")
    private String oauthUrl;
	
	private static Logger log = LoggerFactory.getLogger(MoneyController.class);
	
	/**
	 * 支付方法
	 */
	public  JsonResult  yuzhifu(HttpServletRequest request,String openid, Double  money, String oid ,String NotifyUrl){
		JsonResult jsonResult = new JsonResult();
		//System.out.println(weixin);
		// 商户相关资料
		String appid = weixin.getAppId();
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		System.err.println(appid+",,,"+partner+",,,"+partnerkey);
		//Integer用这个
		//String finalmoney = finalmoney1+"00";
		//String finalmoney = "1";//测试用1分钱 
		//Double用这个。
		String finalmoney = String.format("%.2f",money);
		finalmoney = finalmoney.replace(".", "");
		finalmoney = String.valueOf(Integer.valueOf(finalmoney));
		finalmoney = "1";//测试金额
		UnifiedOrder unifiedorder = new UnifiedOrder();
		unifiedorder.setAppid(appid);
		// 商品描述根据情况修改
        unifiedorder.setBody("支付测试");
        unifiedorder.setMch_id(partner);
        unifiedorder.setNonce_str(java.util.UUID.randomUUID().toString().substring(0, 15));
        // 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
     	// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
        unifiedorder.setNotify_url(NotifyUrl);//weixin.getWeixinPayConfig().getNotifyUrl()
        unifiedorder.setOpenid(openid);
        // 商户订单号
        unifiedorder.setOut_trade_no(oid);
        // 订单生成的机器 IP
        String spbill_create_ip=getIpAddr(request);
        unifiedorder.setSpbill_create_ip(spbill_create_ip);
         //总费用
         unifiedorder.setTotal_fee(finalmoney);
         unifiedorder.setTrade_type("JSAPI");
         //对下单对象进行签名
         String sign = SignUtil.getSign(unifiedorder.toMap(), partnerkey);
         //设置签名
         unifiedorder.setSign(sign);
         //统一预下单
         UnifiedOrderResult unifiedOrderResult;
		try {
			
			unifiedOrderResult = weixin.pay().payUnifiedOrder(unifiedorder);
			System.err.println(unifiedOrderResult.getReturn_msg());
			//下单成功
	         if (unifiedOrderResult.isSuccess()) {
	             String prepay_id = unifiedOrderResult.getPrepay_id();
	             //初始化
	             WCPay wcPay = PayUtil.getBrandWCPayRequest(appid, prepay_id, partnerkey);
	            Request.setName(request,"appId" ,weixin.getAppId());
	     	    Request.setName(request,"timestamp" ,wcPay.getTimeStamp());
	     	    Request.setName(request,"nonceStr" ,wcPay.getNonceStr());
	     	    Request.setName(request,"package" ,wcPay.getPackage());
	     	    Request.setName(request,"sign" ,wcPay.getPaySign());
	     	    jsonResult.setZhifu1(weixin.getAppId());
		     	jsonResult.setZhifu2(wcPay.getTimeStamp());
		     	jsonResult.setZhifu3(wcPay.getNonceStr());
		     	jsonResult.setZhifu4(wcPay.getPackage());
		     	jsonResult.setZhifu5(wcPay.getPaySign());
		     	jsonResult.setRes1(oid);
	         }
		} catch (WeixinException e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	/**
	 * 支付方法2
	 */
	public  JsonResult  yuzhifu2(HttpServletRequest request,String openid, Double  money, String oid ,String NotifyUrl){
		JsonResult jsonResult = new JsonResult();
		//System.out.println(weixin);
		// 商户相关资料
		String appid =WxWebLogin.getOfficialAppID();
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		System.err.println(appid+",,,"+partner+",,,"+partnerkey);
		//Integer用这个
		//String finalmoney = finalmoney1+"00";
		//String finalmoney = "1";//测试用1分钱 
		//Double用这个。
		String finalmoney = String.format("%.2f",money);
		finalmoney = finalmoney.replace(".", "");
		finalmoney = String.valueOf(Integer.valueOf(finalmoney));
		finalmoney = "1";//测试金额
		UnifiedOrder unifiedorder = new UnifiedOrder();
		unifiedorder.setAppid(appid);
		// 商品描述根据情况修改
        unifiedorder.setBody("支付测试");
        unifiedorder.setMch_id(partner);
        unifiedorder.setNonce_str(java.util.UUID.randomUUID().toString().substring(0, 15));
        // 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
     	// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
        unifiedorder.setNotify_url(NotifyUrl);//weixin.getWeixinPayConfig().getNotifyUrl()
        unifiedorder.setOpenid(openid);
        // 商户订单号
        unifiedorder.setOut_trade_no(oid);
        // 订单生成的机器 IP
        String spbill_create_ip=getIpAddr(request);
        unifiedorder.setSpbill_create_ip(spbill_create_ip);
         //总费用
         unifiedorder.setTotal_fee(finalmoney);
         unifiedorder.setTrade_type("JSAPI");
         //对下单对象进行签名
         String sign = SignUtil.getSign(unifiedorder.toMap(), partnerkey);
         //设置签名
         unifiedorder.setSign(sign);
         //统一预下单
         UnifiedOrderResult unifiedOrderResult;
		try {
			
			unifiedOrderResult = weixin.pay().payUnifiedOrder(unifiedorder);
			System.err.println(unifiedOrderResult.getReturn_msg());
			//下单成功
	         if (unifiedOrderResult.isSuccess()) {
	            String prepay_id = unifiedOrderResult.getPrepay_id();
	            System.out.println("prepay_id="+prepay_id);
	             //初始化
	            WCPay wcPay = PayUtil.getBrandWCPayRequest(appid, prepay_id, partnerkey);
	            Request.setName(request,"appId" ,WxWebLogin.getOfficialAppID());
	     	    Request.setName(request,"timestamp" ,wcPay.getTimeStamp());
	     	    Request.setName(request,"nonceStr" ,wcPay.getNonceStr());
	     	    Request.setName(request,"package" ,wcPay.getPackage());
	     	    Request.setName(request,"sign" ,wcPay.getPaySign());
	     	    jsonResult.setZhifu1(WxWebLogin.getOfficialAppID());
		     	jsonResult.setZhifu2(wcPay.getTimeStamp());
		     	jsonResult.setZhifu3(wcPay.getNonceStr());
		     	jsonResult.setZhifu4(wcPay.getPackage());
		     	jsonResult.setZhifu5(wcPay.getPaySign());
		     	jsonResult.setRes1(oid);
	         }
		} catch (WeixinException e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	/**
	 * 扫码支付(公众号):模式一(未知openID)
	 */
	public  JsonResult  codePay1(HttpServletRequest request,String oid){
		JsonResult jsonResult = new JsonResult();
		//System.out.println(weixin);
		// 商户相关资料
		String appid =WxWebLogin.getOfficialAppID();
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		System.err.println(appid+",,,"+partner+",,,"+partnerkey);
		//签名
      //随机字符串
        String nonceStr=java.util.UUID.randomUUID().toString().substring(0, 15);
        //时间戳
        String timeStamp = String.valueOf(System.currentTimeMillis() / 1000);
        
        Map<String,String> map=new HashMap<String,String>();
        map.put("appid", appid);
        map.put("mch_id", partner);
        map.put("time_stamp", timeStamp);
        map.put("nonce_str", nonceStr);
        map.put("product_id", oid);
        String sign = SignUtil.getSign(map, partnerkey);
        System.out.println("sign2="+sign);
//		String stringA="appid="+appid+"&body=test&device_info=1000&mch_id="+partner+"&nonce_str="+java.util.UUID.randomUUID().toString().substring(0, 15);
//		String stringSignTemp=stringA+"&key="+partnerkey; //注：key为商户平台设置的密钥key
//		String sign=DigestUtils.md5Hex(stringSignTemp).toUpperCase(); //注：MD5签名方式
		
		String WX_CODE_URL="weixin://wxpay/bizpayurl?appid=APPID&mch_id=MCHID&nonce_str=NONCESTR&product_id=PRODUCTID&time_stamp=TIMESTATE&sign=SIGN";
		String wxCodeUrl=WX_CODE_URL.replace("SIGN", sign).replace("APPID", appid).replace("MCHID", partner).replace("PRODUCTID", oid).replace("TIMESTATE", timeStamp).replace("NONCESTR", nonceStr);
		System.out.println(wxCodeUrl);
		jsonResult.setCode_url(wxCodeUrl);
		jsonResult.setRes1(oid);;
		return jsonResult;
	}
	
	/**
	 * 扫码支付(公众号):模式二
	 */
	public  JsonResult  codePay2(HttpServletRequest request,String openid, Double  money, String oid){
		JsonResult jsonResult = new JsonResult();
		//System.out.println(weixin);
		// 商户相关资料
		String appid =WxWebLogin.getOfficialAppID();
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		System.err.println(appid+",,,"+partner+",,,"+partnerkey);
		//Integer用这个
		//String finalmoney = finalmoney1+"00";
		//String finalmoney = "1";//测试用1分钱 
		//Double用这个。
		String finalmoney = String.format("%.2f",money);
		finalmoney = finalmoney.replace(".", "");
		finalmoney = String.valueOf(Integer.valueOf(finalmoney));
		finalmoney = "1";//测试金额
		UnifiedOrder unifiedorder = new UnifiedOrder();
		unifiedorder.setAppid(appid);
		// 商品描述根据情况修改
        unifiedorder.setBody("支付测试");
        unifiedorder.setMch_id(partner);
        unifiedorder.setNonce_str(java.util.UUID.randomUUID().toString().substring(0, 15));
        // 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
     	// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
//      unifiedorder.setNotify_url(NotifyUrl);//weixin.getWeixinPayConfig().getNotifyUrl()
        unifiedorder.setOpenid(openid);
        // 商户订单号
        unifiedorder.setOut_trade_no(oid);
        // 订单生成的机器 IP
        String spbill_create_ip=getIpAddr(request);
        unifiedorder.setSpbill_create_ip(spbill_create_ip);
         //总费用
         unifiedorder.setTotal_fee(finalmoney);
         unifiedorder.setTrade_type("NATIVE");
         //对下单对象进行签名
         String sign = SignUtil.getSign(unifiedorder.toMap(), partnerkey);
         //设置签名
         unifiedorder.setSign(sign);
         //统一预下单
         UnifiedOrderResult unifiedOrderResult;
		try {
			
			unifiedOrderResult = weixin.pay().payUnifiedOrder(unifiedorder);
			System.err.println(unifiedOrderResult.getReturn_msg());
			//下单成功
	         if (unifiedOrderResult.isSuccess()) {
	            String prepay_id = unifiedOrderResult.getPrepay_id();
	             //初始化
	            String code_url=unifiedOrderResult.getCode_url();
	            jsonResult.setCode_url(code_url);
	         }
		} catch (WeixinException e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	/**
	 * 
	 * @param request 
	 * @param orderId   oid
	 * @param totalFee  订单金额
	 * @param refundFee 退款金额  退款金额<=订单金额
	 * @param openId  用户openid
	 * Description: 自动退款功能
	 */
//	public void refund(HttpServletRequest request,String orderId, double totalFee, double refundFee, String openId,String type){
//		 Map<String, String> resultMap=refundOrder(request,orderId,totalFee, refundFee, openId,type);
//		for (Map.Entry<String, String> entry : resultMap.entrySet()) {  
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
//		 }
//	 }
	public Map<String, String> refundOrder(HttpServletRequest request,String orderId, String totalFee1,
			String refundFee1,String openId,String type) {
		String totalFee = String.format("%.2f", totalFee1);
		totalFee = totalFee.replace(".", "");
		totalFee= String.valueOf(Integer.valueOf(totalFee));
		//测试订单金额为1分
//		totalFee="100";
//		String refundFee = String.format("%.2f", refundFee1);
//		refundFee = refundFee.replace(".", "");
//		refundFee = String.valueOf(Integer.valueOf(refundFee));
		String refundFee = refundFee1+"00";
		refundFee = "1";//测试用1分钱 。
		// 商户相关资料
		String appid="";
		String appsecret="";
		if(type.equals("xiaochengxu")){
			appid = weixin.getAppId();
			appsecret = weixin.getSecret();
		}else if(type.equals("gongzonghao")){
			appid=WxWebLogin.getOfficialAppID();
			appsecret=WxWebLogin.getOfficialAppSecret();				
		}
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		Map<String, String> resultMap = new HashMap<String, String>();
		Map<String, String> parseMap = new HashMap<String, String>();
		// 申请退款接口地址
		String requestUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";
		// 构造请求微信支付系统参数
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("appid", appid);
		paramMap.put("mch_id", partner);
		paramMap.put("nonce_str", java.util.UUID.randomUUID().toString().substring(0, 15));
		String cert_path = weixin.getWeixinPayConfig().getCertPath();
		String cert_pwd = partner;
		// 商户侧传给微信的订单号
		paramMap.put("out_trade_no", orderId);
		// 微信生成的订单号，在支付通知中有返回
		paramMap.put("out_refund_no", orderId);// StringHelper.getUUID()
		// paramMap.put("transaction_id", "1005090346201509150891328635");
		// 订单总金额，单位为分，只能为整数
		paramMap.put("total_fee", totalFee);
		// 退款总金额，订单总金额，单位为分，只能为整数
		paramMap.put("refund_fee", refundFee);
		// 操作员帐号, 默认为商户号
		paramMap.put("op_user_id", partner);
		//生成签名
		String sign = SignUtil.getSign(paramMap, partnerkey);
		paramMap.put("sign", sign);
		for (Map.Entry<String, String> entry : paramMap.entrySet()) {  
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
		}
		try {
			log.info(String.format("PARAMS:orderId=%s,totalFee=%s,refundFee=%s,opUserId=%s,openId=%s",
				orderId,totalFee,refundFee,partner,openId));
			parseMap = sendToWechat(requestUrl, paramMap, true,cert_path,cert_pwd,partner,appsecret);
			log.info(String.format("return:%s ",parseMap));
			// 结果处理
			if (parseMap != null) {
				resultMap.put("return_code", parseMap.get("return_code"));
				resultMap.put("return_msg", parseMap.get("return_msg"));
				resultMap.put("result_code", parseMap.get("result_code"));
				resultMap.put("refund_id", parseMap.get("refund_id"));
				resultMap.put("err_code", parseMap.get("err_code"));
				resultMap.put("err_code_des", parseMap.get("err_code_des"));
				resultMap.put("transaction_id", parseMap.get("transaction_id"));
			}
		} catch (Exception e) {
			log.error("------------------微信退款---------------------", e);
			log.error(e.getStackTrace().toString());
			e.printStackTrace();
			resultMap.put("return_code", "FAIL");
			resultMap.put("result_code", "FAIL");
			resultMap.put("return_msg", e.getMessage());
		}
		log.info("=====================end refund==============");
		return resultMap;
	}
	private static Map<String, String> sendToWechat(String requestUrl, Map<String, String> paramMap, boolean useCert,
			String cert_path,String cert_pwd,String partner,String appsecret)throws Exception, DocumentException {
		Map<String, String> parseMap;
		XmlHandler xmlHandler = new XmlHandler();
		String dataStr = xmlHandler.Map2Xml(paramMap);
		String result;
		// 发送请求
		if (useCert) {
			result = CommonUtil.sendHttpRequestWithCert(requestUrl, dataStr, cert_path, cert_pwd);
		} else {
			result = CommonUtil.sendHttpsRequest(requestUrl, "POST", dataStr);
		}
		// 结果解析
		parseMap = xmlHandler.simpleXml2Map(result);
		return parseMap;
	}
	
	
	/**
	 * 提现
	 */
	 public String send(HttpServletRequest request,String openid,Double money){
		String finalmoney = String.format("%.2f",money);
		finalmoney = finalmoney.replace(".", "");
		finalmoney = String.valueOf(Integer.valueOf(finalmoney));
		// 商户相关资料
		String appid = weixin.getAppId();
		String partner = weixin.getWeixinPayConfig().getPartnerId();
		String partnerkey = weixin.getWeixinPayConfig().getPartnerKey();
		
		SimpleDateFormat df1 = new SimpleDateFormat("MMddHHmmss");
		String idd = df1.format(new Date());
		//String orderNNo =  MoneyUtils.getOrderNo() ; 
		Map<String, String> map = new HashMap<String, String>();
		map.put("mch_appid",appid);//appid
		map.put("mchid",partner);//商户号
		map.put("nonce_str",java.util.UUID.randomUUID().toString().substring(0, 15));//随机字符串
		map.put("partner_trade_no",idd);//商户订单号
		map.put("openid", openid);//用户openid
		map.put("amount", finalmoney);//付款金额
		map.put("check_name", "NO_CHECK");
		map.put("desc", "sslf");//描述
		String spbill_create_ip=getIpAddr(request);
		map.put("spbill_create_ip", spbill_create_ip);
		String sign = SignUtil.getSign(map, partnerkey);
		map.put("sign", sign);//签名
		
		String reqXml = createXML(map);
		String resXml = "";
		try {
			String url1 = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
			resXml = doSendMoney(request,url1, reqXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("resXml:"+resXml);
		//创建一个新的字符串
	    StringReader read = new StringReader(resXml);
	    //创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
	    InputSource source = new InputSource(read);
	    //创建一个新的SAXBuilder
	    SAXBuilder sb = new SAXBuilder();
	    try {
	        //通过输入源构造一个Document
	        Document doc = sb.build(source);
	        //取的根元素
	        Element root = doc.getRootElement();
	        System.out.println("根元素名称"+root.getName());//输出的（测试）
	        //得到根元素所有子元素的集合
	        List jiedian = root.getChildren();
	        //获得XML中的命名空间（XML中未定义可不写）
	        Namespace ns = root.getNamespace();
	        Element et = null;
	        for(int i=0;i<jiedian.size();i++){
	            et = (Element) jiedian.get(i);//循环依次得到子元素
	            String jieguo=et.getName();
	            if(jieguo.equals("result_code")){
	            	String j=et.getText();
	            	if(j.equals("SUCCESS")){
	             		System.out.println("成功了！");
	             		return "yes";
	             	}
	            }   
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return null;
	 }
	 
	 @SuppressWarnings("deprecation")
		public String doSendMoney(HttpServletRequest request,String url, String data) throws Exception {
			KeyStore keyStore  = KeyStore.getInstance("PKCS12");
		    FileInputStream instream = new FileInputStream(new File(weixin.getWeixinPayConfig().getCertPath()));//P12文件目录
	        try {
	            keyStore.load(instream, weixin.getWeixinPayConfig().getCertSecret().toCharArray());//这里写密码..默认是你的MCHID
	        } finally {
	            instream.close();
	        }
	        // Trust own CA and all self-signed certs
	        SSLContext sslcontext = SSLContexts.custom()
	                .loadKeyMaterial(keyStore, weixin.getWeixinPayConfig().getCertSecret().toCharArray())//这里也是写密码的
	                .build();
	        // Allow TLSv1 protocol only
	        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" }, null,
	        		SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
	        CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
	        try {
	        	HttpPost httpost = new HttpPost(url); // 设置响应头信息
	        	httpost.addHeader("Connection", "keep-alive");
	        	httpost.addHeader("Accept", "*/*");
	        	httpost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=GBK");
	        	httpost.addHeader("Host", "api.mch.weixin.qq.com");
	        	httpost.addHeader("X-Requested-With", "XMLHttpRequest");
	        	httpost.addHeader("Cache-Control", "max-age=0");
	        	httpost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
	    		httpost.setEntity(new StringEntity(data, "GBK"));
	            CloseableHttpResponse response = httpclient.execute(httpost);
	            try {
	                HttpEntity entity = response.getEntity();
	                //String jsonStr = toStringInfo(response.getEntity(),"UTF-8");
	                //微信返回的报文时GBK，直接使用httpcore解析乱码
	                String jsonStr = EntityUtils.toString(response.getEntity(),"UTF-8");
	                EntityUtils.consume(entity);
	               return jsonStr;
	            } finally {
	                response.close();
	            }
	        } finally {
	            httpclient.close();
	        }
		}
	 
	 
	 
	 public static String createXML(Map<String, String> map){
			String xml = "<xml>";
			Set<String> set = map.keySet();
			Iterator<String> i = set.iterator();
			while(i.hasNext()){
				String str = i.next();
				xml+="<"+str+">"+"<![CDATA["+map.get(str)+"]]>"+"</"+str+">";
			}
			xml+="</xml>";
			return xml;
		}
	 
	 /**
     * 获得客户端真实IP地址
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}