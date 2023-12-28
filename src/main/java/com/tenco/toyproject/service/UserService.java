package com.tenco.toyproject.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dao.UserDAO;
import com.tenco.toyproject.dto.UserDTO;
import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User findById(Integer id) {
		return userRepository.findById(id);
	}

//	수정시작
	public String selectPassword(String email) {
		return userRepository.selectPassword(email);
	}
	public User selectUser(String email) {
		return userRepository.selectUser(email);
	}
	@Transactional
	public int insertUser(User user) {
		return userRepository.insertUser(user);
	}
	public User selectUserEmail(String email) {
		return userRepository.selectUserEmail(email);
	}
	public User selectUserSns(String sns) {
		return userRepository.selectUserSns(sns);
	}
	public Map findByNameAndPhone(String name, String phoneNumber) {
		return userRepository.findByNameAndPhone(name, phoneNumber);
	}
	public int updatePassword(String password, String email) {
		return userRepository.updatePassword(password, email);
	}

}
