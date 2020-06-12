package com.example.demo.entity;

public class Xuehanyudetail {
	private int id;
	private int pid;
	private String author;
	private String annotation;
	private String century;
	private String contson;
	private String title;
	private String translation;
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
	public String getAnnotation() {
		return annotation;
	}
	public void setAnnotation(String annotation) {
		this.annotation = annotation;
	}
	public String getCentury() {
		return century;
	}
	public void setCentury(String century) {
		this.century = century;
	}
	public String getContson() {
		return contson;
	}
	public void setContson(String contson) {
		this.contson = contson;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTranslation() {
		return translation;
	}
	public void setTranslation(String translation) {
		this.translation = translation;
	}
	@Override
	public String toString() {
		return "Xuehanyudetail [id=" + id + ", pid=" + pid + ", author=" + author + ", annotation=" + annotation
				+ ", century=" + century + ", contson=" + contson + ", title=" + title + ", translation=" + translation
				+ "]";
	}
}
