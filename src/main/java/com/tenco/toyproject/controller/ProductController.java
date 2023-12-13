package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject.dto.KakaoPayDto;
import com.tenco.toyproject.dto.response.KakaoPayResponse;
import com.tenco.toyproject.repository.entity.Order;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.service.KakaoPayService;
import com.tenco.toyproject.service.ProductService;
import com.tenco.toyproject.service.UserService;
import com.tenco.toyproject.vo.PageVO;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private UserService userService;
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}

	@GetMapping("detail/{id}")
    public String detail(Model model, PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage, @PathVariable int id) {
        // 페이징처리
        int total = productService.countProductCustomer(id);
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
        //상품별로 변경해야함
        List<Map<String, Object>> CustomerList = customerService.selectCustomerById(4, pageVO.getStart(), id); // 상품문의
        model.addAttribute("customerList", CustomerList);
        //페이징 처리해서 상품문의 출력 끝

        // 상품 정보
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product/detail";
    }

	@PostMapping("order")
	public String order(Model model, @RequestParam("id") int productId) {
		User principal = (User) session.getAttribute("principal");
		User userInfo = userService.findById(principal.getId());
		Product orderList = productService.findById(productId);
		model.addAttribute("orderList", orderList);
		model.addAttribute("userInfo", userInfo);
		return "product/order";
	}
	@GetMapping("order/kakao-pay")
	public void kakaoPayGet() {
		
	}
	
	
	@PostMapping("order/kakao-pay")
	public String kakaoPayReady(@RequestParam("id") int productId) {
		User principal = (User) session.getAttribute("principal");
		int userId = principal.getId();
			return "redirect:" + kakaoPayService.KakaoPayReady(productId, userId);
	}
	// http://localhost/product/kakao-pay/success?pg_token=T5794b2c3ad74821dd21
	@GetMapping("order/kakao-pay/success")
	public String kakaoPaySuccess(Model model, @RequestParam("pg_token") String pg_token) {
		User principal = (User) session.getAttribute("principal");
		int userId = principal.getId();
		// 단일 주문 성공시 order 테이블에 저장
		KakaoPayDto kakao = kakaoPayService.kakaoPayInfo(pg_token, userId);
		int productId = Integer.valueOf(kakao.getItemCode());
		System.out.println(productId);
		productService.payForProduct(userId, productId);
		model.addAttribute("info", kakao);
		
		return "redirect:/mypage/order-list";
	}
	
	@GetMapping("order/kakao-pay/cancel")
	public String kakaoPayCancel() {
		System.out.println("결제취소");
		
		return "redirect:/product/order";
	}
	
	

	
}