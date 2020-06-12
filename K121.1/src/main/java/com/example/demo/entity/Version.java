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
 * 版本号
 */
@Entity
@Table(name="version")
public class Version {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String versionNow;
	private String versionNext;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVersionNow() {
		return versionNow;
	}
	public void setVersionNow(String versionNow) {
		this.versionNow = versionNow;
	}
	public String getVersionNext() {
		return versionNext;
	}
	public void setVersionNext(String versionNext) {
		this.versionNext = versionNext;
	}
	
}
