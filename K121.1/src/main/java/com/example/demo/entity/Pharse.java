package com.example.demo.entity;
/**
 * 阶段
 * @author ymm
 *
 */
public class Pharse {
	private int pharseId;
	private String pharseName;
	public int getPharseId() {
		return pharseId;
	}
	public void setPharseId(int pharseId) {
		this.pharseId = pharseId;
	}
	public String getPharseName() {
		return pharseName;
	}
	public void setPharseName(String pharseName) {
		this.pharseName = pharseName;
	}
	@Override
	public String toString() {
		return "Pharse [pharseId=" + pharseId + ", pharseName=" + pharseName + "]";
	}
	
}
