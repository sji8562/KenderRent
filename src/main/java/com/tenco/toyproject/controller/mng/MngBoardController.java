package com.tenco.toyproject.controller.mng;

import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngReplyDTO;
import com.tenco.toyproject.repository.entity.Board;
import com.tenco.toyproject.repository.entity.QnaDetail;
import com.tenco.toyproject.service.mng.board.MngFaqService;
import com.tenco.toyproject.service.mng.board.MngNoticeService;
import com.tenco.toyproject.service.mng.board.MngQnaService;
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

    @Autowired
    private MngFaqService mngFaqService;

    @Autowired
    private MngQnaService mngQnaService;

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
    public String noticeDetail(@PathVariable Integer id){
//        mngNoticeService.notice
        return "mng/board/notice/detail";
    }

    // 자주 묻는 질문
    @GetMapping("faq-list")
    public String qna(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage){
        int total = mngFaqService.countFaqList();

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

        List<MngBoardDTO.NoticeListDTO> noticeList = mngFaqService.findAllByFaq(pageVO);
        System.out.println(noticeList.toString());
        model.addAttribute("noticeList", noticeList);

        return "mng/board/faq/list";
    }
    @GetMapping("qna")
    public String qnaPage(Model model, PageVO pageVO, @RequestParam(value = "nowPage",required = false) String nowPage, @RequestParam(value = "cntPerPage",required = false) String cntPerPage){

        int total = mngQnaService.countQnaList();

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

        // 1:1문의 조회
        List<MngBoardDTO.QnaListDto> boardList = mngQnaService.findQnaByCodeWithPagenation(pageVO);
        model.addAttribute("boardList", boardList);

        logger.info("여기 왔나???????????????" + boardList);

        return "mng/board/qna/list";

    }
    @GetMapping("productqna")
    public String productqna(){
        return "mng/board/productqna/list";
    }

    // faq 삭제
    @GetMapping("{id}/faq-delete")
    public String deleteFaq(@PathVariable int id) {

        mngFaqService.deleteBoardById(id);
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

        mngFaqService.createFaq(dto);

        return "redirect:/mng/board/faq-list";
    }

    // faq 수정 페이지로 이동
    @GetMapping("{id}/faq-update")
    public String updatePage(Model model, @PathVariable int id) {
        logger.info("이 글좀 찾아줘요~" + id);
        // 글 조회
        Board board = mngFaqService.findBoardById(id);
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

        mngFaqService.updateFaqById(dto);

        return "redirect:/mng/board/faq-list";
    }

    /**
     * 1:1 문의
    * */
    // 1:1 문의 상세
    @GetMapping("{id}/qna-detail")
    public String QnaDetail(Model model, @PathVariable int id) {
        logger.info("상세 보기" + id);

        QnaDetail qnaDetail = mngQnaService.findQnaByIdWithReply(id);
        model.addAttribute("board", qnaDetail);

        return "/mng/board/qna/detail";
    }

    // 1:1 문의 답변 등록
    @PostMapping("{id}/qna-answer")
    public String submitQnaAnswer(@PathVariable int id, MngReplyDTO.QnaReplyDto dto) {

        if(dto.getReplyContent() == null || dto.getReplyContent().isEmpty()) {
            throw new Exception500("답변 내용을 입력하세요");
        }

        dto.setBoardId(id);

        mngQnaService.submitQnaAnswer(dto);

        return "redirect:/mng/board/" + id + "/qna-detail";
    }

    // 1:1 문의 삭제
    @GetMapping("{id}/qna-delete")
    public String deleteQna(@PathVariable int id) {
        mngQnaService.deleteQna(id);
        return "redirect:/mng/board/qna";
    }

}


