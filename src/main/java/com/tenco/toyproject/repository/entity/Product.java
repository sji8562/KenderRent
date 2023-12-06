package com.tenco.toyproject.repository.entity;


import java.security.Timestamp;


import com.tenco.toyproject.utils.DecimalUtil;
import com.tenco.toyproject.utils.ImageUtil;
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
	private int grade;
	private Timestamp createdAt;
	
	private String firstCategoryName;
	private String secondCategoryName;


	public String formatStatus(int grade) {
		String condition = null;
		if (grade == 1) {
			condition = "최상급";
		} else if (grade == 2) {
			condition = "상급";
		}
		return condition;
	}

	public String formatDecimal() {
		return DecimalUtil.decimalToString(price);
	}

	// KWON
	public String formatImgUrl() {
		return ImageUtil.checkImageUrl(picUrl);
	}

}
