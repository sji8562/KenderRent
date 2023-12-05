package com.tenco.toyproject.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.toyproject._core.utils.ApiUtils;
import com.tenco.toyproject.dto.MngUserDTO;
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

	@GetMapping("/product/list")
	public String productList() {
		return "mng/product/list";
	}

	@GetMapping("/user")
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
	@GetMapping("/user/{id}/update")
	public String userUpdate(@PathVariable Integer id , Model model) {
		User user = mngService.findById(id);
		model.addAttribute("user",user);
		System.out.println(user.getUserName()+"님을 불러왔습니다.");
		return "mng/user/update";
	}
	@PostMapping("/user/{id}/update")
	public String  userUpdated(@PathVariable Integer id ,MngUserDTO.UpdateDTO updateDTO) {
		mngService.update(id,updateDTO);
//		ResponseEntity.ok().body(ApiUtils.success(null))
		return "redirect:/mng/user";
	}

	@GetMapping("/product/detail/{pIdx}")
	public String productDetail(@PathVariable Integer pIdx) {
		System.out.println(pIdx + "번");
		return "mng/product/detail";

	}
	@GetMapping("/user/{id}/delete")
	public String userDelete(@PathVariable Integer id) {
		mngService.delete(id);
		return "redirect:/mng/user";
	}
}
