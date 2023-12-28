package com.tenco.toyproject.repository.interfaces;

import com.tenco.toyproject.dto.HeaderDTO;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.SecondCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IndexRepository {
    public List<HeaderDTO> findByFCategory();

    public List<SecondCategory> findBySecondCategoryId();

    List<HeaderDTO> findByFCategoryCode2();
}
