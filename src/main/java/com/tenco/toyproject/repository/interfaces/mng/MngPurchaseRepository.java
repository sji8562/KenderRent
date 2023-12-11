package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface MngPurchaseRepository {

    public List<MngApplyDTO.PurchaseListDTO> findPurchaseWithUserAll(PageVO pageVO);

    public int findPurchaseAllCount();


}
