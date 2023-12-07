package com.tenco.toyproject.repository.interfaces;

import java.util.List;


import com.tenco.toyproject.dto.MngProductDto;

import com.tenco.toyproject.dto.MngRentDTO;

import com.tenco.toyproject.repository.entity.FirstCategory;

import com.tenco.toyproject.repository.entity.Rent;

import com.tenco.toyproject.repository.entity.SecondCategory;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.domain.Page;


import com.tenco.toyproject.repository.entity.Product;

import com.tenco.toyproject.dto.MngUserDTO;

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
	//유저쪽 xml
	public int deleteById(Integer id);
	public int updateById(User user);
	public User findById(Integer id);
	public List<User> findAllWithPagination(PageVO pageVO);
	
	public int findAllCount();

	public List<MngRentDTO.RentListDTO> findRentWithUserAll(PageVO pageVO);
	// KWON
	// 물품 전체 조회
	List<Product> findAllProductWithPagination(PageVO pageVo);

//	List<Product> findAllProductWithPagination();

	// 아이디로 물품 조회
	Product findProductById(Integer pId);

	// product 총 개수
	public int findProductCount();
	
	// 특정 물품 삭제 
	public int deleteByProductId(Integer id);

	// 물품 등록
	public int createProduct(Product product);

	// 1차 카테고리 조회
	public List<FirstCategory> findFirstCategoryAll();


	// 2차 카테고리 조회
	public List<SecondCategory> findSecondCategoryForRent();

}


