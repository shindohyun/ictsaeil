package com.ictsaeil.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.demo.dto.MemberRequestDto;
import com.ictsaeil.demo.service.ProductService;
import com.ictsaeil.demo.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("")
	public String main() {
		return "Main";
	}
	
	@GetMapping("product")
	public ModelAndView product(@RequestParam String name) {
		ModelAndView mv = new ModelAndView("Product");
		
		List<Map<String, Object>> products = productService.searchByName(name);
		mv.addObject("products", products);
		
		return mv;
	}
	
	@GetMapping("my-page")
	public String myPage() {
		return "MyPage";
	}
	
	@GetMapping("signin")
	public String Signin() {
		return "Signin";
	}
	
	@GetMapping("signup")
	public String Signup() {
		return "Signup";
	}
	
	@GetMapping("member-by-get")
	public ModelAndView memberByGet(@RequestParam String name, @RequestParam int age) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = userService.searchByNameAndAge(name, age);
		mv.addObject("member", member);
		
		return mv;
	}

	@GetMapping("member-by-get-obj-param")
	public ModelAndView memberByGetObjParam(@ModelAttribute MemberRequestDto request) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = userService.searchByNameAndAge(request.getName(), request.getAge());
		mv.addObject("member", member);
		
		return mv;
	}
	
	@PostMapping("member-by-post")
	public ModelAndView memberByPost(@RequestParam String name, @RequestParam int age) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = userService.searchByNameAndAge(name, age);
		mv.addObject("member", member);
		
		return mv;
	}
	
	@PostMapping("member-by-post-obj-param")
	public ModelAndView memberByPostObjParam(@ModelAttribute MemberRequestDto request) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = userService.searchByNameAndAge(request.getName(), request.getAge());
		mv.addObject("member", member);
		
		return mv;
	}
}
