package com.tenco.toyproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tenco.toyproject.repository.entity.User;

import jakarta.servlet.http.HttpSession;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class MessageController {
	final DefaultMessageService messageService;
	@Autowired
	private HttpSession session;
	private String fromNumber = "01047873752"; 

    public MessageController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("INSERT_API_KEY", "INSERT_API_SECRET_KEY", "https://api.coolsms.co.kr");
    }
    
//    @PostMapping("/send-one")
//    public SingleMessageSentResponse sendOne() {
//    	User principal = (User) session.getAttribute("principal");
//    	String toNumber = String.valueOf(principal.getPhoneNumber());
//        Message message = new Message();
//        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
//        message.setFrom(fromNumber);
//        message.setTo(toNumber);
//        message.setText("한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가됩니다.");
//
//        SingleMessageSentResponse response = this.messageService.sendOne(new Sing)
//        System.out.println(response);
//
//        return response;
//    }

}
