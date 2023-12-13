package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.Exception404;
import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngProductDto;
import com.tenco.toyproject.dto.MngProductUpdateDto;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject._core.utils.Define;
import com.tenco.toyproject.service.mng.MngProductService;
import com.tenco.toyproject.vo.PageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/mng/product")
@Slf4j
public class MngProductController {

    @Autowired
    private MngProductService mngService;
    @GetMapping("list")
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

    @GetMapping("/{pId}/detail")
    public String productDetail(Model model, @PathVariable Integer pId) {
        System.out.println(pId + "번");

        Product product = mngService.findProductById(pId);
        System.out.println("1512345343484531423dsadasdasdasdsads"+product.toString());
        model.addAttribute(product);

        return "mng/product/detail";
    }

    @GetMapping("{id}/delete")
    public String productDelete(@PathVariable Integer id) {

        mngService.deleteProduct(id);
        return "redirect:/mng/product/list";
    }

    @GetMapping("productForm")
    public String productCreate() {
        return "/mng/product/productForm";
    }

    @GetMapping("modify/{pId}")
    public String productModify(Model model, @PathVariable Integer pId) {
        Product product = mngService.findProductById(pId);
        List<FirstCategory> fCategory = mngService.findCategoryAll();
//        System.out.println(fCategory.toString());
//        model.addAttribute("fCategory", fCategory);
        List<SecondCategory> sCategory = mngService.findSecondCategoryForRent();
        model.addAttribute("sCategory", sCategory);

        model.addAttribute("product",product);
        model.addAttribute("fCategory",fCategory);
        return "mng/product/modifyForm";
    }

    @GetMapping("register")
    public String productRegister(Model model) {

//        List<FirstCategory> fCategory = mngService.findCategoryAll();
//        model.addAttribute("fCategory", fCategory);

        List<SecondCategory> sCategory = mngService.findSecondCategoryForRent();
        model.addAttribute("sCategory", sCategory);


        return "mng/product/submitForm";
    }

    @GetMapping("second-category")
    public List<SecondCategory> getScondCategory(Model model) {
        List<SecondCategory> secondCategory = mngService.findSecondCategoryForRent();

        return secondCategory;
    }

    @PostMapping("register")
    public String registerProduct(MngProductDto dto) {

        if(dto.getName() == null || dto.getName().isEmpty()) {
            throw new Exception404("물품명을 입력해주세요");
        }

        if(dto.getPrice() <= 0) {
            throw new Exception500("물품 가격은 0원 이하일 수 없습니다");
        }

        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("제품 상세 설명을 입력해주세요");
        }

        // 상품 썸네일 등록
        MultipartFile file = null;

        if(dto.getFile() != null || !dto.getFile().isEmpty()) {
            file = dto.getFile();
        }

        // 등록된 파일이 있으면
        if(!file.isEmpty()) {
            // 파일 사이즈 체크
            if(file.getSize() > Define.MAX_FILE_SIZE) {
                throw new Exception500("파일 크기는 200MB 미만이어야 합니다");
            }
        }

        if(file != null && !file.isEmpty()) {
            try {
                // 업로드 파일 경로
                String saveDirectory = Define.UPLOAD_DIRECTORY;

                // 폴더가 없다면
                File dir = new File(saveDirectory);
                if(dir.exists() == false) {
                    dir.mkdirs();
                }

                // 파일 이름 중복 예방
                UUID uuid = UUID.randomUUID();
                // 새로운 파일 이름
                String fileName = "";

                if(file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                    fileName = uuid + "_" + file.getOriginalFilename();
                    Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                    Files.write(uploadPath, file.getBytes());
                }else {
                    fileName = null;
                }
                // 전체 경로 지정
                dto.setPicUrl(fileName);

            } catch(Exception e) {
                System.out.println(e.getMessage());
            }
        }

        mngService.createProduct(dto);

        return "redirect:/mng/product/list";
    }

    @PostMapping("/{id}/modify")
    public String modifyProduct(MngProductUpdateDto dto, @PathVariable Integer id) {

        if(dto.getName() == null || dto.getName().isEmpty()) {
            throw new Exception404("물품명을 입력해주세요");
        }

        if(dto.getPrice() <= 0) {
            throw new Exception500("물품 가격은 0원 이하일 수 없습니다");
        }

        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("제품 상세 설명을 입력해주세요");
        }

        // 상품 썸네일 등록
        MultipartFile file = null;
        if(dto.getFile() != null || !dto.getFile().isEmpty()){
            file = dto.getFile();
        }


        // 등록된 파일이 있으면
        if(!file.isEmpty()) {
            // 파일 사이즈 체크
            if(file.getSize() > Define.MAX_FILE_SIZE) {
                throw new Exception500("파일 크기는 200MB 미만이어야 합니다");
            }
        }
        if(file!= null && !file.isEmpty()){
            try {
                // 업로드 파일 경로
                String saveDirectory = Define.UPLOAD_DIRECTORY;
//                String saveDirectory = "/";

                // 폴더가 없다면
                File dir = new File(saveDirectory);
                if(dir.exists() == false) {
                    dir.mkdirs();
                }

                // 파일 이름 중복 예방
                UUID uuid = UUID.randomUUID();
                // 새로운 파일 이름
                String fileName = "";

                if(file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()){
                    fileName = uuid + "_" + file.getOriginalFilename();
                    Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                    Files.write(uploadPath, file.getBytes());

                }else {
                    if(dto.getPicUrl() != null) {

                        fileName = dto.getPicUrl();
                    } else {
                        fileName = null;

                    }
                }
                // 전체 경로 지정

                dto.setPicUrl(fileName);

            } catch(Exception e) {
                System.out.println(e.getMessage());
            }
        }


        System.out.println("CONTROLLER UPDATE 전" + dto.toString());

        mngService.updateProduct(dto);

        return "redirect:/mng/product/"+dto.getId()+"/detail";

    }
}
