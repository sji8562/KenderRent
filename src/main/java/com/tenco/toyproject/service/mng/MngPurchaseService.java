package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.repository.interfaces.mng.MngPurchaseRepository;
import com.tenco.toyproject.vo.PageVO;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MngPurchaseService {

    @Autowired
    private MngPurchaseRepository mngPurchaseRepository;
    public List<MngApplyDTO.PurchaseListDTO> findAllByPurchase(PageVO pageVO) {
        List<MngApplyDTO.PurchaseListDTO> dto =  mngPurchaseRepository.findPurchaseWithUserAll(pageVO);
        return dto;
    }
    public List<MngApplyDTO.PurchaseListDTO> findAllByPurchase() {
        List<MngApplyDTO.PurchaseListDTO> dto =  mngPurchaseRepository.findPurchaseAll();
        return dto;
    }

    public int countPurchaseList() {
        return mngPurchaseRepository.findPurchaseAllCount();
    }
    @Transactional
    public int updateStatus(Integer id){
        return mngPurchaseRepository.updateByPurchaseStatus(id);
    }

    public int deleteStatus(Integer id) {
        return mngPurchaseRepository.deleteByPurchaseStatus(id);
    }

    public MngApplyDTO.PurchaseDetailDTO findByPurchaseId(Integer id) {
        return mngPurchaseRepository.findByPurchaseId(id);
    }

    public int updateByPurchase(MngApplyDTO.PurchaseDetailUpdateDTO purchaseDetailUpdateDTO) {
        return mngPurchaseRepository.updateByPurchase(purchaseDetailUpdateDTO);
    }

}
