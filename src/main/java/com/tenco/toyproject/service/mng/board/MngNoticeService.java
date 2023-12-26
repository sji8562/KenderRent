package com.tenco.toyproject.service.mng.board;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.entity.Board;
import com.tenco.toyproject.repository.interfaces.mng.board.MngNoticeRepository;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MngNoticeService {
    @Autowired
    private MngNoticeRepository mngNoticeRepository;
    public int countNoticeList() {
        return mngNoticeRepository.countNotice();

    }

    public List<MngBoardDTO.NoticeListDTO> findAllByNotice(PageVO pageVO) {
        return mngNoticeRepository.findAllNoticeWithPagenaition(pageVO);
    }

    public Board findByNotice(Integer id) {
        return mngNoticeRepository.findByNoticeId(id);
    }

    @Transactional
    public int noticeSubmit(MngBoardDTO.NoticeSubmitDTO dto) {
        System.out.println("이거 나오게 해봐라"+dto.toString());
        Board board = Board.builder().title(dto.getTitle()).content(dto.getContent()).build();


        return mngNoticeRepository.noticeSubmit(board);
    }

    @Transactional
    public int noticeUpdate(MngBoardDTO.NoticeUpdateDTO dto) {
        return mngNoticeRepository.UpdateByNoticeId(dto);
    }

    public int deleteByNotice(Integer id) {
        return mngNoticeRepository.deleteByNotice(id);
    }
}
