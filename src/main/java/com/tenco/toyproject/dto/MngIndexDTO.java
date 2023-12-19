package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MngIndexDTO {
    private String date;
    private Integer count;
    private Integer price;
}
