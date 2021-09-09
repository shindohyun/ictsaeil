package com.ictsaeil.sample.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictsaeil.sample.mapper.CommentMapper;

@Service
public class CommentService {

	@Autowired
	CommentMapper commentMapper;
	
	public int insert(int productIdx, int userIdx, String comment) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("PRODUCT_IDX", productIdx);
		paramMap.put("USER_IDX", userIdx);
		paramMap.put("COMMENT", comment);
		
		return commentMapper.insert(paramMap);
	}
}
