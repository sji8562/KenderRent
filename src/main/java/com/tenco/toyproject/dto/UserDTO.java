package com.tenco.toyproject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	private int id;
	private String email;
	private String password;
	private String userName;
	private String address;
	private String addressDetail;
	private String phoneNumber;
	private int level;
	private String sns; //social 회원가입 여부
}

