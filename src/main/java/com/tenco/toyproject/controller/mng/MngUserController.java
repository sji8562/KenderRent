package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngUserDTO;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.service.MngService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/mng/user")
@Slf4j
public class MngUserController {

    @Autowired
    private MngService mngService;

    /**
     * 유저 리스트 페이징처리
     * @param model
     * @param pageVO
     * @param nowPage
     * @param cntPerPage
     * @return http://localhost/mng/user/list
     */
    @GetMapping("/list")
    public String UserTable(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage
            , @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
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
    @PostMapping("{id}/update")
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

    @GetMapping("{id}/update")
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
    @GetMapping("{id}/delete")
    public String userDelete(@PathVariable Integer id) {
        mngService.delete(id);
        return "redirect:/mng/user/list";
    }
}
