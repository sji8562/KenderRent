package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;

public class MngRentDTO {

    @Data
    public static class RentListDTO{
        private Integer id;
        private String username;
        private String productId;
        private String productName;
        private Timestamp startDay;
        private Timestamp endDay;
        private Timestamp createdAt;
    }


}
