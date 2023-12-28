package com.tenco.toyproject.controller.mng;

import com.sun.tools.jconsole.JConsoleContext;
import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.dto.MngIndexDTO;
import com.tenco.toyproject.dto.MngSignInFormDto;
import com.tenco.toyproject.dto.MngUserDTO;
import com.tenco.toyproject.repository.entity.Review;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.mng.MngIndexRepository;
import com.tenco.toyproject.service.mng.MngIndexService;
import com.tenco.toyproject.vo.PageVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/mng")
@Slf4j
public class MngIndexController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MngIndexService mngIndexService;

    @Autowired
    private MngIndexRepository mngIndexRepository;



    @GetMapping("/login")
    public String goLoginPage() {
        return "mng/login";
    }

    @PostMapping("/sign-in")
    public String signInProc(MngSignInFormDto dto) {

        // 1. 유효성 검사
        if(dto.getUsername() == null || dto.getUsername().isEmpty()) {
            throw new CustomRestfullException("아이디를 입력하세요", HttpStatus.BAD_REQUEST);
        }

        if(dto.getPassword() == null || dto.getPassword().isEmpty()) {
            throw new CustomRestfullException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
        }

        // 2. 서비스 호출
        User mngPrincipal = mngIndexService.signIn(dto);

        // 3. 세션 처리
        session.setAttribute("mngPrincipal", mngPrincipal);

        System.out.println("mngPrincipal" + mngPrincipal);

        return "redirect:/mng/index";
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/mng/login";
    }

    @GetMapping({"/","/index"})
    public String manager(Model model,PageVO pageVO,@RequestParam(value = "nowPage", required = false) String nowPage,@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

        System.out.println("매니저 페이지로 들어갑니다.");
        MngIndexDTO.MngTotalDTO totalDTO =mngIndexService.findByCreatedAt();
        MngIndexDTO.MngCountDTO countDTO = mngIndexService.findByAllCount();

        int total = mngIndexService.findByStatusAllCount();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        List<MngIndexDTO.MngStatusDTO> statusDTO = mngIndexService.findByStatus(pageVO);
        model.addAttribute("paging", pageVO);
        List<MngIndexDTO.MngReviewDTO> reviewList = mngIndexService.findByReview();
        System.out.println(reviewList.toString());


        model.addAttribute("dtos",totalDTO.getMngMonthDTO());
        model.addAttribute("payOff",totalDTO.getPayOff());
        model.addAttribute("countDTO",countDTO);
        model.addAttribute("statusDTO",statusDTO);
        model.addAttribute("reviewList",reviewList);
        return "/mng/index";
    }
}

// try {
//int total = mngRentService.countRentList();

//
//List<MngApplyDTO.RentListDTO> rentList = mngRentService.findrentAll(pageVO);
//
//            if (rentList != null || rentList.isEmpty()) {
//        model.addAttribute("rentList", rentList);
//                return "mng/apply/rental/rentalList";
//                        }
//                        throw new CustomRestfulException("렌탈내역을 찾지 못했습니다.", HttpStatus.BAD_REQUEST);
//        } catch (Exception e) {
//        e.printStackTrace();
//            return null;
//                    }

