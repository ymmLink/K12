package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="K12Config")
public class K12Config {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private boolean isShowEdu;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isShowEdu() {
		return isShowEdu;
	}
	public void setShowEdu(boolean isShowEdu) {
		this.isShowEdu = isShowEdu;
	}
	
}
