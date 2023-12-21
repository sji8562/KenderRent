package com.tenco.toyproject.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;


@Data
// JSON 형식의 코딩 컨벤션의 SNAKE CASE를 JAVA CAMEL NOTATION으로 변환처리
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class OAuthToken {
	
	private String accessToken;
	private String tokenType;
	private String refreshToken;
	private String expiresIn;
	private String scope;
	

}
