package com.example.demo.entity;

public class Xuehanyucategory {
	private int id;
	private int pid;
	private String author;
	private String title;
	private String title_uri;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_uri() {
		return title_uri;
	}
	public void setTitle_uri(String title_uri) {
		this.title_uri = title_uri;
	}
	@Override
	public String toString() {
		return "Xuehanyucategory [id=" + id + ", pid=" + pid + ", author=" + author + ", title=" + title
				+ ", title_uri=" + title_uri + "]";
	}
	
}
