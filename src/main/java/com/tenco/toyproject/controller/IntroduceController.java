package com.tenco.toyproject.controller;

import com.tenco.toyproject.repository.entity.Information;
import com.tenco.toyproject.service.IntroduceService;
import com.tenco.toyproject.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("introduce")
public class IntroduceController {

	@Autowired
	private IntroduceService introduceService;

	@GetMapping("come")
	public String wayToCome() {
		return "introduce/wayToCome";
	}

	public Integer code;

	/**
	 * 회사 소개 페이지
	 */
	@GetMapping("introduction")
	public String companyIntroduction(Model model) {
		code = 1;
		Information information = introduceService.findContentByCode(code);

		model.addAttribute("content", information.getContent());

		return "introduce/companyIntroduction";
	}

	/**
	 * 이용 수칙 페이지
	 */
	@GetMapping("terms-of-use")
	public String termsOfUse(Model model) {
		code = 2;
		Information information = introduceService.findContentByCode(code);
		model.addAttribute("content", information.getContent());
		return "introduce/termsOfUse";
	}

	/**
	 * 소독 과정 페이지
	 */
	@GetMapping("sanitization-process")
	public String sanitizationProcess(Model model) {
		code = 3;
		Information information = introduceService.findContentByCode(code);
		model.addAttribute("content", information.getContent());

		return "introduce/sanitizationProcess";
	}

}
