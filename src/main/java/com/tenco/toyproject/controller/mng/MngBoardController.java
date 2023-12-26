package com.tenco.toyproject.controller.mng;

import java.util.List;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.tenco.toyproject._core.handler.exception.CustomRestfulException;
import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngProductReplyDTO;
import com.tenco.toyproject.dto.MngReplyDTO;
import com.tenco.toyproject.repository.entity.Board;
import com.tenco.toyproject.repository.entity.ProductQnaDetail;
import com.tenco.toyproject.repository.entity.QnaDetail;
import com.tenco.toyproject.service.mng.board.MngFaqService;
import com.tenco.toyproject.service.mng.board.MngNoticeService;
import com.tenco.toyproject.service.mng.board.MngProductQnaService;
import com.tenco.toyproject.service.mng.board.MngQnaService;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;


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

  @Autowired
  private MngProductQnaService mngProductQnaService;

  // 공지사항 리스트
  @GetMapping("noticeList")
  public String notice(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
    try {
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
      if (noticeList != null) {
        model.addAttribute("noticeList", noticeList);
      }
      return "mng/board/notice/list";
    } catch (Exception e) {
      return null;
    }

  }

  @GetMapping("notice-submit")
  public String noticeSubmit() {

    return "mng/board/notice/submit";
  }

  @PostMapping("notice-submit-proc")
  public String noticeSubmit(MngBoardDTO.NoticeSubmitDTO noticeSubmitDTO) {
    System.out.println("들어오지??여기도 안들어와 ??");
    try {
      if (noticeSubmitDTO == null) {
        throw new CustomRestfulException("내용을 입력해주세요", HttpStatus.BAD_REQUEST);
      }
      if (noticeSubmitDTO.getTitle() == null || noticeSubmitDTO.getTitle().isEmpty()) {
        throw new CustomRestfulException("제목을 입력해주세요", HttpStatus.BAD_REQUEST);
      }
      if (noticeSubmitDTO.getContent() == null || noticeSubmitDTO.getContent().isEmpty()) {
        throw new CustomRestfulException("내용을 입력해주세요", HttpStatus.BAD_REQUEST);
      }
      System.out.println("이거 나오게 해봐라"+noticeSubmitDTO.toString());
      int result = mngNoticeService.noticeSubmit(noticeSubmitDTO);

      System.out.println(result);
      if (result != 1) {
        throw new CustomRestfulException("공지사항 생성이 되지 않았습니다.", HttpStatus.BAD_REQUEST);
      }
      return "redirect:/mng/board/noticeList";
    } catch (Exception e) {
      System.out.println("설마 여기오겠어 ?");
      return null;
    }

  }

  @GetMapping("{id}/notice-detail")
  public String noticeDetail(@PathVariable Integer id, Model model) {
    try {
      if (id == null) {
        throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
      }
      Board notice = mngNoticeService.findByNotice(id);
      if (notice == null) {
        throw new CustomRestfulException("없는 공지사항입니다.", HttpStatus.BAD_REQUEST);
      }
      System.out.println(notice.toString());
      logger.info(notice.toString());

      model.addAttribute("notice", notice);
      return "mng/board/notice/detail";
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  @GetMapping("{id}/notice-update")
  public String noticeUpdate(@PathVariable Integer id, Model model) {
    try {
      if (id == null) {
        throw new CustomRestfulException("없는 공지사항입니다.", HttpStatus.BAD_REQUEST);
      }
      Board notice = mngNoticeService.findByNotice(id);
      model.addAttribute("notice", notice);
      return "mng/board/notice/update";
    } catch (Exception e) {
      return null;
    }
  }

  @PostMapping("notice-update-proc")
  public String noticeUpdateProc(MngBoardDTO.NoticeUpdateDTO dto) {
    try {
      if (dto == null) {
        throw new CustomRestfulException("다시 한번 확인해주세요", HttpStatus.BAD_REQUEST);
      }
      if (dto.getTitle() == null || dto.getTitle().isEmpty()) {
        throw new CustomRestfulException("제목을 입력해주세요", HttpStatus.BAD_REQUEST);
      }
      if (dto.getContent() == null || dto.getContent().isEmpty()) {
        throw new CustomRestfulException("내용을 입력해주세요", HttpStatus.BAD_REQUEST);
      }
      int result = mngNoticeService.noticeUpdate(dto);
      if (result != 1) {
        throw new CustomRestfulException("업데이트 하지 못했습니다.", HttpStatus.BAD_REQUEST);
      }
      return "redirect:/mng/board/" + dto.getId() + "/notice-detail";
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  @GetMapping("{id}/notice-delete")
  public String noticeDelete(@PathVariable Integer id) {
    try {
      int result = mngNoticeService.deleteByNotice(id);
      if (result != 1) {
        throw new CustomRestfulException("삭제가 되지않았습니다.", HttpStatus.BAD_REQUEST);
      }
      return "redirect:/mng/board/noticeList";
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  // 자주 묻는 질문
  @GetMapping("faq-list")
  public String qna(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
      @RequestParam(value = "keyword", required = false) String keyword) {

    int total = mngFaqService.countFaqList(keyword);
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
    model.addAttribute("keyword", keyword);
    System.out.println(cntPerPage);

    List<MngBoardDTO.NoticeListDTO> noticeList;

    // 검색어가 있는 경우
    if (keyword != null && !keyword.isEmpty()) {
      // 검색어를 이용해 검색 쿼리 수행
      noticeList = mngFaqService.findFaqByKeyword(pageVO, keyword);
    } else {
      // 검색어가 없을 때
      noticeList = mngFaqService.findAllByFaq(pageVO);
    }

    model.addAttribute("noticeList", noticeList);

    return "mng/board/faq/list";
  }

  @GetMapping("qna")
  public String qnaPage(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
      @RequestParam(value = "keyword", required = false) String keyword) {

    int total = mngQnaService.countQnaList(keyword);

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
    model.addAttribute("keyword", keyword);
    System.out.println(cntPerPage);

    List<MngBoardDTO.QnaListDto> boardList;

    // 검색어가 있는 경우
    if (keyword != null && !keyword.isEmpty()) {
      // 검색어를 이용해 검색 쿼리 수행
      boardList = mngQnaService.findQnaByCodeWithPagenationAndKeyword(pageVO, keyword);
    } else {
      // 검색어가 없을 때
      boardList = mngQnaService.findQnaByCodeWithPagenation(pageVO);
    }

    model.addAttribute("boardList", boardList);

    logger.info("여기 왔나???????????????" + boardList);

    return "mng/board/qna/list";

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

    if (dto.getTitle() == null || dto.getTitle().isEmpty()) {
      throw new Exception500("질문을 입력하세요");
    }

    if (dto.getContent() == null || dto.getContent().isEmpty()) {
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


    if (dto.getTitle() == null || dto.getTitle().isEmpty()) {
      throw new Exception500("질문을 입력하세요");
    }

    if (dto.getContent() == null || dto.getContent().isEmpty()) {
      throw new Exception500("내용을 입력하세요");
    }

    mngFaqService.updateFaqById(dto);

    return "redirect:/mng/board/faq-list";
  }

  /**
   * 1:1 문의
   */
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

    if (dto.getReplyContent() == null || dto.getReplyContent().isEmpty()) {
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

  // ======================================= //
  // 231220 전우진

  // 제품 문의 리스트
  @GetMapping("productqna")
  public String productQnaPage(Model model, PageVO pageVO,
      @RequestParam(value = "nowPage", required = false) String nowPage,
      @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
      @RequestParam(value = "keyword", required = false) String keyword) {

    int total = mngProductQnaService.countProductQnaList(keyword);

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
    model.addAttribute("keyword", keyword);
    System.out.println(cntPerPage);

    List<MngBoardDTO.ProductQnaListDto> boardList;

      //  System.out.println("상세보기 왜 안돼?" + qnaDetail);

      //  System.out.println("상세보기 왜 안돼?" + qnaDetail);

    // 검색어가 있는 경우
    if (keyword != null && !keyword.isEmpty()) {
      // 검색어를 이용해 검색 쿼리 수행
      boardList =
          mngProductQnaService.findProductQnaByCodeWithPagenationAndKeyword(pageVO, keyword);
    } else {
      // 검색어가 없을 때
      boardList = mngProductQnaService.findProductQnaByCodeWithPagenation(pageVO);
    }

    model.addAttribute("boardList", boardList);

    return "mng/board/productqna/list";

  }

  // 제품 문의 상세
  @GetMapping("{id}/productqna-detail")
  public String productQnaDetail(Model model, @PathVariable Integer id) {
    logger.info("상세 보기" + id);

    ProductQnaDetail productQnaDetail = mngProductQnaService.findProductQnaByIdWithReply(id);
    model.addAttribute("board", productQnaDetail);

    return "/mng/board/productqna/detail";
  }

  // 제품 문의 답변 등록
  @PostMapping("{id}/productqna-answer")
  public String submitProductQnaAnswer(@PathVariable int id, MngProductReplyDTO.ProductQnaReplyDto dto) {

    if (dto.getReplyContent() == null || dto.getReplyContent().isEmpty()) {
      throw new Exception500("답변 내용을 입력하세요");
    }

    dto.setBoardId(id);


    mngProductQnaService.submitProductQnaAnswer(dto);

    return "redirect:/mng/board/" + id + "/productqna-detail";
  }

  // 제품 문의 삭제
  @GetMapping("{id}/productqna-delete")
  public String deleteProductQna(@PathVariable int id) {
    mngProductQnaService.deleteProductQna(id);
    return "redirect:/mng/board/productqna";
  }

}
