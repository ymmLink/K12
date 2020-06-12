package com.example.demo.utils;

public class MyUtil {
	public static boolean isnull(String s){
		if(s==null||"".equals(s.trim())||"&nbsp;".equals(s.trim())){
			return true;
		}else{
			return false;
		}
	}
}
