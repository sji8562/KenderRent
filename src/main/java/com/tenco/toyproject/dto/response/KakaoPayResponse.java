package com.tenco.toyproject.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoPayResponse {

	private String tid; // 결제 고유 번호
//	private String nextRedirectMobileUrl; // 모바일 웹일 경우 받는 결제페이지 url
	private String nextRedirectPcUrl; // pc 웹일 경우 받는 결제 페이지
	private String createdAt;
}
