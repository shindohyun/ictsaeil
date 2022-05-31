package com.ictsaeil.demo.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggerAdvice {
	
	// com.ictsaeil.demo.service.ProductService 클래스에 속한 임의의 메서드를 대상으로 한다.
	@Before("execution(* com.ictsaeil.demo.service.ProductService*.*(..))")
	public void startLog(JoinPoint joinPoint) {
		System.out.println("start log");
		System.out.println("start log: " + joinPoint.getSignature());
		System.out.println("start log: " + Arrays.toString(joinPoint.getArgs()));
	}
	
}
