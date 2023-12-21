package com.tenco.toyproject.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class MessageController {
	private final DefaultMessageService messageService;
	private String fromNumber = "01047873752"; 
	private String APIKEY = "NCSRWW2H2O5V5EPE";
	private String APISECRETKEY = "PELHQ0EZNBMUWMBBLRLHSVXB0FTHBDFI";
	private String uri = "https://api.coolsms.co.kr";

    public MessageController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize(APIKEY, APISECRETKEY, uri);
    }
    
    @PostMapping("/send-one")
    public SingleMessageSentResponse sendOne(String userName, String toNumber) {
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom(fromNumber);
        message.setTo(toNumber);
        message.setText(userName + "님 주문 완료.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }
    
    

}
