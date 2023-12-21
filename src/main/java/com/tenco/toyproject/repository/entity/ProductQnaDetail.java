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
public class ProductQnaDetail {
    private Integer id;
    private String title; // 질문
    private String content; // 질문 내용
    private Integer userId; // 질문 작성자
    private String email; // 질문 작성자
    private Timestamp createdAt; // 질문 작성일

    private Integer replyId; // 답변 고유번호
    private String replyContent; // 답변 내용
    private Timestamp replyCreatedAt; // 답변일

    public String formatCreatedAtToString() {
        return DateUtil.dateToString(createdAt);
    }
    public String formatReplyCreatedAtToString() {
        return DateUtil.dateToString(replyCreatedAt);
    }
}
