package com.ictsaeil.sample.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ictsaeil.sample.model.User;
import com.ictsaeil.sample.payload.RequestMember;
import com.ictsaeil.sample.payload.RequestSignup;
import com.ictsaeil.sample.service.ProductService;
import com.ictsaeil.sample.service.UserService;

@Controller
@RequestMapping("/")
public class PageController {
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("")
	public ModelAndView main(HttpSession session) {
		ModelAndView mv = new ModelAndView("Main");
		
		User user = (User)session.getAttribute("USER");
		mv.addObject("user", user);	
		
		Locale.setDefault(Locale.ROOT);
		System.out.println(messageSource.getMessage("name", new String[] {}, "name", Locale.getDefault()));
		System.out.println(messageSource.getMessage("name", new String[] {}, "이름", Locale.KOREA));
		System.out.println(messageSource.getMessage("name", new String[] {}, "name", Locale.US));
		System.out.println(messageSource.getMessage("name", new String[] {}, "名称", Locale.CHINA));
		System.out.println(messageSource.getMessage("name", new String[] {}, "名前", Locale.JAPAN));
		
		Locale currentLocale = LocaleContextHolder.getLocale();
		System.out.println(messageSource.getMessage("name", new String[] {}, "", currentLocale));
		System.out.println(messageSource.getMessage("hello", new String[] {"도현"}, "", currentLocale));
		
		return mv;
	}
	
	@GetMapping("inquiryid")
	public ModelAndView inquiryId() {
		ModelAndView mv = new ModelAndView("InquiryId");
		return mv;
	}
	
	@GetMapping("inquirypassword")
	public ModelAndView inquiryPassword() {
		ModelAndView mv = new ModelAndView("InquiryPassword");
		return mv;
	}
	
	@GetMapping("signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView("Signup");
		return mv;
	}
	
	@PostMapping("signup-result")
	public ModelAndView signupResult(@ModelAttribute RequestSignup request) {
		ModelAndView mv = new ModelAndView("SignupResult");
		
		try {
			userService.signup(request);
			mv.addObject("message", "회원가입 완료");
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", "회원가입 실패");
		}
		return mv;
	}
	
	@GetMapping("signin")
	public ModelAndView signin(@CookieValue(value="signin-cookie", required=false) Cookie cookie, HttpSession session) {
		if(cookie != null) {
			// 자동 로그인
			final String sessionId = cookie.getValue();
			User user = userService.signinBySession(sessionId);
			
			if(user != null) {
				session.setAttribute("USER", user);
				ModelAndView mv = new ModelAndView("redirect:/");
				return mv;
			}
		}
		
		ModelAndView mv = new ModelAndView("Signin");
		return mv;
	}
	
	@GetMapping("my-page")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mv = new ModelAndView("MyPage");
		
		User user = (User)session.getAttribute("USER");
		mv.addObject("user", user);	
		
		return mv;
	}
	
	@GetMapping("product")
	public ModelAndView product(HttpSession session) {
		ModelAndView mv = new ModelAndView("Product");
		
		User user = (User)session.getAttribute("USER");
		mv.addObject("user", user);	
		
		List<Map<String, Object>> products = productService.products(); 
	    mv.addObject("products", products);
		
		return mv;
	}
	
	/* 개별 속성값 파라미터 받기 - get
	@GetMapping("member")
	public ModelAndView member(@RequestParam String name, @RequestParam int age) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = userService.searchByNameAndAge(name, age); 
	    mv.addObject("member", member);
		
		return mv;
	}
	*/
	
	/* 객체 파라미터 받기 - get
	@GetMapping("member")
	public ModelAndView member(@ModelAttribute RequestMember request) {
		ModelAndView mv = new ModelAndView("Member");
		
		List<Map<String, Object>> member = 
				userService.searchByNameAndAge(request.getName(), request.getAge()); 
	    mv.addObject("member", member);
		
		return mv;
	}*/
	
	/* 개별 속성값 파라미터 받기 - post
	@PostMapping("member")
	public ModelAndView member(@RequestParam String name, @RequestParam int age) {
		ModelAndView mv = new ModelAndView("Member");

		List<Map<String, Object>> member = userService.searchByNameAndAge(name,age); 
	    mv.addObject("member", member);
		
		return mv;
	}
	*/
	
	// 객체 파라미터 받기 - post
	@PostMapping("member")
	public ModelAndView member(@ModelAttribute RequestMember request, HttpSession session) {
		ModelAndView mv = new ModelAndView("Member");
		
		User user = (User)session.getAttribute("USER");
		mv.addObject("user", user);	
		
		List<Map<String, Object>> member = 
				userService.searchByNameAndAge(request.getName(), request.getAge()); 
	    mv.addObject("member", member);
		
		return mv;
	}
}