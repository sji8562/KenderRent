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
	private String socialChk; //social 회원가입 여부
	
	// Social 회원 회원가입 전용 생성자
	public UserDTO(int id, String email, String userName, String socialChk) {
		this.id = id;
		this.email = email;
		this.userName = userName;
		this.socialChk = socialChk;
	}

}

