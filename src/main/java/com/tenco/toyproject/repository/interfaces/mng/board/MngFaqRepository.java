package com.tenco.toyproject.repository.interfaces.mng.board;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.entity.Board;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

@Mapper
public interface MngFaqRepository {
    public int countFaq(String keyword);

    public List<MngBoardDTO.NoticeListDTO> findAllFaqWithPagenation(PageVO pageVO);

    void deleteBoardById(int id);

    // 기존 FAQ 등록
//    void createFaq(MngBoardDTO.FaqSubmitDto dto);

    int createFaq(@Param("title") String title, @Param("content") String content, @Param("code") int code, @Param("userId") int userId);
    Board findBoardById(int id);

    void updateFaqById(MngBoardDTO.FaqSubmitDto dto);

    List<MngBoardDTO.NoticeListDTO> findFaqWithPagenationAndKeyword(PageVO pageVO, String keyword);
}
