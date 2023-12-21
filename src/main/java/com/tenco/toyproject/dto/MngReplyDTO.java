package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Time;
import java.sql.Timestamp;

public class MngReplyDTO {
    @Data
    public static class QnaReplyDto {
        private Integer boardId;
        private Integer replyId;
        private String replyContent;
    }
    
    // 231219 전우진
    @Data
    public static class ProductQnaReplyDto {
      private Integer boardId;
      private Integer replyId;
      private String replyContent;
    }
}
