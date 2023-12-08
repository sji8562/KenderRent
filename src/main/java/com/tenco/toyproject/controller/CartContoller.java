package com.tenco.toyproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartContoller {
	
	@Autowired
	private ProductService productService;
	
	// 장바구니 목록
	@GetMapping
	public String cart(Model model) {		
		List<Product> cartList = productService.showCartById(1); // 1은 사용자 ID, 필요에 따라 변경
		model.addAttribute("cartList", cartList);
		return "product/cart";
	}	


	// 장바구니 추가
    @PostMapping("/add")
    public String addToCart(
            @RequestParam("id") int productId, Model model) {
    		if (productService.isItemInCart(1, productId)) {
    			throw new CustomRestfullException("이미 장바구니에 있는 물건입니다.", HttpStatus.BAD_REQUEST);
    		} else {
    			productService.addToCartById(1, productId); 
        		List<Product> cartList = productService.showCartById(1);
        		model.addAttribute("cartList", cartList);
    		}
        return "redirect:/cart";
    }
    
    // 장바구니 삭제
    @PostMapping("/delete")
    public String deleteCartItem(@RequestParam("id") int id) {
        productService.deleteCartItem(1, id); 
        return "redirect:/cart";
    }
	
}
