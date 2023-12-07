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

    @GetMapping("/product/list")
    public String productList(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage
            , @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

        int total = mngService.countProductList();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }

        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", pageVO);

        System.out.println("===============");
        System.out.println(cntPerPage);
        System.out.println("===============");

        List<Product> productList = mngService.findProductAll(pageVO);
        System.out.println("productList" + productList);
        model.addAttribute(productList);

        return "mng/product/list";

    }

    @GetMapping("/product/detail/{pId}")
    public String productDetail(Model model, @PathVariable Integer pId) {
        System.out.println(pId + "번");

        Product product = mngService.findProductById(pId);
        model.addAttribute(product);

        return "mng/product/detail";
    }

    @GetMapping("/product/{id}/delete")
    public String productDelete(@PathVariable Integer id) {

        mngService.deleteProduct(id);
        return "redirect:/mng/product/list";
    }

    @GetMapping("/product/productForm")
    public String productCreate() {
        return "/mng/product/productForm";
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

    @GetMapping("/product/modify/{pId}")
    public String productModify(Model model, @PathVariable Integer pId) {
        FirstCategory fCategory = mngService.findCategoryAll();
        Product product = mngService.findProductById(pId);

//        List<FirstCategory> fCategory = mngService.findCategoryAll();
//        System.out.println(fCategory.toString());
//        model.addAttribute("fCategory", fCategory);
        List<SecondCategory> sCategory = mngService.findSecondCategoryForRent();
        model.addAttribute("sCategory", sCategory);


        model.addAttribute("product",product);
        model.addAttribute("fCategory",fCategory);
        return "mng/product/modifyForm";
    }

    @GetMapping("/product/register")
    public String productRegister(Model model) {

//        List<FirstCategory> fCategory = mngService.findCategoryAll();
//        model.addAttribute("fCategory", fCategory);

        List<SecondCategory> sCategory = mngService.findSecondCategoryForRent();
        model.addAttribute("sCategory", sCategory);


        return "mng/product/submitForm";
    }

    @GetMapping("/product/second-category")
    public List<SecondCategory> getScondCategory(Model model) {
        List<SecondCategory> secondCategory = mngService.findSecondCategoryForRent();

        return secondCategory;
    }

    @PostMapping("/product/register")
    public String registerProduct(MngProductDto dto) {
        System.out.println("========= 들어왔냐 =====" + dto.toString());

        if(dto.getName() == null || dto.getName().isEmpty()) {
            throw new Exception404("물품명을 입력해주세요");
        }

        if(dto.getPrice() <= 0) {
            throw new Exception500("물품 가격은 0원 이하일 수 없습니다");
        }

        if(dto.getPrice() <= 0) {
            throw new Exception500("물품 가격은 0원 이하일 수 없습니다");
        }

        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("제품 상세 설명을 입력해주세요");
        }

        // 상품 썸네일 등록
        MultipartFile file = dto.getFile();
        // 등록된 파일이 있으면
        if(file.isEmpty() == false) {
            // 파일 사이즈 체크
            if(file.getSize() > Define.MAX_FILE_SIZE) {
                throw new Exception500("파일 크기는 200MB 미만이어야 합니다");
            }
        }

        try {
            // 업로드 파일 경로
            String saveDirectory = Define.UPLOAD_DIRECTORY;

            // 폴더가 없다면
            File dir = new File(saveDirectory);
            if(dir.exists() == false) {
                dir.mkdir();
            }

            // 파일 이름 중복 예방
            UUID uuid = UUID.randomUUID();
            // 새로운 파일 이름
            String fileName = uuid + "_" + file.getOriginalFilename();
            // 전체 경로 지정
            String uploadPath = Define.UPLOAD_DIRECTORY + File.separator + fileName;
            File destination = new File(uploadPath);

            file.transferTo(destination); // 실제 생성

            dto.setPicUrl(fileName);

        } catch(Exception e) {
            System.out.println(e.getMessage());
        }

        mngService.createProduct(dto);

        return "redirect:/mng/product/list";
    }
}
