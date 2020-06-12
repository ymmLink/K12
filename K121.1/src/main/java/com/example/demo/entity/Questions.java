package com.example.demo.entity;
/**
 * 问题表
 * @author ymm
 *
 */
public class Questions {
	private int id;
	private String title;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String optionE;
	private String answer1;
	private String answer2;
	private String parse;
	private String qtpye;
	private float diff;
	private String md5;
	private int subjectId;
	private int gradeId;
	private String knowledges;
	private String area;
	private int year;
	private String paperTpye;//试题类型：1，月考；2，模拟考；3，中考；4，高考；5，学业考试；6，其他
	private String source;
	private String fromSite;
	private int isSub;//是否存在图片水印
	private int isNormal;//是否常规题，如果选择题无法正常提取标准答案或者选项，有小题的答题无法正常提取小题，则isNormal为0，否则为1
	private int isKonw;//是否匹配章节知识点，1匹配，0不匹配
	private String tiid;
	private int similarity;
	private int isunique;//试题在题库中的相似度，相似度越高，质量越低
	private String md52;
	private int collectState=0;//收藏状态，0为收藏，1已收藏
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getOptionE() {
		return optionE;
	}
	public void setOptionE(String optionE) {
		this.optionE = optionE;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getParse() {
		return parse;
	}
	public void setParse(String parse) {
		this.parse = parse;
	}
	public String getQtpye() {
		return qtpye;
	}
	public void setQtpye(String qtpye) {
		this.qtpye = qtpye;
	}
	public float getDiff() {
		return diff;
	}
	public void setDiff(float diff) {
		this.diff = diff;
	}
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getKnowledges() {
		return knowledges;
	}
	public void setKnowledges(String knowledges) {
		this.knowledges = knowledges;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getPaperTpye() {
		return paperTpye;
	}
	public void setPaperTpye(String paperTpye) {
		this.paperTpye = paperTpye;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getFromSite() {
		return fromSite;
	}
	public void setFromSite(String fromSite) {
		this.fromSite = fromSite;
	}
	public int getIsSub() {
		return isSub;
	}
	public void setIsSub(int isSub) {
		this.isSub = isSub;
	}
	public int getIsNormal() {
		return isNormal;
	}
	public void setIsNormal(int isNormal) {
		this.isNormal = isNormal;
	}
	public int getIsKonw() {
		return isKonw;
	}
	public void setIsKonw(int isKonw) {
		this.isKonw = isKonw;
	}
	public String getTiid() {
		return tiid;
	}
	public void setTiid(String tiid) {
		this.tiid = tiid;
	}
	public int getSimilarity() {
		return similarity;
	}
	public void setSimilarity(int similarity) {
		this.similarity = similarity;
	}
	public int getIsunique() {
		return isunique;
	}
	public void setIsunique(int isunique) {
		this.isunique = isunique;
	}
	public String getMd52() {
		return md52;
	}
	public void setMd52(String md52) {
		this.md52 = md52;
	}
	public int getCollectState() {
		return collectState;
	}
	public void setCollectState(int collectState) {
		this.collectState = collectState;
	}
	@Override
	public String toString() {
		return "Questions [id=" + id + ", title=" + title + ", optionA=" + optionA + ", optionB=" + optionB
				+ ", optionC=" + optionC + ", optionD=" + optionD + ", optionE=" + optionE + ", answer1=" + answer1
				+ ", answer2=" + answer2 + ", parse=" + parse + ", qtpye=" + qtpye + ", diff=" + diff + ", md5=" + md5
				+ ", subjectId=" + subjectId + ", gradeId=" + gradeId + ", knowledges=" + knowledges + ", area=" + area
				+ ", year=" + year + ", paperTpye=" + paperTpye + ", source=" + source + ", fromSite=" + fromSite
				+ ", isSub=" + isSub + ", isNormal=" + isNormal + ", isKonw=" + isKonw + ", tiid=" + tiid
				+ ", Similarity=" + similarity + ", isunique=" + isunique + ", md52=" + md52 + "]";
	}
	
	
}
