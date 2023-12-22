package com.tenco.toyproject.repository.entity;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private int id;
    private String email; // 인증시 필요한 필드(인증용)
    private String password;
    private String userName;
    private String phoneNumber;
    private String postNumber;
    private String address;
    private String addressDetail;
    private int level; // 1 : 유저 / 2 : 관리자
    private Timestamp createdAt; // 가입일시
    private String sns;

    @Builder
    public User(int id, String email, String password, String userName, String phoneNumber, int level,
            Timestamp createdAt) {
        this.id = id;
      
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.level = level;
        this.createdAt = createdAt;

    }


	public void setToken(String token) {
		// TODO Auto-generated method stub
		
	}

}