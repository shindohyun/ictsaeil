package com.ictsaeil.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictsaeil.sample.mapper.UserMapper;
import com.ictsaeil.sample.model.User;
import com.ictsaeil.sample.payload.RequestSignin;
import com.ictsaeil.sample.payload.RequestSignup;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	
	public User signin(String username, String password) {
		User user = new User();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", username);
		paramMap.put("PASSWORD", password);
		
		Map<String, Object> map = userMapper.selectByIdAndPassword(paramMap);
		if(map != null) {
			if(map.containsKey("IDX")) {
				user.setIdx(Integer.parseInt(map.get("IDX").toString()));	
			}
			
			if(map.containsKey("ID")){
				user.setId(map.get("ID").toString());
			}
			
			if(map.containsKey("PASSWORD")) {
				user.setPassword(map.get("PASSWORD").toString());
			}
			
			if(map.containsKey("NAME")) {
				user.setName(map.get("NAME").toString());
			}
			
			if(map.containsKey("AGE")) {
				user.setAge(Integer.parseInt(map.get("AGE").toString()));
			}
			
			if(map.containsKey("EMAIL")) {
				user.setEmail(map.get("EMAIL").toString());
			}
			
			if(map.containsKey("MOBILE")) {
				user.setMobile(map.get("MOBILE").toString());
			}
		}
		
		return user;
	}
	
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
