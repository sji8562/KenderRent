package com.tenco.toyproject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class UserSignUpFormDto {
	
	private String email;
	private String password;
	private String username;
	private String postNumber;
	private String address;
	private String addressDetail;
	private String phoneNumber;

}
