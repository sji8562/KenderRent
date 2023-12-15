package com.tenco.toyproject.service.mng.board;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.interfaces.mng.board.MngQnaRepository;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngQnaService {

    @Autowired
    private MngQnaRepository mngQnaRepository;

    public int countQnaList() {
        return mngQnaRepository.countQnaList();
    }

    public List<MngBoardDTO.QnaListDto> findQnaByCodeWithPagenation(PageVO pageVO) {
        return mngQnaRepository.findQnaByCodeWithPagenation(pageVO);
    }
}
