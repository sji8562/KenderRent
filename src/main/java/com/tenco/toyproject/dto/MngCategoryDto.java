package com.tenco.toyproject.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class MngCategoryDto {

    private int id;
    private String firstCategoryName;
    private MngSecondCategory mngSecondCategory;

    @Data
    public class MngSecondCategory {
        private int secondId;
        private String secondCategoryName;
    }
}
