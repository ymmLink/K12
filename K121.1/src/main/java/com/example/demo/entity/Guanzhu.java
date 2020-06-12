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
 *	关注表
 */
@Entity
@Table(name="guanzhu")
public class Guanzhu {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id; 
	private Long userId;//用户id
	private Long guanzhuId;//关注的id
	private String startDate;//关注时间
	private String endDate;//取消关注时间
	private int state=0;//关注状态0,未关注，1已关注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getGuanzhuId() {
		return guanzhuId;
	}
	public void setGuanzhuId(Long guanzhuId) {
		this.guanzhuId = guanzhuId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Guanzhu(Long id, Long userId, Long guanzhuId, String startDate, String endDate, int state) {
		super();
		this.id = id;
		this.userId = userId;
		this.guanzhuId = guanzhuId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.state = state;
	}
	public Guanzhu() {};
	@Override
	public String toString() {
		return "Guanzhu [id=" + id + ", userId=" + userId + ", guanzhuId=" + guanzhuId + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", state=" + state + "]";
	}
	
}
