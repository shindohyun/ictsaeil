package com.ictsaeil.sample.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.sample.service.ProductService;

@Controller
@RequestMapping("/")
public class PageController {
	@Autowired
	ProductService productService;
	
	@GetMapping("")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("Main");
		return mv;
	}
	
	@GetMapping("signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView("Signup");
		return mv;
	}
	
	@GetMapping("signin")
	public ModelAndView signin() {
		ModelAndView mv = new ModelAndView("Signin");
		return mv;
	}
	
	@GetMapping("my-page")
	public ModelAndView myPage() {
		ModelAndView mv = new ModelAndView("MyPage");
		return mv;
	}
	
	@GetMapping("product")
	public ModelAndView product(@RequestParam String name) {
		ModelAndView mv = new ModelAndView("Product");
		
		List<Map<String, Object>> products = productService.searchByName(name); 
	    mv.addObject("products", products);
		
		return mv;
	}
}