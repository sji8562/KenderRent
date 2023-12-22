package com.tenco.toyproject.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dto.UserSignInFormDto;
import com.tenco.toyproject.dto.response.KakaoProfile;
import com.tenco.toyproject.dto.response.KakaoProfile.Properties;
import com.tenco.toyproject.dto.response.OAuthToken;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.UserService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Value("${tenco.key}")
	private String tencoKey;
	
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
	
	//이메일 인증
	@PostMapping("EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		
		System.out.println("전달 받은 이메일 주소 : " + email);
		
		//난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		//이메일 보낼 양식
		String setFrom = "wjs1kk@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." +
						 "<br>" +
						 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return checkNum;
	}
	
	
	@GetMapping("/kakao-callback")
//	@ResponseBody // 데이터를 반환 하고 싶을 때 
	public String kakaoCallBack(@RequestParam("code") String code) {
		RestTemplate rt1 = new RestTemplate();
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
		params1.add("grant_type", "authorization_code");
		params1.add("client_id", "0a29e10b57cb7259eec5a50bdced4aa7");
		params1.add("redirect_uri", "http://localhost:80/user/kakao-callback");
		params1.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> requestMsg1 
			= new HttpEntity<>(params1, headers1);
		
		ResponseEntity<OAuthToken> response1 = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, 
				requestMsg1, OAuthToken.class);
		
		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<MultiValueMap<String, String>> requestMsg2 
						= new HttpEntity<>(headers2);
		
		ResponseEntity<KakaoProfile> response2 =  rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				requestMsg2, KakaoProfile.class);
		
		
		System.out.println("------------카카오 서버 정보 받기 완료---------");
		KakaoProfile kakaoProfile = response2.getBody();
		User user = User.builder().userName("OAuth_" + kakaoProfile.getId())
				.password(tencoKey).build();
		
		User oldUser = userService.selectUserEmail(user.getEmail());
		if(oldUser == null) {
			userService.insertUser(user);
			oldUser = userService.selectUserEmail(user.getEmail());	
			
		}
		oldUser.setPassword(null);
		session.setAttribute("principal", oldUser);
        return "redirect:/";
	}
	@GetMapping("/naver-callback")
//	@ResponseBody // 데이터를 반환 하고 싶을 때 
	public String naverCallBack(@RequestParam("code") String code, @RequestParam("state") String state) {
		try {
			RestTemplate rt1 = new RestTemplate();
			HttpHeaders headers1 = new HttpHeaders();
			headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
			params1.add("grant_type", "authorization_code");
			params1.add("client_id", "LbaGbefoStQkPYuwldjm");
			params1.add("client_secret", "QLL06505pS");
			params1.add("redirect_uri", "http://localhost:80/user/naver-callback");
			params1.add("code", code);
			HttpEntity<MultiValueMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);
			ResponseEntity<OAuthToken> response1 = rt1.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST, 
					requestMsg1, OAuthToken.class);
			
			
			HttpHeaders headers2 = new HttpHeaders();
			RestTemplate rt2 = new RestTemplate();
			HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers2);
			headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());
			headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			ResponseEntity<String> response = rt2.exchange("https://openapi.naver.com/v1/nid/me", 
					HttpMethod.POST, httpEntity, String.class);
		
		
		
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj =(JSONObject)jsonParser.parse(response.getBody());
			JSONObject account = (JSONObject)jsonObj.get("response");
			String name = String.valueOf(account.get("name"));
			User user = new User();
			user.setEmail(String.valueOf(account.get("email")));
			user.setUserName(String.valueOf(account.get("name")));
			user.setPhoneNumber(String.valueOf(account.get("mobile")));
			user.setPassword(tencoKey);
			System.out.println(user.getEmail());
			User oldUser = userService.selectUserEmail(user.getEmail());
			System.out.println(user.toString());
			if(oldUser == null) {
				userService.insertUser(user);
				oldUser = userService.selectUserEmail(user.getEmail());	
				
			}
			oldUser.setPassword(null);
			session.setAttribute("principal", oldUser);
		} catch (ParseException e) {
			e.printStackTrace();
		}

        return "redirect:/";

	}

}