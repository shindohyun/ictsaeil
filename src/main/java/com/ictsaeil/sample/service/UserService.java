package com.ictsaeil.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictsaeil.sample.mapper.UserMapper;
import com.ictsaeil.sample.payload.RequestSignup;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	
	public List<Map<String, Object>> searchByNameAndAge(String name, int age){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("NAME", name);
		paramMap.put("AGE", age);
		
		return userMapper.selectByNameAndAge(paramMap);
	}
	
	public Map<String, Object> duplicationCheckId(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = userMapper.selectCountById(id);
		map.put("requestId", id);
		map.put("isDuplicated", count >= 1 ? true : false);
		return map;
	}
	
	public int signup(RequestSignup request) {
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
}
