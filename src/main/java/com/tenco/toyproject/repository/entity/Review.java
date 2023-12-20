package com.tenco.toyproject.repository.entity;

import com.tenco.toyproject._core.utils.DateUtil;
import com.tenco.toyproject._core.utils.ImageUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private Integer id;
    private Integer userId;
    private String email;
    private Integer productId;
    private String content;
    private Integer rate;
    private Timestamp createdAt;
    private Integer firstCategoryId;
    private String firstCategoryName;
    private Integer secondCategoryId;
    private String secondCategoryName;
    private String name;
    private Integer price;
    private String picUrl;

    public String formatCreatedAtToString() { return DateUtil.dateToString(createdAt);}

    public String formatImgUrl() {

        return ImageUtil.checkImageUrl(picUrl);
    }
}
