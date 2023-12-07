package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.vo.PageVO;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired // DI 처리
	private CustomerService customerService;

	

	//사용자 회원가입 페이지 요청
	//주소설계 http://localhost/customer/custSignUp
	@GetMapping("/custSignUp")
	public String custSignUp() {
		return "customer/custSignUp";
	}
	

	@GetMapping("/contact")
	public String contact(Model model, PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam(name = "type", defaultValue = "1" , required = false) int code) {
		
		int total = customerService.countCustomer(code);
	    if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
	    pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    model.addAttribute("paging",pageVO);
	    
		List<Map<String, Object>> customerList = customerService.selectCustomer(code, pageVO.getStart());
		System.out.println(customerList);
		model.addAttribute("customerList", customerList);
		
		return "customer/contact";
	}
	
	@GetMapping("/write")
	public String inquiryDetail() {
		//접근제한 해야함.
		
		return "customer/inquiryWrite";
	}
	@PostMapping("/write")
	public String inquiryPro(String title, String content, @RequestParam("type") String type) {
		//접근제한 해야함
		//로그인 다 되면 session값으로 user_id 넣기
		//상품문의할때 id값 받아오기
		if(type.equals("inquiry")) {
			customerService.insertInquiry(2, 0, 3, title, content);
			return "redirect:/customer/contact";
		}
		customerService.insertInquiry(2, 0, 4, title, content);
		return "redirect:/customer/contact";
	}
	@GetMapping("/detail")
	public String detail(Model model, int id) {
		Map inquiryDetail = customerService.selectInquiryDetail(id);
		String content = org.springframework.web.util.HtmlUtils.htmlEscape(String.valueOf(inquiryDetail.get("content")));
		content = content.replaceAll("\n","<br/>");
		inquiryDetail.put("content", content);
		model.addAttribute("inquiryDetail", inquiryDetail);
		return "customer/inquiryDetail";
	}
}
