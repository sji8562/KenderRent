package com.tenco.toyproject.dto;

import lombok.Data;

@Data
public class PayForProductDTO {
	private int userId;
	private int productId;
	private String tid;
}
