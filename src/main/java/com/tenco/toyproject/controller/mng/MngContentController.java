package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tenco.toyproject.dto.MngContentDto;
import com.tenco.toyproject.repository.entity.Content;
import com.tenco.toyproject.service.mng.MngContentService;
import lombok.extern.slf4j.Slf4j;

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
        if(content != null){
            model.addAttribute("content", content);
        }
        return "/mng/content/companyInfo";

    }

    @PostMapping("register")
    public String companyInfoRegister(MngContentDto dto) {
        try{
            if(dto.getContent() == null || dto.getContent().isEmpty()) {
                throw new CustomRestfullException("내용을 입력하세요", HttpStatus.BAD_REQUEST);
            }

            int result;

            System.out.println("=========== DTO getID ============" + dto.getId());

            if(dto.getId() != null) {
                System.out.println("=========== 이미 존재. 업데이트 할게요 ============");
                // 이미 존재
                result = mngContentService.updateMngContent(dto);
            } else {
                System.out.println("=========== 없네요. 새로 만들게요 ============");
                result = mngContentService.createMngContent(dto);
            }

            if(result != 1){
                throw new CustomRestfullException("회사 소개 등록에 실패했습니다", HttpStatus.BAD_REQUEST);
            }

            return "redirect:/mng/content/info";
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }


    }

    @GetMapping("disinfection-process")
    public String goToDisinfectionProcess(Model model) {
        // 등록된 소독 과정 조회
        Content content = mngContentService.getDisinfectionProcess();
        if (content != null){
            model.addAttribute("content", content);
        }
        return "/mng/content/disinfectionProcess";
    }

    @GetMapping("rules-of-use")
    public String goToRulesOfUse(Model model) {
        // 등록된 이용 수칙 조회
        Content content = mngContentService.getRulesOfUse();
        if (content != null){
            model.addAttribute("content", content);
        }

        return "/mng/content/rulesOfUse";
    }



}