package com.tenco.toyproject.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SecondCategory {
	private int id;
	private String secondCategoryName;
	private int firstCategoryId;
}
