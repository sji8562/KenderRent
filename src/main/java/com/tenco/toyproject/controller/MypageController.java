package com.tenco.toyproject.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.toyproject.repository.entity.PayBack;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.Sale;
import com.tenco.toyproject.repository.entity.User;

import com.tenco.toyproject.service.MypageService;

import com.tenco.toyproject.service.ProductService;
import com.tenco.toyproject.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductService productService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private UserService userService;
	
	// 예외처리 해야함
	@GetMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model) {
		//최근 본 상품
		ArrayList<Integer> cookieList = new ArrayList<Integer>();
		Cookie[] cookies = request.getCookies();
		ArrayList<Integer> goodsCookie = new ArrayList<Integer>();
		if(cookies != null) {
			for(int i = 0 ; i<cookies.length; i++) {
				if(cookies[i].getName().startsWith("goods")) {
					goodsCookie.add(Integer.parseInt(cookies[i].getValue()));
				}
			}			
		}
		System.out.println(goodsCookie);
//		필요없는 쿠키 삭제
		if(goodsCookie.size() >= 4) {
			int count = goodsCookie.size() - 3;
			for(int i = 0 ; i<cookies.length; i++) {
				if(cookies[i].getName().startsWith("goods")) {
					cookies[i].setPath("/");
					cookies[i].setValue(null);
					cookies[i].setMaxAge(0);			
					response.addCookie(cookies[i]);
					System.out.println(goodsCookie.size());
					
					goodsCookie.remove(i);
					count--;					
				}
				if(count == 0) {
					break;
				}
			}
		}
		
		ArrayList<Product> goodsProduct = new ArrayList<>();
		for(int i : goodsCookie) {
			Product product = productService.findById(i);
			goodsProduct.add(product);
			
		}
		Collections.reverse(goodsProduct);
		model.addAttribute("goodsProduct", goodsProduct);
		
		return "mypage/main";
	}
	

	@GetMapping("/inquiry")
	public String inquiryList(Model model,  @RequestParam(name = "type", defaultValue = "3" , required = false) int code) {
		User principal = (User)session.getAttribute("principal"); 
		List<Map> userCustomerList = mypageService.selectUserCustomer(principal.getId(), code);
		model.addAttribute("userCustomerList", userCustomerList);
		return "mypage/inquiry";
	}

	@GetMapping("/order-list")
	public String orderList(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<Map> orderList = productService.showCustomerOrderList(principal.getId());
		model.addAttribute("orderList", orderList);
		return "mypage/orderList";

	}
	
	@GetMapping("/order-list/detail")
	public String orderListDetailInfo(Model model, @RequestParam("id") int orderId) {
		User principal = (User) session.getAttribute("principal");
		Sale sale = productService.findTid(orderId);
		Product product = productService.findById(sale.getProductId());
		User userInfo = userService.findById(principal.getId());
		model.addAttribute("sale", sale);
		model.addAttribute("product", product);
		model.addAttribute("userInfo", userInfo);
		return "mypage/orderListDetailInfo";
	}
	
	@GetMapping("/cancel-list")
	public String CancelList(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<Map> cancelList = productService.showCancelList(principal.getId());
		model.addAttribute("cancelList",cancelList);
		return "mypage/cancelList";
	}
	
	@GetMapping("/wish-list")
	public String showWishList(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<Map> wishList = productService.showWishList(principal.getId());
		model.addAttribute("wishList", wishList);
		return "mypage/wishList";
	}
	
	@PostMapping("/wish-list")
	@ResponseBody
	public void addToWishList(@RequestBody HashMap<String, Integer> map) {
		User principal = (User) session.getAttribute("principal");
		productService.addToBookmark(principal.getId(), map.get("id"));
	}
	
	@PostMapping("/wish-list/cancel")
	@ResponseBody
	public String deleteFromWishList(@RequestBody HashMap<String, Integer> map) {
		User principal = (User)session.getAttribute("principal");
		int userId = principal.getId();
		int productId = map.get("id");
		productService.deleteWishList(userId, productId);
		return "redirect:/mypage/wish-list";
	}

}
