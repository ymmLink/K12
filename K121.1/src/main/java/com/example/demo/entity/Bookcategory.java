package com.example.demo.entity;
/**
 * 
 * @author ymm
 * 书本单元
 */
public class Bookcategory {
	private int id;
	private int dataId;
	private String bookId;
	private String name;
	private int bookVersionId;
	private String versionName;
	private int gradeId;
	private int termId;
	private int subjectId;
	private String bookCategoriesId;
	private String bcName;
	private String bcbookId;
	private int bcseq;
	private String bcparentId;
	private String categoriesId;
	private String cName;
	private String bookCategoryDesc;
	private String cBookId;
	private int seq;
	private String parentId;
	private String categories;
	private String points;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
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
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getBookCategoriesId() {
		return bookCategoriesId;
	}
	public void setBookCategoriesId(String bookCategoriesId) {
		this.bookCategoriesId = bookCategoriesId;
	}
	public String getBcName() {
		return bcName;
	}
	public void setBcName(String bcName) {
		this.bcName = bcName;
	}
	public String getBcbookId() {
		return bcbookId;
	}
	public void setBcbookId(String bcbookId) {
		this.bcbookId = bcbookId;
	}
	public int getBcseq() {
		return bcseq;
	}
	public void setBcseq(int bcseq) {
		this.bcseq = bcseq;
	}
	public String getBcparentId() {
		return bcparentId;
	}
	public void setBcparentId(String bcparentId) {
		this.bcparentId = bcparentId;
	}
	public String getCategoriesId() {
		return categoriesId;
	}
	public void setCategoriesId(String categoriesId) {
		this.categoriesId = categoriesId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getBookCategoryDesc() {
		return bookCategoryDesc;
	}
	public void setBookCategoryDesc(String bookCategoryDesc) {
		this.bookCategoryDesc = bookCategoryDesc;
	}
	public String getcBookId() {
		return cBookId;
	}
	public void setcBookId(String cBookId) {
		this.cBookId = cBookId;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	@Override
	public String toString() {
		return "Bookcategory [id=" + id + ", dataId=" + dataId + ", bookId=" + bookId + ", name=" + name
				+ ", bookVersionId=" + bookVersionId + ", versionName=" + versionName + ", gradeId=" + gradeId
				+ ", termId=" + termId + ", subjectId=" + subjectId + ", bookCategoriesId=" + bookCategoriesId
				+ ", bcName=" + bcName + ", bcbookId=" + bcbookId + ", bcseq=" + bcseq + ", bcparentId=" + bcparentId
				+ ", categoriesId=" + categoriesId + ", cName=" + cName + ", bookCategoryDesc=" + bookCategoryDesc
				+ ", cBookId=" + cBookId + ", seq=" + seq + ", parentId=" + parentId + ", categories=" + categories
				+ ", points=" + points + "]";
	}
	
}
