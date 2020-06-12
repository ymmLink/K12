package com.example.demo.entity;
/**
 * 年级
 * @author ymm
 *
 */
public class Grade {
	private int gradeId;
	private String gradeName;
	private int subjectId;
	private int parseId;
	private int editionId;
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getParseId() {
		return parseId;
	}
	public void setParseId(int parseId) {
		this.parseId = parseId;
	}
	public int getEditionId() {
		return editionId;
	}
	public void setEditionId(int editionId) {
		this.editionId = editionId;
	}
	@Override
	public String toString() {
		return "Grade [gradeId=" + gradeId + ", gradeName=" + gradeName + "]";
	}
	
}
