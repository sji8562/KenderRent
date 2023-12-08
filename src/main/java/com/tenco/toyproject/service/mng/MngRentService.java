package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngRentDTO;
import com.tenco.toyproject.repository.entity.Rent;


import com.tenco.toyproject.repository.interfaces.mng.MngRentRepository;
import com.tenco.toyproject.vo.PageVO;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngRentService {

    @Autowired
    private MngRentRepository mngRepository;

    public List<MngRentDTO.RentListDTO> findrentAll(PageVO pageVO) {
        List<MngRentDTO.RentListDTO> rent = mngRepository.findRentWithUserAll(pageVO);
        return rent;
    }

    public int countRentList() {
        return mngRepository.findRentAllCount();
    }

    public Rent findByRentId(Integer id) {
        return mngRepository.findByRentId(id);

    }
    @Transactional
    public int updateStatus(Integer id){
        return mngRepository.updateByStatus(id);
    }

    public int deleteStatus(Integer id) {
        return mngRepository.deleteByStatus(id);
    }
}
