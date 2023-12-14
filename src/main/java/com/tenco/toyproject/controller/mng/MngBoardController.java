package com.tenco.toyproject.controller.mng;



import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.service.mng.MngNoticeService;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;




@Controller
@RequestMapping("/mng/board")
public class MngBoardController {


    @Autowired
    private MngNoticeService mngNoticeService;
    @GetMapping("noticeList")
    public String notice( Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage) {

        int total = mngNoticeService.countNoticeList();

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

        List<MngBoardDTO.NoticeListDTO> noticeList = mngNoticeService.findAllByNotice(pageVO);
        System.out.println(noticeList.toString());
        model.addAttribute("noticeList", noticeList);
        return "mng/board/notice/list";
    }
    @GetMapping("{id}/notice-detail")
    public String noticeDetail(@PathVariable Integer id){
        System.out.println("들어왔다");
//        mngNoticeService
        return "mng/board/notice/detail";
    }
    @GetMapping("qna")
    public String qna(){
        return "mng/board/qna/list";
    }
    @GetMapping("mantoman")
    public String mantoman(){
        return "mng/board/mantoman/list";
    }
    @GetMapping("productqna")
    public String productqna(){
        return "mng/board/productqna/list";
    }

}
