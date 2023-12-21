//package com.tenco.toyproject.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.tenco.toyproject.dto.UserDTO;
//import com.tenco.toyproject.service.FindPwdMail;
//import com.tenco.toyproject.service.RegisterMail;
//import com.tenco.toyproject.service.UserService;
//
//@Controller
//public class AccountController {
//
//	@Autowired
//	UserService us;
//
//	// 회원가입 메일 서비스
//	@Autowired
//	RegisterMail registerMail;
//
//	// 임시 패스워드 발송 서비스
//	@Autowired
//	FindPwdMail findPwdMail;
//
//	@Autowired
//	private PasswordEncoder passwdEncoder;
//
//	// 일반회원 회원가입 완료
//	@PostMapping("user/signUpOkUser")
//	public String signUpOkUser(@ModelAttribute("udto") UserDTO udto, @RequestParam("address")String address) {
//		System.out.println("udto : " + udto);
//		
//		// 추가 주소가 있다면 주소 세팅
//		if(address != null) {
//			udto.setAddress(udto.getAddress()+" "+address);
//		}
//
//		// udto 에서 패스워드 가져와서 다시 인코딩에서 set
//		udto.setPassword(passwdEncoder.encode(udto.getPassword()));
//
//		int result = us.addUser(udto);
//
////			System.out.println("result : " + result);
//
//		return "redirect:/account/userSignIn";
//	}
//
//	// 이메일 인증
//	@PostMapping("account/mailConfirm")
//	@ResponseBody
//	String mailConfirm(@RequestParam("email") String email) throws Exception {
//
//		String code = registerMail.sendSimpleMessage(email);
//		System.out.println("인증코드 : " + code);
//		return code;
//	}
//
//	// 일반회원 계정 찾기 페이지 이동
//	@GetMapping("user/find-account-user")
//	public String findAccountUser() {
//		return "user/findAccountUser";
//	}
//
//	// 일반 회원 이메일 찾기
//	@PostMapping("user/find-user-email")
//	@ResponseBody
//	String findUserEmail(@RequestParam("userName") String userName, @RequestParam("phoneNumber") String phoneNumber) {
//		// System.out.println(userName+ " : "+phoneNumber);
//
//		return us.findUserEmail(userName, phoneNumber);
//	}
//
//	// 일반 회원 비밀번호 찾기 및 임시 패스워드로 변경
//	@PostMapping("user/findUserPwd")
//	@ResponseBody
//	String findMemberPwd(@RequestParam("id") int id, @RequestParam("email") String email,
//			@RequestParam("phoneNumber") String phoneNumber) throws Exception {
//		// System.out.println(id + " : " + email + " : " + phoneNumber);
//		UserDTO udto = us.findUserPwd(id, email, phoneNumber);
//
//		if (udto != null) {
//			// 임시 패스워드 메일 발송 및 변수 저장
//			String tempPwd = passwdEncoder.encode(findPwdMail.sendSimpleMessage(udto.getEmail()));
//			// System.out.println("tempPwd : " + tempPwd);
//			// 임시 패스워드 db 에 저장
//			us.changeTempPwd(tempPwd, udto.getId());
//
//			return "변경완료";
//		}
//		return null;
//	}
//
//}
