package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Map> selectNotice(int code){
		return customerRepository.selectNotice(code);
	}
}
