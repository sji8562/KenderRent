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
}
