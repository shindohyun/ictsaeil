package com.ictsaeil.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PageInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("[preHandle]" + request.getRequestURI());
		
		// 마이페이지 이동 요청의 경우 컨트롤러를 실행하지 않고
		// 로그인 페이지로 redirect 시킨다.
		if(request.getRequestURI().equals("/my-page")) {
			response.sendRedirect("/signin");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("[postHandle]" + request.getRequestURI());
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		System.out.println("[afterCompletion]" + request.getRequestURI());
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
