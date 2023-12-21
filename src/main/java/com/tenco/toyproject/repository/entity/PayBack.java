package com.tenco.toyproject.repository.entity;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PayBack {
	private Integer id;
	private Integer rentId;
	private Integer saleId;
	private Integer purchaseId;
	private Timestamp createAt;
	private Integer status;
	private Timestamp updateAt;
	private Integer money;
	private Integer userId;
	private Integer productId;
	
	public String formatStatus() {
		if(status == 1) {
			return "처리중";
		} else return "완료";
	}
}
