package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired // DI 처리
	private CustomerService customerService;
	
	@GetMapping("contact")
//	 @RequestParam(name = "type", defaultValue = "1" , required = false) int code
	public String contact(Model model) {
		
		List<Map> noticeList = customerService.selectNotice(1);
		model.addAttribute("noticeList", noticeList);
		return "customer/contact";
	}
	//사용자 회원가입 페이지 요청
	//주소설계 http://localhost/customer/custSignUp
	@GetMapping("/custSignUp")
	public String custSignUp() {
		return "customer/custSignUp";
	}
	
}
