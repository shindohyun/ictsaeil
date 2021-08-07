package com.ictsaeil.sample.controller;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ictsaeil.sample.payload.RequestUser;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	@GetMapping("users")
	public ResponseEntity getUsers() {
		System.out.println("GET /api/users");
		
		// 요청 성공
		String body = "BODY DATA: USER LIST";
		HttpStatus status = HttpStatus.OK;
		
		return new ResponseEntity<>(body, status);
	}
	
	@GetMapping("users/count")
	public void getUsersCount() {
		System.out.println("GET /api/users/count");
	}
	
	@GetMapping("users/{id}")
	public void getUser(@PathVariable("id") int id) {
		System.out.println("GET /api/users/{id}, id=" + Integer.toString(id));
	}
	
	@GetMapping("users/{id}/cart-items")
	public void getUserCartItems(@PathVariable("id") int id) {
		System.out.println("GET /api/users/{id}/cart-items, id=" + Integer.toString(id));
	}
	
	@GetMapping("user")
	public void getUser(@RequestParam String name) {
		System.out.println("GET /api/user?name=" + name);
	}
	
	@PutMapping("users/{id}")
	public void updateUser(@PathVariable("id") int id, @RequestBody RequestUser request) {
		System.out.println("PUT /api/users{id}, id=" + Integer.toString(id) + ", set name=" + request.getName());
	}
	
	@DeleteMapping("users/{id}")
	public void deleteUser(@PathVariable("id") int id) {
		System.out.println("DELETE /api/users{id}, id=" + Integer.toString(id));
	}
	
	@PostMapping("user")	
	public void createUser(@RequestBody RequestUser request) {
		System.out.println("POST /api/user, name=" + request.getName());
	}
}
