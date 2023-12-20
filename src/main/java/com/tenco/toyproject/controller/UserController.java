package com.tenco.toyproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject._core.handler.exception.CustomRestfulException;
import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dto.UserDTO;
import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.dto.response.KakaoProfile;
import com.tenco.toyproject.dto.response.NaverProfile;
import com.tenco.toyproject.dto.response.OAuthToken;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.FindPwdMail;
import com.tenco.toyproject.service.RegisterMail;
import com.tenco.toyproject.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	
	@GetMapping("signIn")
	public String signIn() {
		return "user/signIn";
	}
	@GetMapping("signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@PostMapping("signIn")
	public String SignInPro(UserSignInFormDto dto) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String password = userService.selectPassword(dto.getEmail());
		if(password == null || !passwordEncoder.matches(dto.getPassword(), password)) {
			throw new CustomRestfullException("아이디 또는 비밀번호를 잘못 입력했습니다. ", HttpStatus.BAD_REQUEST);
		}
		User principal = userService.selectUser(dto.getEmail());
		session.setAttribute("principal", principal);
		return "redirect:/";
	}
	@PostMapping("signUp")
	public String signUpPro(User user) {
		if(userService.selectUser(user.getEmail()) != null) {
			throw new CustomRestfullException("이미 가입한 이메일입니다", HttpStatus.BAD_REQUEST);
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(securePassword);
		if(userService.insertUser(user) == 0) {
			throw new CustomRestfullException("회원가입에 실패하였습니다",  HttpStatus.BAD_REQUEST);
		}
		
		return "redirect:/user/signIn";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	


}
