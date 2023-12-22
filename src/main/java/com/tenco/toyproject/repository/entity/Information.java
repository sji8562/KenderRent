package com.tenco.toyproject.repository.entity;

import com.tenco.toyproject._core.utils.DateUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Information {
    private int id;
    private int code;
    private String content;
    private Timestamp createdAt;
}
