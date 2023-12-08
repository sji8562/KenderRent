package com.tenco.toyproject.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mng")
@Slf4j
public class MngController {

//    @Autowired
//    private MngService mngService;


    

    @GetMapping("/test")
    public String test() {
        return "mng/apply/test";
    }

    @GetMapping("/form-basic")
    public String formBasic() {
        return "mng/form-basic";
    }

    @GetMapping("/table")
    public String tableBasic() {
        return "mng/tableBasic";
    }

    @GetMapping("/icon-material")
    public String iconMaterial() {
        return "mng/icon-material";
    }

    @GetMapping("/blank")
    public String blank() {
        return "mng/starter-kit";
    }

    @GetMapping("/error-404")
    public String errorPage() {
        return "mng/error-404";
    }


}
