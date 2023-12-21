package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Time;
import java.sql.Timestamp;

public class MngProductReplyDTO {
    @Data
    public static class ProductQnaReplyDto {
        private Integer boardId;
        private Integer replyId;
        private String replyContent;
    }
}
