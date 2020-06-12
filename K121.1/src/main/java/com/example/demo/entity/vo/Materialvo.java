package com.example.demo.entity.vo;

import javax.persistence.Column;

/**
 * 
 * @author ymm
 * 素材结果集
 */
public class Materialvo {
	private int uId;
	private String nickName;
	private String avatarUrl;
	private int gzState;//关注状态
	private int scState;//收藏状态
	private int printState;//打印状态
	private int zanState;//点赞状态
	private int mId;
	private Long userId;
	private String story;//素材描述
	private String label;//标签
	private String imgPath;//图片路径，根据,分割
	private int collectCount;//收藏数量
	private int printCount;//打印数量
	private int zanCount;//点赞数量
	private String publishDate;//发布时间
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAvatarUrl() {
		return avatarUrl;
	}
	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}
	public int getGzState() {
		return gzState;
	}
	public void setGzState(int gzState) {
		this.gzState = gzState;
	}
	public int getScState() {
		return scState;
	}
	public void setScState(int scState) {
		this.scState = scState;
	}
	public int getPrintState() {
		return printState;
	}
	public void setPrintState(int printState) {
		this.printState = printState;
	}
	public int getZanState() {
		return zanState;
	}
	public void setZanState(int zanState) {
		this.zanState = zanState;
	}
	public String getStory() {
		return story;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getCollectCount() {
		return collectCount;
	}
	public void setCollectCount(int collectCount) {
		this.collectCount = collectCount;
	}
	public int getPrintCount() {
		return printCount;
	}
	public void setPrintCount(int printCount) {
		this.printCount = printCount;
	}
	public int getZanCount() {
		return zanCount;
	}
	public void setZanCount(int zanCount) {
		this.zanCount = zanCount;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	@Override
	public String toString() {
		return "Materialvo [nickName=" + nickName + ", avatarUrl=" + avatarUrl + ", gzState=" + gzState + ", story="
				+ story + ", label=" + label + ", imgPath=" + imgPath + ", collectCount=" + collectCount
				+ ", printCount=" + printCount + ", zanCount=" + zanCount + ", publishDate=" + publishDate + "]";
	}
	
}
