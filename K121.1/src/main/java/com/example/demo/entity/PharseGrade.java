package com.example.demo.entity;
/**
 * 阶段年纪关系表
 * @author ymm
 *
 */
public class PharseGrade {
	private int pharseId;
	private int gradeId;
	public int getPharseId() {
		return pharseId;
	}
	public void setPharseId(int pharseId) {
		this.pharseId = pharseId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	@Override
	public String toString() {
		return "PharseGrade [pharseId=" + pharseId + ", gradeId=" + gradeId + "]";
	}
	
}
