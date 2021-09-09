package com.ictsaeil.sample.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	public int insert(Map<String, Object> paramMap);
}
