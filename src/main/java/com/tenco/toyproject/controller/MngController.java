package com.tenco.toyproject.controller;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import com.tenco.toyproject._core.handler.exception.Exception404;

import com.tenco.toyproject.dto.MngRentDTO;
import com.tenco.toyproject.dto.MngCategoryDto;
import com.tenco.toyproject.dto.MngProductDto;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.utils.Define;
import jakarta.mail.Multipart;
import jdk.jfr.Category;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject.repository.entity.Product;


import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngUserDTO;

import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.MngService;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/mng")
@Slf4j
public class MngController {

    @Autowired
    private MngService mngService;

    @GetMapping("/login")
    public String mngLogin() {
        return "mng/login";
    }

    @GetMapping("/test")
    public String test() {
        return "mng/pagesProfile";
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
