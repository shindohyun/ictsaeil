package com.ictsaeil.sample.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	public List<Map<String, Object>> selectByNameAndAge(Map<String, Object> paramMap);
	public int selectCountById(String id);
	public int insert(Map<String, Object> paramMap);
	public Map<String, Object> selectByIdAndPassword(Map<String, Object> paramMap);
	public int updateSession(Map<String, Object> paramMap);
}
