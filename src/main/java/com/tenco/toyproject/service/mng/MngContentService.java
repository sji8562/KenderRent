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
        System.out.println("여기여기여기" + resultSet);
        if(resultSet < 1) {
            throw new Exception500("등록에 실패했습니다");
        }
        return resultSet;
    }

    public Content getCompanyInfo() {
        Content content = mngContentRepository.getCompanyInfo();

        return content;
    }

    public Content getDisinfectionProcess() {
        Content content = mngContentRepository.getDisinfectionProcess();

        return content;
    }

    public Content getRulesOfUse() {
        Content content = mngContentRepository.getRulesOfUse();

        return content;
    }

    public int updateMngContent(MngContentDto dto) {
        int resultSet = mngContentRepository.updateMngContent(dto);
        System.out.println("여기여기여기" + resultSet);
        if(resultSet < 1) {
            throw new Exception500("등록에 실패했습니다");
        }
        return resultSet;
    }
}
