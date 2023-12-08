package com.tenco.toyproject.controller;

import ch.qos.logback.core.CoreConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tenco.toyproject.service.ProductService;

@Controller
public class IndexController {
	@Autowired
	ProductService productService;
    
    @GetMapping({"index","/"})
    public String home(Model model){
    	
        return "index";
    }
    @GetMapping({"mng"})
    public String manager() {
    	System.out.println("매니저 페이지로 들어갑니다.");
    	return "mng/index";
    }

    @GetMapping("/mng/pages-profile")
    public String profile() {
        return "/mng/pages-profile";
    }

    @GetMapping("/icon-material")
    public String icon() {
        return "/mng/icon-meterial";
    }
    
    

}
