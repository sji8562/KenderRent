package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.toyproject.dto.AddToCartDTO;
import com.tenco.toyproject.repository.entity.Cart;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.interfaces.CustomerRepository;
import com.tenco.toyproject.repository.interfaces.ProductRepository;
import com.tenco.toyproject.vo.PageVO;

@Service
@Mapper
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	public Product findById(Integer id) {
	 
		Product productEntity = productRepository.findById(id);
	
		return productEntity;
	}

	public List<Map<String, Object>> selectCustomer(int code, int start){
		return customerRepository.selectCustomer(code, start);
	}
	
	public List<Product> showCartById(Integer userId){
		List<Product> cartEntity = productRepository.showCartById(userId);
		return cartEntity;
	}
	
	@Transactional
	public int addToCartById(int userId, int productId) {
		
		int resultRowCount = productRepository.addToCartById(userId, productId);
		if(resultRowCount != 1) {
			System.out.println("이미 장바구니에있는 물건");
		}
		return resultRowCount;
	}
	public int countProductCustomer(int productId) {
		return productRepository.countProductCustomer(productId);
	}
}
