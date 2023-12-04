package com.tenco.toyproject.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.MngService;




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

	@GetMapping("/product/list")
	public String productList() {
		return "mng/product/list";
	}

	@GetMapping("user")
	public String UserTable(Model model) {
		List<User> userList = mngService.findAll();
		System.out.println(userList.toArray());
		System.out.println(userList.toString());
		model.addAttribute("userList",userList);
		
		return "mng/user-table";
	}

	@GetMapping("/product/detail/{pIdx}")
	public String productDetail(@PathVariable Integer pIdx) {
		System.out.println(pIdx + "번");
		return "mng/product/detail";

	}
}
