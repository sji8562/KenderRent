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
}
