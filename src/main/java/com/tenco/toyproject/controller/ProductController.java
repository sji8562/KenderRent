package com.tenco.toyproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.service.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}
	
	@GetMapping("detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "product/detail";
	}
	
}
