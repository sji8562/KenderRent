package com.tenco.toyproject.repository.interfaces;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.toyproject.repository.entity.Product;

@Mapper
public interface ProductRepository {
	public Product findById(Integer id); 
	public List<Product> showCartById(Integer userId);
}
