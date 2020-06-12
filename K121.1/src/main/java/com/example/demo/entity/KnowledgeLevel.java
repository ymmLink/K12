package com.example.demo.entity;
/**
 * 知识点树表
 * @author ymm
 *
 */
public class KnowledgeLevel {
	private int subjectId;
	private int pharseId;
	private int knowledge_level_1;
	private int knowledge_level_2;
	private int knowledge_level_3;
	private int knowledgeId;
	private String level1;
	private String level2;
	private String level3;
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
	public int getKnowledge_level_1() {
		return knowledge_level_1;
	}
	public void setKnowledge_level_1(int knowledge_level_1) {
		this.knowledge_level_1 = knowledge_level_1;
	}
	public int getKnowledge_level_2() {
		return knowledge_level_2;
	}
	public void setKnowledge_level_2(int knowledge_level_2) {
		this.knowledge_level_2 = knowledge_level_2;
	}
	public int getKnowledge_level_3() {
		return knowledge_level_3;
	}
	public void setKnowledge_level_3(int knowledge_level_3) {
		this.knowledge_level_3 = knowledge_level_3;
	}
	public int getKnowledgeId() {
		return knowledgeId;
	}
	public void setKnowledgeId(int knowledgeId) {
		this.knowledgeId = knowledgeId;
	}
	public String getLevel1() {
		return level1;
	}
	public void setLevel1(String level1) {
		this.level1 = level1;
	}
	public String getLevel2() {
		return level2;
	}
	public void setLevel2(String level2) {
		this.level2 = level2;
	}
	public String getLevel3() {
		return level3;
	}
	public void setLevel3(String level3) {
		this.level3 = level3;
	}
	@Override
	public String toString() {
		return "KnowledgeLevel [subjectId=" + subjectId + ", pharseId=" + pharseId + ", knowledge_level_1="
				+ knowledge_level_1 + ", knowledge_level_2=" + knowledge_level_2 + ", knowledge_level_3="
				+ knowledge_level_3 + ", knowledgeId=" + knowledgeId + ", level1=" + level1 + ", level2=" + level2
				+ ", level3=" + level3 + "]";
	}
	
}
