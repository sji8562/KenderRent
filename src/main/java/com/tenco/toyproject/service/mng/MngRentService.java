package com.tenco.toyproject.service.mng;

import com.tenco.toyproject.dto.MngApplyDTO;
import com.tenco.toyproject.repository.entity.Rent;


import com.tenco.toyproject.repository.interfaces.mng.MngRentRepository;
import com.tenco.toyproject.vo.PageVO;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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


    @Transactional
    public int updateById(MngApplyDTO.RentalDetailUpdateDTO rentalDetailUpdateDTO) throws ParseException {
        Rent rent = mngRentRepository.findByRent(rentalDetailUpdateDTO.getId());
        System.out.println(rent);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localStartDate = LocalDate.parse(rentalDetailUpdateDTO.getStartDay(), formatter);
        LocalDate localEndDate = LocalDate.parse(rentalDetailUpdateDTO.getEndDay(), formatter);
        Timestamp startDay = Timestamp.valueOf(localStartDate.atStartOfDay());
        Timestamp endDay = Timestamp.valueOf(localEndDate.atStartOfDay());
        rent.setAddress(rentalDetailUpdateDTO.getAddress());
        rent.setAddressDetail(rentalDetailUpdateDTO.getAddressDetail());
        rent.setPostNumber(rentalDetailUpdateDTO.getPostNumber());
        rent.setStatus(rentalDetailUpdateDTO.getStatus());
        rent.setStartDay(startDay);
        rent.setEndDay(endDay);
        return mngRentRepository.updateById(rent);
    }
}
