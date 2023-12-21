package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.dto.MngContentDto;
import com.tenco.toyproject.repository.entity.Content;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MngContentRepository {

    // 관리자 - 회사 소개, 이용 수칙, 소독 과정 작성
    public int createContent(MngContentDto dto);

    // 컨텐츠 조회
    Content getCompanyContent(int type);

    // 회사 소개 조회
    Content getCompanyInfo();

    // 이용 수칙 조회
    Content getRulesOfUse();

    // 소독 과정 조회
    Content getDisinfectionProcess();

    int updateMngContent(MngContentDto dto);
}
