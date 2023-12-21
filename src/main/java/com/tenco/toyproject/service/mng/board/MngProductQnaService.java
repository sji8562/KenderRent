package com.tenco.toyproject.service.mng.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.dto.MngProductReplyDTO;
import com.tenco.toyproject.repository.entity.ProductQnaDetail;
import com.tenco.toyproject.repository.interfaces.mng.board.MngProductQnaRepository;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MngProductQnaService {
  
  @Autowired
  private MngProductQnaRepository mngProductQnaRepository;

  public int countProductQnaList(String keyword) {
    return mngProductQnaRepository.countProductQnaList(keyword);
  }

  public List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenation(PageVO pageVO) {
    return mngProductQnaRepository.findProductQnaByCodeWithPagenation(pageVO);
  }

  public ProductQnaDetail findProductQnaByIdWithReply(int id) {
    return mngProductQnaRepository.findProductQnaByIdWithReply(id);
  }

  public ProductQnaDetail findProductQnaByProductIdWithReply(int productId) {
    return mngProductQnaRepository.findProductQnaByProductIdWithReply(productId);
  }

  public void submitProductQnaAnswer(MngProductReplyDTO.ProductQnaReplyDto dto) {
    mngProductQnaRepository.submitProductQnaAnswer(dto);
  }

  public void deleteProductQna(int id) {
    mngProductQnaRepository.deleteProductQna(id);
  }

  public List<MngBoardDTO.ProductQnaListDto> findProductQnaByCodeWithPagenationAndKeyword(
      PageVO pageVO, String keyword) {
    return mngProductQnaRepository.findProductQnaByCodeWithPagenationAndKeyword(pageVO, keyword);
  }
}
