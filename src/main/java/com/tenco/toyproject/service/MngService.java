package com.tenco.toyproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngUserDTO;
import com.tenco.toyproject.dto.MngUserDTO.UpdateDTO;
import com.tenco.toyproject.repository.entity.User;
import com.tenco.toyproject.repository.interfaces.MngRepository;
import com.tenco.toyproject.vo.PageVO;

@Service
public class MngService {

	@Autowired
	private MngRepository mngRepository;

	public List<User> findAll(PageVO pageVO) {
		return mngRepository.findAllWithPagination(pageVO);

	}

	public int countUserList() {

		return mngRepository.findAllCount();
	}

	public User findById(Integer id) {
		User user = mngRepository.findById(id);
		if (user == null) {
			throw new Exception500("존재하지 않은 회원입니다");
		}
		return user;
	}

	@Transactional
	public int update(Integer id, MngUserDTO.UpdateDTO updateDTO) {
		User userEntity = mngRepository.findById(id);
		
		userEntity.setEmail(updateDTO.getEmail());
		userEntity.setUserName(updateDTO.getUsername());
		userEntity.setPassword(updateDTO.getPassword());
		userEntity.setPhoneNumber(updateDTO.getPhoneNumber());

		int resultSet = mngRepository.updateById(userEntity);
		return resultSet;
	}

	@Transactional
	public int delete(Integer id) {
		int resultSet = mngRepository.deleteById(id);
		return resultSet;
	}

}
