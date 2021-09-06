package com.ictsaeil.sample.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.ictsaeil.sample.model.User;
import com.ictsaeil.sample.payload.RequestSignin;
import com.ictsaeil.sample.payload.RequestUser;
import com.ictsaeil.sample.service.UserService;

@RestController
@RequestMapping("/api")
public class ApiController {
	private final Logger logger = LogManager.getLogger(ApiController.class);
	
	@Autowired
	UserService userService;
	
	@PostMapping("/signin")
	public ResponseEntity signin(@RequestBody RequestSignin request, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		try {
			User user = userService.signin(request.getUsername(), request.getPassword());
			
			if(user == null) {
				return new ResponseEntity<>("아이디 또는 비밀번호를 확인해주세요.", HttpStatus.NOT_FOUND);
			}
			else {
				HttpSession session = httpServletRequest.getSession(true);
				session.setAttribute("USER", user);
				
				if(request.isKeep()) {
					final int INTERVAL = 60; // 세션 유지 기간(초)
					final String SESSION_ID = session.getId();
					
					// 로그인 상태 유지를 위해 현재 세션 아이디를 쿠키로 저장한다.
					Cookie cookie = new Cookie("signin-cookie", SESSION_ID);
					cookie.setMaxAge(INTERVAL);
					httpServletResponse.addCookie(cookie);
					
					// 사용자 세션 정보를 업데이트 한다.
					userService.updateSession(user.getIdx(), SESSION_ID, INTERVAL);
				}
				
				return new ResponseEntity<>(HttpStatus.OK);	
			}
		}catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping("/signout")
	public ResponseEntity signout(HttpSession session) {
		try {
			session.setAttribute("USER", null);
			return new ResponseEntity<>(HttpStatus.OK);
		}catch(Exception e) {
			logger.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("duplication-check/{id}")
	public ResponseEntity duplicationCheckId(@PathVariable("id") String id) {
		try {
			Map<String, Object> body = userService.duplicationCheckId(id);
			return new ResponseEntity<>(body, HttpStatus.OK);
		}catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
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
