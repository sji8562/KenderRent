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
	private Integer id;	
	private Integer firstCategoryId;	
	private Integer secondCategoryId;	
	private Integer price;
	private String name;
	private String picUrl;
	private String content;
	private Integer status;
	private String video;
	private Timestamp timeStamp;
	
	public String formatStatus() {
		String condition = null;
		if (status == 1) {
			condition = "최상급";
		} else if (status == 2) {
			condition = "상급";
		}
		return condition;
	}
}
