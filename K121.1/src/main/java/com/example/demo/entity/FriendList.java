package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author ymm
 * 好友列表
 */
@Entity
@Table(name="friend_list")
public class FriendList {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int uid;
	private	int fid;
	private String fPPID=null;
	private String fnickName;
	private String favatarUrl;
	private String createDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFnickName() {
		return fnickName;
	}
	public void setFnickName(String fnickName) {
		this.fnickName = fnickName;
	}
	public String getFavatarUrl() {
		return favatarUrl;
	}
	public void setFavatarUrl(String favatarUrl) {
		this.favatarUrl = favatarUrl;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getfPPID() {
		return fPPID;
	}
	public void setfPPID(String fPPID) {
		this.fPPID = fPPID;
	}
	
}
