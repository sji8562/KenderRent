package com.tenco.toyproject.controller.mng;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mng")
@Slf4j
public class MngIndexController {
    @GetMapping("/login")
    public String goLoginPage() {
        return "mng/login";
    }
}
