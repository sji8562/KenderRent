package com.tenco.toyproject.repository.interfaces;

import com.tenco.toyproject.repository.entity.Information;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IntroduceRepository {

    Information findContentByCode(Integer code);
}
