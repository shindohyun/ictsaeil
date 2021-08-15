package com.ictsaeil.sample.config;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.apache.tiles.locale.LocaleResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import com.ictsaeil.sample.interceptor.PageInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	private static final List<String> PATH_PATTERNS = Arrays.asList("/*");
	private static final List<String> EX_PATH_PATTERNS = Arrays.asList("/api/*");
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new PageInterceptor())
			.addPathPatterns(PATH_PATTERNS)
			.excludePathPatterns(EX_PATH_PATTERNS);
		
		registry.addInterceptor(localeChangeInterceptor());
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	@Bean
	public CookieLocaleResolver localeResolver() {
		CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
		cookieLocaleResolver.setDefaultLocale(Locale.KOREA);
		cookieLocaleResolver.setCookieName("locale");
		return cookieLocaleResolver;
	}
	
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("locale");
		return localeChangeInterceptor;
	}
}
