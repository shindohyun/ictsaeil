package com.ictsaeil.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	public List<Map<String, Object>> select();
	public List<Map<String, Object>> selectByName(String name);
	public int insert(Map<String, Object> paramMap);
	public int delete(Map<String, Object> paramMap);
	
}
