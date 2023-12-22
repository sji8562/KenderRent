package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;


public class MngIndexDTO {

    @Data
    public static class MngTotalDTO{
        private List<MngMonthDTO> mngMonthDTO;
        private Integer payOff;

    }
    @Data
    public static class MngMonthDTO{
        private String type;
        private String date;
        private Integer count;
        private Integer price;
    }
    @Data
    public static class MngCountDTO{
        private Integer rentCount;
        private Integer saleCount;
        private Integer purchaseCount;
        private Integer totalCount;
    }
    @Data





    public static class MngStatusDTO{
        private String transactionType;
        private String userName;
        private Integer status;
        private Integer price;
        private Timestamp createdAt;


    }
    @Data
    public static class MngReviewDTO{
        private String userName;
        private String productName;
        private String content;
        private Integer rate;
        private Timestamp createdAt;
    }


}
