package com.tenco.toyproject.repository.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CustomerRepository {
	List<Map> selectCustomer(int code);
	int insertInquiry(@Param("userId") int userId, @Param("productId") int productId, @Param("code") int code, @Param("title") String title, @Param("content") String content );
}
