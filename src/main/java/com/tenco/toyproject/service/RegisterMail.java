package com.tenco.toyproject.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.Message.RecipientType;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class RegisterMail {
	
	@Autowired
	JavaMailSender emailSender;
	
	private String authCode;
	
	public MimeMessage createMessage(String receiver) throws  MessagingException
															, UnsupportedEncodingException {
		System.out.println("받는 사람: " + receiver);
		System.out.println("인증 번호: " + authCode);
		
		MimeMessage message = emailSender.createMimeMessage();
		
		message.addRecipients(RecipientType.TO, receiver); // 인증 번호를 받는 사람
		message.setSubject("Kinderlend 비밀번호 찾기 인증 이메일입니다."); // 메일 제목
		
		String authMail = "";
		authMail += "<div style='margin: 100px;'>";
		authMail += "<h1> 안녕하세요. </h1>";
		authMail += "<h1> Kinderlend 비밀번호 찾기 인증 메일입니다. </h1>";
		authMail += "<br>";
		authMail += "<p>비밀번호 찾기 페이지에서 아래의 인증번호를 입력해주세요.</p>";
		authMail += "<br>";
		authMail += "<div align='center' sytle='border: 1px solid black; font-family: verdana';>";
		authMail += "<h3 style='color: blue;'>비밀번호 찾기 인증번호 입니다.</h3>";
		authMail += "<div style='font-size: 130%'>";
		authMail += "CODE: <strong>";
		authMail += authCode + "</strong></div><br>";
		authMail += "</div>";
		message.setText(authMail, "utf-8", "html");
		message.setFrom(new InternetAddress("kinderlend@naver.com", "Kinderlend_Admin"));
		
		return message;
	
	}
	
	//랜덤한 6자리 인증번호 전송
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random random = new Random();
		
		for (int i = 0; i < 6; i++) { // 6자리 랜덤한 숫자
			int index = random.nextInt(2); // 0 혹은 1
			
			switch (index) {
			case 0:
				key.append((char) ((int) (random.nextInt(26)) + 65));
				// A-Z
				break;
			case 1:
				key.append((random.nextInt(10)));
				// 0-9
				break;
			}
		}
		return key.toString();
	}
	
	// 메일 발송
	// sendSimpleMessage의 매개변수로 들어온 receiver는 이메일 주소가 됨
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담음
	// Bean으로 등록해둔 javaMail 객체를 사용하여 메일을 보냄
	public String sendSimpleMessage(String receiver) throws Exception {
		
		authCode = createKey();
		
		MimeMessage message = createMessage(receiver);
		//메일 발송
		try {
			emailSender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}
		
		return authCode;
		
	}
	
	
}
