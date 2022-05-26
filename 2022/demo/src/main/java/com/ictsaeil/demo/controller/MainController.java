package com.ictsaeil.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.demo.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/")
	public String main() {
		return "Main";
	}
	
	@GetMapping("/product")
	public ModelAndView product(@RequestParam String name) {
		ModelAndView mv = new ModelAndView("Product");
		
		List<Map<String, Object>> products = productService.searchByName(name);
		mv.addObject("products", products);
		
		return mv;
	}
	
	@GetMapping("/my-page")
	public String myPage() {
		return "MyPage";
	}
	
	@GetMapping("/signin")
	public String Signin() {
		return "Signin";
	}
	
	@GetMapping("/signup")
	public String Signup() {
		return "Signup";
	}
	
}
