package com.example.demo.entity;
/**
 * 科目表
 * @author ymm
 *
 */
public class Subject {
	private int subjectId;
	private String subjectName;
	private String pinyin;
	private int parseId;//阶级Id
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getPinyin() {
		return pinyin;
	}
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	public int getParseId() {
		return parseId;
	}
	public void setParseId(int parseId) {
		this.parseId = parseId;
	}
	@Override
	public String toString() {
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", pinyin=" + pinyin + "]";
	}
	
}
