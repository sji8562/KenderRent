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

    public MngIndexDTO.MngTotalDTO findByCreatedAt(){
        List<MngIndexDTO.MngMonthDTO> monthDTOS = mngIndexRepository.findByCreatedAt();

        int payoff = monthDTOS.stream()
                .mapToInt(MngIndexDTO.MngMonthDTO::getPrice)
                .sum();
        System.out.println(payoff);
        MngIndexDTO.MngTotalDTO mngTotalDTO = new MngIndexDTO.MngTotalDTO();;
        mngTotalDTO.setMngMonthDTO(monthDTOS);
        mngTotalDTO.setPayOff(payoff);

        return mngTotalDTO;
    }
    public MngIndexDTO.MngCountDTO findByAllCount(){
        MngIndexDTO.MngCountDTO countDTO = mngIndexRepository.countByAll();
        return countDTO;
    }

}
