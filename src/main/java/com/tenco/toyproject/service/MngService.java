package com.tenco.toyproject.service;

import java.util.List;


import com.tenco.toyproject.dto.MngProductDto;
import com.tenco.toyproject.handler.exception.CustomRestfulException;

import com.tenco.toyproject.dto.MngRentDTO;

import com.tenco.toyproject.handler.exception.CustomRestfullException;


import com.tenco.toyproject.repository.entity.FirstCategory;

import com.tenco.toyproject.repository.entity.Rent;

import com.tenco.toyproject.repository.entity.SecondCategory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.tenco.toyproject._core.handler.exception.Exception500;


import com.tenco.toyproject.repository.entity.Product;
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

	
	// KWON
	// 상품 목록 with pagination	
	public List<Product> findProductAll(PageVO pageVo) {
		return mngRepository.findAllProductWithPagination(pageVo);
	}

	// 상품 상세조회
	public Product findProductById(Integer pId) {
		return mngRepository.findProductById(pId);
	}


	// 전체 상품 개수 조회
	public int countProductList() {
		return mngRepository.findProductCount();
	}

	// 상품 삭제
	@Transactional
	public int deleteProduct(Integer id) {
		// 상품 조회
		Product product = mngRepository.findProductById(id);
		System.out.println(product.getStatus()+"해답을 찾아라");
		if(product.getStatus() != 1) {

			throw new Exception500("삭제할 수 없는 상태입니다");
//			throw new CustomRestfulException("삭제할 수 없는 상태입니다.", HttpStatus.BAD_REQUEST);
		}
		int resultSet = mngRepository.deleteByProductId(id);
		System.out.println(resultSet);
		return resultSet;
	}

	// 상품 등록
	public int createProduct(MngProductDto dto) {
		Product product = Product.builder()
				.name(dto.getName())
				.price(dto.getPrice())
				.picUrl(dto.getPicUrl())
				.firstCategoryId(dto.getFirstCategoryId())
				.secondCategoryId(dto.getSecondCategoryId())
				.content(dto.getContent())
				.status(dto.getStatus())
				.grade(dto.getGrade())
				.build();


		int resultRowCount = mngRepository.createProduct(dto);

		if(resultRowCount != 1) {
			throw new Exception500("상품 등록 실패");
		}

		return resultRowCount;
	}

	// 카테고리 조회
	public List<FirstCategory> findCategoryAll() {

		List<FirstCategory> allCategory = mngRepository.findFirstCategoryAll();

		return allCategory;
	}


	public List<SecondCategory> findSecondCategoryForRent() {
		List<SecondCategory> sCategory = mngRepository.findSecondCategoryForRent();

		return sCategory;
  }

	public List<MngRentDTO.RentListDTO> findrentAll(PageVO pageVO) {
		List<MngRentDTO.RentListDTO> rent = mngRepository.findRentWithUserAll(pageVO);
		System.out.println(rent.get(0).toString());
		return rent;
	}

	public int countRentList() {
		return mngRepository.findRentAllCount();

	}
}
