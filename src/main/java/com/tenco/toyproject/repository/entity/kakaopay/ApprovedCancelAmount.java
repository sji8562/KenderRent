package com.tenco.toyproject.repository.entity.kakaopay;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ApprovedCancelAmount {
	private Integer total; // 이번 요청으로 취소된 전체 금액
	private Integer taxFree; // 이번 요청으로 취소된 비과세 금액
	private Integer vat; // 이번 요청으로 취소된 부가세 금액
	private Integer point; // 이번 요청으로 취소된 포인트 금액
	private Integer discount; // 이번 요청으로 취소된 할인 금액
	private Integer greenDeposit; // 컵 보증금
}
