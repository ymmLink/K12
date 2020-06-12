package com.example.demo.before.controller.api;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class TestSocket {
	public static void main(String[] args) {
		try {
			Socket socket=new Socket("127.0.0.1", 8888);
			OutputStream os=socket.getOutputStream();
			InputStream is=socket.getInputStream();
			Thread rThread=new Thread(new Runnable() {
				
				@Override
				public void run() {
					int len;
					byte[] b=new byte[1024*8];
					try {
						while((len=is.read(b))!=-1) {
							String sr=new String(b,0,len);
							System.out.println(sr);
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
			rThread.start();
			Scanner scanner=new Scanner(System.in);
			String s=scanner.next();
			while(true) {
				os.write(s.getBytes());
				s=scanner.next();
			}
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
