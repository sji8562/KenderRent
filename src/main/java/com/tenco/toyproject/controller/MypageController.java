package com.tenco.toyproject.controller;

import java.util.*;

import com.tenco.toyproject.dto.UserUpdateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.Rent;
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
    // 최근 본 상품
	  System.out.println("여기?11111");
    ArrayList<Integer> cookieList = new ArrayList<Integer>();
	  System.out.println("여기?2222222222");
    Cookie[] cookies = request.getCookies();
	  System.out.println("여기?33333333333");
    ArrayList<Integer> goodsCookie = new ArrayList<Integer>();
	  System.out.println("여기?44444444444");
    if (cookies != null) {
		System.out.println("여기?555555555555");
      for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().startsWith("goods")) {
          goodsCookie.add(Integer.parseInt(cookies[i].getValue()));
        }
      }
		System.out.println("여기?666666666666");
    }
	  System.out.println("여기?777777777777777777");
    System.out.println(goodsCookie);
    // 필요없는 쿠키 삭제

	  if (goodsCookie.size() >= 4) {
		  System.out.println("여기?8888888888888888");
		  int count = goodsCookie.size() - 3;
		  System.out.println("여기?9999999999999999");

		  Iterator<Integer> iterator = goodsCookie.iterator();
		  while (iterator.hasNext()) {
			  int i = iterator.next();
			  if (cookies[i].getName().startsWith("goods")) {
				  cookies[i].setPath("/");
				  cookies[i].setValue(null);
				  cookies[i].setMaxAge(0);
				  response.addCookie(cookies[i]);
				  System.out.println(goodsCookie.size());
				  iterator.remove(); // 안전하게 제거
				  count--;
			  }
			  if (count == 0) {
				  break;
			  }
		  }

		  System.out.println("여기?1010101010101010101010101010");
	  }

	  ArrayList<Product> goodsProduct = new ArrayList<>();
	  for (int i : goodsCookie) {
		  Product product = productService.findById(i);
		  goodsProduct.add(product);
	  }

	  Collections.reverse(goodsProduct);
	  model.addAttribute("goodsProduct", goodsProduct);
	  if (!goodsProduct.isEmpty()) {
		  System.out.println(goodsProduct.get(0).toString());
	  } else {
		  System.out.println("goodsProduct이 비어 있습니다.");
	  }

	  return "mypage/main";
  }

  @GetMapping("/inquiry")
  public String inquiryList(Model model,
      @RequestParam(name = "type", defaultValue = "3", required = false) int code) {
    User principal = (User) session.getAttribute("principal");
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
	
	@GetMapping("/rent-list")
	public String rentList(Model model) {
		User principal = (User)session.getAttribute("principal");
		List<Map> rent = productService.showRentList(principal.getId());
		model.addAttribute("rent", rent);
		return "mypage/rentList";
	}
	
	@GetMapping("/rent-list/detail")
	public String rentListDetailInfo(Model model, @RequestParam("id") int orderId) {
		User principal = (User) session.getAttribute("principal");
		Rent rent = productService.findRentList(orderId);
		Product product = productService.findById(rent.getProductId());
		User userInfo = userService.findById(principal.getId());
		model.addAttribute("rent", rent);
		model.addAttribute("product", product);
		model.addAttribute("userInfo", userInfo);
		return "mypage/rentListDetailInfo";
	}
	//유저 업데이트
	@GetMapping("/user-update")
	public String userUpdate(Model model){

		User principal = (User) session.getAttribute("principal");
		User userInfo = userService.findById(principal.getId());
		System.out.println(userInfo.toString());
		model.addAttribute("userInfo",userInfo);
		return "mypage/userUpdate";
	}

	@PostMapping("{id}/user-update")
	public String userUpdateProc(@PathVariable Integer id ,UserUpdateDTO userUpdateDTO){
		System.out.println("이거 나와야한다"+userUpdateDTO.toString());
	  mypageService.userUpdate(id,userUpdateDTO);


		return "redirect:/mypage/user-update";
	}

}
//	private String password;
//	private String userName;
//	private String address;
//	private String addressDetail;
//	private String phoneNumber;