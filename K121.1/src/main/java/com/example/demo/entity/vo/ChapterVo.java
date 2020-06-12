package com.example.demo.entity.vo;

import java.util.List;
import java.util.Map;

import com.example.demo.entity.Chapter;
import com.example.demo.entity.Unit;

/**
 * 章节接收类
 * @author ymm
 *
 */
public class ChapterVo {
	private String chapter;
	private int chapterOrder;
	private List<Unit> uList;
	private Map<String,List<Chapter>> cMap;
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public int getChapterOrder() {
		return chapterOrder;
	}
	public void setChapterOrder(int chapterOrder) {
		this.chapterOrder = chapterOrder;
	}
	public List<Unit> getuList() {
		return uList;
	}
	public void setuList(List<Unit> uList) {
		this.uList = uList;
	}
	public Map<String, List<Chapter>> getcMap() {
		return cMap;
	}
	public void setcMap(Map<String, List<Chapter>> cMap) {
		this.cMap = cMap;
	}
	@Override
	public String toString() {
		return "ChapterVo [chapter=" + chapter + ", chapterOrder=" + chapterOrder + ", uList=" + uList + ", cList="
				+ cMap + "]";
	}
}
