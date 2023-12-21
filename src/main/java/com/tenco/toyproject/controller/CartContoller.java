package com.tenco.toyproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartContoller {
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductService productService;

	// 장바구니 목록
	@GetMapping
	public String cart(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<Product> cartList = productService.showCartById(principal.getId());
		model.addAttribute("cartList", cartList);
		return "product/cart";
	}

	// 장바구니 추가
	@PostMapping("/add")
	public String addToCart(@RequestParam("id") int productId, Model model) {
		User principal = (User) session.getAttribute("principal");
//		if (principal == null) {
//			throw new CustomRestfullException("로그인이 필요합니다.", HttpStatus.BAD_REQUEST);
//		} else {
			if (productService.isItemInCart(principal.getId(), productId)) {
				throw new CustomRestfullException("이미 장바구니에 있는 물건입니다.", HttpStatus.BAD_REQUEST);
			} else {
				productService.addToCartById(principal.getId(), productId);
				List<Product> cartList = productService.showCartById(principal.getId());
				model.addAttribute("cartList", cartList);
			}
//		}
		return "redirect:/cart";
	}

	// 장바구니 삭제
	@PostMapping("/delete")
	public String deleteCartItem(@RequestParam("id") int id) {
		User principal = (User) session.getAttribute("principal");
		productService.deleteCartItem(principal.getId(), id);
		return "redirect:/cart";
	}

<<<<<<< HEAD
	// 장바구니 확인
	public boolean checkCartItemExist(int productId) {
		User principal = (User) session.getAttribute("principal");
		return productService.isItemInCart(principal.getId(), productId);
	}

	@GetMapping("/check")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> checkCartItem(@RequestParam("id") int id) {
		boolean exists = checkCartItemExist(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", exists);
		return ResponseEntity.ok(response);
	}

}
=======
}
>>>>>>> 091ab240b160b8d81f561bb977f8b462b3acf2f0
