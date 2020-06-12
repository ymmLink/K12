package com.example.demo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 
 * @author ymm
 * 书本类
 */
//@Entity
//@Table(name="books")
public class Books {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)//id主键自增
	private int id; // 数据库中Id
	private String jcId;
	private int bookVersionId;
	private String versionName;
	private int subjectId;
	private int booksId;
	private String bookId;
	private String name;
	private int gradeId;
	private int termId;
	private String bookCategories;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJcId() {
		return jcId;
	}
	public void setJcId(String jcId) {
		this.jcId = jcId;
	}
	public int getBookVersionId() {
		return bookVersionId;
	}
	public void setBookVersionId(int bookVersionId) {
		this.bookVersionId = bookVersionId;
	}
	public String getVersionName() {
		return versionName;
	}
	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getBooksId() {
		return booksId;
	}
	public void setBooksId(int booksId) {
		this.booksId = booksId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public int getTermId() {
		return termId;
	}
	public void setTermId(int termId) {
		this.termId = termId;
	}
	public String getBookCategories() {
		return bookCategories;
	}
	public void setBookCategories(String bookCategories) {
		this.bookCategories = bookCategories;
	}
	@Override
	public String toString() {
		return "Books [id=" + id + ", jcId=" + jcId + ", bookVersionId=" + bookVersionId + ", versionName="
				+ versionName + ", subjectId=" + subjectId + ", booksId=" + booksId + ", bookId=" + bookId + ", name="
				+ name + ", gradeId=" + gradeId + ", termId=" + termId + ", bookCategories=" + bookCategories + "]";
	}
	
}
