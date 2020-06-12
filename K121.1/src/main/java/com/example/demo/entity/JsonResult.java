package com.example.demo.entity;

import java.util.Arrays;
import java.util.List;

public class JsonResult {
	protected Object object;
	protected Object object2;
	protected Object object3;
	protected List objs;
	protected List objs2;
	protected List objs3;
	protected String res1;//存储oid
	protected String res2;
	protected String res3;
	
	protected Double allprice;
	protected String[] imgs;
	protected String[] stringvalue;
	protected String[] stringvalue1;
	
	protected Integer resInteger;
	protected Integer resInteger1;
	
	protected String zhifu1;//
	protected String zhifu2;
	protected String zhifu3;
	protected String zhifu4;
	protected String zhifu5;
	//二维码
	protected String code_url;
	
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public Object getObject2() {
		return object2;
	}
	public void setObject2(Object object2) {
		this.object2 = object2;
	}
	public Object getObject3() {
		return object3;
	}
	public void setObject3(Object object3) {
		this.object3 = object3;
	}
	public List getObjs() {
		return objs;
	}
	public void setObjs(List objs) {
		this.objs = objs;
	}
	public List getObjs2() {
		return objs2;
	}
	public void setObjs2(List objs2) {
		this.objs2 = objs2;
	}
	public List getObjs3() {
		return objs3;
	}
	public void setObjs3(List objs3) {
		this.objs3 = objs3;
	}
	public String getRes1() {
		return res1;
	}
	public void setRes1(String res1) {
		this.res1 = res1;
	}
	public String getRes2() {
		return res2;
	}
	public void setRes2(String res2) {
		this.res2 = res2;
	}
	public String getRes3() {
		return res3;
	}
	public void setRes3(String res3) {
		this.res3 = res3;
	}
	public Double getAllprice() {
		return allprice;
	}
	public void setAllprice(Double allprice) {
		this.allprice = allprice;
	}
	public String[] getImgs() {
		return imgs;
	}
	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}
	public String[] getStringvalue() {
		return stringvalue;
	}
	public void setStringvalue(String[] stringvalue) {
		this.stringvalue = stringvalue;
	}
	public String[] getStringvalue1() {
		return stringvalue1;
	}
	public void setStringvalue1(String[] stringvalue1) {
		this.stringvalue1 = stringvalue1;
	}
	public Integer getResInteger() {
		return resInteger;
	}
	public void setResInteger(Integer resInteger) {
		this.resInteger = resInteger;
	}
	public Integer getResInteger1() {
		return resInteger1;
	}
	public void setResInteger1(Integer resInteger1) {
		this.resInteger1 = resInteger1;
	}
	public String getZhifu1() {
		return zhifu1;
	}
	public void setZhifu1(String zhifu1) {
		this.zhifu1 = zhifu1;
	}
	public String getZhifu2() {
		return zhifu2;
	}
	public void setZhifu2(String zhifu2) {
		this.zhifu2 = zhifu2;
	}
	public String getZhifu3() {
		return zhifu3;
	}
	public void setZhifu3(String zhifu3) {
		this.zhifu3 = zhifu3;
	}
	public String getZhifu4() {
		return zhifu4;
	}
	public void setZhifu4(String zhifu4) {
		this.zhifu4 = zhifu4;
	}
	public String getZhifu5() {
		return zhifu5;
	}
	public void setZhifu5(String zhifu5) {
		this.zhifu5 = zhifu5;
	}
	
	public String getCode_url() {
		return code_url;
	}
	public void setCode_url(String code_url) {
		this.code_url = code_url;
	}
	@Override
	public String toString() {
		return "JsonResult [object=" + object + ", object2=" + object2 + ", object3=" + object3 + ", objs=" + objs
				+ ", objs2=" + objs2 + ", objs3=" + objs3 + ", res1=" + res1 + ", res2=" + res2 + ", res3=" + res3
				+ ", allprice=" + allprice + ", imgs=" + Arrays.toString(imgs) + ", stringvalue="
				+ Arrays.toString(stringvalue) + ", stringvalue1=" + Arrays.toString(stringvalue1) + ", resInteger="
				+ resInteger + ", resInteger1=" + resInteger1 + ", zhifu1=" + zhifu1 + ", zhifu2=" + zhifu2
				+ ", zhifu3=" + zhifu3 + ", zhifu4=" + zhifu4 + ", zhifu5=" + zhifu5 + "]";
	}
	
}
