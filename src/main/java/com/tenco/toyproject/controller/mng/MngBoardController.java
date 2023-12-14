package com.tenco.toyproject.controller.mng;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mng/board")
public class MngBoardController {
    @GetMapping("notice")
    public String notice(){
        return null;
    }
}
