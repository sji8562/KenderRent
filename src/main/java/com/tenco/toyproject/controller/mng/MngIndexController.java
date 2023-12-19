package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject.dto.MngIndexDTO;
import com.tenco.toyproject.service.mng.MngIndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mng")
@Slf4j
public class MngIndexController {

    @Autowired
    private MngIndexService mngIndexService;

    @GetMapping("/login")
    public String goLoginPage() {
        return "mng/login";
    }
    @GetMapping({"/","/index"})
    public String manager(Model model) {

        System.out.println("매니저 페이지로 들어갑니다.");
        List<MngIndexDTO> dtos =mngIndexService.findByCreatedAt();
        System.out.println(dtos.toString());
        model.addAttribute("dtos",dtos);
        return "/mng/index";
    }
}

