package com.tenco.toyproject.dto;

import lombok.Data;

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
        private String content; // 답변
        private Integer userId; // 질문 작성자
        private Timestamp createdAt;
    }
}
