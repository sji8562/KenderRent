package com.tenco.toyproject.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dto.KakaoPayDto;
import com.tenco.toyproject.dto.response.KakaoPayCancelResponse;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.Sale;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.vo.PageVO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import retrofit2.http.Path;

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
	@Autowired
	private MessageController message;

	@GetMapping("{fId}/categories/{sId}")
	public String categories(@PathVariable Integer fId, @PathVariable Integer sId, Model model) {

		List<Product> productList2 = productService.findByCategoryId(fId, sId);
		List<SecondCategory> secondCategoryList = productService.findBysCategoryId(fId);
		System.out.println("여기오자나 그치 ?");
		System.out.println(productList2.toString());
		System.out.println("---------------------------------" + secondCategoryList.toString());

    model.addAttribute("secondCategoryList", secondCategoryList);
    model.addAttribute("productList2", productList2);
    if(fId == 3 ||fId == 4||fId == 5){
      List<Product> productList = productService.findByCategoryId(fId);
      System.out.println(productList.toString());
      model.addAttribute("productList", productList);

      return "product/categories02";
    }
    if(fId >= 7 ){
      return "product/categories03";
    }
    return "product/categories01";
  }

  
  @GetMapping("detail/{id}")
  public String detail(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage, @PathVariable int id,
      HttpServletResponse response) {
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
    model.addAttribute("paging", pageVO);
    // 상품별로 변경해야함
    List<Map<String, Object>> CustomerList =
        customerService.selectCustomerById(4, pageVO.getStart(), id); // 상품문의
    model.addAttribute("customerList", CustomerList);
    // 페이징 처리해서 상품문의 출력 끝
    // 최근본 프로젝트 관련
    Cookie cookie = new Cookie("goods" + id, String.valueOf(id));
    cookie.setPath("/");  //
    cookie.setMaxAge(60 * 60 * 24); //
    response.addCookie(cookie); //
    // 최근본 프로젝트 관련 끝
    // 상품 정보
    Product product = productService.findById(id);
    model.addAttribute("product", product);
    // 찜한 상품 확인
    User principal = (User) session.getAttribute("principal");
    if (principal != null) {
      boolean isWished = productService.checkWishList(principal.getId(), id);
      model.addAttribute("isWished", isWished);
    }
    return "product/detail";
  }

  @PostMapping("order")
  public String order(Model model, @RequestParam("id") String selectedProducts) {
	  User principal = (User) session.getAttribute("principal");
	  User userInfo = userService.findById(principal.getId());  //세션은 들고왔는데 세션 체크 안함
    int[] productId =
        Arrays.stream(selectedProducts.split(",")).mapToInt(Integer::parseInt).toArray(); //
    List<Product> orderList = new ArrayList<>();
    int productPrice = 0;
    int deliveryFee = 3000;
    for (int id : productId) {
      Product product = productService.findById(id);
      orderList.add(product);
      productPrice += product.getPrice();
      if (product.getStatus() != 1) {
        throw new CustomRestfullException("이미 품절된 물건입니다.", HttpStatus.BAD_REQUEST);
      }
    }
    int totalPrice = productPrice + deliveryFee; //
    model.addAttribute("productPrice", productPrice);
    model.addAttribute("deliveryFee", deliveryFee);
    model.addAttribute("totalPrice", totalPrice);
    model.addAttribute("orderList", orderList);
    model.addAttribute("userInfo", userInfo);
    return "product/order";
  }



	@PostMapping("order/kakao-pay")
	public String kakaoPayReady(@RequestParam("orderIds") String[] orderIds, String name, String phoneNumber,
			String postNumber, String address, String addressDetail,
			@RequestParam(required = false, name = "selectedOption") String selectedOption) {
		User principal = (User) session.getAttribute("principal");
		int userId = principal.getId();
		for (String id : orderIds) {
			productService.payForProduct(userId, Integer.parseInt(id), postNumber, address, addressDetail);
		}
		String orderIdsToString = String.join(",", orderIds);
		System.out.println("결제 들어가쏘?");
		return "redirect:" + kakaoPayService.KakaoPayReady(orderIds, userId, selectedOption) + "?id=" + orderIdsToString
				+ "&selectedOption=" + selectedOption;
	}

	// http://localhost/product/kakao-pay/success?pg_token=T5794b2c3ad74821dd21
	@GetMapping("order/kakao-pay/success")
	public String kakaoPaySuccess(Model model, @RequestParam("pg_token") String pg_token) {
		User principal = (User) session.getAttribute("principal");
		int userId = principal.getId();
		KakaoPayDto kakao = kakaoPayService.kakaoPayInfo(pg_token, userId);
		String tid = kakao.getTid();
		String productId = kakao.getItemCode();
		int[] productIdArray = Arrays.stream(productId.split(",")).mapToInt(Integer::parseInt).toArray();
		model.addAttribute("info", kakao);

		for (int id : productIdArray) {
			productService.updateTid(tid, userId, id);
		}

		for (int id : productIdArray) {
			productService.deleteCartItem(userId, id);
		}
		message.sendOne(principal.getUserName(), principal.getPhoneNumber());
		return "redirect:/mypage/order-list";
	}

	@GetMapping("order/kakao-pay/fail")
	public String kakaoPayFail(Model model, @RequestParam("id") String orderIds,
			@RequestParam(required = false, name = "selectedOption") String selectedOption) {
		User principal = (User) session.getAttribute("principal");
		User userInfo = userService.findById(principal.getId());
		int[] productId = Arrays.stream(orderIds.split(",")).mapToInt(Integer::parseInt).toArray();
		List<Product> orderList = new ArrayList<>();
		int productPrice = 0;
		int deliveryFee = 3000;
		for (int id : productId) {
			Product product = productService.findById(id);
			orderList.add(product);
			productPrice += product.getPrice();
			productService.deleteFromSale(principal.getId(), id);
		}
		int optionPrice = 0;
		if (selectedOption == null) {
			optionPrice = 0;
		} else {
			if (selectedOption.equals("2.0")) {
				optionPrice = 5000;
			} else if (selectedOption.equals("3.0")) {
				optionPrice = 10000;
			}
		}

		int totalPrice = productPrice + deliveryFee + optionPrice;
		model.addAttribute("optionPrice", optionPrice);
		model.addAttribute("productPrice", productPrice);
		model.addAttribute("deliveryFee", deliveryFee);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("orderList", orderList);
		model.addAttribute("userInfo", userInfo);
		return "product/order";
	}

	@GetMapping("search")
	public String search(Model model, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sortBy", required = false) String sortBy,
			@RequestParam(value = "price1", required = false) String price1,
			@RequestParam(value = "price2", required = false) String price2) {

		if (keyword == "" || keyword.equals("")) {
			List<Map> productList = null;
			return "product/search";
		}
		System.out.println(sortBy);
		if(sortBy == null || sortBy.isEmpty()){
			throw new CustomRestfullException("잘못된 경로입니다.",HttpStatus.BAD_REQUEST);
		}
		List<Map> productList = productService.searchProduct(keyword,sortBy);

		System.out.println(productList.toString());
		model.addAttribute("productList", productList);
		model.addAttribute("MaxPrice", productService.searchMaxPrice());

		return "product/search";
	}

	@GetMapping("/getData")
	public @ResponseBody List<Map> getData(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize, @RequestParam String keyword, Model model) {
		// 페이지 및 페이지 크기를 이용하여 데이터 조회
		List<Map> productList = productService.searchProductInfinite(keyword, page, pageSize);
		return productService.searchProductInfinite(keyword, page, pageSize);
	}

	@PostMapping("order/kakao-pay/cancel")
	public String kakaoPayCancel(Model model, @RequestParam("orderId") int orderId) {
		User principal = (User) session.getAttribute("principal");
		int userId = principal.getId();
		Sale sale = productService.findTid(orderId);
		Product product = productService.findById(sale.getProductId());
		int cancelAmount = product.getPrice().intValue();
		KakaoPayCancelResponse cancelResponse = kakaoPayService.kakaoPayCancel(userId, cancelAmount, sale.getTid());
		productService.applyForRefund(product.getId(), userId, orderId);
		productService.deleteRefundFromSale(orderId);
		List<Map> orderList = productService.showCustomerOrderList(userId);
		model.addAttribute("orderList", orderList);
		model.addAttribute("refund", cancelResponse);
		return "redirect:/mypage/order-list";
	}

	@GetMapping("/rent/{id}")
	public String rent(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, @PathVariable int id,
			HttpServletResponse response) {
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
		model.addAttribute("paging", pageVO);
		// 상품별로 변경해야함
		List<Map<String, Object>> CustomerList = customerService.selectCustomerById(4, pageVO.getStart(), id); // 상품문의
		model.addAttribute("customerList", CustomerList);
		// 페이징 처리해서 상품문의 출력 끝
//		최근본 프로젝트 관련
		Cookie cookie = new Cookie("goods" + id, String.valueOf(id));
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
//		최근본 프로젝트 관련 끝
		// 상품 정보
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		// 찜한 상품 확인
		User principal = (User) session.getAttribute("principal");
		if (principal != null) {
			boolean isWished = productService.checkWishList(principal.getId(), id);
			model.addAttribute("isWished", isWished);
		}
		// 리뷰갯수
		int countReview = productService.countReview(id);
		model.addAttribute("countReview", countReview);
		// 리뷰 내용
		List<Map> review = productService.showReview(id);
		model.addAttribute("review", review);
		return "product/rent";
	}


}