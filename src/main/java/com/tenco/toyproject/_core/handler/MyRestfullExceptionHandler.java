package com.tenco.toyproject._core.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;

/*
 * 예외 발생시 데이터를 내려 줄 수 있다.
 * */

@RestControllerAdvice // IoC 대상 + AOP 기반
public class MyRestfullExceptionHandler {
	
	@ExceptionHandler(CustomRestfullException.class)
	public String basicException(CustomRestfullException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+e.getMessage() +"');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}

}
