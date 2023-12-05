package com.tenco.toyproject.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.toyproject.repository.entity.Product;

@Mapper
public interface ProductRepository {
	public Product findById(Integer id); 
}
