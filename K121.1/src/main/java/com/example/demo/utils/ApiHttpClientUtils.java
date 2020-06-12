package com.example.demo.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.Map;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * api接口请求工具类
 * @author lvzf	 2016年7月18日
 *
 */
public class ApiHttpClientUtils {

	 
	
	
	//其中第三个是”application/json” 即 传递数据的格式。 
	//第四个则表示的是，传递数据的认证方式。一般都是null或者""
	
	 public static String httpsRequest(String url, Map<String ,Object> param, String method, String base64) {
         StringBuffer buffer = new StringBuffer();

         // 声明SSL上下文
         javax.net.ssl.SSLContext ssl_context = null;
         try {
             ssl_context = javax.net.ssl.SSLContext.getInstance("SSL");
             ssl_context.init(null, new javax.net.ssl.TrustManager[]{
                 new javax.net.ssl.X509TrustManager() {
                     @Override
                     public void checkClientTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                     }
                     @Override
                     public void checkServerTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                     }
                     @Override
                     public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                         return null;
                     }
                 }   
             }, null);
         } catch (Exception e) {
             e.printStackTrace();
         }
         javax.net.ssl.HttpsURLConnection.setDefaultSSLSocketFactory(ssl_context.getSocketFactory());

         // 实例化主机名验证接口
         javax.net.ssl.HostnameVerifier hostname_verifier = new javax.net.ssl.HostnameVerifier(){
             @Override
             public boolean verify(String hostname, javax.net.ssl.SSLSession session) {
                 return true;
             }
         };
         javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(hostname_verifier);

         javax.net.ssl.HttpsURLConnection http_url_connection = null;
         try {
//           System.out.println("url"+url);new URL(null, url, new sun.net.www.protocol.https.Handler())
//             http_url_connection = (javax.net.ssl.HttpsURLConnection)(new java.net.URL(url)).openConnection()旧的可用
        	 http_url_connection = (javax.net.ssl.HttpsURLConnection)(new URL(null, url, new sun.net.www.protocol.https.Handler())).openConnection();
             http_url_connection.setDoInput(true);
             http_url_connection.setDoOutput(true);
             http_url_connection.setRequestMethod(method);
             http_url_connection.setRequestProperty("Content-Length", String.valueOf(mapToByte(param).length));
             http_url_connection.setRequestProperty("Content-Type", "application/json");
             http_url_connection.setUseCaches(false);
             if (null!=base64) {
                 http_url_connection.setRequestProperty("Authorization", "Basic "+new String(java.util.Base64.getEncoder().encode(base64.getBytes("utf-8")), "utf-8"));
             }

             // write request.
             java.io.BufferedOutputStream output_stream = new java.io.BufferedOutputStream(http_url_connection.getOutputStream());
             System.out.println(param);
             String s=JSON.toJSONString(param);
             System.out.println(s);
             output_stream.write(mapToByte(param));
             output_stream.flush();
             output_stream.close();
             output_stream = null;

             java.io.InputStreamReader input_stream_reader = new java.io.InputStreamReader(http_url_connection.getInputStream(), "utf-8");
             java.io.BufferedReader buffered_reader = new java.io.BufferedReader(input_stream_reader);
             buffer = new StringBuffer();
             String line;
             while ((line = buffered_reader.readLine()) != null) {
                 buffer.append(line);
             }
             line=null;
             input_stream_reader.close();
             input_stream_reader = null;
             buffered_reader.close();
             buffered_reader = null;
             http_url_connection.disconnect();
         } catch (Exception e) {  
             e.printStackTrace();  
         }

         return buffer.toString();
     }
	 
	
	 
	 
	 
	 /**
	  * map转byte[]
	  *@author thc
	  * 2018年10月22日
	  */
	 @SuppressWarnings("finally")
	public static byte[] mapToByte( Map<String,Object> map){
		 byte[] bt = null;
		 try {
		
		 ByteArrayOutputStream os = new ByteArrayOutputStream();
		 ObjectOutputStream oos = new ObjectOutputStream(os);
		 oos.writeObject(map);
		 bt=os.toByteArray();

		 oos.close();
		 os.close();
		 } catch (FileNotFoundException e) {
		 e.printStackTrace();
		 } catch (IOException e) {
		 e.printStackTrace();
		 }finally {
			 return  bt;
		}
		
	 }
	 
	 public static String httpsXML(String url, String xml, String method, String base64) {
         StringBuffer buffer = new StringBuffer();

         // 声明SSL上下文
         javax.net.ssl.SSLContext ssl_context = null;
         try {
             ssl_context = javax.net.ssl.SSLContext.getInstance("SSL");
             ssl_context.init(null, new javax.net.ssl.TrustManager[]{
                 new javax.net.ssl.X509TrustManager() {
                     @Override
                     public void checkClientTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                     }
                     @Override
                     public void checkServerTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
                     }
                     @Override
                     public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                         return null;
                     }
                 }   
             }, null);
         } catch (Exception e) {
             e.printStackTrace();
         }
         javax.net.ssl.HttpsURLConnection.setDefaultSSLSocketFactory(ssl_context.getSocketFactory());

         // 实例化主机名验证接口
         javax.net.ssl.HostnameVerifier hostname_verifier = new javax.net.ssl.HostnameVerifier(){
             @Override
             public boolean verify(String hostname, javax.net.ssl.SSLSession session) {
                 return true;
             }
         };
         javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(hostname_verifier);

         javax.net.ssl.HttpsURLConnection http_url_connection = null;
         try {
//           System.out.println("url"+url);
             http_url_connection = (javax.net.ssl.HttpsURLConnection)(new java.net.URL(url)).openConnection();
             http_url_connection.setDoInput(true);
             http_url_connection.setDoOutput(true);
             http_url_connection.setRequestMethod(method);
             http_url_connection.setRequestProperty("Content-Length", String.valueOf(xml.getBytes().length));
             http_url_connection.setRequestProperty("Content-Type", "application/json");
             http_url_connection.setUseCaches(false);
             if("POST".equalsIgnoreCase(method)){
             	
 				// 设置此 HttpURLConnection 实例是否应该自动执行 HTTP 重定向
            	 http_url_connection.setInstanceFollowRedirects(true);
 				// 设置使用标准编码格式编码参数的名-值对
            	 http_url_connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
             	 
             }
             if (null!=base64) {
                 http_url_connection.setRequestProperty("Authorization", "Basic "+new String(java.util.Base64.getEncoder().encode(base64.getBytes("utf-8")), "utf-8"));
             }

             // write request.
             java.io.BufferedOutputStream output_stream = new java.io.BufferedOutputStream(http_url_connection.getOutputStream());
             
             output_stream.write(xml.getBytes("UTF-8"));
             output_stream.flush();
             output_stream.close();
             output_stream = null;

             java.io.InputStreamReader input_stream_reader = new java.io.InputStreamReader(http_url_connection.getInputStream(), "utf-8");
             java.io.BufferedReader buffered_reader = new java.io.BufferedReader(input_stream_reader);
             buffer = new StringBuffer();
             String line;
             while ((line = buffered_reader.readLine()) != null) {
                 buffer.append(line);
             }
             line=null;
             input_stream_reader.close();
             input_stream_reader = null;
             buffered_reader.close();
             buffered_reader = null;
             http_url_connection.disconnect();
         } catch (Exception e) {  
             e.printStackTrace();  
         }

         return buffer.toString();
     }
	//传json
	//其中第三个是”application/json” 即 传递数据的格式。 
	//第四个则表示的是，传递数据的认证方式。一般都是null或者""
	
	 public static String TChttpsRequest(String url, Map<String ,Object> param, String method, String base64) {
	     StringBuffer buffer = new StringBuffer();
	
	     // 声明SSL上下文
	     javax.net.ssl.SSLContext ssl_context = null;
	     try {
	         ssl_context = javax.net.ssl.SSLContext.getInstance("SSL");
	         ssl_context.init(null, new javax.net.ssl.TrustManager[]{
	             new javax.net.ssl.X509TrustManager() {
	                 @Override
	                 public void checkClientTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
	                 }
	                 @Override
	                 public void checkServerTrusted (java.security.cert.X509Certificate[] chain, String authType) throws java.security.cert.CertificateException {
	                 }
	                 @Override
	                 public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	                     return null;
	                 }
	             }   
	         }, null);
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     javax.net.ssl.HttpsURLConnection.setDefaultSSLSocketFactory(ssl_context.getSocketFactory());
	
	     // 实例化主机名验证接口
	     javax.net.ssl.HostnameVerifier hostname_verifier = new javax.net.ssl.HostnameVerifier(){
	         @Override
	         public boolean verify(String hostname, javax.net.ssl.SSLSession session) {
	             return true;
	         }
	     };
	     javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(hostname_verifier);
	
	     javax.net.ssl.HttpsURLConnection http_url_connection = null;
	     try {
	//	           System.out.println("url"+url);new URL(null, url, new sun.net.www.protocol.https.Handler())
	//	             http_url_connection = (javax.net.ssl.HttpsURLConnection)(new java.net.URL(url)).openConnection()旧的可用
	    	 http_url_connection = (javax.net.ssl.HttpsURLConnection)(new URL(null, url, new sun.net.www.protocol.https.Handler())).openConnection();
	         http_url_connection.setDoInput(true);
	         http_url_connection.setDoOutput(true);
	         http_url_connection.setRequestMethod(method);
	         http_url_connection.setRequestProperty("Content-Length", String.valueOf(mapToByte(param).length));
	         http_url_connection.setRequestProperty("Content-Type", "application/json");
	         http_url_connection.setUseCaches(false);
	         if (null!=base64) {
	             http_url_connection.setRequestProperty("Authorization", "Basic "+new String(java.util.Base64.getEncoder().encode(base64.getBytes("utf-8")), "utf-8"));
	         }
	
	         // write request.
	         java.io.BufferedOutputStream output_stream = new java.io.BufferedOutputStream(http_url_connection.getOutputStream());
	         System.out.println(param);
	         String s=JSON.toJSONString(param);
	         System.out.println(s.getBytes());
	         output_stream.write(s.getBytes("UTF-8"));
	         output_stream.flush();
	         output_stream.close();
	         output_stream = null;
	
	         java.io.InputStreamReader input_stream_reader = new java.io.InputStreamReader(http_url_connection.getInputStream(), "utf-8");
	         java.io.BufferedReader buffered_reader = new java.io.BufferedReader(input_stream_reader);
	         buffer = new StringBuffer();
	         String line;
	         while ((line = buffered_reader.readLine()) != null) {
	             buffer.append(line);
	         }
	         line=null;
	         input_stream_reader.close();
	         input_stream_reader = null;
	         buffered_reader.close();
	         buffered_reader = null;
	         http_url_connection.disconnect();
	     } catch (Exception e) {  
	         e.printStackTrace();  
	     }
	
	     return buffer.toString();
	 }
}
