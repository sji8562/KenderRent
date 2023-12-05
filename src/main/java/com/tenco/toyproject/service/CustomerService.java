package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Map> selectCustomer(int code){
		return customerRepository.selectCustomer(code);
	}
	public int insertInquiry(int userId, int productId, int code, String title, String content) {
		return customerRepository.insertInquiry(userId, productId, code, title, content);
	}
	
}
