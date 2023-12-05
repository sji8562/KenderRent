package com.tenco.toyproject.repository.entity;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
	private int id;
	private int user_id;
	private int product_id;
	private int code;	
	private String title;
	private String content;
	private Timestamp createAt;
}
