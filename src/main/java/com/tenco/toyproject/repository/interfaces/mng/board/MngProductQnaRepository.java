package com.tenco.toyproject.repository.interfaces.mng.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.tenco.toyproject.dto.MngBoardDTO;

import com.tenco.toyproject.dto.MngProductReplyDTO.ProductQnaReplyDto;



import com.tenco.toyproject.repository.entity.ProductQnaDetail;
import com.tenco.toyproject.vo.PageVO;

@Mapper
public interface MngProductQnaRepository {
    List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenation(PageVO pageVO);

    int countProductQnaList(String keyword);

    ProductQnaDetail findProductQnaByIdWithReply(int id);

    ProductQnaDetail findProductQnaByProductIdWithReply(int productId);

    void submitProductQnaAnswer(ProductQnaReplyDto dto);

    void deleteProductQna(int id);

    List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenationAndKeyword(PageVO pageVO, String keyword);

}