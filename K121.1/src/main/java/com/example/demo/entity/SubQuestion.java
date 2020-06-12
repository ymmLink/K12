package com.example.demo.entity;
/**
 * 子题表
 * @author ymm
 *
 */
public class SubQuestion {
	private int id;
	private String title;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private int pid;
	private String answer1;
	private String answer2;
	private String parse;
	private String qtpye;
	private float diff;
	private int subjectId;
	private int gradeId;
	private String knowledges;
	private String source;
	private String tiid;
	private String ptiid;
	private int fromsite;
	private String answerJson;
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTiid() {
		return tiid;
	}
	public void setTiid(String tiid) {
		this.tiid = tiid;
	}
	public String getPtiid() {
		return ptiid;
	}
	public void setPtiid(String ptiid) {
		this.ptiid = ptiid;
	}
	public int getFromsite() {
		return fromsite;
	}
	public void setFromsite(int fromsite) {
		this.fromsite = fromsite;
	}
	public String getAnswerJson() {
		return answerJson;
	}
	public void setAnswerJson(String answerJson) {
		this.answerJson = answerJson;
	}
	@Override
	public String toString() {
		return "SubQuestion [id=" + id + ", title=" + title + ", optionA=" + optionA + ", optionB=" + optionB
				+ ", optionC=" + optionC + ", optionD=" + optionD + ", pid=" + pid + ", answer1=" + answer1
				+ ", answer2=" + answer2 + ", parse=" + parse + ", qtpye=" + qtpye + ", diff=" + diff + ", subjectId="
				+ subjectId + ", gradeId=" + gradeId + ", knowledges=" + knowledges + ", source=" + source + ", tiid="
				+ tiid + ", ptiid=" + ptiid + ", fromsite=" + fromsite + ", answerJson=" + answerJson + "]";
	}	
}
