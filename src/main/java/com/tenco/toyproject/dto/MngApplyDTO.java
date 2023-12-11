package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;

public class MngApplyDTO {

    @Data
    public static class RentListDTO{
        private Integer id;
        private String username;
        private String productId;
        private String productName;
        private Integer status;
        private Timestamp startDay;
        private Timestamp endDay;
        private Timestamp createdAt;
    }

    @Data
    public static class SaleListDTO {
        private int id;
        private String username;
        private int productId;
        private String productName;
        private Timestamp createdAt;
        private Integer status;

    }
    @Data
    public static class PurchaseListDTO{
        private int id;
        private String username;
        private int productId;
        private String productName;
        private Timestamp createdAt;
        private Integer status;
    }

}
