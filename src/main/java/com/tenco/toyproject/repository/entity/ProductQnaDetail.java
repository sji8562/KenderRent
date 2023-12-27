package com.tenco.toyproject.repository.entity;



import java.sql.Timestamp;

import com.tenco.toyproject._core.utils.DateUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductQnaDetail {

    private Integer id; //문의하달ID
    private Integer productId; //문의제품ID
    private String productName;
    
    private String title; // 문의 제목
    private String content; // 문의 내용
    private Integer userId; // 문의 작성자 ID
    private String email; // 문의 작성자
    private Timestamp createdAt; // 문의 작성일

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