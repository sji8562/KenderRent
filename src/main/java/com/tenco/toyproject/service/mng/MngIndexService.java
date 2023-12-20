package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngIndexDTO;
import com.tenco.toyproject.repository.interfaces.mng.MngIndexRepository;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngIndexService {

    @Autowired
    MngIndexRepository mngIndexRepository;

    public List<MngIndexDTO> findByCreatedAt(){
        List<MngIndexDTO> dto = mngIndexRepository.findByCreatedAt();

        return dto;
    }

}
