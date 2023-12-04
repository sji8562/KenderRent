package com.tenco.toyproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.MngRepository;

@Service
public class MngService {
	
	@Autowired
	private MngRepository mngRepository;
	
	public List<User> findAll() {
		List<User> users = mngRepository.findAll();
		System.out.println(users.toString());
		return users;
		
	}
	
}
