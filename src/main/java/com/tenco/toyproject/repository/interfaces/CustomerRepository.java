package com.tenco.toyproject.repository.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.toyproject.vo.PageVO;

@Mapper
public interface CustomerRepository {
	List<Map<String, Object>> selectCustomer(@Param("code") int code, @Param("start") int start);

	List<Map<String, Object>> selectCustomerById(@Param("code") int code, @Param("start") int start, @Param("id") int id);

	int insertInquiry(@Param("userId") int userId, @Param("productId") int productId, @Param("code") int code, @Param("title") String title, @Param("content") String content, @Param("secret") int secret );

	Map selectInquiryDetail(int id);
	int countCustomer(int code);
	Map selectReply(int boardId);
	
	
}
