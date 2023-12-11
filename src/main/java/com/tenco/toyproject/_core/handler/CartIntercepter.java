package com.tenco.toyproject._core.handler;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tenco.toyproject._core.handler.exception.UnAuthorizedException;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


// 1 HandlerInterceptor 구현 IoC 대상
// 2 
@Component // IoC 대상 - 싱글톤 관리
public class CartIntercepter implements HandlerInterceptor{
	// @Bean X
	@Autowired
	private ProductService productService;
	// 컨트롤러에 들어오기 전에 동작하는 메서드
	// controller --> true(들어감), false(안들어감)
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		// 세션에 사용자 정보 확인
//		System.out.println("동작확인");
//		HttpSession session = request.getSession();
//		User principal = (User)session.getAttribute("principal");
//		if(principal == null) {
//			response.sendRedirect("/user/sign-in");
//			throw new UnAuthorizedException("로그인 먼저 해주세요", HttpStatus.UNAUTHORIZED);
//		}
//
//		return true;
//	}
	
	
	//뷰가 렌더링 되기 전에 호출 되는 메서드
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		int countItemInCart = productService.countItemInCart(1);
//		System.out.println(countItemInCart);
//		modelAndView.addObject("countItemInCart", countItemInCart);
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
	
	
	// 요청 처리가 완료된 후(뷰 렌더링이 완료된 후) 호출 되는 메서드
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//	}
}
