package com.example.demo.entity.vo;
/**
 * 
 * @author ymm
 * 申请添加好友vo
 */
public class ApplyAddFriendVo {
	private int uid;
	private int auid;//对方id
	private String applayDate;
	private String nickName;
	private String avatarUrl;
	private int state;//0申请，1通过，2拒绝
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getAuid() {
		return auid;
	}
	public void setAuid(int auid) {
		this.auid = auid;
	}
	public String getApplayDate() {
		return applayDate;
	}
	public void setApplayDate(String applayDate) {
		this.applayDate = applayDate;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
