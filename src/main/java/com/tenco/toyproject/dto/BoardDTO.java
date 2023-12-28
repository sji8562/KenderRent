package com.tenco.toyproject.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Integer boardId;
    private String title;
    private String content;
    private Integer code;
    private Integer createUser;
    private Integer createProduct;
    private Integer secret;
    private Timestamp createdAt;
    private Integer replyId;
    private String replyContent;
    private Timestamp replyAt;

}
