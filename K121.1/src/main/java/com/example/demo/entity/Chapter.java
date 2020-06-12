package com.example.demo.entity;

/**
 * 章节
 * @author ymm
 *
 */
public class Chapter {
	private int id;
	private int subjectId;
	private int pharseId;
	private int gradeId;
	private int editionId;
	private String chapter;
	private String unit;
	private String section;
	private int knowledgeId;
	private int chapterOrder;
	private int unitOrder;
	private int sectionOrder;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public int getEditionId() {
		return editionId;
	}
	public void setEditionId(int editionId) {
		this.editionId = editionId;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public int getKnowledgeId() {
		return knowledgeId;
	}
	public void setKnowledgeId(int knowledgeId) {
		this.knowledgeId = knowledgeId;
	}
	public int getChapterOrder() {
		return chapterOrder;
	}
	public void setChapterOrder(int chapterOrder) {
		this.chapterOrder = chapterOrder;
	}
	public int getUnitOrder() {
		return unitOrder;
	}
	public void setUnitOrder(int unitOrder) {
		this.unitOrder = unitOrder;
	}
	public int getSectionOrder() {
		return sectionOrder;
	}
	public void setSectionOrder(int sectionOrder) {
		this.sectionOrder = sectionOrder;
	}
	@Override
	public String toString() {
		return "Chapter [id=" + id + ", subjectId=" + subjectId + ", pharseId=" + pharseId + ", gradeId=" + gradeId
				+ ", editionId=" + editionId + ", chapter=" + chapter + ", unit=" + unit + ", section=" + section
				+ ", knowledgeId=" + knowledgeId + ", chapterOrder=" + chapterOrder + ", unitOrder=" + unitOrder
				+ ", sectionOrder=" + sectionOrder + "]";
	}
	
	
}
