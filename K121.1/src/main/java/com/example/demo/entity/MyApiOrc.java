package com.example.demo.entity;

import org.springframework.stereotype.Component;

import com.baidu.aip.ocr.AipOcr;
@Component
public class MyApiOrc {
	 //设置APPID/AK/SK
    public static final String BD_APP_ID = "17972195";
    public static final String BD_API_KEY = "O0UML4lrPhWNMOgt4aKNkAtT";
    public static final String BD_SECRET_KEY = "run7OGkecY6NY0FFHjGzm2FXebbWQjDl";
    private static AipOcr myAipOcr;
    public MyApiOrc() {
    	AipOcr client = new AipOcr(BD_APP_ID, BD_API_KEY, BD_SECRET_KEY);
    	myAipOcr=client;
    }
    public static AipOcr getMyAipOcr() {
    	return myAipOcr;
    }
//    public static void main(String[] args) {
//        // 初始化一个AipOcr
//        AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
//
//        // 可选：设置网络连接参数
//        client.setConnectionTimeoutInMillis(2000);
//        client.setSocketTimeoutInMillis(60000);
//
//        // 可选：设置代理服务器地址, http和socket二选一，或者均不设置
//        client.setHttpProxy("proxy_host", proxy_port);  // 设置http代理
//        client.setSocketProxy("proxy_host", proxy_port);  // 设置socket代理
//
//        // 可选：设置log4j日志输出格式，若不设置，则使用默认配置
//        // 也可以直接通过jvm启动参数设置此环境变量
//        System.setProperty("aip.log4j.conf", "path/to/your/log4j.properties");
//
//        // 调用接口
//        String path = "test.jpg";
//        JSONObject res = client.basicGeneral(path, new HashMap<String, String>());
//        System.out.println(res.toString(2));
//        
//    }
}
