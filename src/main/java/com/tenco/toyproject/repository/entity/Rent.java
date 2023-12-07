package com.tenco.toyproject.repository.entity;



import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Rent {
    private Integer id;
    private Timestamp startDay;
    private Timestamp endDay;
    private Timestamp createdAt;
    private Integer userId;
    private Integer productId;
}
