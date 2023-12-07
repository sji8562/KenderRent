package com.tenco.toyproject.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

// {"access_token":"lSOOLnCFD_ljKn2lS3wqkOe-Fp9wvDxYj74KKiUPAAABjB4NDQTokopMIboAuA"
// ,"token_type":"bearer"
// ,"refresh_token":"5_NwBL6xgkye65OgMxJMmiXNFNBYemVEQEUKKiUPAAABjB4NDQHokopMIboAuA"
// ,"expires_in":21599
// ,"scope":"profile_image profile_nickname"
// ,"refresh_token_expires_in":5183999}

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
