package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.interfaces.mng.MngNoticeRepository;
import com.tenco.toyproject.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
