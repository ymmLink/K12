package com.example.demo.entity;
/**
 * 知识点和问题关系表
 * @author ymm
 *
 */
public class QuestionKnowledgeBasicId {
	private int id;
	private int knowledgeBasicId;
	private int questionId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKnowledgeBasicId() {
		return knowledgeBasicId;
	}
	public void setKnowledgeBasicId(int knowledgeBasicId) {
		this.knowledgeBasicId = knowledgeBasicId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	@Override
	public String toString() {
		return "QuestionKnowledgeBasicId [id=" + id + ", knowledgeBasicId=" + knowledgeBasicId + ", questionId="
				+ questionId + "]";
	}
	
}
