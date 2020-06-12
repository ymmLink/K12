package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//import com.example.demo.config.interceptor.IsmobileInterceptor;
import com.example.demo.config.interceptor.LoginInterceptor;
//import com.example.demo.config.interceptor.UserLoginInterceptor;

@Configuration
public class WebConfigurer implements WebMvcConfigurer {
//	@Autowired
//	IsmobileInterceptor ii;
	@Autowired
	LoginInterceptor loginInterceptor;
//	@Autowired
//	UserLoginInterceptor userLoginInterceptor;
	
//	 这个方法是用来配置静态资源的，比如html，js，css，等等
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	 registry.addResourceHandler("/**").addResourceLocations("/");
    	 registry.addResourceHandler("/images/**").addResourceLocations("file:/c:/images/");//图片资源配置
    	 registry.addResourceHandler("/ttf/**").addResourceLocations("file:/c:/ttf/");//字体资源配置
    	 registry.addResourceHandler("/apk/**").addResourceLocations("file:/c:/apk/");//字体资源配置
    }
 
     //这个方法用来注册拦截器，我们自己写好的拦截器需要通过这里添加注册才能生效
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//    	registry.addInterceptor(ii).addPathPatterns("/**");
//    	registry.addInterceptor(userLoginInterceptor).addPathPatterns("/before/product/cartList","/before/mine/mine","/before/product/addCart","/before/product/createOrder","/index/cart","/presonal");
    	registry.addInterceptor(loginInterceptor).addPathPatterns("/admin/**").excludePathPatterns("/admin/login","/admin/index","/admin/doLogin");
    }

}

