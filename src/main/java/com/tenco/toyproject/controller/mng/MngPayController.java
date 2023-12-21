package com.tenco.toyproject.controller.mng;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mng/pay")
@Slf4j
public class MngPayController {

    private static final Logger logger = LoggerFactory.getLogger(MngProductController.class);

    @GetMapping("list")
    public String payList() {
        return "/mng/pay/list";
    }

}
