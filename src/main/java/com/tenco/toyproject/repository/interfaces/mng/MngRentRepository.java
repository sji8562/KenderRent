package com.tenco.toyproject.repository.interfaces.mng;

import com.tenco.toyproject.dto.MngRentDTO;
import com.tenco.toyproject.repository.entity.Rent;
import com.tenco.toyproject.vo.PageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MngRentRepository {

    public List<MngRentDTO.RentListDTO> findRentWithUserAll(PageVO pageVO);
    public int findRentAllCount();

    public Rent findByRentId(Integer id);
    public int updateByStatus (Integer id);

    public int deleteByStatus(Integer id);
}
