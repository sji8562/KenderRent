package com.tenco.toyproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.dto.UserSignUpFormDto;
import com.tenco.toyproject.dto.response.KakaoProfile;
import com.tenco.toyproject.dto.response.OAuthToken;
import com.tenco.toyproject.handler.exception.CustomRestfulException;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@Value("${tenco.key}")
	private String tencoKey;

	// 회원가입 페이지 요청
	// 주소설계 http://localhost/
	@GetMapping("/sign-up")
	public String userSignUp() {
		return "user/userSignUp";
	}

	// 로그인 페이지 요청
	// 주소설계 http://localhost/
	@GetMapping("/sign-in")
	public String userSignIn() {
		return "user/userSignIn";
	}

	/**
	 * 회원가입처리
	 * 
	 * @param dto
	 * 
	 * @return 리다이렉트 로그인 페이지
	 */

	// DTO
	@PostMapping("/sign-up")
	public String signUpProc(UserSignUpFormDto dto) throws CustomRestfulException {

		if (dto.getEmail() == null || dto.getEmail().isEmpty()) {
			throw new CustomRestfulException("이메일을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getPassword() == null || dto.getPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getUserName() == null || dto.getUserName().isEmpty()) {
			throw new CustomRestfulException("이메일을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}

		userService.userSignUp(dto);

		return "redirect:/user/sign-in";

	}

	@PostMapping("/sign-in")
	public String signInProc(UserSignInFormDto dto) throws CustomRestfulException {

		if (dto.getEmail() == null || dto.getEmail().isEmpty()) {
			throw new CustomRestfulException("이메일을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getPassword() == null || dto.getPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력해주세요.", HttpStatus.BAD_REQUEST);
		}

		User principal = userService.userSignIn(dto);

		return "redirect:/account/list";
	}

	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/user/sign-in";
	}

	// http://localhost:80/user/kakao-callback?code=
	@GetMapping("/kakao-callback")
	public String kakaoCallBack(@RequestParam String code) throws CustomRestfulException {

		// 액세스 토큰 요청 --> Server2Server
		RestTemplate rt1 = new RestTemplate();

		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
		params1.add("grant_type", "authorization_code");
		params1.add("client_id", "9c1f13e7e8b25dc2a7a6985ffce3cabb");
		params1.add("redirect_uri", "http://localhost:80/user/kakao-callback");
		params1.add("code", code);

		HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);

		// 요청 처리
		ResponseEntity<OAuthToken> response1 = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				requestMsg1, OAuthToken.class);

		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
		System.out.println(response1.getHeaders());
		System.out.println(response1.getBody());
		System.out.println(response1.getBody().getAccessToken());
		System.out.println(response1.getBody().getRefreshToken());
		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");

		// 이상 토큰을 받기 위한 처리

		RestTemplate rt2 = new RestTemplate();
		// Header 구성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());

		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// Header + Body 결합
		HttpEntity<MultiValueMap<String, String>> requestMsg2 = new HttpEntity<>(headers2);
		// 요청 처리
		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				requestMsg2, KakaoProfile.class);

		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
		System.out.println(response2.getBody().getProperties().getNickname());
		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");

		// 카카오 서버에 존재하는 정보를 요청 처리
		System.out.println("----카카카카카오 서버 정보 받기 완료----");

		// 1. 회원 가입 여부 확인
		KakaoProfile kakaoProfile = response2.getBody();

		// 소셜 회원 가입자는 전부 비밀번호가 동일하게 된다.
		UserSignUpFormDto userSignUpFormDto = UserSignUpFormDto.builder().email("OAuth_" + kakaoProfile.getId() + "_님")
//				.fullname("OAuth_" + kakaoProfile.getId() + "_님")
				.password(tencoKey).userName("Kakao").build();

		System.out.println("tencoKey: " + tencoKey);

		// --> null 일때는 세션에 로그인을 하기위해 값을 할당해주어야 한다.
		User oldUser = userService.searchEmail(userSignUpFormDto.getEmail());
		if (oldUser == null) {
			// oldUser가 null이라면 회원 가입 최초 처리를 해줘야함
			// 최초 처리 =회원가입 자동 처리
			userService.userSignUp(userSignUpFormDto); // 회원가입이 됨

			oldUser = userService.searchEmail(userSignUpFormDto.getEmail());

		}
		// null이 아닌 경우, 즉 이미 있는 정보일 경우
		// 로그인 처리

		oldUser.setPassword(null);

		// 만약 소셜 로그인 사용자가 회원 가입 처리 완료된
		// 사용자라면, 바로 세션 처리 및 로그인 처리
		return "redirect:/account/list";

	}

}
