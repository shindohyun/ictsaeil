package com.ictsaeil.sample.scheduler;

import java.time.LocalDateTime;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
//	@Scheduled(fixedRate= 2000)
//	@Async
//	public void task1() {
//		System.out.println("[" + LocalDateTime.now() + "] [" 
//				+ Thread.currentThread().getName() + "] [task1] start ==========");
//		for(int i = 0; i < 10; i++) {
//			System.out.println("[" + LocalDateTime.now() + "] [" 
//					+ Thread.currentThread().getName() + "] [task1] " + Integer.toString(i));
//			if(i == 9) break;
//			
//			try {
//				Thread.sleep(1000);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
//	@Scheduled(fixedRate = 2000)
//	public void task2() {
//		System.out.println("[" + LocalDateTime.now() + "] [" 
//				+ Thread.currentThread().getName() + "] [task2] start ==========");
//		for(int i = 0; i < 10; i++) {
//			System.out.println("[" + LocalDateTime.now() + "] [" 
//					+ Thread.currentThread().getName() + "] [task2] " + Integer.toString(i));
//			
//			if(i == 9) break;
//			
//			try {
//				Thread.sleep(1000);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//		}
//	}
}
