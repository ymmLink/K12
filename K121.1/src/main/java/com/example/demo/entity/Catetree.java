package com.example.demo.entity;

public class Catetree {
	private int rec;
	private int id;
	private int xdid;
	private int chidid;
	private int chapteId;
	private String title;
	private String hasChild;
	private int questionCount;//题目数
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getXdid() {
		return xdid;
	}
	public void setXdid(int xdid) {
		this.xdid = xdid;
	}
	public int getChidid() {
		return chidid;
	}
	public void setChidid(int chidid) {
		this.chidid = chidid;
	}
	public int getChapteId() {
		return chapteId;
	}
	public void setChapteId(int chapteId) {
		this.chapteId = chapteId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHasChild() {
		return hasChild;
	}
	public void setHasChild(String hasChild) {
		this.hasChild = hasChild;
	}
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	
}
