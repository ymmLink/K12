package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="feed_back")
public class FeedBack {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int type;//0问题反馈，1体验建议
	private String conTel;
	private int proModel;
	private String inText;
	private String imgPath;
	private int uid;
	private String createDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getConTel() {
		return conTel;
	}
	public void setConTel(String conTel) {
		this.conTel = conTel;
	}
	public int getProModel() {
		return proModel;
	}
	public void setProModel(int proModel) {
		this.proModel = proModel;
	}
	public String getInText() {
		return inText;
	}
	public void setInText(String inText) {
		this.inText = inText;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "FeedBack [id=" + id + ", type=" + type + ", conTel=" + conTel + ", proModel=" + proModel + ", inText="
				+ inText + ", imgPath=" + imgPath + ", uid=" + uid + "]";
	}
	
}
