package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="material")
public class Material {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(columnDefinition="varchar(120) COMMENT '素材故事'")
	private String story;//素材描述
	private String label;//标签
	@Column(name="img_path",columnDefinition="varchar(500) COMMENT '图片路径'")
	private String imgPath;//图片路径，根据,分割
	private Long userId;//用户id
	private int collectCount=0;//收藏数量
	private int printCount=0;//打印数量
	private int zanCount=0;//点赞数量
	private String publishDate;//发布时间
	private int state=1;//状态，0可显示，1不显示
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStory() {
		return story;
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
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Meterial [id=" + id + ", story=" + story + ", label=" + label + ", imgPath=" + imgPath + ", userId="
				+ userId + ", collectCount=" + collectCount + ", printCount=" + printCount + ", zanCount=" + zanCount
				+ ", publishDate=" + publishDate + ", state=" + state + "]";
	}
	
}
