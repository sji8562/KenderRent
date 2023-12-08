package com.tenco.toyproject._core.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomRestfulException extends Exception {
	
	private HttpStatus status;
	
	public CustomRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.status = httpStatus;
	}

}
