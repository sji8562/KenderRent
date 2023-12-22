package com.tenco.toyproject.service;

import com.tenco.toyproject.repository.entity.Information;
import com.tenco.toyproject.repository.interfaces.IntroduceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IntroduceService {
    @Autowired
    private IntroduceRepository introduceRepository;


    public Information findContentByCode(Integer code) {
        return introduceRepository.findContentByCode(code);
    }
}
