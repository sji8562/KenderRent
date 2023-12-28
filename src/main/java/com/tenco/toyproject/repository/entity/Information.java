package com.tenco.toyproject.repository.entity;

import com.tenco.toyproject._core.utils.DateUtil;
import jakarta.persistence.Lob;
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
//    @Lob
    private String content;
    private Timestamp createdAt;
}
