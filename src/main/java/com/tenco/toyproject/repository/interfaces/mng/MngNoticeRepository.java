package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MngNoticeRepository {
    public int countNotice();

    public List<MngBoardDTO.NoticeListDTO> findAllNoticeWithPagenaition(PageVO pageVO);
}
