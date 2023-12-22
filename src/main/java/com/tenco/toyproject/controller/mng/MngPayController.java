package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject.dto.MngIndexDTO;
import com.tenco.toyproject.service.mng.MngIndexService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/mng/pay")
@Slf4j
public class MngPayController {

    @Autowired
    private MngIndexService mngIndexService;

    private static final Logger logger = LoggerFactory.getLogger(MngProductController.class);

    @GetMapping("list")
    public String payList(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

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
        System.out.println("****************" + statusDTO);
        model.addAttribute("payList", statusDTO);

        return "/mng/pay/list";
    }

}
