package com.tenco.toyproject.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int id;
	private int userId;
	private int productId;
	private Timestamp createdAt;
	private int option;
	
	public String optionToString() {
		if (option == 1) {
			return "1개월";
		} else if (option == 2) {
			return "2개월";
		} else {
			return "3개월";
		}
	}
}
