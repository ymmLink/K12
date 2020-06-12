//package com.example.demo.config.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.example.demo.entity.AdminEntity;
//import com.example.demo.utils.CheckMobileUtil;
//import com.example.demo.utils.Request;
//
//@Component
//public class IsmobileInterceptor implements HandlerInterceptor{
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		//判断登入设备
//				HttpSession session=request.getSession();
//				boolean isFromMobile = false;
//				// 检查是否已经记录访问方式（移动端或pc端）
//				if (null == session.getAttribute("ua")) {
//					try {
//						// 获取ua，用来判断是否为移动端访问
//						String userAgent = request.getHeader("USER-AGENT").toLowerCase();
//						if (null == userAgent) {
//							userAgent = "";
//						}
//						isFromMobile = CheckMobileUtil.check(userAgent);
//						// 判断是否为移动端访问
//						if (isFromMobile) {
//							System.out.println("手机端访问");
//							session.setAttribute("ua", "mobile");
//
//						} else {
//							System.out.println("pc端访问");
//							session.setAttribute("ua", "pc");
//
//						}
//					} catch (Exception e) {
//					}
//				} else {
//					isFromMobile = session.getAttribute("ua").equals("mobile");
//				}
//				return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		
//	}
//}
