package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
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
    private MngRentRepository mngRentRepository;
    public List<MngApplyDTO.RentListDTO> findrentAll() {
        List<MngApplyDTO.RentListDTO> rent = mngRentRepository.findRentAll();
        return rent;
    }

    public List<MngApplyDTO.RentListDTO> findrentAll(PageVO pageVO) {
        List<MngApplyDTO.RentListDTO> rent = mngRentRepository.findRentWithUserAll(pageVO);
        return rent;
    }

    public int countRentList() {
        return mngRentRepository.findRentAllCount();
    }

    public MngApplyDTO.RentalDetailDTO findByRentId(Integer id) {
        return mngRentRepository.findByRentId(id);

    }
    @Transactional
    public int updateStatus(Integer id){
        return mngRentRepository.updateByRentStatus(id);
    }

    public int deleteStatus(Integer id) {
        return mngRentRepository.deleteByRentStatus(id);
    }


}
