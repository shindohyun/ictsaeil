package com.ictsaeil.sample.payload;

public class RequestSignin {
	String username;
	String password;
	boolean keep;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isKeep() {
		return keep;
	}
	public void setKeep(boolean keep) {
		this.keep = keep;
	}
}
