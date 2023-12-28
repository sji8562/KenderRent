package com.tenco.toyproject.service;

import com.tenco.toyproject.dto.HeaderDTO;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.repository.interfaces.IndexRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexService {

    @Autowired
    IndexRepository indexRepository;
    public List<HeaderDTO> findByFCategory(){
        return indexRepository.findByFCategory();
    }
    public List<HeaderDTO> findByFCategoryCode2(){
        return indexRepository.findByFCategoryCode2();
    }

    public List<SecondCategory> findBySecondCategoryId() {
        return indexRepository.findBySecondCategoryId();
    }
}
