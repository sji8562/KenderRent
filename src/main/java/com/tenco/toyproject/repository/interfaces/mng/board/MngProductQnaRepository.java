package com.tenco.toyproject.repository.interfaces.mng.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngReplyDTO.ProductQnaReplyDto;
import com.tenco.toyproject.repository.entity.QnaDetail;
import com.tenco.toyproject.vo.PageVO;

@Mapper
public interface MngProductQnaRepository {
    List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenation(PageVO pageVO);

    int countProductQnaList(String keyword);

    QnaDetail findProductQnaByIdWithReply(int id);

    void submitProductQnaAnswer(ProductQnaReplyDto dto);

    void deleteProductQna(int id);

    List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenationAndKeyword(PageVO pageVO, String keyword);
}
