package com.example.demo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author ymm
 * 题目收藏
 */
@Entity
@Table(name="question_collect")
public class Questioncollect {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)//id主键自增
	private int id;
	private int uid;
	private int qid;
	private int subjectId;
	private int pharseId;
	private String createDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getPharseId() {
		return pharseId;
	}
	public void setPharseId(int pharseId) {
		this.pharseId = pharseId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Questioncollect(int id, int uid, int qid, int subjectId, int pharseId, String createDate) {
		super();
		this.id = id;
		this.uid = uid;
		this.qid = qid;
		this.subjectId = subjectId;
		this.pharseId = pharseId;
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Questioncollect [id=" + id + ", uid=" + uid + ", qid=" + qid + ", subjectId=" + subjectId
				+ ", pharseId=" + pharseId + ", createDate=" + createDate + "]";
	}
	public Questioncollect() {};
	
}
