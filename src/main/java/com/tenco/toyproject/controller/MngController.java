package com.tenco.toyproject.controller;


import java.util.List;
import java.util.Map;



import com.tenco.toyproject.dto.MngRentDTO;


import com.tenco.toyproject.dto.MngCategoryDto;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.SecondCategory;

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

    @GetMapping("/apply/list")
    public String applyList() {

        return "mng/apply/list";
    }
    @GetMapping("/apply/rental-list")
    public String rentalList(Model model,PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage,@RequestParam(value = "cntPerPage",required = false) String cntPerPage) {
        int total = mngService.countRentList();
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
        System.out.println(cntPerPage);

        List<MngRentDTO.RentListDTO> rentList = mngService.findrentAll(pageVO);
        System.out.println(rentList.stream().toList());
        model.addAttribute("rentList", rentList);

        return "mng/apply/rental/rentalList";
    }
    @GetMapping("/apply/sale-list")
    public String saleList() {
        return "mng/apply/sale/saleList";
    }
    @GetMapping("/apply/purchase-list")
    public String purchaseList() {
        return "mng/apply/purchase/purchaseList";
    }


    @GetMapping("/user/list")
    public String UserTable(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage
            , @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

        List<User> userPG = null;
        //model.addAttribute("keyword", keyword);

        //if(keyword.isBlank()){
        //  userPG = mngService.findAll(page);
        //}else{
        //userPG = mngService.findAll(page,keyword);
        //}
        //System.out.println(userPG.getNumber());
        //model.addAttribute("userPG", userPG);
        //model.addAttribute("prevPage", userPG.getNumber() - 1);
        //model.addAttribute("nextPage", userPG.getNumber() + 1);
        int total = mngService.countUserList();
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
        System.out.println(cntPerPage);
        List<User> userList = mngService.findAll(pageVO);
        model.addAttribute("userList", userList);
        return "mng/user/list";
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

    @GetMapping("/user/{id}/update")
    public String userUpdate(@PathVariable Integer id, Model model) {
        try {
            User user = mngService.findById(id);
            model.addAttribute("user", user);
            System.out.println(user.getUserName() + "님을 불러왔습니다.");
            return "mng/user/update";
        } catch (Exception e) {
            throw new Exception500("너 무슨짓 했어");
        }

    }

    @PostMapping("/user/{id}/update")
    public String userUpdated(@PathVariable Integer id, MngUserDTO.UpdateDTO updateDTO) {
        if (updateDTO == null) {
            throw new Exception500("다시 한번 확인해주세요");
        }
        if (updateDTO.getEmail() == null || updateDTO.getEmail().isEmpty()) {
            throw new Exception500("이메일을 입력해주세요");
        }
        if (updateDTO.getUsername() == null || updateDTO.getUsername().isEmpty()) {
            throw new Exception500("이름을 입력해주세요");
        }
        if (updateDTO.getPassword() == null || updateDTO.getPassword().isEmpty()) {
            throw new Exception500("비밀번호를 입력해주세요");
        }
        if (updateDTO.getPhoneNumber() == null || updateDTO.getPhoneNumber().isEmpty()) {
            throw new Exception500("전화번호를 입력해주세요");
        }
        mngService.update(id, updateDTO);
//		ResponseEntity.ok().body(ApiUtils.success(null))
        return "redirect:/mng/user";

    }

    @GetMapping("/product/detail/{pId}")
    public String productDetail(Model model, @PathVariable Integer pId) {
        System.out.println(pId + "번");

        Product product = mngService.findProductById(pId);
        model.addAttribute(product);

        return "mng/product/detail";
    }

    @GetMapping("/user/{id}/delete")
    public String userDelete(@PathVariable Integer id) {
        mngService.delete(id);
        return "redirect:/mng/user";
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
//        FirstCategory fCategory = mngService.findCategoryAll();
//        model.addAttribute("category", fCategory);

        model.addAttribute("product",product);
        model.addAttribute("fCategory",fCategory);
        return "mng/product/modifyForm";
    }

    @GetMapping("/product/register")
    public String productRegister(Model model, MngCategoryDto categoryDto) {

        FirstCategory fCategory = mngService.findFirstCategory();
        model.addAttribute("fCategory", fCategory);

//        SecondCategory sCategory = mngService.findSecondCategory(categoryDto.getId());
//        model.addAttribute("sCategory", sCategory);


        return "mng/product/submitForm";
    }

}
