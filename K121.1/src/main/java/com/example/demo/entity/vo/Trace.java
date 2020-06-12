package com.example.demo.entity.vo;

public class Trace {
	
	private String acceptStation;
	private String acceptTime;
	public String getAcceptStation() {
		return acceptStation;
	}
	public void setAcceptStation(String acceptStation) {
		this.acceptStation = acceptStation;
	}
	public String getAcceptTime() {
		return acceptTime;
	}
	public void setAcceptTime(String acceptTime) {
		this.acceptTime = acceptTime;
	}
	@Override
	public String toString() {
		return "trace [acceptStation=" + acceptStation + ", acceptTime=" + acceptTime + "]";
	}
	
}
