package com.tenco.toyproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    
    @GetMapping({"index","/"})
    public String home(){
        return "index";
    }
    @GetMapping({"mng"})
    public String manager() {
    	System.out.println("매니저 드간다");
    	return "mng/index";
    }
}
