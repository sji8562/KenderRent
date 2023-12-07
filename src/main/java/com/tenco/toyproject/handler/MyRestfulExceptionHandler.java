package com.tenco.toyproject.handler;

import com.tenco.toyproject.handler.exception.CustomRestfulException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class MyRestfulExceptionHandler {

    @ExceptionHandler(Exception.class)
    public void exception(Exception e) {
        System.out.println("----------------");
        System.out.println(e.getClass().getName());
        System.out.println(e.getMessage());
        System.out.println("----------------");
    }

    @ExceptionHandler(CustomRestfulException.class)
    public String basicException(CustomRestfulException e) {
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "' );");
        sb.append("</script>");

        return sb.toString();
    }
}
