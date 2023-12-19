package com.tenco.toyproject.repository.entity;

import java.sql.Timestamp;

public class Review {
    private int id;
    private int userId;
    private String email;
    private int productId;
    private String content;
    private Timestamp createdAt;
    private int firstCategoryId;
    private String firstCategoryName;
    private int secondCategoryId;
    private String secondeCategoryName;
    private String name;
    private String picUrl;
}
