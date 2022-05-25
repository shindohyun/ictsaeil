package com.ictsaeil.sample.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.sample.model.User;

public class PageInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("[preHandle]" + request.getRequestURI());
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("USER");
		String uri = request.getRequestURI();
		
		// 로그인 페이지 요청 시 현재 세션에 사용자 정보를 검사
		// 사용자 정보가 존재한다면 메인 페이지로 이동시킨다.
		if(uri.equals("/signin")) {
			if(user != null) {
				response.sendRedirect("/");	
				return false;
			}
		}
		// 로그인 페이지를 제외한 페이지 요청 시 현재 세션에 사용자 정보를 검사
		// 사용자 정보가 없다면 로그인 페이지로 이동시킨다.
		// 예외: 회원가입 페이지, 아이디 찾기, 비밀번호 찾기
		else {
			if(user == null && 
				(!uri.equals("/signup") && !uri.equals("/inquiryid") && !uri.equals("/inquirypassword"))) {
				response.sendRedirect("/signin");	
				return false;
			}
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
		System.out.println("[afterCompletion]"+request.getRequestURI());
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
