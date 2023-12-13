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
    public String applyList(Model model,PageVO rentPage, PageVO salePage, PageVO purchasePage, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {
        int rentTotal = mngRentService.countRentList();
        int saleTotal = mngSaleService.countSaleList();
        int purchaseTotal = mngPurchaseService.countPurchaseList();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        rentPage = new PageVO(rentTotal, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        salePage = new PageVO(saleTotal, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        purchasePage = new PageVO(purchaseTotal, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        List<MngApplyDTO.RentListDTO> rentList = mngRentService.findrentAll(rentPage);
        List<MngApplyDTO.SaleListDTO> saleList = mngSaleService.findAllBySale(salePage);
        List<MngApplyDTO.PurchaseListDTO> purchaseList = mngPurchaseService.findAllByPurchase(purchasePage);

        model.addAttribute("rentList",rentList);
        model.addAttribute("saleList",saleList);
        model.addAttribute("purchaseList",purchaseList);
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
    public String rentalDetail(@PathVariable Integer id, Model model){
        System.out.println("여긴 오는감");
        MngApplyDTO.RentalDetailDTO dto = mngRentService.findByRentId(id);
        System.out.println(dto);
        model.addAttribute("dto",dto);
        return "mng/apply/rental/rentalDetail";
    }
    @GetMapping("{id}/rental-update")
    public String updateRentalStatus(@PathVariable Integer id){
        mngRentService.updateStatus(id);
        return "redirect:/mng/apply/rental-list";
    }
    @PostMapping("rent-update")
    public String updateRent(MngApplyDTO.RentalDetailUpdateDTO rentalDetailUpdateDTO) throws Exception{
        System.out.println("1111111111111111"+rentalDetailUpdateDTO.toString());

        mngRentService.updateById(rentalDetailUpdateDTO);
        return "redirect:/mng/apply/"+rentalDetailUpdateDTO.getId() +"/rental-detail";
    }

    @GetMapping("{id}/rental-delete")
    public String deleteRentalStatus(@PathVariable Integer id){
        mngRentService.deleteStatus(id);
        return "redirect:/mng/apply/rental-list";
//        return null;
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
    @GetMapping("{id}/sale-update")
    public String updateSaleStatus(@PathVariable Integer id){
        mngSaleService.updateStatus(id);
        return "redirect:/mng/apply/sale-list";
    }
    @GetMapping("{id}/sale-delete")
    public String deleteSaleStatus(@PathVariable Integer id){
        mngSaleService.deleteStatus(id);
        return "redirect:/mng/apply/sale-list";
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


    @GetMapping("{id}/purchase-update")
    public String updatePurchaseStatus(@PathVariable Integer id){
        mngPurchaseService.updateStatus(id);
        return "redirect:/mng/apply/purchase-list";
    }
    @GetMapping("{id}/purchase-delete")
    public String deletePurchaseStatus(@PathVariable Integer id){
        mngPurchaseService.deleteStatus(id);
        return "redirect:/mng/apply/purchase-list";
    }
}
