package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.service.mng.MngPurchaseService;
import com.tenco.toyproject.service.mng.MngRentService;
import com.tenco.toyproject.service.mng.MngSaleService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/mng/apply")
@Slf4j
public class MngApplyController {

    @Autowired
    private MngRentService mngRentService;

    @Autowired
    private MngSaleService mngSaleService;

    @Autowired
    private MngPurchaseService mngPurchaseService;

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
    //대여 시작
    @GetMapping("rental-list")
    public String rentalList(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {
        int total = mngRentService.countRentList();
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

        List<MngApplyDTO.RentListDTO> rentList = mngRentService.findrentAll(pageVO);

        model.addAttribute("rentList", rentList);

        return "mng/apply/rental/rentalList";
    }
    @GetMapping("{id}/rental-detail")
    public String rentalDetail(@PathVariable Integer id){
        System.out.println("여긴 오는감");
//        mngService.findByRentId(id);
        return "mng/apply/rental/rentalDetail";
    }
    @GetMapping("{id}/rental-update")
    public String updateRentalStatus(@PathVariable Integer id){
        mngRentService.updateStatus(id);
        return "redirect:/mng/apply/rental-list";
    }
    @GetMapping("{id}/rental-delete")
    public String deleteRentalStatus(@PathVariable Integer id){
        mngRentService.deleteStatus(id);
        return "redirect:/mng/apply/rental-list";
    }


    //판매 시작
    @GetMapping("sale-list")
    public String saleList(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {

        int total = mngSaleService.countSaleList();
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

        List<MngApplyDTO.SaleListDTO> saleList = mngSaleService.findAllBySale(pageVO);

        model.addAttribute("saleList", saleList);
        return "mng/apply/sale/saleList";
    }

    //구매 시작
    @GetMapping("purchase-list")
    public String purchaseList(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {
        int total = mngPurchaseService.countPurchaseList();
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

        List<MngApplyDTO.PurchaseListDTO> purchaseList = mngPurchaseService.findAllByPurchase(pageVO);

        model.addAttribute("purchaseList", purchaseList);
        return "mng/apply/purchase/purchaseList";
    }
}
