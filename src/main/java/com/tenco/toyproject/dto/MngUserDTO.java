package com.tenco.toyproject.dto;


import lombok.Data;

public class MngUserDTO {

	@Data
	public static class UpdateDTO{
		private String email;
		private String username;
		private String password;
        private String phoneNumber;
    }
}
