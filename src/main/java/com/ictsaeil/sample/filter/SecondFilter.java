package com.ictsaeil.sample.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("[Second Filter] init");
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void destroy() {
		System.out.println("[Second Filter] destroy");
		Filter.super.destroy();
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		System.out.println("[Second Filter] Request URI: " + httpRequest.getRequestURI());
		
		System.out.println("[Second Filter] ===== before servlet");
		chain.doFilter(httpRequest, httpResponse); // 다음 필터로 요청 전달, 다음 필터가 없는 경우 서블릿 호출
		System.out.println("[Second Filter] ===== after servlet");
		
		System.out.println("[Second Filter] Response code: " + Integer.toString(httpResponse.getStatus()));
	}
}
