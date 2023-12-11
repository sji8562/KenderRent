package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.service.ProductService;
import com.tenco.toyproject.vo.PageVO;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("categories")
	public String categories() {
		return "product/categories";
	}

	@GetMapping("detail/{id}")
    public String detail(Model model, PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage, @PathVariable int id) {
        // 페이징처리
        int total = productService.countProductCustomer(id);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) { 
            cntPerPage = "10";
        }
        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging",pageVO);
        //상품별로 변경해야함
        List<Map<String, Object>> CustomerList = customerService.selectCustomerById(4, pageVO.getStart(), id); // 상품문의
        model.addAttribute("customerList", CustomerList);
        //페이징 처리해서 상품문의 출력 끝

        // 상품 정보
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product/detail";
    }

	@GetMapping("order")
	public String order(Model model) {
		
		return "product/order";
	}
}