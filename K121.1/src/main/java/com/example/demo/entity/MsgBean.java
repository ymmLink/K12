package com.example.demo.entity;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

public class MsgBean {
	 //状态码  100=success  200=fail
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private String reg1;//返回变量1
    private Map<String, Object> extend = new HashMap<String, Object>();
    public static MsgBean success(){
        MsgBean result = new MsgBean();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    
    public static MsgBean fail(){
        MsgBean result = new MsgBean();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    public MsgBean add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }
    
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

	public String getReg1() {
		return reg1;
	}

	public void setReg1(String reg1) {
		this.reg1 = reg1;
	}
    
}
