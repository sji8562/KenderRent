package com.tenco.toyproject.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.domain.Page;

import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.vo.PageVO;

@Mapper
public interface MngRepository {
	
	

	// 사용자 등록
    //public int insert(User user);
    // 사용자 수정
    //public int updateById(User user);
    // 사용자 삭제
    //public int deleteById(Integer id);
    // 사용자 조회
    //public User findById(Integer id); 
    //사용자 로그인
    //public User findByUsernameAndPassword(SignInFormDto dto);    
    // 사용자 전체 조회
	List<User> findAllWithPagination(PageVO pageVO);
	
	public int findAllCount();
	
}


