package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngBoardDTO;
import com.tenco.toyproject.repository.entity.Board;
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

    public int countFaqList() {
        return mngNoticeRepository.countFaq();
    }

    public List<MngBoardDTO.NoticeListDTO> findAllByFaq(PageVO pageVO) {
        return mngNoticeRepository.findAllFaqWithPagenation(pageVO);
    }

    public void deleteBoardById(int id) {
        mngNoticeRepository.deleteBoardById(id);
    }

    public void createFaq(MngBoardDTO.FaqSubmitDto dto) {
        mngNoticeRepository.createFaq(dto);
    }

    public Board findBoardById(int id) {
        return mngNoticeRepository.findBoardById(id);
    }

    public void updateFaqById(MngBoardDTO.FaqSubmitDto dto) {
        mngNoticeRepository.updateFaqById(dto);
    }

    public List<MngBoardDTO.QnaListDto> findAllBoardByCode(int code) { mngNoticeRepository.findQnaByCodeWithPagenation(code);
        return mngNoticeRepository.findQnaByCodeWithPagenation(code);
    }
}
