package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author ymm
 *
 */
@Entity
@Table(name="admin")
public class AdminEntity {
	/*
	  	@Table - 映射表名 
		@Id - 主键 
		@GeneratedValue(strategy=GenerationType.IDENTITY) - 自动递增生成 
		@Column(name = “dict_name”,columnDefinition=”varchar(100) COMMENT ‘字典名’”) - 字段名、类型、注释 
		@UpdateTimestamp - 更新时自动更新时间 
		@CreationTimestamp - 创建时自动更新时间 
		@Version - 版本号，更新时自动加1
	 */
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="account",columnDefinition="varchar(100) COMMENT '账号'")
	private String account;
	
	@Column(name="password",columnDefinition="varchar(100) COMMENT '密码'")
	private String password;
	
	@Column(name="name",columnDefinition="varchar(100) COMMENT '名称'")
	private String name;
	
	@Column(name="phone",columnDefinition="varchar(100) COMMENT '电话'")
	private String phone;
	
	@Column(name="img",columnDefinition="varchar(150)")
	private String img;

	@Column(name="qianming")
	private String qianming;
	
	@Column(name="add_time",columnDefinition="varchar(100) COMMENT '添加时间'")
	private String addTime;
	
//	private Integer isFen=1;//0总管理员   1分管理员
//	//权限管理 0有权限  1无权限
//	private Integer isProduct=1;//商品模块权限  
//	private Integer isOrder=1;//订单模块权限
//	private Integer isCoupon=1;//优惠券模块权限
//	private Integer isMarket=1;//营销工具模块权限
//	private Integer switchover=0;//切换登入
	@Column(name="identity",columnDefinition="INT default 1")
	private int identity=0;//身份 0总管理员   1分管理员
//	@Column(name="authotity",columnDefinition="INT default 1")
//	private int authotity;//权限 权限管理 0一级  1二级只能查看
//	@Column(name="isservice",columnDefinition="INT default 0")
//	private int isservice;//是否为客服；0非，1是
	private String ip;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getQianming() {
		return qianming;
	}

	public void setQianming(String qianming) {
		this.qianming = qianming;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "AdminEntity [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", img=" + img + ", qianming=" + qianming + ", addTime=" + addTime
				+ ", identity=" + identity + ", ip=" + ip + "]";
	}
}
