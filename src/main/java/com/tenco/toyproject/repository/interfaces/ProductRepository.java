package com.tenco.toyproject.repository.interfaces;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.toyproject.repository.entity.Cart;
import com.tenco.toyproject.repository.entity.Product;

@Mapper
public interface ProductRepository {
	public Product findById(Integer id); 
	public List<Product> showCartById(Integer userId);
	public int addToCartById(@Param("userId") int userId, @Param("productId") int productId);
	
	public int countProductCustomer(int productId);
}
