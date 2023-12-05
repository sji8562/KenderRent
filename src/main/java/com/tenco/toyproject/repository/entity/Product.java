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
public class Product {
	private int id;
	private int firstCategoryId;
	private int secondCategoryId;
	private int price;
	private String name;
	private String picUrl;
	private String content;
	private int status;
	private String vedio;
	private String grade;
	private Timestamp createdAt;
	
	private String firstCategoryName;
	private String secondCategoryName;
}
