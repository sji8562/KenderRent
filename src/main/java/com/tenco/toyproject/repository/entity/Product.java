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
public class Product {
	private int id;
	private int mainCategory;
	private int subCategory;
	private int price;
	private String name;
	private String picUrl;
	private String content;
	private int status;
	private String video;
	private Timestamp timeStamp;
}
