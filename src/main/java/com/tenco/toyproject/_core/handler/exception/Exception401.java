package com.tenco.toyproject._core.handler.exception;

import org.springframework.http.HttpStatus;

import com.tenco.toyproject._core.utils.ApiUtils;

import lombok.Getter;

// 인증 안됨
@Getter
public class Exception401 extends RuntimeException {
    public Exception401(String message) {
        super(message);
    }

    public ApiUtils.ApiResult<?> body() {
        return ApiUtils.error(getMessage(), HttpStatus.UNAUTHORIZED);
    }

    public HttpStatus status() {
        return HttpStatus.UNAUTHORIZED;
    }
}