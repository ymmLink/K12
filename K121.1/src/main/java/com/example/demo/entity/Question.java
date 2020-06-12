package com.example.demo.entity;
/**
 * 
 * @author ymm
 * 问题表
 */
public class Question {
	private int id;
	private int bookcategoryId;
	private String categoriesId;
	private String questionId;
	private int subjectId;
	private String subject;
	private int cateId;
	private String content;
	private String parentContent;
	private String method;
	private String analyse;
	private String discuss;
	private int seq;
	private String topics;
	private String points;
	private String options;
	private String answer;
	private int viewCount;
	private int downCount;
	private String questionStatus;
	private String degree;
	private int degreeStartNumber;
	private String deletable;
	private String propertyValueList;
	private int collectState=0;//0为未收藏，1为已收藏
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookcategoryId() {
		return bookcategoryId;
	}
	public void setBookcategoryId(int bookcategoryId) {
		this.bookcategoryId = bookcategoryId;
	}
	public String getCategoriesId() {
		return categoriesId;
	}
	public void setCategoriesId(String categoriesId) {
		this.categoriesId = categoriesId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getParentContent() {
		return parentContent;
	}
	public void setParentContent(String parentContent) {
		this.parentContent = parentContent;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getAnalyse() {
		return analyse;
	}
	public void setAnalyse(String analyse) {
		this.analyse = analyse;
	}
	public String getDiscuss() {
		return discuss;
	}
	public void setDiscuss(String discuss) {
		this.discuss = discuss;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTopics() {
		return topics;
	}
	public void setTopics(String topics) {
		this.topics = topics;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getDownCount() {
		return downCount;
	}
	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}
	public String getQuestionStatus() {
		return questionStatus;
	}
	public void setQuestionStatus(String questionStatus) {
		this.questionStatus = questionStatus;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public int getDegreeStartNumber() {
		return degreeStartNumber;
	}
	public void setDegreeStartNumber(int degreeStartNumber) {
		this.degreeStartNumber = degreeStartNumber;
	}
	public String getDeletable() {
		return deletable;
	}
	public void setDeletable(String deletable) {
		this.deletable = deletable;
	}
	public String getPropertyValueList() {
		return propertyValueList;
	}
	public void setPropertyValueList(String propertyValueList) {
		this.propertyValueList = propertyValueList;
	}
	public int getCollectState() {
		return collectState;
	}
	public void setCollectState(int collectState) {
		this.collectState = collectState;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", questionId=" + questionId + ", subjectId=" + subjectId + ", subject=" + subject
				+ ", cateId=" + cateId + ", content=" + content + ", parentContent=" + parentContent + ", method="
				+ method + ", analyse=" + analyse + ", discuss=" + discuss + ", seq=" + seq + ", topics=" + topics
				+ ", points=" + points + ", options=" + options + ", answer=" + answer + ", viewCount=" + viewCount
				+ ", downCount=" + downCount + ", questionStatus=" + questionStatus + ", degree=" + degree
				+ ", degreeStartNumber=" + degreeStartNumber + ", deletable=" + deletable + ", propertyValueList="
				+ propertyValueList + "]";
	}
	
}
