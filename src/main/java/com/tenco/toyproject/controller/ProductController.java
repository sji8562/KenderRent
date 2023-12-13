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

import com.tenco.toyproject.dto.response.KakaoPayResponse;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.service.ProductService;
import com.tenco.toyproject.service.UserService;
import com.tenco.toyproject.vo.PageVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
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
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}

	@GetMapping("detail/{id}")
    public String detail(Model model, PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage, @PathVariable int id,  HttpServletResponse response) {
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
//		최근본 프로젝트 관련
		Cookie cookie = new Cookie("goods"+id,String.valueOf(id));
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
//		최근본 프로젝트 관련 끝
        // 상품 정보
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product/detail";
    }

	@GetMapping("order")
	public String order(Model model) {
		User principal = (User) session.getAttribute("principal");
		User userInfo = userService.findById(principal.getId());
		model.addAttribute("userInfo", userInfo);
		return "product/order";
	}
	
	@PostMapping("order/kakao-pay/ready")
	public String kakaoPay() {
		User principal = (User) session.getAttribute("principal");
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "KakaoAK " + "bd58a402485edbfc26668cfb00914ee0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", "TC0ONETIME");
		params.add("partner_order_id", "TC0ONETIME");
		params.add("partner_user_id", "TC0ONETIME");
	    params.add("item_name", "상품명");
	    params.add("quantity", "주문 수량");
	    params.add("total_amount", "총 금액");
	    params.add("vat_amount", "부가세");
	    params.add("tax_free_amount", "상품 비과세 금액");
	    params.add("approval_url", "http://localhost/product/order/success"); // 성공 시 redirect url
	    params.add("cancel_url", "http://localhost/product/order/cancel"); // 취소 시 redirect url
	    params.add("fail_url", "http://localhost/product/order/fail"); // 실패 시 redirect url

	    HttpEntity<MultiValueMap<String, String>> requestEntity
	     = new HttpEntity<>(params, headers);
	    
		RestTemplate rt = new RestTemplate();
		
		KakaoPayResponse response = rt.postForObject("https://kapi.kakao.com/v1/payment/ready", 
				requestEntity,
				KakaoPayResponse.class);		
		return "product/order/list";
	}
}