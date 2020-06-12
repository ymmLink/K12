//package com.example.demo.config.interceptor;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URLEncoder;
//import java.util.Random;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.alibaba.fastjson.JSONObject;
//import com.example.demo.dao.idao.UserDao;
//import com.example.demo.entity.AdminEntity;
//import com.example.demo.entity.JsonResult;
//import com.example.demo.entity.User;
//import com.example.demo.entity.WxWebLogin;
//import com.example.demo.utils.MyUtil;
//import com.example.demo.utils.Request;
//import com.example.demo.utils.WXWebUtil;
//
//@Component
//public class UserLoginInterceptor implements HandlerInterceptor{
//	@Autowired
//	private UserDao ud;
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
//		HttpSession session=request.getSession();	
//		User user=(User)session.getAttribute("user");
//		//判断设备
//		boolean isFromMobile = session.getAttribute("ua").equals("mobile");
//
//		String code=(String)request.getAttribute("code");
//		String state=(String)request.getAttribute("state");
//		//System.out.println("code="+code+";state:"+state);
//		//String requestUrl=request.getRequestURL().toString();
//		//System.out.println(requestUrl);
//		if(user==null){
//			if(!MyUtil.isnull(code)){
//				user=this.getUser(request, code, state);
//				session.setAttribute("user", user);
//				return true;
//			}else{
//				if(isFromMobile){
//					String redirectUrl=this.MobileRequestLogin(request);
//					response.sendRedirect(redirectUrl);
//					return false;
//				}else{
//					String redirectUrl=this.PCRequestLogin(request);
//					response.sendRedirect(redirectUrl);
//					return false;
//				}
//			}
//		}else{
//			return true;
//		}
//		
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
//	//手机端登入
//	public String MobileRequestLogin(HttpServletRequest request){
//		String appid=WxWebLogin.OfficialAppID;
//		String requestUrl=request.getRequestURL().toString();
//		System.out.println(requestUrl);
//		String redirectUrl="";
//		try {
//			redirectUrl = URLEncoder.encode(requestUrl, "GBK");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
////		System.out.println(redirectUrl);
//		String responseType="code";
//		String scope="snsapi_userinfo";
//		Random r=new Random();
//	    int state=r.nextInt(100);
//	    HttpSession session=request.getSession();
//	    session.setAttribute("state", state+"");
//		return "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+redirectUrl+
//				"&response_type="+responseType+"&scope="+scope+"&state="+state+"#wechat_redirect";
//	}
//	//PC端登入
//	public String PCRequestLogin(HttpServletRequest request){
//		String appid=WxWebLogin.getAppID();
//		String requestUrl=request.getRequestURL().toString();
//		String redirectUrl="";
//		try {
//			redirectUrl = URLEncoder.encode(requestUrl, "GBK");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
////		System.out.println(redirectUrl);
//		String responseType="code";
//		String scope="snsapi_login";
//		Random r=new Random();
//	    int state=r.nextInt(100);
//	    HttpSession session=request.getSession();
//	    session.setAttribute("state", state+"");
//		return "https://open.weixin.qq.com/connect/qrconnect?appid="+appid+"&redirect_uri="+redirectUrl+
//				"&response_type="+responseType+"&scope="+scope+"&state="+state+"#wechat_redirect";
//	}
//	//通过code得到user
//	public User getUser(HttpServletRequest request,String code,String state){
//		HttpSession session=request.getSession();
//		//判断设备
//		boolean isFromMobile = session.getAttribute("ua").equals("mobile");
//		String sessionState=(String)session.getAttribute("state");
//		User user=new User();
//		if(sessionState.equals(state)){
//			if(isFromMobile){
//				JSONObject result=WXWebUtil.getAccessTokenResult2(code);
//				System.out.println("result"+result);
//				String accessToken=result.getString("access_token");
//				String openId=result.getString("openid");
//				JSONObject userinfoResult=WXWebUtil.getUserInfoResult2(accessToken, openId);
//				System.out.println("userinfoResult"+userinfoResult);
//				String unionId = result.getString("unionid");
//				String nickname=userinfoResult.getString("nickname");
//				String headimgurl=userinfoResult.getString("headimgurl");
//				user=ud.findByUnionId(unionId);
//				if(user==null){
//					User newuser=new User();
//					newuser.setAvatarUrl(headimgurl);
//					newuser.setNickName(nickname);
//					newuser.setUnionId(unionId);
//					newuser.setOfficialOpenId(openId);
//					user=ud.save(newuser);
//				}else{
//					user.setOfficialOpenId(openId);
//					user=ud.save(user);
//				}
//			}else{
//				JSONObject result=WXWebUtil.getAccessTokenResult(code);
//				System.out.println("result"+result);
//				String accessToken=result.getString("access_token");
//				String openId=result.getString("openid");
//				JSONObject userinfoResult=WXWebUtil.getUserInfoResult(accessToken, openId);
//				System.out.println("userinfoResult"+userinfoResult);
//				String unionId = result.getString("unionid");
//				String nickname=userinfoResult.getString("nickname");
//				String headimgurl=userinfoResult.getString("headimgurl");
//				user=ud.findByUnionId(unionId);
//				if(user==null){
//					User newuser=new User();
//					newuser.setAvatarUrl(headimgurl);
//					newuser.setNickName(nickname);
//					newuser.setUnionId(unionId);
//					newuser.setWebOpenId(openId);
//					user=ud.save(newuser);
//				}else{
//					user.setWebOpenId(openId);
//					user=ud.save(user);
//				}
//			}
//		}else{
//			System.out.println("状态码不符");
//		}
//		return user;
//	}
//}
