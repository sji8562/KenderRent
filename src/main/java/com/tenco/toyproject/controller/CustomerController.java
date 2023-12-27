package com.tenco.toyproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.CustomerService;
import com.tenco.toyproject.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class CustomerController {

  @Autowired // DI 처리
  private CustomerService customerService;
  @Autowired
  private HttpSession session;

  // 사용자 회원가입 페이지 요청
  // 주소설계 http://localhost/customer/custSignUp
  @GetMapping("/custSignUp")
  public String custSignUp() {
    return "customer/custSignUp";
  }


  @GetMapping("/contact")
  public String contact(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
      @RequestParam(name = "type", defaultValue = "1", required = false) int code) {

    int total = customerService.countCustomer(code);
    if (nowPage == null && cntPerPage == null) {
      nowPage = "1";
      cntPerPage = "10";
    } else if (nowPage == null) {
      nowPage = "1";
    } else if (cntPerPage == null) {
      cntPerPage = "10";
    }
    pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

    model.addAttribute("paging", pageVO);
    System.out.println("코드는 ~~~~~~~~~~~~~~~~"+ code);
    List<Map<String, Object>> customerList = customerService.selectCustomer(code, pageVO.getStart());
    System.out.println(customerList);
    model.addAttribute("customerList", customerList);
    return "customer/contact";
  }

  @GetMapping("/write")
  public String inquiryDetail (@RequestParam(defaultValue = "0", required = false) int pId, @RequestParam("type") String type) {
    // 접근제한 해야함.
    System.out.println("ppppppppIIIIIIIIIIIIIIdddddddddddd" + pId);
    System.out.println("tttttttttttyyyyyyyppppppppppeeeeeeeeeeee" + type);

    return "customer/inquiryWrite";
  }

  @PostMapping("/write")
  public String inquiryPro(String title, String content, @RequestParam(defaultValue = "0", required = false) int pId, @RequestParam("type") String type,
      @RequestParam(value = "isSecret", required = false) String isSecret) {
    // 접근제한 해야함
    // 로그인 다 되면 session값으로 user_id 넣기
    // 상품문의할때 id값 받아오기#{userId}, #{productId},#{code},#{title}, #{content}, #{secret}

    System.out.println("여기여기여기" + pId);

    User principal = (User) session.getAttribute("principal");
    if (isSecret != null && isSecret.equals("1")) {
      if (type.equals("inquiry")) {
        customerService.insertInquiry(principal.getId(), pId, 3, title, content, 1);
        return "redirect:/customer/contact?type=3";
      }
      customerService.insertInquiry(principal.getId(), pId, 4, title, content, 1);
    } else {
      if (type.equals("inquiry")) {
        customerService.insertInquiry(principal.getId(), pId, 3, title, content, 0);
        return "redirect:/customer/contact?type=3";
      }
      customerService.insertInquiry(principal.getId(), pId, 4, title, content, 0);
    }

    return "redirect:/customer/contact?type=4";
  }

  @GetMapping("/detail")
  public String detail(Model model, int id) {
    Map inquiryDetail = customerService.selectInquiryDetail(id);
    User principal = (User) session.getAttribute("principal");
    if (inquiryDetail.get("secret") == (Object) 1 && !inquiryDetail.get("user_id").equals(principal.getId())) {
      throw new CustomRestfullException("권한이 없습니다.", HttpStatus.BAD_REQUEST);
    }
    String content = org.springframework.web.util.HtmlUtils
        .htmlEscape(String.valueOf(inquiryDetail.get("content")));
    content = content.replaceAll("\n", "<br/>");
    inquiryDetail.put("content", content);
    model.addAttribute("inquiryDetail", inquiryDetail);

    Map replyContent = customerService.selectReply(id);
    if (replyContent != null) {
      model.addAttribute("replyContent", replyContent);
    }
    return "customer/inquiryDetail";
  }
}
