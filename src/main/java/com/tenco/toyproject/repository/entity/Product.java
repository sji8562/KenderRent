package com.tenco.toyproject.repository.entity;


import java.security.Timestamp;
import java.text.DecimalFormat;

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
	private Integer FirstCategoryCode;
	private String secondCategoryName;
	private Integer code; // 1: 대여용, 2: 판매용
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
	
	// 1000원 단위로 콤마 + 원
	public String formatPrice() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(price) + "원";
	}
	
	// 배송비
	public String getDeliveryFee() {
		return "3,000원";
	}
	
	// 단일 상품 결제 배송비 합한 가격(상세페이지에서 구매하기버튼을통해) 
	public String totalPriceForOne() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(price + 3000) + "원";
	}
}
