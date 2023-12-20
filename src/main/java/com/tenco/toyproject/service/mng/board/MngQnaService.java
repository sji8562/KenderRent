package com.tenco.toyproject.service.mng.board;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngReplyDTO;
import com.tenco.toyproject.repository.entity.QnaDetail;
import com.tenco.toyproject.repository.interfaces.mng.board.MngQnaRepository;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngQnaService {

    @Autowired
    private MngQnaRepository mngQnaRepository;

    public int countQnaList(String keyword) {
        return mngQnaRepository.countQnaList(keyword);
    }

    public List<MngBoardDTO.QnaListDto> findQnaByCodeWithPagenation(PageVO pageVO) {
        return mngQnaRepository.findQnaByCodeWithPagenation(pageVO);
    }

    public QnaDetail findQnaByIdWithReply(int id) {
        return mngQnaRepository.findQnaByIdWithReply(id);
    }

    public void submitQnaAnswer(MngReplyDTO.QnaReplyDto dto) {
        mngQnaRepository.submitQnaAnswer(dto);
    }

    public void deleteQna(int id) {
        mngQnaRepository.deleteQna(id);
    }

    public List<MngBoardDTO.QnaListDto> findQnaByCodeWithPagenationAndKeyword(PageVO pageVO, String keyword) {
        return mngQnaRepository.findQnaByCodeWithPagenationAndKeyword(pageVO, keyword);
    }
}
