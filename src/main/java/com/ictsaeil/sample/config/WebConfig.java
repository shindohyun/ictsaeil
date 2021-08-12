package com.ictsaeil.sample.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	private static final List<String> PATH_PATTERNS = Arrays.asList("/*");
	private static final List<String> EX_PATH_PATTERNS = Arrays.asList("/api/*");
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new PageInterceptor())
			.addPathPatterns(PATH_PATTERNS)
			.excludePathPatterns(EX_PATH_PATTERNS);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}
