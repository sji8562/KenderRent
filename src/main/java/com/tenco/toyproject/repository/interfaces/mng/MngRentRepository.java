package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.repository.entity.Rent;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MngRentRepository {

    public List<MngApplyDTO.RentListDTO> findRentAll();
    public List<MngApplyDTO.RentListDTO> findRentWithUserAll(PageVO pageVO);
    public int findRentAllCount();

    public MngApplyDTO.RentalDetailDTO findByRentId(Integer id);
    public int updateByRentStatus (Integer id);

    public int deleteByRentStatus(Integer id);
}
