package com.tenco.toyproject.repository.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.repository.entity.User;

@Mapper
public interface UserRepository {
	
	
	
	// 사용자 수정
	public int updateById(User user);
	
	// 사용자 삭제
	public int deleteById(Integer id);
	
	// 사용자 단일 조회
	public User findById(Integer id);
	
	// 사용자 전체 조회
	public List<User> findAll();
	
	// 사용자 이름과 비밀번호로 조회
	public User findByEmailAndPassword(UserSignInFormDto dto);
	
	// 사용자 이름으로 조회
	public User findByEmail(String dto);
	
	
//	수정
	public String selectPassword(String email);
	public User selectUser(String email);
	public int insertUser(User user);
	public User selectUserName(String userName);
}

