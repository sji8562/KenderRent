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
	public List<Product> findProductAll() {
//	public List<Product> findProductAll(PageVO pageVo) {
		return mngRepository.findAllProductWithPagination();
	}

	public Product findProductById(Integer pId) {
		return mngRepository.findProductById(pId);
	}
}
