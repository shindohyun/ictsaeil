package com.ictsaeil.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictsaeil.demo.dto.SignupRequestDto;
import com.ictsaeil.demo.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public List<Map<String, Object>> searchByNameAndAge(String name, int age) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", name);
		paramMap.put("age", age);
		
		return userMapper.selectByNameAndAge(paramMap);
	}
	
	public int signup(SignupRequestDto request) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", request.getId());
		paramMap.put("PASSWORD", request.getPassword());
		paramMap.put("NAME", request.getName());
		paramMap.put("AGE", request.getAge());
		paramMap.put("EMAIL", request.getEmail());
		paramMap.put("MOBILE", request.getMobile());
		
		userMapper.insert(paramMap);
		
		if(paramMap.containsKey("IDX")) {
			return Integer.parseInt(paramMap.get("IDX").toString());
		}
		
		return 0;
	}
	
	public Map<String, Object> duplicationCheckId(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = userMapper.selectCountById(id);
		map.put("requestId", id);
		map.put("isDuplicated", count >= 1 ? true : false);
		return map;
	}
	
}
