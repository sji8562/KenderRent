package com.tenco.toyproject.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoProfile {

	private Long id;
	private String connectedAt;

	@Data
	public class Properties {
		private String nickname;
	}

}
