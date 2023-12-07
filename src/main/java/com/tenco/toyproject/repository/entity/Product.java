package com.tenco.toyproject.repository.entity;


import java.security.Timestamp;


import com.tenco.toyproject.utils.DecimalUtil;
import com.tenco.toyproject.utils.ImageUtil;
import com.tenco.toyproject.utils.ProductUtil;
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
			condition = "최상";
		} else if (grade == 2) {
			condition = "상";
		} else if (grade == 3) {
			condition = "중";
		} else if (grade == 4) {
			condition = "하";
		} else {
			condition = "최하";
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

	public String formatStatusToString() { return ProductUtil.statusToString(status);}

	public String formatGradeToString() { return ProductUtil.gradeToString(grade);}
}
