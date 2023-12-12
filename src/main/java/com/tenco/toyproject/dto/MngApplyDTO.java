package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;

public class MngApplyDTO {

    @Data
    public static class RentListDTO {
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
    public static class RentalDetailDTO {
        private Integer id;
        private String username;
        private String email;
        private String phoneNumber;
        private String productId;
        private String productName;
        private String productPicUrl;
        private Timestamp startDay;
        private Timestamp endDay;
        private String address;
        private String addressDetail;
        private String postNumber;
        private Integer status;
    }

    @Data
    public static class RentalDetailUpdateDTO {
        private Integer id;
        private String postNumber;
        private String address;
        private String addressDetail;
        private Integer status;
        private String startDay;
        private String endDay;
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
    public static class PurchaseListDTO {
        private int id;
        private String username;
        private int productId;
        private String productName;
        private Timestamp createdAt;
        private Integer status;
    }

}
