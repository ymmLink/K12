package com.example.demo.utils;

import javax.servlet.http.HttpServletRequest;

import org.weixin4j.model.sns.SnsAccessToken;

import com.example.demo.entity.AdminEntity;
import com.example.demo.entity.User;

/**
 * 保存数据到session
 * @author ymm
 *
 */
public class Request {

	/** 管理员标志 */
	public static void setAdmin(HttpServletRequest request, Object object) {
		request.getSession().setAttribute("admin", object);
	}
	public static AdminEntity getAdmin(HttpServletRequest request) {
		return (AdminEntity)request.getSession().getAttribute("admin");
	
	}
	public static void removeAdmin(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");;
	}
	public static void setUser(HttpServletRequest request, Object object) {
		request.getSession().setAttribute("user", object);
	}
	public static User getUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("user");
	}
	
	public static void setToken(HttpServletRequest request, Object object) {
		request.getSession().setAttribute("token", object);
	}
	public static SnsAccessToken getToken(HttpServletRequest request) {
		return (SnsAccessToken) request.getSession().getAttribute("token");
	}
	
	public static void setName(HttpServletRequest request,String name, String object) {
		request.getSession().setAttribute(name, object);
	}
	public static String getConfig(HttpServletRequest request,String name) {
		return (String) request.getSession().getAttribute(name);
	}
}
