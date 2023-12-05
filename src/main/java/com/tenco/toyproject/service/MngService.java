package com.tenco.toyproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.MngRepository;
import com.tenco.toyproject.vo.PageVO;

@Service
public class MngService {
	
	@Autowired
	private MngRepository mngRepository;
	
	public List<User> findAll(PageVO pageVO) {
		return mngRepository.findAllWithPagination(pageVO);
		
	}

	public int countUserList() {
 
		return mngRepository.findAllCount();
	}
	
	// KWON
	// 상품 목록 with pagination	
	public List<Product> findProductAll(PageVO pageVo) {
		return mngRepository.findAllProductWithPagination(pageVo);
	}

	// 상품 상세조회
	public Product findProductById(Integer pId) {
		return mngRepository.findProductById(pId);
	}

	// 전체 상품 개수 조회
	public int countProductList() {
		return mngRepository.findProductCount();
	}
}
