package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngContentDto;
import com.tenco.toyproject.service.mng.MngContentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mng/content")
@Slf4j
public class MngContentController {

    @Autowired
    private MngContentService mngContentService;

    @GetMapping("info")
    public String informationList() {
        return "mng/company/info";
    }

    @PostMapping("register")
    public String companyInfoPage(MngContentDto dto) {
        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("내용을 입력해주세요");
        }

        mngContentService.createMngContent(dto);

        return "redirect:/mng/content/info";

    }

//    @PostMapping("info")
//    public String registerInfo(MngContentDto dto) {  }



}
