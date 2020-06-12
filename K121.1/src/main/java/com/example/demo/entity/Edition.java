package com.example.demo.entity;
/**
 * 教材版本
 * @author ymm
 *
 */
public class Edition {
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Edition [id=" + id + ", name=" + name + "]";
	}
	
	
}
