package com.tenco.toyproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.interfaces.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Product findById(Integer id) {
	 
		Product productEntity = productRepository.findById(id);
	
		return productEntity;
	}
}
