package com.ictsaeil.sample.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	public List<Map<String, Object>> selectByName(String name); 
}
