

package com.example.demo;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.RestController;
import org.weixin4j.WeixinException;
@RestController
@SpringBootApplication
@EnableScheduling
public class SpringbootExampleApplication  extends SpringBootServletInitializer  {
	public static Map<String, Socket> socketMap=new Hashtable<String, Socket>();
	public static Map<String,String> deviceMap=new Hashtable<String,String>();
	public static void main(String[] args) throws WeixinException {	
		
		SpringApplication.run(SpringbootExampleApplication.class, args);
		try {
			ServerSocket ss=new ServerSocket(8888);
			while(true) {
				Socket socket=ss.accept();
				Thread thread=new Thread(new Runnable() {
					@Override
					public void run() {
						InputStream is=null;
						try {
							is=socket.getInputStream();
							byte[] b=new byte[1024*8];
							int len;
							while((len=is.read(b))!=-1) {
								String ms=new String(b,0,len);
								System.out.println(ms);
								String shead=ms.split(",")[0].trim();
								if(shead.equals("uid")) {
									String uid=ms.split(",")[1].trim();
									String idevice=ms.split(",")[2];
									Socket ts=socketMap.get(uid);
									String device=deviceMap.get(uid);
									if(ts!=null&&!idevice.equals(device)) {
										OutputStream tsos=ts.getOutputStream();
										tsos.write(("outLogin,"+uid).getBytes());
									}
									socketMap.put(uid, socket);
									deviceMap.put(uid, idevice);
								}else if(shead.equals("sendMsg")) {
									String touid=ms.split(",")[1].trim();
									Socket ts=socketMap.get(touid);
									if(ts!=null) {
										OutputStream tsos=ts.getOutputStream();
										tsos.write(("sendMsg,"+touid).getBytes());
									}
								}else if(shead.equals("addFriend")) {
									String touid=ms.split(",")[1].trim();
									Socket ts=socketMap.get(touid);
									if(ts!=null) {
										OutputStream tsos=ts.getOutputStream();
										tsos.write(("addFriend,"+touid).getBytes());
									}
								}else if(shead.equals("followed")) {
									String touid=ms.split(",")[1].trim();
									Socket ts=socketMap.get(touid);
									if(ts!=null) {
										OutputStream tsos=ts.getOutputStream();
										tsos.write(("followed,"+touid).getBytes());
									}
								}
							}
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
				});
				thread.start();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	 //继承跟重写是为了jsp
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringbootExampleApplication.class);
    }
    
}
