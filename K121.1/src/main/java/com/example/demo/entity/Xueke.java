package com.example.demo.entity;

public class Xueke {
	private int id;
	private int xd;
	private int chid;
	private String xdName;
	private String chidName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getXd() {
		return xd;
	}
	public void setXd(int xd) {
		this.xd = xd;
	}
	public int getChid() {
		return chid;
	}
	public void setChid(int chid) {
		this.chid = chid;
	}
	public String getXdName() {
		return xdName;
	}
	public void setXdName(String xdName) {
		this.xdName = xdName;
	}
	public String getChidName() {
		return chidName;
	}
	public void setChidName(String chidName) {
		this.chidName = chidName;
	}
	@Override
	public String toString() {
		return "Xueke [id=" + id + ", xd=" + xd + ", chid=" + chid + ", xdName=" + xdName + ", chidName=" + chidName
				+ "]";
	}
	
}
