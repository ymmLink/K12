package com.example.demo.entity;

public class Xuehanyu {
	private int id;
	private String title;
	private String uri;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	@Override
	public String toString() {
		return "Xuehanyu [id=" + id + ", title=" + title + ", uri=" + uri + "]";
	}
	
}
