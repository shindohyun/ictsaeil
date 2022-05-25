package com.ictsaeil.sample.payload;

/**
 * 멤버를 조회할때 사용되는 Request 객체 
 */
public class RequestMember {
	String name;
	int age;

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
}
