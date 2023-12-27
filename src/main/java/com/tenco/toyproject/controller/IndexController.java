package com.tenco.toyproject.controller;

import ch.qos.logback.core.CoreConstants;

import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.service.IndexService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tenco.toyproject.service.ProductService;

import java.util.List;

@Controller
public class IndexController {
	@Autowired
	ProductService productService;

    @Autowired
    IndexService indexService;

    @Autowired
    HttpSession session;
    @GetMapping({"index","/"})
    public String home(Model model){

        List<Product> productList = productService.findProductForMain();
        model.addAttribute("productList", productList);

        return "index";
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
