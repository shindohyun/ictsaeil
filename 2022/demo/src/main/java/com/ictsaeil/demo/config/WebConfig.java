package com.ictsaeil.demo.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ictsaeil.demo.interceptor.PageInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	private static final List<String> PATH_PTTERNS = Arrays.asList("/*");
	private static final List<String> EX_PATH_PATTERNS = Arrays.asList("/api/*");

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new PageInterceptor())
		.addPathPatterns(PATH_PTTERNS)
		.excludePathPatterns(EX_PATH_PATTERNS);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
