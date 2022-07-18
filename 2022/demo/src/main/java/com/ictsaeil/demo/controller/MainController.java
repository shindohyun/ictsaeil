package com.ictsaeil.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.demo.dto.MemberRequestDto;
import com.ictsaeil.demo.service.ProductService;
import com.ictsaeil.demo.service.UserService;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("Main");
		
		Locale.setDefault(Locale.ROOT);
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", Locale.getDefault()));
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", Locale.KOREA));
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", Locale.US));
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", Locale.CHINA));
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", Locale.JAPAN));
		
		Locale currentLocale = LocaleContextHolder.getLocale();
		System.out.println(messageSource.getMessage("name", new String[] {}, "code를 찾을 수 없습니다.", currentLocale));
		System.out.println(messageSource.getMessage("hello", new String[] {"도현", "신"}, "code를 찾을 수 없습니다.", currentLocale));
		
		return mv;
	}
	
	@GetMapping("product")
	public ModelAndView product( String name) {
		ModelAndView mv = new ModelAndView("Product");
		return mv;
	}
	
	@PostMapping("product/search")
	@ResponseBody
	public Map<String, Object> searchProduct(@RequestParam(required=false) String name) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Map<String, Object>> products = null;
		if(name == null || name.isEmpty()) {			
			products = productService.search();
		} else {
			products = productService.searchByName(name);
		}
		
		result.put("searchName", name);
		result.put("products", products);
		return result;
	}
	
	@GetMapping("product/add")
	public String addProduct() {
		return "AddProduct";
	}
	
	@PostMapping("/product/save")
	@ResponseBody
	public boolean saveProduct(@RequestParam String name, @RequestParam int price, @RequestParam int stock) {
		return productService.save(name, price, stock);
	}
	
	@GetMapping("/product/remove")
	@ResponseBody
	public boolean removeProduct(@RequestParam String idxListStr) {
		idxListStr = idxListStr.substring(1, idxListStr.length()-2);
		idxListStr = idxListStr.replace("\"", "");
		String[] toks = idxListStr.split(",");
		List<String> tempList = Arrays.asList(toks);
		List<Integer> idxList = new ArrayList<Integer>();
		
		for(String temp : tempList) {
			idxList.add(Integer.parseInt(temp));
		}
		
		return productService.remove(idxList);
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
