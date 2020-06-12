package com.example.demo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 
 * @author zb
 *
 */
@Entity
@Table(name = "banner")
/**
 * 首页轮播实体类
 * 
 * @author xmyun
 *
 */
public class BannerEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)//id主键自增
	private Long id; // 数据库中Id

	private Long sort; // 排序

	private String image; // 轮播图

	private String url; // 轮播链接 
	
	private Integer mark=0; //判断为什么轮播   0首页PC轮播    1首页手机轮播
	
	public Integer getMark() {
		return mark;
	}

	public void setMark(Integer mark) {
		this.mark = mark;
	}

	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "BannerEntity [id=" + id + ", sort=" + sort + ", image=" + image + ", url=" + url + ", mark=" + mark
				+ "]";
	}

	
}