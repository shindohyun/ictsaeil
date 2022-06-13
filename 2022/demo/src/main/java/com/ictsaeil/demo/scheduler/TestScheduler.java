package com.ictsaeil.demo.scheduler;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TestScheduler {
	
	//@Scheduled(fixedRate = 5000)
	//@Async
	public void task11() {
		String threadName = Thread.currentThread().getName();
		
		System.out.println("[" + LocalDateTime.now() + "] [task11] " + threadName);
		
		try {
			for(int i = 0; i < 10; i++) {
				Thread.sleep(1000);
				System.out.println("[" + LocalDateTime.now() + "] [task11] "+ threadName +" working...");
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Scheduled(fixedDelay = 1000)
	public void task10(){
		System.out.println("[" + LocalDateTime.now() + "] [task10] " + Thread.currentThread().getName());
		
		try {
			for(int i = 0; i < 10; i++) {
				Thread.sleep(1000);
				System.out.println("[" + LocalDateTime.now() + "] [task10] working...");
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Scheduled(fixedDelay = 1000)
	public void task9(){
		System.out.println("[" + LocalDateTime.now() + "] [task9] " + Thread.currentThread().getName());
		
		try {
			for(int i = 0; i < 10; i++) {
				Thread.sleep(1000);
				System.out.println("[" + LocalDateTime.now() + "] [task9] working...");
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//@Scheduled(cron = "00 19 03 * * *", zone = "America/New_York")
	public void task8() {
		TimeZone tz = TimeZone.getTimeZone("America/New_York");
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.setTimeZone(tz);
		
		System.out.println("[" + df.format(date) + "] [task8]");
	}
	
	//@Scheduled(cron = "00 13 * * * *")
	public void task7() {
		System.out.println("[" + LocalDateTime.now() + "] [task7]");
	}
	
	//@Scheduled(fixedDelay = 5000, initialDelayString = "${testscheduler.initial.delay}")
	//@Scheduled(fixedDelay = 5000, initialDelayString = "5000")
	public void task6() {
		System.out.println("[" + LocalDateTime.now() + "] [task6]");
	}
	
	//@Scheduled(fixedDelay = 5000, initialDelay = 5000)
	public void task5() {
		System.out.println("[" + LocalDateTime.now() + "] [task5]");
	}
	
	//@Scheduled(fixedRateString = "${testscheduler.fixed.rate}")
	//@Scheduled(fixedRateString = "5000")
	public void task4() {
		System.out.println("[" + LocalDateTime.now() + "] [task4]");
	}
	
	//@Scheduled(fixedRate = 5000)
	public void task3() {
		System.out.println("[" + LocalDateTime.now() + "] [task3]");
	}
	
	//@Scheduled(fixedDelayString = "${testscheduler.fixed.delay}")
	//@Scheduled(fixedDelayString = "5000")
	public void task2() {
		System.out.println("[" + LocalDateTime.now() + "] [task2]");
	}
	
	//@Scheduled(fixedDelay = 5000)
	public void task1() {
		System.out.println("[" + LocalDateTime.now() + "] [task1]");
	}
	
}
