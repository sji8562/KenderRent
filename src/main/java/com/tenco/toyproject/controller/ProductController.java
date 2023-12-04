package com.tenco.toyproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "product/detail";
	}
}
