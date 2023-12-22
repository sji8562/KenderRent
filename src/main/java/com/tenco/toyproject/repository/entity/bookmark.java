package com.tenco.toyproject.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class bookmark {
	private Integer Id;
	private Integer userId;
	private Integer productId;
}
