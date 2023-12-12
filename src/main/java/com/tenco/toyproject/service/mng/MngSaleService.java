package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.repository.interfaces.mng.MngSaleRepository;
import com.tenco.toyproject.vo.PageVO;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngSaleService {

    @Autowired
    MngSaleRepository mngSaleRepository;

    public List<MngApplyDTO.SaleListDTO> findAllBySale() {
        List<MngApplyDTO.SaleListDTO> dto =  mngSaleRepository.findSaleAll();
        return dto;
    }
    public List<MngApplyDTO.SaleListDTO> findAllBySale(PageVO pageVO) {
        List<MngApplyDTO.SaleListDTO> dto =  mngSaleRepository.findSaleWithUserAll(pageVO);
        return dto;
    }

    public int countSaleList() {
        return mngSaleRepository.findSaleAllCount();
    }

    @Transactional
    public int updateStatus(Integer id){
        return mngSaleRepository.updateBySaleStatus(id);
    }

    public int deleteStatus(Integer id) {
        return mngSaleRepository.deleteBySaleStatus(id);
    }
}
