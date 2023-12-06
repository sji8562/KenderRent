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
	private String vedio;
	private String grade;
	private Timestamp createdAt;
	
	private String firstCategoryName;
	private String secondCategoryName;

	
	public String formatStatus() {
		String condition = null;
		if (status == 1) {
			condition = "최상급";
		} else if (status == 2) {
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

	public String formatStatusToString() { return ProductUtil.statusToString(status);
	}
}
