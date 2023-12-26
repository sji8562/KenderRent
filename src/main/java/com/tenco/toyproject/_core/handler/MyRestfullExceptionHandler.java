package com.tenco.toyproject._core.handler;
import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
public class MyRestfullExceptionHandler {

    @ExceptionHandler(CustomRestfullException.class)
    public String basicException(CustomRestfullException e) {

        System.out.println("여기로 왔어??????" + e.getMessage());

        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert( '" + e.getMessage() + "' );");
        sb.append("history.back()");
        sb.append("</script>");

        return sb.toString();
    }
}
