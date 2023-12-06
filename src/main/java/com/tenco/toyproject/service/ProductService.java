package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.entity.Cart;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.interfaces.CustomerRepository;
import com.tenco.toyproject.repository.interfaces.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	public Product findById(Integer id) {
	 
		Product productEntity = productRepository.findById(id);
	
		return productEntity;
	}
	
	public List<Map> selectCustomer(int code){
		return customerRepository.selectCustomer(code);
	}
	
	public List<Product> showCartById(Integer userId){
		List<Product> cartEntity = productRepository.showCartById(userId);
		return cartEntity;
	}
}
