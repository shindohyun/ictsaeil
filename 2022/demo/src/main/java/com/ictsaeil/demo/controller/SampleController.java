package com.ictsaeil.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ictsaeil.demo.dto.SampleDto;

@Controller
@RequestMapping("/sample")
public class SampleController {
	
	/*****************************************************************
	 * 페이지 요청하기
	 * ***************************************************************/
	
	/**
	 * Sample 페이지 요청하기1
	 */
	@GetMapping("")
	public String samplePage() {
		return "Sample";
	}
	
	/**
	 * Sample 페이지 요청하기2
	 * 위 'Sample 페이지 요청하기1'과 동일한 코드
	 */
//	@RequestMapping(method = RequestMethod.GET, value="")
//	public ModelAndView samplePage() {
//		ModelAndView mv = new ModelAndView("Sample");
//		return mv;
//	}
	
	/**
	 * Sample2 페이지 요청하기
	 */
	@GetMapping("/sample2")
	public String sample2Page() {
		return "Sample2";
	}
	
	/**
	 * Sample2 페이지 요청하기(데이터와 함께)
	 */
	@GetMapping("/sample2-with-data")
	public ModelAndView sample2PageWithData() {
		ModelAndView mv = new ModelAndView("Sample2");
		String data = "임시 데이터 입니다.";
		mv.addObject("DATA", data);
		return mv;
	}
	
	/**
	 * Sample2 페이지 요청하기(Object 데이터와 함께)
	 */
	@GetMapping("/sample2-with-obj")
	public ModelAndView sample2PageWithObject() {
		ModelAndView mv = new ModelAndView("Sample2");
		
		SampleDto object= new SampleDto();
		object.setStringData("객체 데이터의 문자열 속성 입니다.");
		object.setIntData(3132113);
		
		mv.addObject("OBJ_DATA", object);
		return mv;
	}
	
	/**
	 * Sample2 페이지 요청하기(Map 데이터와 함께)
	 */
	@GetMapping("/sample2-with-map")
	public ModelAndView sample2PageWithMap() {
		ModelAndView mv = new ModelAndView("Sample2");
		
		String stringData = "문자열 데이터 입니다.";
		int intData = 23213213;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("STRING_DATA", stringData);
		map.put("INT_DATA", intData);
		
		mv.addObject("MAP_DATA", map);
		return mv;
	}
	
	/**
	 * Sample2 페이지 요청하기(List 데이터와 함께)
	 */
	@GetMapping("/sample2-with-list")
	public ModelAndView sample2PageWithList() {
		ModelAndView mv = new ModelAndView("Sample2");
		
		List<String> list = new ArrayList<>();
		list.add("첫번째");
		list.add("두번째");
		list.add("세번째");
		list.add("네번째");
		
		mv.addObject("LIST_DATA", list);
		return mv;
	}
	
	/**
	 * Sample2 페이지 요청하기(Map List 데이터와 함께)
	 */
	@GetMapping("/sample2-with-map-list")
	public ModelAndView sample2PageWithMapList() {
		ModelAndView mv = new ModelAndView("Sample2");
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(int i = 0; i < 5; i++) {
			String stringData = Integer.toString(i) + "번째 문자열 데이터";
			int intData = i;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("STRING_DATA", stringData);
			map.put("INT_DATA", intData);
			
			list.add(map);
		}
		
		mv.addObject("MAP_LIST_DATA", list);
		return mv;
	}
	
	/**
	 * Sample2 페이지 요청하기(Object List 데이터와 함께)
	 */
	@GetMapping("/sample2-with-obj-list")
	public ModelAndView sample2PageWithObjectList() {
		ModelAndView mv = new ModelAndView("Sample2");
		
		List<SampleDto> list = new ArrayList<>();
		
		for(int i = 0; i < 5; i++) {
			String stringData = Integer.toString(i) + "번째 문자열 데이터";
			int intData = i;
			
			SampleDto obj = new SampleDto();
			obj.setStringData(stringData);
			obj.setIntData(intData);
			
			list.add(obj);
		}
		
		mv.addObject("OBJ_LIST_DATA", list);
		return mv;
	}
	
	@PostMapping("/sample2-with-form")
	public ModelAndView sample2PageWithForm(@RequestParam String data) {
		ModelAndView mv = new ModelAndView("Sample2");
		mv.addObject("FORM_DATA", data);
		return mv;
	}
		
	/*****************************************************************
	 * 데이터 요청하기
	 * ***************************************************************/
	@GetMapping("/res-string")
	@ResponseBody // 클래스단에서 @RestController 를 사용하면 필요없음 
	public String responseString() {
		return "문자열 응답입니다.";
	}
	
	@GetMapping("/res-int")
	@ResponseBody
	public int responseInt() {
		return 10000;
	}
	
	@GetMapping("/res-obj")
	@ResponseBody
	public SampleDto responseObject() {
		SampleDto obj = new SampleDto();
		obj.setStringData("문자열 데이터 입니다.");
		obj.setIntData(20000);
		return obj;
	}
	
	@GetMapping("/res-map")
	@ResponseBody
	public Map<String, Object> responseMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("STRING_DATA", "문자열 데이터 입니다.");
		map.put("INT_DATA", 1232323);
		return map;
	}
	
	@GetMapping("/res-list")
	@ResponseBody
	public List<String> responseList() {
		List<String> list = new ArrayList<String>();
		for(int i = 0; i < 10; i++) {
			list.add(Integer.toString(i));
		}
		return list;
	}
	
	@GetMapping("/res-obj-list")
	@ResponseBody
	public List<SampleDto> responseObjectList() {
		List<SampleDto> list = new ArrayList<SampleDto>();
		for(int i = 0; i < 10; i++) {
			SampleDto obj = new SampleDto();
			obj.setIntData(i);
			obj.setStringData(Integer.toString(i) + "번째 문자열 데이터 입니다.");
			list.add(obj);
		}
		return list;
	}
	
	@GetMapping("/res-map-list")
	@ResponseBody
	public List<Map<String, Object>> responseMapList() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(int i = 0; i < 10; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("INT_DATA", i);
			map.put("STRING_DATA", Integer.toString(i) + "번째 문자열 데이터 입니다.");
			list.add(map);
		}
		return list;
	}
	
	@GetMapping("/req-param")
	@ResponseBody 
	public String requestParam(@RequestParam String stringParam, @RequestParam int intParam) {
		return "stringParam: " + stringParam + ", intParam: " + Integer.toString(intParam);
	}
	
	@GetMapping("/req-model")
	@ResponseBody 
	public String requestModel(@ModelAttribute SampleDto model) {
		return "stringData: " + model.getStringData() + ", intData: " + Integer.toString(model.getIntData());
	}
	
	@PostMapping("/req-body")
	@ResponseBody 
	public String requestBody(@RequestBody SampleDto body) {
		return "stringData: " + body.getStringData() + ", intData: " + Integer.toString(body.getIntData());
	}
	
	@GetMapping("/req-path/{data}")
	@ResponseBody 
	public String requestPath(@PathVariable("data") String data) {
		return "data: " + data;
	}
}
