package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.entity.Board;
import com.tenco.toyproject.service.mng.board.MngNoticeService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/mng/board")
@Slf4j
public class MngBoardController {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MngBoardController.class);

    @Autowired
    private MngNoticeService mngNoticeService;

    //공지사항 리스트
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
    public String noticeDetail(@PathVariable Integer id, Model model){
        Board board = mngNoticeService.findByNotice(id);
        System.out.println(board.toString());
        model.addAttribute("board",board);
        return "mng/board/notice/detail";
    }

    // 자주 묻는 질문
    @GetMapping("faq-list")
    public String qna(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage){
        int total = mngNoticeService.countFaqList();

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

        List<MngBoardDTO.NoticeListDTO> noticeList = mngNoticeService.findAllByFaq(pageVO);
        System.out.println(noticeList.toString());
        model.addAttribute("noticeList", noticeList);

        return "mng/board/faq/list";
    }
    @GetMapping("qna")
    public String qnaPage(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage){

        int total = mngNoticeService.countFaqList();

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

        // 1:1문의 조회(code 3번)
        List<MngBoardDTO.QnaListDto> boardList = mngNoticeService.findAllBoardByCode(3);
        model.addAttribute("boardList", boardList);

        return "mng/board/qna/list";

    }
    @GetMapping("productqna")
    public String productqna(){
        return "mng/board/productqna/list";
    }

    // faq 삭제
    @GetMapping("{id}/faq-delete")
    public String deleteFaq(@PathVariable int id) {

        mngNoticeService.deleteBoardById(id);
        return "redirect:/mng/board/faq-list";
    }

    // faq 등록 페이지로 이동
    @GetMapping("faq-submit")
    public String submitPage() {
        return "/mng/board/faq/submit";
    }

    // faq 등록
    @PostMapping("faq-submit")
    public String submitFaq(MngBoardDTO.FaqSubmitDto dto) {
        logger.info("------------------------------" + dto.toString());

        if(dto.getTitle() == null || dto.getTitle().isEmpty()) {
            throw new Exception500("질문을 입력하세요");
        }

        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("내용을 입력하세요");
        }

        dto.setCode(2);

        mngNoticeService.createFaq(dto);

        return "redirect:/mng/board/faq-list";
    }

    // faq 수정 페이지로 이동
    @GetMapping("{id}/faq-update")
    public String updatePage(Model model, @PathVariable int id) {
        logger.info("이 글좀 찾아줘요~" + id);
        // 글 조회
        Board board = mngNoticeService.findBoardById(id);
        model.addAttribute(board);

        return "/mng/board/faq/update";
    }

    // faq 수정
    @PostMapping("{id}/faq-update")
    public String updateFaq(MngBoardDTO.FaqSubmitDto dto, @PathVariable int id) {
        logger.info("이 글 좀 수정해주세요" + id);

        if(dto.getTitle() == null || dto.getTitle().isEmpty()) {
            throw new Exception500("질문을 입력하세요");
        }

        if(dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new Exception500("내용을 입력하세요");
        }

        mngNoticeService.updateFaqById(dto);

        return "redirect:/mng/board/faq-list";
    }
}


