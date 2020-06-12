package com.example.demo.entity;
/**
 * 知识点详情表
 * @author ymm
 *
 */
public class KnowledgeBasic {
	private int id;
	private String knowledgeName;
	private int subjectId;
	private int pharseId;
	private String key;
	private String descs;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKnowledgeName() {
		return knowledgeName;
	}
	public void setKnowledgeName(String knowledgeName) {
		this.knowledgeName = knowledgeName;
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	@Override
	public String toString() {
		return "KnowledgeBasic [id=" + id + ", knowledgeName=" + knowledgeName + ", subjectId=" + subjectId
				+ ", pharseId=" + pharseId + ", key=" + key + ", descs=" + descs + "]";
	}
	
}
