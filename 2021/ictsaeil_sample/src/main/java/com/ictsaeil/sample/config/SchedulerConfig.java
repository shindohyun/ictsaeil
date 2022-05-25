package com.ictsaeil.sample.config;

import java.util.concurrent.Executor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

@Configuration
public class SchedulerConfig implements SchedulingConfigurer, AsyncConfigurer{
	private final int THREAD_POOL_SIZE = 10;
	
	@Bean
	public ThreadPoolTaskScheduler threadPoolTaskScheduler() {
		ThreadPoolTaskScheduler threadPoolTaskScheduler = new ThreadPoolTaskScheduler();
		threadPoolTaskScheduler.setPoolSize(THREAD_POOL_SIZE);
		threadPoolTaskScheduler.setThreadNamePrefix("scheduler-task-thread");
		threadPoolTaskScheduler.initialize();
		return threadPoolTaskScheduler; 
	}
	
	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		TaskScheduler taskScheduler = this.threadPoolTaskScheduler();
		taskRegistrar.setTaskScheduler(taskScheduler);
	}

	@Override
	public Executor getAsyncExecutor() {
		Executor executor = this.threadPoolTaskScheduler();
		return executor;
	}
}
