package com.tenco.toyproject.repository.entity;

import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Content {
    private int id;
//    @Lob
    private String content;
    private Timestamp createdAt;
}
