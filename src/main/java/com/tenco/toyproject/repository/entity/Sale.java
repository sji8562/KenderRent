package com.tenco.toyproject.repository.entity;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Sale {
	private int id;
	private int userId;
	private int productId;
	private int status;
	private int postNumber;
	private String address;
	private String addressDetail;
	private Timestamp createdAt;
	private String tid;
	
	public String formatTime() {
      	LocalDateTime localDateTime = createdAt.toLocalDateTime();
      	String formattedDate = localDateTime.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
      	return formattedDate;
	 }
}
