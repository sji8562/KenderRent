package com.tenco.toyproject._core.handler.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class CustomRestfulException extends RuntimeException {

    private HttpStatus status;

    public CustomRestfulException(String message, HttpStatus httpStatus) {
        super(message);
        this.status = httpStatus;
    }
}
