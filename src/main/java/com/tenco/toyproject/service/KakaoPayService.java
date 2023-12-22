package com.tenco.toyproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject.dto.KakaoPayDto;
import com.tenco.toyproject.dto.response.KakaoPayCancelResponse;
import com.tenco.toyproject.dto.response.KakaoPayResponse;
import com.tenco.toyproject.repository.entity.Product;


@Service
public class KakaoPayService {

	private KakaoPayResponse kakaoPayResponse;
	private KakaoPayDto kakaoPayDto;
	private KakaoPayCancelResponse kakaoPayCancelResponse;
	
	@Autowired
	private ProductService productService;

	private Product product;
	private String[] productIds;

	public String KakaoPayReady(String[] productId, int userId) {
//		Product orderList = productService.findById(productId);
		HttpHeaders headers = new HttpHeaders();
		productIds = productId;
		String productIdToString = String.join(",", productId);
		int productPrice = 0;
		int deliveryFee = 3000;
		int count = -1;
	    for (String id : productIds) {
	        product = productService.findById(Integer.parseInt(id));
	        productPrice += product.getPrice();
	        count++;
	    }
	    int totalPrice = productPrice + deliveryFee;
	    String productName = product.getName();
	    if (productId.length > 1) {
	    	productName = product.getName() + "외 " + count + "개";
	    }
	    
		headers.add("Authorization", "KakaoAK " + "bd58a402485edbfc26668cfb00914ee0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "KENDERRENT");
		params.add("partner_user_id", String.valueOf(userId));
		params.add("item_name", productName);
		params.add("item_code", productIdToString);
		params.add("quantity", "1");
		params.add("total_amount", String.valueOf(totalPrice));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost/product/order/kakao-pay/success"); // 성공 시 redirect url
		params.add("cancel_url", "http://localhost/product/order/kakao-pay/fail" + "?id=" + productIdToString); // 실패 시 redirect url
		params.add("fail_url", "http://localhost/product/order/kakao-pay/fail"); // 취소 시 redirect url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		RestTemplate rt = new RestTemplate();
		try {
			kakaoPayResponse = rt.postForObject("https://kapi.kakao.com/v1/payment/ready", 
					requestEntity,
					KakaoPayResponse.class);
			return kakaoPayResponse.getNextRedirectPcUrl();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public KakaoPayDto kakaoPayInfo(String pg_token, int userId) {

		RestTemplate rt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "bd58a402485edbfc26668cfb00914ee0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	
		int productPrice = 0;
		int deliveryFee = 3000;
	    for (String id : productIds) {
	        product = productService.findById(Integer.parseInt(id));
	        productPrice += product.getPrice();
	    }
	    int totalPrice = productPrice + deliveryFee;

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayResponse.getTid());
		params.add("partner_order_id", "KENDERRENT");
		params.add("partner_user_id", String.valueOf(userId));
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf(totalPrice));

		HttpEntity<MultiValueMap<String, String>> httpEntity 
			= new HttpEntity<MultiValueMap<String, String>>(params, headers);

		kakaoPayDto = rt.postForObject("https://kapi.kakao.com/v1/payment/approve", 
				httpEntity, KakaoPayDto.class);
		return kakaoPayDto;
	}
	
	public KakaoPayCancelResponse kakaoPayCancel(int userId, int cancelPrice, String tid) {
		RestTemplate rt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "bd58a402485edbfc26668cfb00914ee0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid);
		params.add("cancel_amount", String.valueOf(cancelPrice));
		params.add("cancel_tax_free_amount", "0");

		HttpEntity<MultiValueMap<String, String>> httpEntity 
			= new HttpEntity<MultiValueMap<String, String>>(params, headers);

		kakaoPayCancelResponse = rt.postForObject("https://kapi.kakao.com/v1/payment/cancel", 
				httpEntity, KakaoPayCancelResponse.class);
		return kakaoPayCancelResponse;
	}
}
