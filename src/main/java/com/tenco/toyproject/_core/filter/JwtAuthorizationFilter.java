package com.tenco.toyproject._core.filter;

import java.io.IOException;

import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// public class JwtAuthorizationFilter implements Filter{

    // @Override
    // public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)throws IOException, ServletException {
    //     HttpServletRequest request = (HttpServletRequest) req;
    //     HttpServletResponse response = (HttpServletResponse) resp;

    //     String jwt = request.getHeader("Authorization");
    //     if (jwt == null || jwt.isEmpty()) {
    //         onError(response, "토큰이 없습니다");
    //         return;
    //     }

        // try {
        //     DecodedJWT decodedJWT = JwtTokenUtils.verify(jwt);
        //     int id = decodedJWT.getClaim("id").asInt();
        //     String userId = decodedJWT.getClaim("loginId").asString();

        //     User sessionUser = User.builder().id(id).loginId(userId).build();

        //     HttpSession session = request.getSession();
        //     session.setAttribute("sessionUser", sessionUser);

        //     chain.doFilter(request, response);
        // } catch (SignatureVerificationException | JWTDecodeException e1) {
        //     onError(response, "토큰 검증 실패");
        // } catch (TokenExpiredException e2) {
        //     onError(response, "토큰 시간 만료");
        // }
    // }

    // ExceptionHandler를 호출할 수 없다. 왜? Filter니까!! DS전에 작동하니까!!
    // private void onError(HttpServletResponse response, String msg) {
    //     Exception401 e401 = new Exception401(msg);

    //     try {
    //         String body = new ObjectMapper().writeValueAsString(e401.body());
    //         response.setStatus(e401.status().value());
    //         // response.setHeader("Content-Type", "application/json; charset=utf-8");
    //         response.setContentType(MediaType.APPLICATION_JSON_VALUE);
    //         PrintWriter out = response.getWriter();
    //         out.println(body);
    //     } catch (Exception e) {
    //         System.out.println("파싱 에러가 날 수 없음");
    //     }
    // }
// }