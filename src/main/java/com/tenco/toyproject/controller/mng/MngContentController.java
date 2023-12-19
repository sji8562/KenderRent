package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngContentDto;
import com.tenco.toyproject.repository.entity.Content;
import com.tenco.toyproject.service.mng.MngContentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "mng/content/info";
    }

    // 등록된 회사 소개 조회
    @GetMapping("register")
    public String companyInfoPage(Model model) {

        Content content = mngContentService.getCompanyInfo();
        model.addAttribute("content", content);

        return "/mng/content/companyInfo";

    }

    @PostMapping("register")
    public String companyInfoRegister(MngContentDto dto) {
        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("내용을 입력해주세요");
        }

        // 이미 등록된 회사 소개가 있는지 확인

        mngContentService.createMngContent(dto);

        return "redirect:/mng/content/info";

    }

    @GetMapping("disinfection-process")
    public String goToDisinfectionProcess(Model model) {
        // 등록된 소독 과정 조회
        Content content = mngContentService.getDisinfectionProcess();
        model.addAttribute("content", content);

        return "/mng/content/disinfectionProcess";
    }

    @GetMapping("rules-of-use")
    public String goToRulesOfUse(Model model) {
        // 등록된 이용 수칙 조회
        Content content = mngContentService.getRulesOfUse();
        model.addAttribute("content", content);
        return "/mng/content/rulesOfUse";
    }



}
