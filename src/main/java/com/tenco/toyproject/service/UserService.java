package com.tenco.toyproject.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
	// 의존성 주입(생성자 주입과 메소드 주입으로 나뉘어짐)
	// 보통은 생성자 의존성 주입을 씀
	private UserRepository userRepository;
	@Autowired
	private UserDAO udao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	

	public User userSignIn(UserSignInFormDto dto) {

		// 1. 유저 이메일 존재 여부 확인
		User userEntity = userRepository.findByEmail(dto.getEmail());
		if (userEntity == null) {
			throw new CustomRestfullException("존재하지 않는 계정입니다.", HttpStatus.BAD_REQUEST);
		}
		// 2. 객체 상태값의 비밀번호와 암호화된 비밀번호의 일치 여부 확인

		boolean isPwdMatched = passwordEncoder.matches(dto.getPassword(), userEntity.getPassword());

		if (isPwdMatched == false) {
			throw new CustomRestfullException("비밀번호가 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}

		// User userEntity = userRepository
		// .findByUsernameAndPassword(dto);

		return userEntity;

	}

	public User searchEmail(String email) {

		return userRepository.findByEmail(email);
	}

	public User findById(Integer id) {
		return userRepository.findById(id);
	}

	public void add(User user) {
		// TODO Auto-generated method stub

	}

	// 회원 이메일(아이디) 찾기
	public String findUserEmail(String userName, String phoneNumber) {
		return udao.findUserEmail(userName, phoneNumber);
	}

	// 회원 패스워드 찾기
	// 회원 계정정보 가져오기
	public UserDTO findUserPwd(int id, String email, String phoneNumber) {
		return udao.findUserPwd(id, email, phoneNumber);
	}

	// 회원 계정 정보 확인 후 임시 패스워드로 변경
	public int changeTempPwd(String tempPwd, int id) {
		return udao.updateTempPwd(tempPwd, id);
	}
		
	// 일반 유저 추가
	public int addUser(UserDTO udto) {

		if (udao.insertUser(udto) != 2) {
			return 1;
		}
		return 2;
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
	public User selectUserName(String userName) {
		return userRepository.selectUserName(userName);
	}

}
