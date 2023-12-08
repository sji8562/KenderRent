package com.tenco.toyproject.repository.entity;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.beans.factory.annotation.Value;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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

}