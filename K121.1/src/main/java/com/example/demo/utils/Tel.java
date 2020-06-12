package com.example.demo.utils;

import java.io.Serializable;

public class Tel implements Serializable{
	
	private String mobile;
	private String nationcode;
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNationcode() {
		return nationcode;
	}
	public void setNationcode(String nationcode) {
		this.nationcode = nationcode;
	}
	
}
