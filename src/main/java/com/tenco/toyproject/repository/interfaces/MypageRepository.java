package com.tenco.toyproject.repository.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MypageRepository {
	public List<Map> selectUserCustomer(@Param("userId") int userId, @Param("code") int code);
}
