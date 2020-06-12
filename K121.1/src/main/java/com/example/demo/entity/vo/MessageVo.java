package com.example.demo.entity.vo;
/**
 * 
 * @author ymm
 * 聊天消息提示
 */
public class MessageVo {
	private int uid;
	private int touid;
	private String nickName;//用户昵称
	private String avatarUrl;//用户头像
	private int count=0;//条数
	private String lastDate;//最新时间
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTouid() {
		return touid;
	}
	public void setTouid(int touid) {
		this.touid = touid;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	
}
