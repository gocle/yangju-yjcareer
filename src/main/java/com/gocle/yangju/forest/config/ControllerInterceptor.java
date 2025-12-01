package com.gocle.yangju.forest.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public interface ControllerInterceptor extends HandlerInterceptor {
	boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception;
	void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception;
	void afterHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception;
}