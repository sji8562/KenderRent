package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.MypageRepository;

@Service
public class MypageService {
	@Autowired
	private MypageRepository mypageRepository;
	
	public List<Map> selectUserCustomer(int userId, int code) {
		return mypageRepository.selectUserCustomer(userId, code);
	}
}
