package com.tenco.toyproject.repository.interfaces.mng.board;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngReplyDTO;
import com.tenco.toyproject.repository.entity.QnaDetail;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MngQnaRepository {
    List<MngBoardDTO.QnaListDto> findQnaByCodeWithPagenation(PageVO pageVO);

    int countQnaList();

    QnaDetail findQnaByIdWithReply(int id);

    void submitQnaAnswer(MngReplyDTO.QnaReplyDto dto);

    void deleteQna(int id);
}
