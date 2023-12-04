package com.tenco.toyproject.repository.entity;

import java.security.Timestamp;

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
@Entity
@Table(name = "user")
public class User {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 100, nullable = false, unique = true)
    private String email; // 인증시 필요한 필드(인증용)
    @Column(length = 256, nullable = false)
    private String password;
    @Column(length = 256, nullable = false)
    private String userName;
    @Column(length = 256, nullable = false)
    private String phoneNumber;
    @Column
    @ColumnDefault("1")
    private int level; // 1 : 유저 / 2 : 관리자
    @Column(length = 256)
    @CreationTimestamp
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