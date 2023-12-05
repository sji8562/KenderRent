package dto;

import lombok.Data;

@Data
public class GetProductDetailDto {
	private Integer id;
	private Integer firstCategoryId;
	private Integer secondCategoryId;
	private Integer price;
	private String name;
	private Integer status;
}
