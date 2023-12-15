package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.toyproject.repository.entity.Order;
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


	public List<Map<String, Object>> selectCustomer(int code, int start){
		return customerRepository.selectCustomer(code, start);

	}
	
	public List<Product> showCartById(Integer userId){
		List<Product> cartEntity = productRepository.showCartById(userId);
		return cartEntity;
	}
	
	@Transactional
	public void addToCartById(int userId, int productId) {
		productRepository.addToCartById(userId, productId);
	}
	
	public int countProductCustomer(int productId) {
        return productRepository.countProductCustomer(productId);
    }
	
	@Transactional
	public int deleteCartItem(int userId, int productId) {
		return productRepository.deleteCartItem(userId, productId);		
	}

	public boolean isItemInCart(int userId, int productId) {
		return productRepository.isItemInCart(userId, productId) > 0;
	}
	
	public int countItemInCart(int userId) {
		return productRepository.countItemInCart(userId);
	}
	
	public void payForProduct(int userId, int productId, String tid) {
		productRepository.payForProduct(userId, productId, tid);
	}
	public List<Map> showCustomerOrderList(int userId) {
		return productRepository.showCustomerOrderList(userId);
	}
	@Transactional
	public int applyForRefund(int productId) {
		return productRepository.applyForRefund(productId);
	}
	public Order findTid(int userId, int productId) {
		return productRepository.findTid(userId, productId);
	}
	public List<Map> searchProduct(String keyword){
		return productRepository.searchProduct(keyword);
	}
}
