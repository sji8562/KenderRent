package com.tenco.toyproject.service;

import java.util.List;
import java.util.Map;

import com.tenco.toyproject.dto.BoardDTO;
import com.tenco.toyproject.dto.UserUpdateDTO;
import com.tenco.toyproject.repository.entity.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.MypageRepository;

@Service
public class MypageService {
	@Autowired
	private MypageRepository mypageRepository;
	
	public List<Map> selectUserCustomer(int userId, int code) {
		return mypageRepository.selectUserCustomer(userId, code);
	}

    public int userUpdate(Integer id, UserUpdateDTO userUpdateDTO) {
		if(userUpdateDTO.getPassword() == null|| userUpdateDTO.getPassword().isEmpty()){
			return mypageRepository.userUpdateNonPw(id,userUpdateDTO);
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePassword = passwordEncoder.encode(userUpdateDTO.getPassword());
		userUpdateDTO.setPassword(securePassword);
		return mypageRepository.userUpdate(id,userUpdateDTO);
    }

	public List<BoardDTO> findByQna(int id) {
		return mypageRepository.findByQna(id);
	}
}
