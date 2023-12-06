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
	private Integer id;
	private Integer userId;
	private Integer productId;
	private Timestamp createdAt;
	
}
