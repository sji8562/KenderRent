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
public class Board {
    private int id;
    private String title;
    private String content;
    private int userId;
    private int productId;
    private Timestamp createdAt;

    private int reply; // 답변 여부
    private String email; // 작성자 이메일
    private Timestamp replyCreatedAt; // 답변 일시

    public String formatCreatedAtToString() {
        return DateUtil.dateToString(createdAt);
    }
    public String formatReplyCreatedAtToString() {
        return DateUtil.dateToString(replyCreatedAt);
    }
}
