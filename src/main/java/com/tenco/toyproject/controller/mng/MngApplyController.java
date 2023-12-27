package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.service.mng.MngPurchaseService;
import com.tenco.toyproject.service.mng.MngRentService;
import com.tenco.toyproject.service.mng.MngSaleService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    public String applyList(Model model, PageVO rentPage, PageVO salePage, PageVO purchasePage, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
        try {
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

            if (rentList != null || rentList.isEmpty()) {
                model.addAttribute("rentList", rentList);
            }
            if (saleList != null || saleList.isEmpty()) {
                model.addAttribute("saleList", saleList);
            }
            if (purchaseList != null || purchaseList.isEmpty()) {
                model.addAttribute("purchaseList", purchaseList);
            }
            return "mng/apply/list";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 대여리스트 페이징처리
     *
     * @param model
     * @param pageVO
     * @param nowPage
     * @param cntPerPage
     * @return http://localhost/mng/apply/rental-list
     */
    //대여 시작
    @GetMapping("rental-list")
    public String rentalList(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
        try {
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

            if (rentList != null || rentList.isEmpty()) {
                model.addAttribute("rentList", rentList);
                return "mng/apply/rental/rentalList";
            }
            throw new CustomRestfullException("렌탈내역을 찾지 못했습니다.", HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @GetMapping("{id}/rental-detail")
    public String rentalDetail(@PathVariable Integer id, Model model) {
        try {
            MngApplyDTO.RentalDetailDTO dto = mngRentService.findByRentId(id);
            if (dto != null) {
                model.addAttribute("dto", dto);
                System.out.println(dto);
                return "mng/apply/rental/rentalDetail";
            }
            throw new CustomRestfullException("신청을 찾지 못했습니다.", HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("{id}/rental-update")
    public String updateRentalStatus(@PathVariable Integer id) {
        try {
            int result = mngRentService.updateStatus(id);
            if (result != 1) {
                throw new CustomRestfullException("신청을 업데이트하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/rental-list";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @PostMapping("rent-update")
    public String updateRent(MngApplyDTO.RentalDetailUpdateDTO rentalDetailUpdateDTO) {
        try {
            int result = mngRentService.updateById(rentalDetailUpdateDTO);
            if (result != 1) {
                throw new CustomRestfullException("신청을 업데이트하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/" + rentalDetailUpdateDTO.getId() + "/rental-detail";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("{id}/rental-delete")
    public String deleteRentalStatus(@PathVariable Integer id) {
        try {
            int result = mngRentService.deleteStatus(id);
            if (result != 1) {
                throw new CustomRestfullException("신청을 업데이트하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/rental-list";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }


    }


    /**
     * 판매 시작
     *
     * @param model
     * @param pageVO
     * @param nowPage
     * @param cntPerPage
     * @return
     */
    @GetMapping("sale-list")
    public String saleList(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
        try {
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
            if (saleList != null || !saleList.isEmpty()) {
                model.addAttribute("saleList", saleList);
            }
            return "mng/apply/sale/saleList";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @GetMapping("{id}/sale-update")
    public String updateSaleStatus(@PathVariable Integer id) {
        try {
            int result = mngSaleService.updateStatus(id);
            if (result != 1) {
                throw new CustomRestfullException("신청을 업데이트하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/sale-list";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @PostMapping("sale-update")
    public String updateSale(MngApplyDTO.SaleDetailUpdateDTO saleDetailUpdateDTO) throws Exception {
        try {
            System.out.println("1111111111111111" + saleDetailUpdateDTO);
            int result = mngSaleService.updateBySale(saleDetailUpdateDTO);
            if (result != 1) {
                throw new CustomRestfullException("신청을 업데이트하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/" + saleDetailUpdateDTO.getId() + "/sale-detail";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @GetMapping("{id}/sale-delete")
    public String deleteSaleStatus(@PathVariable Integer id) {
        try{
            int result = mngSaleService.deleteStatus(id);
            if (result != 1) {
                throw new CustomRestfullException("신청을 삭제하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/sale-list";
        }catch(Exception e){
        e.printStackTrace();
        return null;

        }

    }

    @GetMapping("{id}/sale-detail")
    public String saleDetail(@PathVariable Integer id, Model model) {
        try{
            MngApplyDTO.SaleDetailDTO dto = mngSaleService.findBySaleId(id);
            if(dto != null){
                System.out.println(dto.toString());
                model.addAttribute("dto", dto);
                return "mng/apply/sale/saleDetail";
            }
            throw new CustomRestfullException("없는 신청입니다.", HttpStatus.BAD_REQUEST);
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }


    //구매 시작
    @GetMapping("purchase-list")
    public String purchaseList(Model model, PageVO pageVO, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
        try{
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
            if(purchaseList == null || purchaseList.isEmpty()){
                throw new CustomRestfullException("리스트를 불러올수없습니다.", HttpStatus.BAD_REQUEST);
            }
            model.addAttribute("purchaseList", purchaseList);
            return "mng/apply/purchase/purchaseList";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }


    @GetMapping("{id}/purchase-update")
    public String updatePurchaseStatus(@PathVariable Integer id) {
        try{
            int result = mngPurchaseService.updateStatus(id);
            if(result != 1){
                throw new CustomRestfullException("업데이트 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/purchase-list";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @GetMapping("{id}/purchase-delete")
    public String deletePurchaseStatus(@PathVariable Integer id) {
        try{
            int result = mngPurchaseService.deleteStatus(id);
            if(result != 1){
                throw new CustomRestfullException("삭제 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/purchase-list";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @GetMapping("{id}/purchase-detail")
    public String purchaseDetail(@PathVariable Integer id, Model model) {
        try{
            MngApplyDTO.PurchaseDetailDTO dto = mngPurchaseService.findByPurchaseId(id);
            if(dto == null){
                throw new CustomRestfullException("없는 신청입니다.", HttpStatus.BAD_REQUEST);
            }
            System.out.println(dto.toString());
            model.addAttribute("dto", dto);
            return "mng/apply/purchase/purchaseDetail";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @PostMapping("purchase-update")
    public String updateSale(MngApplyDTO.PurchaseDetailUpdateDTO purchaseDetailUpdateDTO) throws Exception {
        try{
            System.out.println("1111111111111111" + purchaseDetailUpdateDTO);
            int result = mngPurchaseService.updateByPurchase(purchaseDetailUpdateDTO);
            if(result != 1){
                throw new CustomRestfullException("업데이트 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/apply/" + purchaseDetailUpdateDTO.getId() + "/purchase-detail";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }
}
