package com.tenco.toyproject._core.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.tenco.toyproject._core.handler.CartIntercepter;
import org.springframework.web.servlet.resource.PathResourceResolver;


@Configuration // Ioc 등록 --> 2개 이상 Ioc 등록 처리
public class WebMvcConfig implements WebMvcConfigurer {

//	@Autowired
//	private AuthIntercepter authIntercepter;
	
	@Autowired
	private CartIntercepter cartIntercepter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(cartIntercepter);
//				.addPathPatterns("/");
//				.addPathPatterns("/auth/**"); // 추가하는 방법
	}

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//
//		registry.addResourceHandler("/images/**") //중요
//				.addResourceLocations("file:"+"./images/") //중요
//				.addResourceLocations("file:"+"./static/images")
//				.setCachePeriod(60*60)// 1시간 중요
//				.resourceChain(true)
//				.addResolver(new PathResourceResolver());
//	}


	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//
//		 registry.addInterceptor(authInterceptor)
//				 .addPathPatterns("/account/**")
//				 .addPathPatterns("/auth/**"); // 추가하는 방법
//	}
	
	// 리소스 등록 처리 
	// 서버 컴퓨터에 위치한 Resource를 활용하는 방법(프로젝트 외부 폴더 접근)
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/images/uploads/**")
//		.addResourceLocations("file:///C:\\spring_upload\\bank\\upload/");
//	}
	

	 @Bean // Ioc 관리 대상 처리 - 싱글톤 
	 public PasswordEncoder passwordEnCoder() {
		 return new BCryptPasswordEncoder();
	 }
	
//	 @Bean
//	 public CartIntercepter cartIntercepter() {
//		 return new CartIntercepter();
//	 }
	
}