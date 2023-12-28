package com.tenco.toyproject.dto;

import lombok.Data;

@Data
public class UserUpdateDTO {
    private String password;
    private String userName;
    private String postNumber;
    private String address;
    private String addressDetail;
    private String phoneNumber;
}
