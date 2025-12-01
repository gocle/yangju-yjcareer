package com.gocle.yangju.forest.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;

public class ControllerInterceptorAdaptor implements ControllerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
	}

	public void afterHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}

	/**
	 * handler에서 interceptor 어노테이션을 찾아 element들 반환한다.
	 * @param handler
	 * @return ControllerInterceptor
	 */
	public ControllerInterceptor getInterceptor(Object handler) {
		HandlerMethod method = (HandlerMethod)handler;
		Interceptor interceptor = method.getMethodAnnotation(Interceptor.class);
		if( null == interceptor ) {
			interceptor = AnnotationUtils.findAnnotation(method.getBeanType(), Interceptor.class);
		}
		ControllerInterceptor controllerInterceptor = new ControllerInterceptorAdaptor();
		return controllerInterceptor;
	}
}