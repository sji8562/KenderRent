package com.tenco.toyproject.repository.entity;

import com.tenco.toyproject._core.utils.DateUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.DateFormat;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private int id;
    private String title;
    private String content;
    private int userId;
    private int productId;
    private Timestamp createdAt;

    public String formatCreatedAtToString() {
        return DateUtil.dateToString(createdAt);
    }
}
