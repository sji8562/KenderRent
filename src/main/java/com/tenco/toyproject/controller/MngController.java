package com.tenco.toyproject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mng")
public class MngController {
	@GetMapping("/login")
	public String mngLogin() {
		return "mng/login";
	}
	@GetMapping("table")
	public String table() {
		return "mng/table-basic";
	}
}
