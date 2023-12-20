package com.tenco.toyproject.dto;

import lombok.Data;
import org.springframework.data.relational.core.sql.In;

import java.sql.Time;
import java.sql.Timestamp;

public class MngBoardDTO {

    @Data
    public static class NoticeListDTO {
        private Integer id;
        private String title;
        private String userName;
        private Timestamp createdAt;
    }
    @Data
    public static class NoticeSubmitDTO{
        private String title;
        private String content;

    }
    @Data
    public static class NoticeUpdateDTO{
        private Integer id;
        private String title;
        private String content;
    }

    @Data
    public static class FaqSubmitDto {
        private int id;
        private String title;
        private String content;
        private int code;
    }

    @Data
    public static class QnaListDto {
        private Integer id;
        private String title; // 질문
        private Integer userId; // 질문 작성자
        private String email; // 질문 작성자
        private Timestamp createdAt;
        private Integer reply; // 답변 여부
    }
    
    // 231219 전우진
    @Data
    public static class ProductQnaListDto {
      private Integer id; // 문의데이터ID
      private Integer productId; // 제품ID
      private String title; // 질문
      private Integer userId; // 질문 작성자
      private String email; // 질문 작성자
      private Timestamp createdAt;
      private Integer reply; // 답변 여부
    }
}
