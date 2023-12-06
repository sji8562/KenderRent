package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.service.ProductService;

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
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}

	@GetMapping("detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		Product product = productService.findById(id);
		List<Map> CustomerList = customerService.selectCustomer(4); // 상품문의
		model.addAttribute("customerList", CustomerList);		
		model.addAttribute("product", product);
		return "product/detail";
	}
	
	@GetMapping("cart/{userId}")
	public String cart(@PathVariable Integer userId, Model model) {
//		Integer userId = 2;
		List<Product> cartList = productService.showCartById(userId);
		model.addAttribute("cartList", cartList);
		return "product/cart";
	}
	
	@GetMapping("order")
	public String order(Model model) {
		
		return "product/order";
	}

}
