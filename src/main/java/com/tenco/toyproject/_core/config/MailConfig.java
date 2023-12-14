package com.tenco.toyproject._core.config;

import java.util.Properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import lombok.Data;
import lombok.ToString;

@Configuration
@PropertySource("classpath:mailAuth.properties")
@ConfigurationProperties(prefix="mail")
@Data
@ToString
public class MailConfig {
	
	private String username;
	private String password;
	
	@Bean
	public JavaMailSender javaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.naver.com"); 
		// 메인 도메인(여기서는 smtp) 서버주소
		javaMailSender.setUsername(username); 
		// 네이버 아이디
		javaMailSender.setPassword(password); 
		//네이버 비밀번호
		javaMailSender.setPort(465); 
		// 메일 인증 서버 포트넘버
		javaMailSender.setJavaMailProperties(getMailProperties()); 
		// 메일 인증 서버 정보 가져오기
		
		return javaMailSender;
		
	}

	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", "smtp");
		// 프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true");
		// smtp 인증
		properties.setProperty("mail.smtp.starttls.enable", "true");
		// smtp starttls 사용
		properties.setProperty("mail.debug", "true");
		// 디버그 사용
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
		// ssl 인증 서버는 smtp.naver.com
		properties.setProperty("mail.smtp.ssl.enable", "true");
		// ssl 사용
		return properties;
		
	}

}
