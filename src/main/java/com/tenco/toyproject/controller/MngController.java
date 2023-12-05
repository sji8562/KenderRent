package com.tenco.toyproject.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.MngService;
import com.tenco.toyproject.vo.PageVO;


@Controller
@RequestMapping("/mng")
public class MngController {
	
	@Autowired
	private MngService mngService;
	
	@GetMapping("/login")
	public String mngLogin() {
		return "mng/login";
	}
	@GetMapping("table")
	public String table() {
		return "mng/table-basic";
	}

	@GetMapping("user")
	public String UserTable(Model model, PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
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
	        model.addAttribute("paging",pageVO);
	        System.out.println(cntPerPage);
	        List<User> userList = mngService.findAll(pageVO);
	        model.addAttribute("userList", userList);
		return "mng/user-table";
	}
	
	// KWON
	@GetMapping("/product/list")
	public String productList(Model model) {
		
		List<Product> productList = mngService.findProductAll();
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
}
