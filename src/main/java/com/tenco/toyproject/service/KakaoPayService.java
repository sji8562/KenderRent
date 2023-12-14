package com.tenco.toyproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.tenco.toyproject.dto.KakaoPayDto;
import com.tenco.toyproject.dto.response.KakaoPayResponse;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;

import jakarta.servlet.http.HttpSession;

@Service
public class KakaoPayService {

	private KakaoPayResponse kakaoPayResponse;
	private KakaoPayDto kakaoPayDto;
	
	@Autowired
	private ProductService productService;

	private Product product;

	public String KakaoPayReady(int productId, int userId) {
//		Product orderList = productService.findById(productId);
		HttpHeaders headers = new HttpHeaders();
		product = productService.findById(productId);
		headers.add("Authorization", "KakaoAK " + "bd58a402485edbfc26668cfb00914ee0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "KENDERENT");
		params.add("partner_user_id", String.valueOf(userId));
		params.add("item_name", product.getName());
		params.add("item_code", String.valueOf(product.getId()));
		params.add("quantity", "1");
		params.add("total_amount", String.valueOf(product.getPrice()));
		params.add("tax_free_amount", "100");
		params.add("approval_url", "http://localhost/product/order/kakao-pay/success"); // 성공 시 redirect url
		params.add("cancel_url", "http://localhost/product/order/kakao-pay/cancel"); // 취소 시 redirect url
		params.add("fail_url", "http://localhost/product/order/kakao-pay/fail"); // 실패 시 redirect url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		RestTemplate rt = new RestTemplate();
		try {
			kakaoPayResponse = rt.postForObject("https://kapi.kakao.com/v1/payment/ready", requestEntity,
					KakaoPayResponse.class);
			System.out.println(kakaoPayResponse.toString());
			
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

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayResponse.getTid());
		params.add("partner_order_id", "KENDERENT");
		params.add("partner_user_id", String.valueOf(userId));
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf(product.getPrice())); // String.valueOf(orderList.getPrice())

		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(params,
				headers);

		kakaoPayDto = rt.postForObject("https://kapi.kakao.com/v1/payment/approve", httpEntity, KakaoPayDto.class);
		return kakaoPayDto;
	}
}
