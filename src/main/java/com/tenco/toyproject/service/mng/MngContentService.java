package com.tenco.toyproject.service.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngContentDto;
import com.tenco.toyproject.repository.entity.Content;
import com.tenco.toyproject.repository.interfaces.mng.MngContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MngContentService {
    @Autowired
    private MngContentRepository mngContentRepository;

    public int createMngContent(MngContentDto dto) {
        int resultSet = mngContentRepository.createContent(dto);
        if(resultSet != 1) {
            throw new Exception500("등록에 실패했습니다");
        }
        return resultSet;
    }

    // 상세 내용 조회
//    public Content findContentByType(Integer type) {
//        return mngContentRepository.findContentByType(type);
//    }

//    // 등록
//    public int createContent(MngContentDto dto) {
//
//    }
//
//    // 수정
//
//    // 삭제


}
