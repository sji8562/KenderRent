
package com.tenco.toyproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.dto.UserSignUpFormDto;
import com.tenco.toyproject._core.handler.exception.CustomRestfulException;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.UserRepository;

@Service
public class UserService {


	// 의존성 주입(생성자 주입과 메소드 주입으로 나뉘어짐)
	// 보통은 생성자 의존성 주입을 씀
	@Autowired
	private UserRepository userRepository;
	


	@Transactional
	public int userSignUp(UserSignUpFormDto dto) throws CustomRestfulException {
		String password = BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt()); //비밀번호 해시화

//		System.out.println("hashPwd : " + hashPwd);
		// username 에 중복 여부 확인은 생략함

		// User
		// SignUpFormDto
		User user = User.builder().email(dto.getEmail()).password(password).userName(dto.getUserName())
				.phoneNumber(dto.getPhoneNumber()).build(); // build() 반드시 호출

		int resultRowCount = userRepository.insert(user);
		if (resultRowCount != 1) {
			throw new CustomRestfulException("회원 가입 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return resultRowCount;

	}

	public User userSignIn(UserSignInFormDto dto) throws CustomRestfulException {

		// 1. username 아이디 존재 여부 확인
		User userEntity = userRepository.findByEmail(dto.getEmail());
		if (userEntity == null) {
			throw new CustomRestfulException("존재하지 않는 계정입니다.", HttpStatus.BAD_REQUEST);
		}
		// 2. 객체 상태값의 비밀번호와 암호화된 비밀번호의 일치 여부 확인

		boolean pwdCheck = BCrypt.checkpw(dto.getPassword(),BCrypt.gensalt()); //비밀번호 체크  salt빼고 디비에서 비밀번호 불러와서 dto.getpassword 뒤에 쓰면됩니다

		if (pwdCheck == false) {
			throw new CustomRestfulException("비밀번호가 잘못되었습니다.", HttpStatus.BAD_REQUEST);
		}

		// User userEntity = userRepository
		// .findByUsernameAndPassword(dto);

		return userEntity;

	}

	public User searchEmail(String email) {

		return userRepository.findByEmail(email);
	}

}

