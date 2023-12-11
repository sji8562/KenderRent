package com.tenco.toyproject.dto;

import jakarta.persistence.Lob;
import lombok.Data;

@Data
public class MngContentDto {
    private Integer id;
    @Lob
    private String content;
}
