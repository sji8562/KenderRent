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
public class Purchase {
	private int id;
	private int userId;
	private int productId;
	private Timestamp createdAt;
}
