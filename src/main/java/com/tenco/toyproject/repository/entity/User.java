package com.tenco.toyproject.repository.entity;

import java.security.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class User {

    
    private int id;
    
    private String loginId;
    
    private String email; // 인증시 필요한 필드(인증용)
    
    private String password;
    
    private String userName;
    
    private String phoneNumber;
    
    private int manager; // 1 : 유저 / 2 : 관리자
    
    private Timestamp userCreatedAt; // 가입일시
    private Timestamp userUpdatedAt; // 수정일시

    @Builder
    public User(int id, String loginId, String email, String password, String userName, String phoneNumber, int manager,
            Timestamp userCreatedAt, Timestamp userUpdatedAt) {
        this.id = id;
        this.loginId = loginId;
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.manager = manager;
        this.userCreatedAt = userCreatedAt;
        this.userUpdatedAt = userUpdatedAt;
    }

    // TODO : 추가 기능 - 등급, 포인트

}