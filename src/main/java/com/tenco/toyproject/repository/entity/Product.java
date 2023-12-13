package com.tenco.toyproject.repository.entity;


import java.security.Timestamp;

import com.tenco.toyproject._core.utils.DecimalUtil;
import com.tenco.toyproject._core.utils.ImageUtil;
import com.tenco.toyproject._core.utils.ProductUtil;

import jakarta.persistence.Lob;
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
	private Long price;
	private String name;
	private String picUrl;
	@Lob
	private String content;
	private int status;
	private String grade;
	private Timestamp createdAt;
	
	private String firstCategoryName;
	private String secondCategoryName;
	public String formatDecimal() {
		return DecimalUtil.decimalToString(price);
	}

	// KWON
	public String formatImgUrl() {

		return ImageUtil.checkImageUrl(picUrl);
	}

	public String formatStatusToString() { return ProductUtil.statusToString(status);}
	
	// 대여, 판매 구분
	public String formatItemForSale() {
		if (firstCategoryId < 10) {
			return "대여";
		} else return "판매";
	}
}
