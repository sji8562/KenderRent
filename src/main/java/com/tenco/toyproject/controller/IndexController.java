package com.tenco.toyproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    
    @GetMapping({"index","/"})
    public String home(){
        System.out.println("여기로 와따");
        return "main";
    }
    @GetMapping({"mng"})
    public String manager() {
    	System.out.println("매니저 페이지로 들어갑니다.");
    	return "mng/index";
    }
}
