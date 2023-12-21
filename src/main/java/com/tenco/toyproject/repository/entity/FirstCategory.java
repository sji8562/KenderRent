package com.tenco.toyproject.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FirstCategory {
	private int id;
	private String firstCategoryName;
	private  Integer code;
}
