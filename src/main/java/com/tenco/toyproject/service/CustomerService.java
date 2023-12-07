package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.CustomerRepository;
import com.tenco.toyproject.vo.PageVO;

import jakarta.transaction.Transactional;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Map<String, Object>> selectCustomer(int code, int start ){
		return customerRepository.selectCustomer(code, start);
	}
	public List<Map<String, Object>> selectCustomerById(int code, int start, int id){
		return customerRepository.selectCustomerById(code, start, id);
	}
	@Transactional
	public int insertInquiry(int userId, int productId, int code, String title, String content, int secret) {
		return customerRepository.insertInquiry(userId, productId, code, title, content, secret);
	}
	public Map selectInquiryDetail(int id) {
		return customerRepository.selectInquiryDetail(id);
	}
	public int countCustomer(int code) {
		return customerRepository.countCustomer(code);
	}
	public Map selectReply(int board_id) {
		return customerRepository.selectReply(board_id);
	}
	
}
