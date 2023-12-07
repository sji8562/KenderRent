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
	private String second_category_name;
	private int first_category_id;
}
