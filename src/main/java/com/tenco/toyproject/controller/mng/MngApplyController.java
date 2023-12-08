package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject.dto.MngRentDTO;
import com.tenco.toyproject.service.MngService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/mng/apply")
@Slf4j
public class MngApplyController {

    @Autowired
    private MngService mngService;
    @GetMapping("list")
    public String applyList() {

        return "mng/apply/list";
    }

    /**
     * 대여리스트 페이징처리
     * @param model
     * @param pageVO
     * @param nowPage
     * @param cntPerPage
     * @return http://localhost/mng/apply/rental-list
     */

    @GetMapping("rental-list")
    public String rentalList(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {
        int total = mngService.countRentList();
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

        List<MngRentDTO.RentListDTO> rentList = mngService.findrentAll(pageVO);

        model.addAttribute("rentList", rentList);

        return "mng/apply/rental/rentalList";
    }
    @GetMapping("{id}/rental-detail")
    public String rentalDetail(@PathVariable Integer id){
        System.out.println("여긴 오는감");
//        mngService.findByRentId(id);
        return "mng/apply/rental/rentalDetail";
    }

    @GetMapping("sale-list")
    public String saleList() {
        return "mng/apply/sale/saleList";
    }
    @GetMapping("purchase-list")
    public String purchaseList() {
        return "mng/apply/purchase/purchaseList";
    }
}
