package com.ictsaeil.demo.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ictsaeil.demo.filter.FirstFilter;
import com.ictsaeil.demo.filter.SecondFilter;
import com.ictsaeil.demo.interceptor.PageInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	private static final List<String> PATH_PTTERNS = Arrays.asList("/*");
	private static final List<String> EX_PATH_PATTERNS = Arrays.asList("/api/*");

	@Bean
	public FilterRegistrationBean<FirstFilter> firstFilterRegistrationBean() {
		FilterRegistrationBean<FirstFilter> filterRegistrationBean = new FilterRegistrationBean<FirstFilter>(new FirstFilter());
		filterRegistrationBean.setOrder(1);
		filterRegistrationBean.setUrlPatterns(EX_PATH_PATTERNS);
		
		return filterRegistrationBean;
	}
	
	@Bean
	public FilterRegistrationBean<SecondFilter> secondFilterRegistrationBean() {
		FilterRegistrationBean<SecondFilter> filterRegistrationBean = new FilterRegistrationBean<SecondFilter>(new SecondFilter());
		filterRegistrationBean.setOrder(2);
		filterRegistrationBean.setUrlPatterns(EX_PATH_PATTERNS);
		
		return filterRegistrationBean;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new PageInterceptor())
		.addPathPatterns(PATH_PTTERNS)
		.excludePathPatterns(EX_PATH_PATTERNS);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
